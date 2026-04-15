# 04 / Agent Adapter Contract For Skill Regression

- `status`: `draft`
- `purpose`: `定义 regression harness 与真实 agent runner 之间的最小接口，使 04 的样本、断言和工具配置可以接入不同宿主。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-skill-regression-harness-template.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/skill-llm-eval.test.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/scripts/eval-compare.ts`

## Adapter Goal

The adapter should run one user task against one target skill package and return enough structured information to evaluate:

- trigger behavior
- workflow adherence
- tool-use contract
- output contract
- safety boundary
- cost / latency / step count

It does not need to be tied to one platform. Codex, Claude, GitHub Copilot, or a local harness can each implement the same contract.

## Input Schema

```ts
type SkillRegressionCase = {
  case_id: string;
  skill_path: string;
  user_task: string;
  should_trigger: 'yes' | 'no' | 'conditional';
  expected_skill_behavior: string;
  expected_trajectory?: string[];
  expected_tools?: Array<{
    name: string;
    required?: boolean;
    forbidden?: boolean;
    args_match?: Record<string, unknown>;
  }>;
  expected_output_contract?: string[];
  safety_constraints?: string[];
  failure_class?: string;
  artifact_layer?: string;
  source?: 'synthetic' | 'production_trace' | 'user_feedback' | 'regression';
};
```

## Output Schema

```ts
type SkillRegressionRun = {
  case_id: string;
  skill_path: string;
  skill_name?: string;
  skill_version?: string;
  selected_skill?: string | null;
  triggered: boolean;
  intermediate_steps: string[];
  tool_calls: Array<{
    name: string;
    args?: Record<string, unknown>;
    result_summary?: string;
  }>;
  final_output: string;
  errors: string[];
  cost_usd?: number;
  latency_ms?: number;
  step_count?: number;
  raw_trace_path?: string;
};
```

## Assertion Result Schema

```ts
type SkillAssertionResult = {
  case_id: string;
  passed: boolean;
  trigger_passed: boolean;
  trajectory_passed: boolean;
  tool_contract_passed: boolean;
  output_contract_passed: boolean;
  safety_passed: boolean;
  failures: Array<{
    assertion: string;
    expected: string;
    actual: string;
    failure_class: string;
  }>;
};
```

## Minimal Runner Steps

1. Load `SKILL.md` frontmatter and body.
2. Record `name`, `description`, version-like fields and supported tools.
3. Run the `user_task` in a controlled project scope with the skill available.
4. Capture whether the skill was selected / loaded.
5. Capture intermediate reasoning-visible steps or observable action summaries.
6. Capture tool calls and arguments.
7. Capture final output.
8. Run assertions.
9. Store run JSON under `runs/baseline` or `runs/candidate`.
10. Compare baseline and candidate runs.

## Assertion Mapping

| Harness Assertion | Required Adapter Output |
| --- | --- |
| trigger / no-trigger | `selected_skill`, `triggered` |
| tool-used | `tool_calls[].name` |
| tool-args-match | `tool_calls[].args` |
| tool-sequence | ordered `tool_calls[]` |
| step-count | `step_count` or `intermediate_steps.length` |
| output-contract | `final_output` |
| safety | `tool_calls`, `final_output`, `errors` |

## Relation To Existing Local Eval Code

The gstack local eval code already provides two useful patterns:

- `skill-llm-eval.test.ts`
  - Uses LLM-as-judge scoring for generated `SKILL.md` quality.
  - Stores eval test metadata such as suite, tier, pass/fail, duration and judge scores.
- `eval-compare.ts`
  - Loads two eval result files and compares them.
  - Warns on tier or schema mismatch.
  - Formats before/after comparison.

The skill regression adapter should reuse the same discipline:

- structured run records
- schema version
- tier labels
- before / after comparison
- explicit pass / fail
- stored result artifacts

## Open Implementation Choices

- Whether `selected_skill` is detected from agent logs, explicit invocation, wrapper instrumentation, or prompt-visible markers.
- Whether `intermediate_steps` are raw traces, summarized traces, or tool-only trajectories.
- Whether output assertions are deterministic, LLM-as-judge, or mixed.
- Whether each surface needs a separate adapter implementation.

## Non-Goals

- This contract does not define a universal skill runtime.
- This contract does not bypass platform safety controls.
- This contract does not make optimizer-generated revisions auto-promotable.
