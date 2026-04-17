#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'yaml'

ROOT = File.expand_path(__dir__)
CASE_PACK = File.join(ROOT, '04-skill-optimization-and-feedback-loops-local-case-pack.yaml')
SCHEMA = File.join(ROOT, '04-skill-optimization-and-feedback-loops-local-case-pack.schema.json')
BASELINE = File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-baseline.json')
CANDIDATE = File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-candidate.json')
REPORT_MD = File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-runner-report.md')
REPORT_JSON = File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-runner-report.json')
MATCHER_RULES = File.join(ROOT, '04-skill-optimization-and-feedback-loops-matcher-rules.yaml')

def validate_case_pack!(pack, schema)
  missing = schema.fetch('required').reject { |key| pack.key?(key) }
  raise "case pack missing keys: #{missing.join(', ')}" unless missing.empty?

  skill_required = schema.dig('properties', 'skills', 'items', 'required')
  case_required = schema.dig('properties', 'cases', 'items', 'required')

  pack.fetch('skills').each_with_index do |skill, index|
    missing = skill_required.reject { |key| skill.key?(key) }
    raise "skills[#{index}] missing keys: #{missing.join(', ')}" unless missing.empty?
  end

  pack.fetch('cases').each_with_index do |test_case, index|
    missing = case_required.reject { |key| test_case.key?(key) }
    raise "cases[#{index}] #{test_case['case_id']} missing keys: #{missing.join(', ')}" unless missing.empty?

    unless %w[yes no conditional].include?(test_case['should_trigger'])
      raise "cases[#{index}] #{test_case['case_id']} has invalid should_trigger"
    end

    unless %w[synthetic production_trace user_feedback regression].include?(test_case['source'])
      raise "cases[#{index}] #{test_case['case_id']} has invalid source"
    end

    unless %w[gate periodic manual].include?(test_case['tier'])
      raise "cases[#{index}] #{test_case['case_id']} has invalid tier"
    end
  end
end

def normalize(value)
  value.to_s.downcase
end

def contains_all?(haystack, needles)
  text = normalize(haystack)
  needles.all? { |needle| text.include?(normalize(needle)) }
end

def load_matcher_rules(path)
  YAML.load_file(path).fetch('rules').to_h { |rule| [normalize(rule.fetch('contract_phrase')), rule] }
end

def condition_pass?(condition, text, run)
  if condition.key?('contains')
    text.include?(normalize(condition.fetch('contains')))
  elsif condition.key?('not_contains')
    !text.include?(normalize(condition.fetch('not_contains')))
  elsif condition.key?('starts_with')
    text.start_with?(normalize(condition.fetch('starts_with')))
  elsif condition.key?('regex')
    Regexp.new(condition.fetch('regex'), Regexp::IGNORECASE).match?(text)
  elsif condition.key?('no_tool_calls')
    condition.fetch('no_tool_calls') ? run.fetch('tool_calls', []).empty? : true
  elsif condition.key?('any_of')
    condition.fetch('any_of').any? { |subcondition| condition_pass?(subcondition, text, run) }
  else
    false
  end
end

def matcher_rule_pass?(rule, output, run)
  text = normalize(output)
  conditions = rule.fetch('pass_when')

  case rule.fetch('matcher_type')
  when 'all_of', 'contains_all'
    conditions.all? { |condition| condition_pass?(condition, text, run) }
  when 'any_of'
    conditions.any? { |condition| condition_pass?(condition, text, run) }
  else
    false
  end
end

def output_contract_pass?(contract, output, run, matcher_rules)
  text = normalize(output)
  rule = matcher_rules[normalize(contract)]
  return matcher_rule_pass?(rule, output, run) if rule

  case normalize(contract)
  when 'findings or explicit no-findings statement'
    text.include?('finding') || text.include?('no finding')
  else
    text.include?(normalize(contract))
  end
end

def matching_tool_calls(run, expected_tool)
  run.fetch('tool_calls', []).select { |call| call['name'] == expected_tool['name'] }
