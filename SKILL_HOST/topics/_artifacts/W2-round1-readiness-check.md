# Wave 2 Round 1 Readiness Check

- generated_at: 2026-04-12 18:35:42 CST
- scope: `Topics 01-08`
- status: passed

## Pass-signal review

- `30-second traceability`: passed
  - most key judgments in `SKILL_HOST/topics/*.md` now link to concrete `_reference/*.md`
  - `_reference/_INDEX.md` provides a stable entry point for shared and topic-specific evidence
  - remaining weakness: a few “synthesis-only” claims still rely on distributed support rather than a single obvious anchor reference
- `mechanism + trend + maintenance/version + model + difficulty`: passed at topic level
  - each topic seed now carries the five layers as explicit sections
  - Topic 06 / 08 are the strongest on “interoperability breakpoints” and “runtime-assumption drift”
- `cross-topic synthesis support`: passed (final-ish)
  - Wave 2 artifacts now cover layering, portability layers, host capability matrix, and decision framing
  - a “stop-the-world” closeout entry point now exists: [W2-round1-closeout-summary.md](./W2-round1-closeout-summary.md)
- `new handoff readiness`: mostly passed
  - a new maintainer can follow references and artifacts without needing the original browsing context
  - remaining weakness: official host-sanctioned migration guidance is still scarce, so interoperability remains evidence-led rather than contract-led

## Topic-by-topic readiness and cross-validation map

- Topic 01 `skill-foundations-and-common-model`: `near_evidence_complete`
  - cross-validated by host runtime divergence (Claude/Codex/Cursor/OpenCode) [ref](../_reference/02-claude-code-directory-scope-and-persistence.md) [ref](../_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](../_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](../_reference/05-opencode-skills-rules-and-instructions-bridge.md)
  - cross-validated by portability breakdown beyond format [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)

- Topic 02 `claude-code-skills-deep-dive`: `near_evidence_complete`
  - cross-validated by “skills become stacks” framing and orchestration breakpoints [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](../_reference/08-deep-research-agent-source-evaluation-pipeline.md)
  - cross-validated by explicit permission/web-tool envelope being a research-skill gate [ref](../_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
  - evidence floor strengthened by official skills/memory/permission-mode/changelog snapshots (locations/precedence, CLAUDE.md import patterns, protected-path guarantees, 2026-dated plugin/effort/versioning changes) [ref](../_reference/02-claude-code-skills-authoring-discovery-and-frontmatter.md) [ref](../_reference/02-claude-code-memory-claude-md-rules-and-auto-memory.md) [ref](../_reference/02-claude-code-permission-modes-and-protected-paths.md) [ref](../_reference/02-claude-code-changelog-2026-plugin-and-skill-surface.md)

- Topic 03 `codex-cli-skills-deep-dive`: `near_evidence_complete`
  - cross-validated by “constraint visibility matters” framing (approvals/sandbox/search modes) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/05-opencode-permissions-granularity-and-command-policy.md)
  - cross-validated by portability strategy requiring translation/delegation when call shapes diverge [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
  - evidence floor strengthened by official config reference + worktrees topology docs (governance keys + explicit parallel execution surface) [ref](../_reference/03-codex-config-reference-policy-and-skill-controls.md) [ref](../_reference/03-codex-app-worktrees-parallel-threads-and-handoff.md)

- Topic 04 `cursor-skills-deep-dive`: `near_evidence_complete`
  - cross-validated by “hidden backend constraints change runtime outcomes” evidence [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md) [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - cross-validated by discovery-layer failure case (duplicate loading/version ambiguity) [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md) [ref](../_reference/00-shared-agent-skills-quickstart-cross-host-paths.md)
  - remaining weakness: official docs path churn/marketplace evolution may require periodic re-snapshotting for time-trend claims

- Topic 05 `opencode-skills-deep-dive`: `near_evidence_complete`
  - cross-validated by “explicit seams enable bridging but increase drift risk” [ref](../_reference/05-opencode-skills-rules-and-instructions-bridge.md) [ref](../_reference/05-opencode-model-flexibility-and-provider-surface.md)
  - cross-validated by tool/provider gating as a research-skill breakpoint [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](../_reference/08-valyu-powered-search-skill-requirements.md)
  - remaining weakness: add at least one more “real-world adaptation” example if the goal is to teach bridging as a repeatable workflow (not just a capability claim)

- Topic 06 `cross-host-comparison-and-interoperability`: `near_evidence_complete`
  - cross-validated by concrete `sync/translate/delegate` strategies [ref](../_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
  - cross-validated by “install portability != semantic portability” stress tests from research skills [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
  - remaining weakness: official host-sanctioned migration guidance remains scarce

- Topic 07 `writing-skills-discovery-adaptation-and-host-support`: `near_evidence_complete`
  - cross-validated by “workflow-method portability” evidence [ref](../_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](../_reference/07-good-prose-human-style-reuse-pattern.md)
  - cross-validated by lifecycle/discovery layer becoming less painful (registry/CLI) [ref](../_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](../_reference/00-shared-skills-cli-management-and-updates.md)
  - evidence floor strengthened by additional 2026 writing-skill registry snapshots spanning API docs, doc systems, doc artifacts, marketing writing, and proofreading [ref](../_reference/07-api-documenter-writing-skill-registry-signal.md) [ref](../_reference/07-documentation-engineer-writing-skill-registry-signal.md) [ref](../_reference/07-proof-skill-proofreading-registry-signal.md)
  - remaining weakness: still light on explicit “maintenance/versioning” cases for writing skills that combine lint/hooks/pipelines across hosts

- Topic 08 `deep-research-skills-discovery-adaptation-and-host-support`: `near_evidence_complete`
  - cross-validated by research-skill taxonomy and evidence-discipline patterns [ref](../_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md) [ref](../_reference/08-deep-research-agent-source-evaluation-pipeline.md)
  - evidence floor strengthened by additional 2026 registry snapshots spanning academic literature, market intel, prospect research, and knowledge-base research ops [ref](../_reference/08-chat-with-arxiv-academic-research-skill-registry-signal.md) [ref](../_reference/08-research-management-notion-workspace-skill-registry-signal.md)
  - cross-validated by runtime/tool/permission breakpoints across hosts [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
  - remaining weakness: more concrete “rewrite the call shape” examples would further harden the adaptation playbook

## Round-level recommendation

- Keep the main thread on `decision-oriented closeout`, not broad evidence collection.
- Only reopen exploration when a new 2026+ source changes one of the current synthesis judgments.
- Keep suspended branches as-is:
  - official host-sanctioned migration guidance
  - additional repair-oriented failure cases with before/after remediation steps
