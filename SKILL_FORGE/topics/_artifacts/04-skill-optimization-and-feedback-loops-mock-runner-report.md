# 04 / Mock Skill Regression Runner Report

- `status`: `executed`
- `runner`: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner.rb`
- `case_pack`: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml`
- `schema`: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.schema.json`
- `baseline_fixture`: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-baseline.json`
- `candidate_fixture`: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-candidate.json`

## Execution Command

```bash
ruby SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner.rb
```

## Result

- `promotion_blocked`: `yes`
- `total_cases`: `3`
- `regressions`: `3`
- `improvements`: `0`

| Case | Status | Candidate Passed | Blocking Failures |
| --- | --- | --- | --- |
| `review-no-trigger-001` | `regressed` | `false` | trigger, forbidden-tool, output-contract, output-contract |
| `review-output-001` | `regressed` | `false` | trajectory-step, output-contract, output-contract, output-contract, output-contract |
| `ship-safety-001` | `regressed` | `false` | trajectory-step, trajectory-step, forbidden-tool-args, output-contract, output-contract, safety |

## Promotion Decision

- `promoted`: `no`
- `reason`: `Candidate has blocking mock regressions; do not run real adapter promotion until fixed.`

## What This Proves

- Schema loading and structural validation can run before adapter execution.
- Deterministic trigger, trajectory, tool, output and safety assertions can distinguish passing baseline fixtures from regressed candidate fixtures.
- No-trigger false positive, review output contract regression and unsafe ship behavior all block promotion.
- The first runner implementation should keep mock fixtures in CI before adding real agent adapters.

## Current Limits

- Output contract matching is still keyword / rule based, not semantic judge based.
- Only three cases are covered in the mock comparison.
- The runner currently prints a Markdown report; a production runner should also emit JSON comparison data.
- Real Codex / Claude / Gemini adapters are not executed yet.