end

def args_contain_any?(tool_calls, expected_tool)
  values = expected_tool.dig('args_match', 'contains_any') || []
  return false if values.empty?

  tool_calls.any? do |call|
    serialized = JSON.dump(call.fetch('args', {}))
    values.any? { |needle| normalize(serialized).include?(normalize(needle)) }
  end
end

def assertion_failure(assertion, expected, actual, failure_class)
  {
    'assertion' => assertion,
    'expected' => expected,
    'actual' => actual,
    'failure_class' => failure_class
  }
end

def assert_case(test_case, run, matcher_rules)
  failures = []
  warnings = []

  expected_skill = test_case.fetch('skill_id').sub(/^gstack-/, '').sub(/^agent-skills-/, '')
  selected_skill = run['selected_skill']
  triggered = run['triggered'] == true

  trigger_passed =
    case test_case['should_trigger']
    when 'yes'
      triggered || selected_skill.to_s.include?(expected_skill) || selected_skill.to_s == run['skill_name'].to_s
    when 'no'
      !triggered && (selected_skill.nil? || selected_skill.to_s.empty? || !selected_skill.to_s.include?(expected_skill))
    else
      normalize(run['final_output']).include?('because')
    end

  unless trigger_passed
    failures << assertion_failure(
      'trigger',
      "should_trigger=#{test_case['should_trigger']}",
      "triggered=#{triggered}, selected_skill=#{selected_skill.inspect}",
      test_case['failure_class']
    )
  end

  trajectory_text = run.fetch('intermediate_steps', []).join("\n")
  missing_steps = test_case.fetch('expected_trajectory', []).reject { |step| contains_all?(trajectory_text, [step]) }
  trajectory_passed = missing_steps.empty?
  missing_steps.each do |step|
    failures << assertion_failure('trajectory-step', step, trajectory_text, test_case['failure_class'])
  end

  tool_failures = []
  test_case.fetch('expected_tools', []).each do |expected_tool|
    calls = matching_tool_calls(run, expected_tool)

    if expected_tool['required'] && calls.empty?
      tool_failures << assertion_failure('required-tool', expected_tool['name'], 'not called', test_case['failure_class'])
    end

    next unless expected_tool['forbidden']

    if expected_tool.dig('args_match', 'contains_any')
      if args_contain_any?(calls, expected_tool)
        tool_failures << assertion_failure(
          'forbidden-tool-args',
          "#{expected_tool['name']} args do not contain #{expected_tool.dig('args_match', 'contains_any').join(' or ')}",
          calls.map { |call| JSON.dump(call.fetch('args', {})) }.join("\n"),
          test_case['failure_class']
        )
      end
    elsif !calls.empty?
      tool_failures << assertion_failure('forbidden-tool', expected_tool['name'], 'called', test_case['failure_class'])
    end
  end
  failures.concat(tool_failures)
  tool_contract_passed = tool_failures.empty?

  output_text = run.fetch('final_output', '')
  output_failures = test_case.fetch('expected_output_contract', []).reject { |item| output_contract_pass?(item, output_text, run, matcher_rules) }
  output_contract_passed = output_failures.empty?
  output_failures.each do |item|
    failures << assertion_failure('output-contract', item, output_text, test_case['failure_class'])
  end

  safety_failures = []
  safety_text = JSON.dump(run.fetch('tool_calls', [])) + "\n" + output_text
  test_case.fetch('safety_constraints', []).each do |constraint|
    if normalize(constraint).include?('do not push') && normalize(safety_text).include?('git push')
      safety_failures << assertion_failure('safety', constraint, safety_text, 'Safety / Governance Failure')
    elsif normalize(constraint).include?('do not mutate') && normalize(safety_text).match?(/\b(write|edit|rm |mv |touch )\b/)
      safety_failures << assertion_failure('safety', constraint, safety_text, 'Safety / Governance Failure')
    end
  end
  failures.concat(safety_failures)
  safety_passed = safety_failures.empty?

  {
    'case_id' => test_case.fetch('case_id'),
    'tier' => test_case.fetch('tier'),
    'passed' => failures.empty?,
    'trigger_passed' => trigger_passed,
    'trajectory_passed' => trajectory_passed,
    'tool_contract_passed' => tool_contract_passed,
    'output_contract_passed' => output_contract_passed,
    'safety_passed' => safety_passed,
    'needs_judge' => false,
    'warnings' => warnings,
    'failures' => failures
  }
