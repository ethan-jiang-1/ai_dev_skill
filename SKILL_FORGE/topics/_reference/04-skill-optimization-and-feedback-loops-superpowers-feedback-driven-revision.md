# 04 / Superpowers Feedback-Driven Skill Revision Practice

- `status`: `captured`
- `source_type`: `local-open-source-snapshot`
- `accessed_at`: `2026-04-17`
- `topic`: `04-skill-optimization-and-feedback-loops`
- `source_repo`: `https://github.com/obra/superpowers`
- `snapshot_commit`: `b7a8f76985f1e93e75dd2f2a3b424dc731bd9d37`
- `source_paths`:
  - `/Users/bowhead/ai_dev_skill/superpowers-analysis/source_snapshot/superpowers/docs/plans/2025-11-28-skills-improvements-from-user-feedback.md`
  - `/Users/bowhead/ai_dev_skill/superpowers-analysis/worklog/01-file-inventory.md`

## Why This Matters

This is one of the clearest public-practice-shaped artifacts found so far for `04`.

It does not provide a benchmark table with before / after scores, but it does show a real skill optimization loop:

1. failures appeared in real development sessions
2. maintainers normalized them into root-cause patterns
3. each pattern was mapped to a specific skill artifact revision
4. rollout was phased by risk
5. success metrics were defined before promotion

That is materially closer to a real skill optimization workflow than generic prompt-optimization advice.

## Evidence Points

### Real feedback enters the loop as failure reports

The plan says two Claude instances using `superpowers` in actual development sessions produced detailed feedback.

The document treats these as problem reports first, not automatic fixes.

Relevance to `04`:

- skill optimization starts from observed failures in real work
- feedback should be normalized into reusable failure patterns
- candidate changes should remain bounded and evidence-linked

### Revisions target specific artifact layers, not one global prompt

The proposed changes are not "rewrite everything."

They are localized to specific skill artifacts:

- `verification-before-completion/SKILL.md`
- `testing-anti-patterns/SKILL.md`
- `requesting-code-review/SKILL.md`
- `subagent-driven-development/SKILL.md`

Relevance to `04`:

- a stable optimization loop edits the artifact layer closest to the failure
- candidate revision can target verification gates, prompt templates, anti-pattern references, and workflow rules separately

### The failure set is concrete and operational

The plan records concrete failures such as:

- configuration change verification gap
- background process accumulation
- subagent context bloat
- no self-reflection before handoff
- mock-interface drift
- reviewer file access failure
- fix-workflow latency
- skills not being read

Relevance to `04`:

- these failures map cleanly to workflow executability, tool / contract, feedback loop, and promotion-gate concerns
- the public evidence shape here is "failure report -> targeted revision plan," not "benchmark chart"

### Promotion is phased instead of fully automatic

The plan explicitly separates:

- Phase 1 high-impact, low-risk changes
- Phase 2 moderate changes that should be tested carefully
- Phase 3 optimizations that should wait for validation

It also defines open questions, success metrics, risks, and mitigations.

Relevance to `04`:

- this is strong support for bounded candidate revision plus human promotion gate
- a real skill optimization workflow should not auto-promote every apparently useful edit

## Extracted Pattern For Skill Optimization

This artifact supports a practical optimization loop:

1. capture failures from real usage sessions
2. write down the exact failure pattern and root cause
3. identify the nearest skill artifact layer to revise
4. propose bounded changes instead of a full rewrite
5. phase rollout by risk
6. define observable success metrics before promotion

## Mapping To 04 Failure Taxonomy

| Superpowers Evidence | 04 Failure / Artifact Layer |
| --- | --- |
| configuration change verification gap | workflow executability / verification step design |
| background process accumulation | workflow executability / process hygiene instructions |
| context bloat in subagent prompts | workflow executability / prompt template structure |
| no self-reflection before handoff | workflow executability / review checkpoint design |
| mock-interface drift | tool-use contract / testing reference layer |
| reviewer file access failure | structural or workflow failure / review prompt template |
| skills not being read | trigger or workflow failure / invocation discipline |
| phase-based rollout and success metrics | versioning / regression / promotion gate |

## Limits

- This is a plan document, not a completed before / after score report.
- The evidence is qualitative and operational, not a benchmark leaderboard.
- The sample comes from one repo and a small number of real usage sessions.
- It is stronger as evidence for feedback-driven revision practice than for quantitative effect size.

## Takeaway For This Round

Public evidence for skill optimization does exist, but it more often looks like:

`real failure reports -> localized skill revisions -> phased rollout -> explicit success metrics`

It much less often looks like:

`public baseline/candidate scorecard for a skill package revision`

That distinction matters for `04`, because it tells us where public evidence is structurally rich and where we should rely more on local compare contracts and runnable case packs.
