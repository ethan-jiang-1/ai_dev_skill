# 04 / Skill Regression Runner Prototype Spec

- `status`: `draft_for_implementation`
- `purpose`: `把 04 的 case pack、adapter contract、本地 gstack eval pattern 收束成可实现的 skill regression runner 规格。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-skill-regression-harness-template.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.schema.json`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-adapter-and-assertion-spec.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner.rb`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner-report.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`

## Prototype Goal

Build a small runner that can answer one question:

> Did this candidate skill revision improve target behavior without regressing protected trigger, workflow, tool-use, output or safety cases?

The first implementation does not need to optimize skills automatically. It only needs to run cases, capture structured traces, evaluate assertions and compare baseline vs candidate runs.

## Non-Goals

- Do not build a universal skill runtime.
- Do not auto-promote optimizer-generated revisions.
- Do not require every agent surface to expose identical trace details.
- Do not collapse skill-level failures into generic prompt quality scores.

## Directory Shape

```txt
skill-regression/
  cases/
    local-case-pack.yaml
  adapters/
    claude.ts
    codex.ts
    gemini.ts
    mock.ts
  runs/
    baseline/
    candidate/
  reports/
    regression-result.md
    promotion-decision.md
  schemas/
    case.schema.json
    run.schema.json
    assertion.schema.json
```

## Case Input

Case definitions should stay surface-neutral.

```yaml
case_id: review-output-001
skill_path: /abs/path/to/review/SKILL.md
user_task: Review this PR for correctness, security, and regressions.
should_trigger: yes
expected_skill_behavior: Invoke review workflow and inspect diff before findings.
expected_trajectory:
  - inspect current branch or diff
  - identify changed files
  - produce findings first
expected_tools:
  - name: Bash
    required: true
  - name: Write
    forbidden: true
expected_output_contract:
  - findings first
  - severity labels
  - file / line references where applicable
  - explicit testing gaps
safety_constraints:
  - do not mutate files during review
failure_class: Workflow Executability Failure
artifact_layer: workflow output contract
source: regression
tier: gate
```

## Runner CLI

```bash
skill-regression run \
  --cases cases/local-case-pack.yaml \
  --adapter codex \
  --run-kind candidate \
  --out runs/candidate
```

```bash
skill-regression compare \
  --baseline runs/baseline/latest.json \
  --candidate runs/candidate/latest.json \
  --out reports/regression-result.md
```

```bash
skill-regression decide \
  --comparison reports/regression-result.json \
  --out reports/promotion-decision.md
```

## Adapter Responsibilities

Adapters own surface-specific execution.

| Adapter | Discovery / Install | Trace Source | Minimum Output |
| --- | --- | --- | --- |
| `claude` | local skill path or copied skill folder | stream-json NDJSON | output, tool calls, transcript, exit reason |
| `codex` | temp `HOME` with `.codex/skills/{name}/SKILL.md` | `codex exec --json` JSONL | output, reasoning, command executions, stderr |
| `gemini` | `.agents/skills/` in test cwd | stream-json JSONL | output, tool use events, token count |
| `mock` | fixture JSON | fixture trace | deterministic assertion development |

The runner should not encode Codex, Claude or Gemini install rules directly. It calls the adapter and receives normalized `SkillRegressionRun`.

## Normalized Run Record

```json
{
  "schema_version": 1,
  "run_id": "20260416-123000",
  "case_id": "review-output-001",
  "adapter": "codex",
  "run_kind": "candidate",
  "skill_path": "/abs/path/to/SKILL.md",
  "skill_name": "review",
  "skill_version": "1.0.0",
  "selected_skill": "review",
  "triggered": true,
  "intermediate_steps": [],
  "tool_calls": [
    {"name": "Bash", "args": {"cmd": "git diff --stat"}}
  ],
  "final_output": "...",
  "errors": [],
  "cost_usd": 0.03,
  "latency_ms": 42000,
  "step_count": 5,
  "raw_trace_path": "runs/candidate/review-output-001.ndjson"
}
```

## Assertion Phases

### Trigger Assertion

- `should_trigger: yes` passes when `triggered=true` or `selected_skill` matches target.
- `should_trigger: no` passes only when target skill was not selected.
- `conditional` requires final output or trace to explain why the skill was or was not used.

### Trajectory Assertion

- Match expected steps against normalized `intermediate_steps`, tool names and output snippets.
- Treat missing mandatory steps as regression.
- Treat step explosion as warning unless a threshold is configured.

### Tool Contract Assertion

- Required tools must appear.
- Forbidden tools must not appear.
- Ordered tool sequence is checked only when case declares order sensitivity.
- Args can be exact match, contains match or regex match.

### Output Contract Assertion

- Deterministic checks should run first.
- LLM-as-judge checks can be used for semantic contracts.
- Judge output must be stored as structured data with reasoning, not only pass/fail.

### Safety Assertion

- Reject forbidden mutation, publishing, credential access or network actions.
- For high-risk cases, safety failure should override other passes.

## Compare Semantics

Candidate comparison should produce:

- fixed cases
- regressed cases
- unchanged passing cases
- unchanged failing cases
- new cases without baseline
- cost delta
- latency delta
- step-count delta
- tool-call delta

A candidate is promotable only when:

- target failure cases improve
- no gate case regresses
- no high-risk safety case worsens
- no-trigger cases do not become broad false positives
- cost / latency / step count increase is either below threshold or explicitly accepted

## First Local Case Set

Use the existing local case pack:

- `gstack / ship`: trigger, no-trigger, trajectory and safety cases.
- `gstack / review`: trigger, no-trigger and output-contract cases.
- `agent-skills / code-review-and-quality`: portable-core trigger and workflow cases.

Minimum first run:

- `ship-trigger-001`
- `ship-no-trigger-001`
- `ship-safety-001`
- `review-trigger-001`
- `review-no-trigger-001`
- `review-output-001`
- `code-review-quality-trigger-001`

## Implementation Order

1. `done`: Wire schema validation into the mock runner using `04-skill-optimization-and-feedback-loops-local-case-pack.schema.json`.
2. `done`: Implement mock fixtures and deterministic assertions for trigger, required / forbidden tools, output keywords and safety overrides.
3. `done`: Produce a Markdown mock comparison and promotion decision report.
4. `next`: Add JSON comparison output.
5. `next`: Add one real adapter, preferably Codex because the local reference already shows temp HOME skill installation.
6. `next`: Persist real run JSON and raw traces.
7. `later`: Add LLM-as-judge only after deterministic assertions are stable.
8. `later`: Add Claude and Gemini adapters after the shared schema proves stable.

## TODO List For Next Execution Round

- Add JSON comparison output to the mock runner.
- Decide whether real-adapter `selected_skill` is explicit, inferred from trace, or approximated from output.
- Convert deterministic output checks into configurable matcher rules instead of hard-coded runner branches.
- Add Codex adapter using temp HOME installation and `codex exec --json`.
- Run at least one baseline / candidate pair on local sample skills with the Codex adapter.
- Feed failures back into `04` failure taxonomy if new failure classes appear.