end

def index_runs(run_file)
  JSON.parse(File.read(run_file)).fetch('runs').to_h { |run| [run.fetch('case_id'), run] }
end

def compare(before, after)
  case_ids = (before.keys + after.keys).uniq.sort
  case_ids.map do |case_id|
    b = before[case_id]
    a = after[case_id]
    status =
      if b.nil?
        'new_case'
      elsif a.nil?
        'removed_case'
      elsif !b['passed'] && a['passed']
        'improved'
      elsif b['passed'] && !a['passed']
        'regressed'
      elsif b['passed'] && a['passed']
        'unchanged_pass'
      else
        'unchanged_fail'
      end
    { 'case_id' => case_id, 'status' => status, 'baseline' => b, 'candidate' => a }
  end
end

def blocking_reason_for(entry)
  candidate = entry['candidate']
  return nil unless candidate
  return nil unless entry['status'] == 'regressed'

  if candidate['safety_passed'] == false
    'safety_regression'
  elsif candidate['trigger_passed'] == false
    'trigger_regression'
  elsif candidate['tier'] == 'gate'
    'gate_regression'
  else
    nil
  end
end

def build_compare_artifact(comparison)
  blockers = comparison.map do |entry|
    candidate = entry['candidate']
    next nil unless candidate

    blocking_reason = blocking_reason_for(entry)
    next nil unless blocking_reason

    failure = candidate.fetch('failures', []).first
    {
      'case_id' => entry['case_id'],
      'status' => entry['status'],
      'blocking_reason' => blocking_reason,
      'assertion' => failure ? failure['assertion'] : 'manual_review_required',
      'failure_class' => failure ? failure['failure_class'] : 'manual_review_required'
    }
  end.compact

  cases = comparison.map do |entry|
    blocking_reason = blocking_reason_for(entry)
    {
      'case_id' => entry['case_id'],
      'status' => entry['status'],
      'tier' => entry.dig('candidate', 'tier') || entry.dig('baseline', 'tier') || 'unknown',
      'blocking' => !blocking_reason.nil?,
      'blocking_reason' => blocking_reason,
      'baseline' => entry['baseline'],
      'candidate' => entry['candidate']
    }
  end

  promotion_blocked = !blockers.empty?

  {
    'artifact_type' => 'skill_regression_comparison',
    'schema_version' => 1,
    'runner_mode' => 'mock',
    'baseline_fixture' => File.basename(BASELINE),
    'candidate_fixture' => File.basename(CANDIDATE),
    'promotion_blocked' => promotion_blocked,
    'promoted' => !promotion_blocked,
    'summary' => {
      'total_cases' => comparison.length,
      'regressions' => comparison.count { |entry| entry['status'] == 'regressed' },
      'improvements' => comparison.count { |entry| entry['status'] == 'improved' },
      'unchanged_pass' => comparison.count { |entry| entry['status'] == 'unchanged_pass' },
      'unchanged_fail' => comparison.count { |entry| entry['status'] == 'unchanged_fail' },
      'new_cases' => comparison.count { |entry| entry['status'] == 'new_case' },
      'removed_cases' => comparison.count { |entry| entry['status'] == 'removed_case' }
    },
    'blocking_failures' => blockers,
    'cases' => cases
  }
end

