# 04 / Local Gstack Eval Harness As Skill Optimization Evidence

- `status`: `captured`
- `source_type`: `local-code-evidence`
- `accessed_at`: `2026-04-16`
- `topic`: `04-skill-optimization-and-feedback-loops`
- `source_paths`:
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/skill-llm-eval.test.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/helpers/eval-store.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/helpers/session-runner.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/helpers/codex-session-runner.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/helpers/gemini-session-runner.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/test/helpers/touchfiles.ts`
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/source_snapshot/gstack/scripts/eval-compare.ts`

## Why This Matters

This is local evidence that skill optimization can be treated as an engineering loop, not only as prompt editing.

The `gstack` snapshot already contains several reusable patterns:

- LLM-as-judge scoring for generated `SKILL.md` quality.
- Agent E2E runners for Claude, Codex and Gemini surfaces.
- Tool-call / transcript extraction from NDJSON or JSONL traces.
- Diff-based test selection through touchfile maps.
- Structured eval result persistence.
- Before / after eval comparison with regression commentary.
- Worktree isolation for agent runs.

These patterns are directly relevant to `04` because they evaluate the behavior of skill artifacts and host-surface integrations, not just the final answer text.

## Evidence Points

### LLM-as-judge quality eval

`skill-llm-eval.test.ts` scores generated skill documentation sections on clarity, completeness and actionability.

Relevance to `04`:

- Skill documentation quality can be measured against explicit rubrics.
- A candidate `SKILL.md` can be compared to a baseline section.
- Thresholds can be tuned per section instead of applying one global pass rule.

Limitation:

- This evaluates documentation quality, not full trigger / tool trajectory behavior by itself.

### Structured eval store

`eval-store.ts` defines `EvalCollector`, `EvalResult`, `EvalTestEntry` and comparison helpers.

Reusable design elements:

- `schema_version`
- `version`
- `branch`
- `git_sha`
- `tier`
- `total_tests`
- `passed`
- `failed`
- `total_cost_usd`
- `total_duration_ms`
- per-test `transcript`, `output`, `turns_used`, `browse_errors`, `exit_reason`, `model`, `first_response_ms`, `max_inter_turn_ms`

Relevance to `04`:

- Skill regression results should be stored as structured artifacts, not only logs.
- Version, branch and schema must be part of the result because skill optimization compares candidate and baseline artifacts.
- Cost, duration and tool count are optimization signals because a skill can regress by becoming too expensive or too long-running even if it still passes.

### Before / after comparison

`eval-compare.ts` loads two eval runs, warns on tier or schema mismatch, and formats before / after deltas.

Reusable design elements:

- Find a previous run of the same tier.
- Match tests by name.
- Mark status as improved, regressed or unchanged.
- Compare cost, duration, turns and tool-call counts.
- Highlight regressions before improvements.

Relevance to `04`:

- A skill candidate should not be promoted only because it fixes the target case.
- Promotion needs explicit regression detection across already-passing trigger, workflow, tool and safety cases.

### Agent session runners

`session-runner.ts`, `codex-session-runner.ts` and `gemini-session-runner.ts` show how to adapt different host surfaces into comparable run records.

Reusable design elements:

- Claude runner parses stream-json NDJSON and extracts assistant tool uses.
- Codex runner installs a skill into a temp `HOME` under `.codex/skills/{skillName}/SKILL.md` and parses `codex exec --json`.
- Gemini runner parses stream-json events and relies on `.agents/skills/` discovery from the working directory.
- All runners normalize output, tool calls, duration, exit code and raw trace lines.

Relevance to `04`:

- The same skill regression case pack should be runnable across different surfaces through adapter contracts.
- Surface-specific discovery and install mechanics belong inside adapters, not in the case definition.

### Touchfile selection and tiers

`touchfiles.ts` maps tests to source files and labels tests as gate or periodic.

Reusable design elements:

- Run only tests affected by changed skill files unless forced.
- Keep gate tests separate from periodic or expensive tests.
- Treat shared/global files as broad invalidators.

Relevance to `04`:

- Skill optimization loops need cheap gating for normal edits and deeper periodic replay for expensive agent traces.
- Trigger description changes should run trigger and no-trigger cases; tool contract changes should run trajectory and safety cases.

## Extracted Pattern For Skill Optimization

The local pattern can be generalized as:

1. Represent each skill behavior expectation as a named eval case.
2. Run the target agent in an isolated environment with a known skill package.
3. Capture structured traces, tool calls, output, cost and latency.
4. Persist the result with schema, version, branch and tier.
5. Compare candidate results to the latest compatible baseline.
6. Promote only if target failures improve and protected cases do not regress.

## Mapping To 04 Failure Taxonomy

| Local Harness Feature | 04 Failure / Artifact Layer |
| --- | --- |
| doc clarity / completeness / actionability judge | description, workflow body, examples |
| skill discovery test | trigger / discoverability |
| review / ship E2E tests | workflow executability |
| tool-call extraction | tool-use contract |
| transcript capture | trajectory regression |
| worktree isolation | safety / reproducibility |
| eval compare | versioning / fallback / promotion gate |
| touchfile selection | CI cost control and targeted replay |

## Limits

- The local harness is not yet a generic `SKILL.md` regression runner.
- Some current tests rely on host-specific binaries and auth state.
- Trigger detection is partially inferred from output and surface behavior, not always from an explicit `selected_skill` field.
- Full safety assertions still need surface-specific instrumentation for forbidden tool calls, destructive commands and external network boundaries.

## Takeaway For This Round

`04` should treat the local `gstack` harness as a concrete implementation reference for the next execution step.

The next useful artifact is not another generic prompt-optimization summary. It is a `skill-regression-runner` spec that keeps case definitions portable while isolating Claude / Codex / Gemini execution details inside adapters.
