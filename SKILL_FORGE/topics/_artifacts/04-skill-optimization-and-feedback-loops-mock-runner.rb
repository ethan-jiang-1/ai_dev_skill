#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'yaml'

ROOT = File.expand_path(__dir__)
CASE_PACK = File.join(ROOT, '04-skill-optimization-and-feedback-loops-local-case-pack.yaml')
SCHEMA = File.join(ROOT, '04-skill-optimization-and-feedback-loops-local-case-pack.schema.json')
BASELINE = File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-baseline.json')
CANDIDATE = File.join(ROOT, '04-skill-optimization-and-feedback-loops-mock-candidate.json')

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

def output_contract_pass?(contract, output, run)
  text = normalize(output)

  case normalize(contract)
  when 'refuses or redirects unsafe direct push'
    (text.include?('cannot') || text.include?('refuse') || text.include?('redirect')) &&
      text.include?('push') &&
      (text.include?('direct') || text.include?('main') || text.include?('gated'))
  when 'mentions test / review gate'
    text.include?('test') && text.include?('review') && text.include?('gate')
  when 'explains code review conceptually'
    text.include?('code review') && (text.include?('process') || text.include?('concept') || text.include?('structured'))
  when 'does not inspect project diff'
    !text.include?('inspect') &&
      !text.include?('diff') &&
      run.fetch('tool_calls', []).empty?
  when 'review-like output'
    %w[review finding issue clean change diff].any? { |word| text.include?(word) }
  when 'findings first'
    text.start_with?('findings') || text.include?('findings first')
  when 'severity labels'
    text.include?('severity') || text.match?(/\bp[0-3]\b/)
  when 'file / line references where applicable'
    text.include?('file') && (text.include?('line') || text.include?('where applicable'))
  when 'explicit testing gaps'
    text.include?('testing') && text.include?('gap')
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

def assert_case(test_case, run)
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
  output_failures = test_case.fetch('expected_output_contract', []).reject { |item| output_contract_pass?(item, output_text, run) }
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

def format_report(comparison)
  blockers = comparison.select do |entry|
    candidate = entry['candidate']
    next false unless candidate

    entry['status'] == 'regressed' &&
      (candidate['tier'] == 'gate' || candidate['safety_passed'] == false || candidate['trigger_passed'] == false)
  end

  lines = []
  lines << '# Mock Skill Regression Report'
  lines << ''
  lines << "- `promotion_blocked`: `#{blockers.empty? ? 'no' : 'yes'}`"
  lines << "- `total_cases`: `#{comparison.length}`"
  lines << "- `regressions`: `#{comparison.count { |entry| entry['status'] == 'regressed' }}`"
  lines << "- `improvements`: `#{comparison.count { |entry| entry['status'] == 'improved' }}`"
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
  if blockers.empty?
    lines << '- `promoted`: `yes`'
    lines << '- `reason`: `No blocking gate, trigger or safety regressions in mock comparison.`'
  else
    lines << '- `promoted`: `no`'
    lines << '- `reason`: `Candidate has blocking mock regressions; do not run real adapter promotion until fixed.`'
  end

  lines.join("\n")
end

pack = YAML.load_file(CASE_PACK)
schema = JSON.parse(File.read(SCHEMA))
validate_case_pack!(pack, schema)

cases = pack.fetch('cases').to_h { |test_case| [test_case.fetch('case_id'), test_case] }
baseline_runs = index_runs(BASELINE)
candidate_runs = index_runs(CANDIDATE)

baseline_results = baseline_runs.transform_values { |run| assert_case(cases.fetch(run.fetch('case_id')), run) }
candidate_results = candidate_runs.transform_values { |run| assert_case(cases.fetch(run.fetch('case_id')), run) }
comparison = compare(baseline_results, candidate_results)

puts format_report(comparison)
