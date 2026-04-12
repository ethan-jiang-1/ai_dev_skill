# Skill Host Skills Deep Research Progressive Plan Round 1 Status

- `plan_path:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/plan/skill-host-skills-deep-research-progressive-plan-round-1.md`
- `template_version:` `v5`
- `seed_dir:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics`
- `reference_dir:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference`
- `artifact_dir:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_artifacts`
- `current_wave:` `round_1_complete`
- `overall_state:` `completed`
- `date_scope_default:` `2026-01-01+`
- `migration_note:` `2026-04-12 从 v4 plan skeleton 升级到 v5 协议；不重置已完成进度，status 继续作为执行真相来源`

## Wave Checklist

- `Wave 0` shared ground truth: `completed`
- `Wave 1` topic deep dives: `completed`
- `Wave 2` cross-topic synthesis: `completed`
- `Readiness Check`: `passed`

## Topic Status

- `01` `skill-foundations-and-common-model`: `near_evidence_complete`
- `02` `claude-code-skills-deep-dive`: `near_evidence_complete`
- `03` `codex-cli-skills-deep-dive`: `near_evidence_complete`
- `04` `cursor-skills-deep-dive`: `near_evidence_complete`
- `05` `opencode-skills-deep-dive`: `near_evidence_complete`
- `06` `cross-host-comparison-and-interoperability`: `near_evidence_complete`
- `07` `writing-skills-discovery-adaptation-and-host-support`: `near_evidence_complete`
- `08` `deep-research-skills-discovery-adaptation-and-host-support`: `near_evidence_complete`

## Document Counters

- `wave0_shared_docs:` `20`
- `total_reference_docs:` `90`
- `total_artifact_docs:` `24`
- `topic01_docs:` `shared refs + boundary examples + expanded evidence summary`
- `topic02_docs:` `10 topic-specific refs + evidence summary`
- `topic03_docs:` `10 topic-specific refs + evidence summary`
- `topic04_docs:` `10 topic-specific refs + evidence summary`
- `topic05_docs:` `10 topic-specific refs + evidence summary`
- `topic06_docs:` `10 topic-specific refs + shared refs backfilled + evidence summary`
- `topic07_docs:` `10 topic-specific refs + evidence summary`
- `topic08_docs:` `10 topic-specific refs + evidence summary`

## Current Focus

- `now_working_on:` `round 1 closeout completed`
- `why_now:` `Wave 1 floors are met for Topics 01-08; Wave 2 artifacts are final-ish; readiness check is passed`
- `next_after_this:` `open Round 2: pick one branch (official migration contracts, more repair-oriented failure cases, or deeper “constraint visibility” comparisons)`

## Suspended Branches

