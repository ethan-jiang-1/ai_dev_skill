# 04 / Tool Config Sketch For SKILL.md Regression Harness

- `status`: `sketch`
- `purpose`: `把 SKILL.md regression harness template 推进一步，给出 Promptfoo-style 和 LangSmith-style 的配置草图。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-skill-regression-harness-template.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-agent-trajectory-regression.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-ci-quality-gates.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-langsmith-offline-online-feedback-loop.md`

## Promptfoo-Style Config Sketch

```yaml
description: "SKILL.md regression harness"

prompts:
  - file://skill-under-test/SKILL.md

providers:
  - id: "agent-under-test"
    config:
      skillPath: "skill-under-test"
      runMode: "project-scope"

tests:
  - description: "trigger: should load skill for target workflow"
    vars:
      user_task: "Run the target workflow that this skill is designed for."
    assert:
      - type: "contains"
        value: "expected intermediate marker"
      - type: "trajectory:tool-used"
        value: "expected_tool"
      - type: "trajectory:step-count"
        threshold: 12

  - description: "no-trigger: boundary task should not load skill"
    vars:
      user_task: "Simple one-step task that should not require this skill."
    assert:
      - type: "not-contains"
        value: "skill-specific marker"

  - description: "tool contract: must call tool with expected args"
    vars:
      user_task: "Task requiring the skill's tool-use contract."
    assert:
      - type: "trajectory:tool-args-match"
        value:
          tool: "expected_tool"
          args:
            mode: "safe"

defaultTest:
  options:
    provider:
      id: "agent-under-test"

outputPath:
  - "runs/candidate/results.json"
  - "runs/candidate/report.html"
```

## LangSmith-Style Trace Loop Sketch

```yaml
project: "skill-regression"

datasets:
  - name: "skill-trigger-cases"
    source: "cases/trigger-cases.md"
  - name: "skill-workflow-cases"
    source: "cases/workflow-cases.md"
  - name: "skill-boundary-cases"
    source: "cases/boundary-cases.md"

online_traces:
  collect:
    - user_task
    - selected_skill
    - loaded_skill_version
    - tool_calls
    - intermediate_steps
    - final_output
    - user_feedback

annotation_queue:
  labels:
    - trigger_failure
    - workflow_failure
    - tool_contract_failure
    - output_contract_failure
    - safety_failure

feedback_loop:
  promote_to_offline_dataset_when:
    - user_feedback: "negative"
    - annotation_label: "not_null"
    - repeated_failure_count: ">= 2"
```

## Promotion Gate Sketch

```md
# Promotion Gate

- baseline_version:
- candidate_version:
- trigger_cases_passed:
- workflow_cases_passed:
- tool_contract_cases_passed:
- boundary_cases_passed:
- safety_cases_passed:
- regressions_found:
- promoted: `yes / no`
- fallback_version:
- reviewer:
```

## Implementation Notes

- `agent-under-test` should implement `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`.
- Initial local cases are listed in `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`.
- Promptfoo-style assertions are best for deterministic case replay and CI gates.
- LangSmith-style traces are best for production feedback and converting failures into future regression cases.
- DSPy / OpenAI evals style optimizers should be treated as candidate generators only; the promotion gate remains mandatory.
