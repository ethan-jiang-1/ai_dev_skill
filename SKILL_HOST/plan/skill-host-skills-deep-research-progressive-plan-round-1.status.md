# Skill Host Skills Deep Research Progressive Plan Round 1 Status

- `plan_path:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/plan/skill-host-skills-deep-research-progressive-plan-round-1.md`
- `seed_dir:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics`
- `reference_dir:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference`
- `artifact_dir:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_artifacts`
- `current_wave:` `wave_1_in_progress`
- `overall_state:` `in_progress`
- `date_scope_default:` `2026-01-01+`

## Wave Checklist

- `Wave 0` shared ground truth: `completed`
- `Wave 1` topic deep dives: `in_progress`
- `Wave 2` cross-topic synthesis: `pending`
- `Readiness Check`: `pending`

## Topic Status

- `01` `skill-foundations-and-common-model`: `in_progress`
- `02` `claude-code-skills-deep-dive`: `in_progress`
- `03` `codex-cli-skills-deep-dive`: `in_progress`
- `04` `cursor-skills-deep-dive`: `in_progress`
- `05` `opencode-skills-deep-dive`: `in_progress`
- `06` `cross-host-comparison-and-interoperability`: `in_progress`
- `07` `writing-skills-discovery-adaptation-and-host-support`: `in_progress`
- `08` `deep-research-skills-discovery-adaptation-and-host-support`: `in_progress`

## Document Counters

- `wave0_shared_docs:` `20`
- `total_reference_docs:` `61`
- `total_artifact_docs:` `20`
- `topic01_docs:` `shared refs backfilled`
- `topic02_docs:` `5 topic-specific refs + evidence summary`
- `topic03_docs:` `7 topic-specific refs + evidence summary`
- `topic04_docs:` `10 topic-specific refs + evidence summary`
- `topic05_docs:` `8 topic-specific refs + evidence summary`
- `topic06_docs:` `1 topic-specific ref + shared refs backfilled + evidence summary`
- `topic07_docs:` `5 topic-specific refs + evidence summary`
- `topic08_docs:` `5 topic-specific refs + evidence summary`

## Current Focus

- `now_working_on:` `Wave 1 density refresh on 01/04/05/06/08 + hidden-runtime-constraint evidence`
- `why_now:` `the strongest remaining gaps are no longer basic feature existence; they are hidden routing constraints, execution topology differences, and provider/tool gating that change whether advanced skills actually run`
- `next_after_this:` `tighten Wave 2 comparison judgments with stronger portability, hidden-runtime, and research-tool-surface evidence`

## Suspended Branches

```md
- branch:
  state: suspended
  why_suspended:
  confirmed_so_far:
  still_missing:
  reopen_trigger:
```

## Risks

- `risk_1:` `some current docs pages do not expose explicit update timestamps, so they should be treated as current canonical snapshots rather than sole evidence for time-trend claims`
- `risk_2:` `Cursor skills docs surface appears to exist but some public URLs and forum references suggest doc-path churn; changelog and official forum may be needed to triangulate current behavior`
- `risk_3:` `cross-host registry examples are valuable for adoption and portability signals, but they remain practitioner evidence rather than host-runtime contracts`

## Notes

- Initialized `_reference` and `_artifacts`
- Added 20 shared Wave 0 reference documents
- Added `_reference/_INDEX.md`
- Added `W0-shared-ground-truth-evidence-summary.md`
- Backfilled Topic 01 with shared evidence and current judgment
- Backfilled Topic 06 with shared evidence and current judgment
- Added Topic 02 topic-specific references and evidence summary
- Added Topic 03 topic-specific references and evidence summary
- Backfilled Topic 02 with current official evidence
- Backfilled Topic 03 with current official evidence
- Added Topic 04 topic-specific references and evidence summary
- Added Topic 05 topic-specific references and evidence summary
- Backfilled Topic 04 with current official evidence
- Backfilled Topic 05 with current official evidence
- Added Topic 07 topic-specific references and evidence summary
- Added Topic 08 topic-specific references and evidence summary
- Backfilled Topic 07 with current ecosystem evidence
- Backfilled Topic 08 with current ecosystem evidence
- Added question-list artifacts for Topics 01-08
- Added evidence summaries for Topics 01 and 06
- Added `W2-cross-topic-synthesis-draft.md`
- Added `W2-host-capability-matrix.md`
- Added `W2-portability-layers-and-breakpoints.md`
- Expanded `_reference/_INDEX.md` to include topic-specific references
- Added late Wave 1 refs for Codex dated changelog and model snapshots
- Added late Wave 1 refs for Cursor CLI context operations, 2.6 platform growth, and 2.5 task-tool persistence
- Added late Wave 1 refs for OpenCode plugin load-order / compaction hooks and permission defaults / safety guards
- Added cross-host workflow reference showing Codex-Claude orchestration as a portability pattern
- Added latest Cursor `3.0` runtime reference covering Agents Window, Await, and self-hosted cloud agents
- Added latest OpenCode tools reference covering websearch provider gating and subagent tool defaults
- Added official Cursor forum evidence showing Task/subagent failures persisted into 2.6.22 and 3.0.4 due to server-side routing and model-policy interactions