```md
- branch: `topic06/official-migration-guidance`
  state: suspended
  why_suspended: repeated 2026 search produced strong practitioner evidence but no meaningful official cross-host migration contract
  confirmed_so_far: portability is well-supported through sync, translation, delegation, and duplicate-loading failure evidence
  still_missing: official host-sanctioned migration guidance or formal interoperability policy
  reopen_trigger: official docs, release notes, or security/config docs begin addressing cross-host migration explicitly

- branch: `topic06-08/additional-repair-oriented-failure-cases`
  state: suspended
  why_suspended: current evidence already covers one strong duplicate-loading failure plus several drift/constraint failures; marginal search return is falling
  confirmed_so_far: install portability can degrade into runtime waste, ambiguity, or stale assumptions without discovery boundaries and translation work
  still_missing: more before/after repair cases with explicit remediation steps outside the current Cursor example
  reopen_trigger: a newly surfaced 2026 failure case materially changes portability guidance or adds a stronger remediation pattern
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
- Migrated active round-1 plan from template `v4` to `v5` without resetting wave progress
- Upgraded plan contract so references must be more self-contained and execution follows file-first autonomous protocol
- Added migration compatibility rule so legacy references can be upgraded incrementally instead of forcing a big-bang rewrite
- Added Claude runtime/permission reference covering WebSearch/WebFetch approvals, subagent inheritance, and Task-to-Agent evolution
- Added cross-host sync skill reference showing portability demand and community path drift
- Added research-skill adoption reference showing install portability can coexist with stale host assumptions
- Backfilled Topic 02 with explicit Claude research-tool and subagent-approval constraints
- Backfilled Topic 06 with sync-path drift, install-vs-runtime portability, and research-skill assumption drift
- Backfilled Topic 08 with multi-host research-skill adoption plus runtime-assumption drift
- Refreshed Topic 06 / 08 evidence summaries and Wave 2 synthesis artifacts to include path drift and runtime-assumption portability
- Added Codex execution-governance reference covering approvals, sandbox/network controls, web-search modes, cloud internet defaults, and subagent inheritance
- Backfilled Topic 03 with explicit Codex approval, sandbox, search-mode, and inheritance constraints
- Refreshed Topic 06 / 08 comparisons so Codex joins Claude and OpenCode on the explicit-constraint side of the matrix
- Refreshed Topic 03 evidence summary and Wave 2 host matrix to include Codex execution-governance layers
- Added cross-host tool-mapping reference showing Claude-oriented tool and subagent labels require Codex translation rather than blind reuse
- Added cross-host mirror-sync reference showing `.agents/skills` and `.claude/skills` maintenance can require a canonical source plus pre-commit enforcement
- Added cross-host delegation package reference showing Claude workflows can wrap `codex exec` with explicit model, reasoning, sandbox, and context-hygiene controls
- Refreshed Topic 06 / 08 docs and Wave 2 artifacts around `sync / translate / delegate` interoperability patterns
- Added official Cursor forum failure case showing cross-tool skill duplication can waste context and create version ambiguity without deduplication
- Added `W2-topic06-08-readiness-check.md` and moved Topic 06 / 08 to `near_evidence_complete`
- Added `W2-host-selection-and-portability-decision-framework.md` to turn Wave 2 evidence into concrete host-choice and portability guidance
- Refreshed `W2-cross-topic-synthesis-draft.md` with explicit cross-topic judgments and direct `_reference/*.md` support links
- Added `W2-round1-readiness-check.md` to expand readiness evaluation to Topics 01-08 and document cross-validation coverage
- Added 5 Topic 07 writing-skill registry references (API docs / doc systems / proofreading / marketing / doc artifacts)
- Backfilled Topic 07 seed + evidence summary with the expanded writing-skill taxonomy evidence
- Added 4 Topic 08 deep-research registry references (ArXiv / market intel / prospect investigation / Notion research ops)
- Backfilled Topic 08 seed + evidence summary with the expanded research-skill taxonomy evidence
- Added 4 Topic 02 official Claude references (skills authoring/paths + memory/rules + permission modes + 2026 changelog) and backfilled Topic 02 seed + evidence summary
- Added 2 Topic 03 official Codex references (config reference + worktrees) and backfilled Topic 03 seed + evidence summary
- Added 2 Topic 05 official OpenCode references (skills discovery paths + providers/connect/auth storage) and backfilled Topic 05 seed + evidence summary
- Added 4 Topic 06 cross-host practitioner references (skills_sync CLI + example config + meta-skill hygiene + MCP research discipline) and backfilled Topic 06 seed + evidence summary
- Added `W2-round1-closeout-summary.md` to provide a decision-oriented “stop-the-world” closeout entry point now that Wave 1 doc floors are met
- Added Topic 01 boundary examples section (skills vs rules vs MCP vs plugins vs subagents) and expanded Topic 01 evidence summary
- Marked Wave 2 artifacts as final-ish and passed the round-level readiness check
- Added `SKILL_HOST/topics/00-topic-registry.md` as a stable workspace entry point for Topic 01-08