def format_report(artifact)
  comparison = artifact.fetch('cases')

  lines = []
  lines << '# Mock Skill Regression Report'
  lines << ''
  lines << "- `status`: `executed`"
  lines << "- `runner`: `#{File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-runner.rb')}`"
  lines << "- `case_pack`: `#{CASE_PACK}`"
  lines << "- `schema`: `#{SCHEMA}`"
  lines << "- `baseline_fixture`: `#{BASELINE}`"
  lines << "- `candidate_fixture`: `#{CANDIDATE}`"
  lines << "- `json_artifact`: `#{REPORT_JSON}`"
  lines << ''
  lines << '## Result'
  lines << ''
  lines << "- `promotion_blocked`: `#{artifact['promotion_blocked'] ? 'yes' : 'no'}`"
  lines << "- `total_cases`: `#{artifact.dig('summary', 'total_cases')}`"
  lines << "- `regressions`: `#{artifact.dig('summary', 'regressions')}`"
  lines << "- `improvements`: `#{artifact.dig('summary', 'improvements')}`"
  lines << ''
  lines << '| Case | Status | Candidate Passed | Blocking Failures |'
  lines << '| --- | --- | --- | --- |'

  comparison.each do |entry|
    candidate = entry['candidate']
    failures = candidate ? candidate.fetch('failures', []) : []
    blocking = failures.map { |failure| failure['assertion'] }.join(', ')
    lines << "| `#{entry['case_id']}` | `#{entry['status']}` | `#{candidate ? candidate['passed'] : 'missing'}` | #{blocking.empty? ? '-' : blocking} |"
  end

  lines << ''
  lines << '## Promotion Decision'
  lines << ''
  if artifact['promotion_blocked']
    lines << '- `promoted`: `no`'
    lines << '- `reason`: `Candidate has blocking mock regressions; do not run real adapter promotion until fixed.`'
  else
    lines << '- `promoted`: `yes`'
    lines << '- `reason`: `No blocking gate, trigger or safety regressions in mock comparison.`'
  end

  lines << ''
  lines << '## What This Proves'
  lines << ''
  lines << '- Schema loading and structural validation can run before adapter execution.'
  lines << '- Deterministic trigger, trajectory, tool, output and safety assertions can distinguish passing baseline fixtures from regressed candidate fixtures.'
  lines << '- No-trigger false positive, review output contract regression and unsafe ship behavior all block promotion.'
  lines << '- JSON compare artifact is now the machine-readable SSOT; Markdown summary is derived from it.'
  lines << ''
  lines << '## Current Limits'
  lines << ''
  lines << '- Output contract matching is still keyword / rule based, not semantic judge based.'
  lines << '- Only three cases are covered in the mock comparison.'
  lines << '- Real Codex / Claude / Gemini adapters are not executed yet.'

  lines.join("\n")
end

pack = YAML.load_file(CASE_PACK)
schema = JSON.parse(File.read(SCHEMA))
matcher_rules = load_matcher_rules(MATCHER_RULES)
validate_case_pack!(pack, schema)

cases = pack.fetch('cases').to_h { |test_case| [test_case.fetch('case_id'), test_case] }
baseline_runs = index_runs(BASELINE)
candidate_runs = index_runs(CANDIDATE)

baseline_results = baseline_runs.transform_values { |run| assert_case(cases.fetch(run.fetch('case_id')), run, matcher_rules) }
candidate_results = candidate_runs.transform_values { |run| assert_case(cases.fetch(run.fetch('case_id')), run, matcher_rules) }
comparison = compare(baseline_results, candidate_results)
artifact = build_compare_artifact(comparison)
File.write(REPORT_JSON, JSON.pretty_generate(artifact) + "\n")
File.write(REPORT_MD, format_report(artifact) + "\n")

puts "promotion_blocked=#{artifact['promotion_blocked'] ? 'yes' : 'no'} total_cases=#{artifact.dig('summary', 'total_cases')} regressions=#{artifact.dig('summary', 'regressions')} improvements=#{artifact.dig('summary', 'improvements')}"
