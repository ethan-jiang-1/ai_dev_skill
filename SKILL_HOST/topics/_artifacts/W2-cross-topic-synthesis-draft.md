# Wave 2 Cross-Topic Synthesis

- updated_at: 2026-04-12 18:35:42 CST
- status: final-ish

## 1) The 3-layer model: spec vs convention vs host runtime

- `Spec layer` (what a skill is):
  - format, frontmatter, progressive disclosure, references/scripts packaging [ref](../_reference/00-shared-agent-skills-specification.md) [ref](../_reference/00-shared-agent-skills-integration-guide.md)
- `Shared convention layer` (how skills are found/managed):
  - cross-host path conventions and shared install/update/lifecycle signals [ref](../_reference/00-shared-agent-skills-quickstart-cross-host-paths.md) [ref](../_reference/00-shared-skills-cli-management-and-updates.md)
  - registry + telemetry signal that lifecycle is now part of “skills” rather than an external afterthought [ref](../_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](../_reference/00-shared-skills-sh-ecosystem-usage-signals.md)
- `Host runtime / extension layer` (what actually runs):
  - persistent instruction layers (`CLAUDE.md`, `AGENTS.md`, IDE rules), plus plugins/marketplaces, subagents, hooks, MCP, approvals/sandbox, tool availability, model/context exposure [ref](../_reference/02-claude-code-directory-scope-and-persistence.md) [ref](../_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](../_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](../_reference/05-opencode-skills-rules-and-instructions-bridge.md)
- Implication: `format portability` is increasingly real, but `runtime portability` is still mostly a host question [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)

## 2) 2026 growth: what is actually getting bigger

- Growth is no longer only “more skills exist”.
- The momentum is visible in:
  - `distribution + governance stacks` (Claude plugins/marketplace controls) [ref](../_reference/02-claude-code-plugin-marketplaces-and-versioning.md) [ref](../_reference/02-claude-code-settings-marketplace-governance.md)
  - `engineered lifecycle + governance surfaces` (Codex: scopes, disable flows, snapshots, approvals/sandbox/search modes) [ref](../_reference/03-codex-skills-locations-lifecycle-and-policy.md) [ref](../_reference/03-codex-model-snapshots-and-cli-optimized-runtime.md) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
  - `IDE + multi-environment agent expansion` (Cursor: agents window/await, cloud/self-hosted runtime expansion signals) [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](../_reference/04-cursor-2026-marketplaces-automations-and-agent-growth.md)
  - `explicit compatibility + provider/tool controls` (OpenCode: permissions, provider-gated websearch, plugin load order) [ref](../_reference/05-opencode-permissions-granularity-and-command-policy.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](../_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
- The ecosystem also now clearly shows what skills *package*:
  - writing/documentation workflows (method portability) [ref](../_reference/07-technical-writer-skill-patterns-and-install-flow.md)
  - deterministic retrieval routing (tool-surface assumptions become visible) [ref](../_reference/08-research-lookup-deterministic-routing-skill.md)
  - evidence-driven deep research orchestration (runtime contracts become the bottleneck) [ref](../_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md) [ref](../_reference/08-deep-research-agent-source-evaluation-pipeline.md)

## 3) The real divergence points (what matters more than syntax)

- The biggest differences are no longer `SKILL.md` syntax; they are:
  - persistent guidance layers and precedence rules [ref](../_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](../_reference/04-cursor-rules-agents-and-skill-boundary.md)
  - runtime composition: subagents, hooks, plugin bundles, MCP wiring [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](../_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](../_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)
  - permissions/sandbox/search controls and inheritance behavior [ref](../_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/05-opencode-permission-defaults-and-safety-guards.md)
  - execution topology: local/worktree/cloud/SSH/self-hosted, plus visibility of the constraints [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](../_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)
  - “hidden backend constraints” as a real 2026 variable (server-side routing/provisioning can decide if a workflow actually runs) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## Fact / analysis / trend split (explicit)

- `Hard facts` (directly evidenced):
  - public spec + implementation guidance exist; progressive disclosure is part of the shared contract [ref](../_reference/00-shared-agent-skills-specification.md) [ref](../_reference/00-shared-agent-skills-integration-guide.md)
  - distribution/lifecycle surfaces exist (registry, CLI update, telemetry signals) [ref](../_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](../_reference/00-shared-skills-cli-management-and-updates.md)
  - hosts expose materially different runtime stacks (instruction layering, permissions, subagents, hooks/plugins) [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](../_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](../_reference/05-opencode-permissions-granularity-and-command-policy.md)
- `Analysis judgments` (derived, but evidence-supported):
  - once a skill becomes orchestration-heavy, host runtime contracts dominate outcomes more than file format does [ref](../_reference/08-deep-research-agent-source-evaluation-pipeline.md) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
  - “useful interoperability” is better modeled as `sync/translate/delegate` strategies than as a single “migration” concept [ref](../_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
- `Trend signals` (2026+ signals, but still “trajectory” not contract):
  - skills are moving from “can you write it” toward “can you distribute/govern/maintain it” as registry/marketplaces and permission/runtime governance become first-order [ref](../_reference/02-claude-code-settings-marketplace-governance.md) [ref](../_reference/03-codex-model-snapshots-and-cli-optimized-runtime.md) [ref](../_reference/05-opencode-2026-changelog-operational-signals.md)
  - execution topology expansion is becoming part of the competitive surface (cloud/self-hosted/remote), but maturity varies and backend routing can still be a bottleneck [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## 4) Writing vs deep research (two high-leverage application lines)

- Writing skills:
  - usually portable at `workflow-method` layer: checklists, examples, style rules, output contracts [ref](../_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](../_reference/07-good-prose-human-style-reuse-pattern.md)
  - main risk is quality/overconfidence, not install failure [ref](../_reference/07-academic-writing-standards-skill-signal.md)
- Deep research skills:
  - portability breaks earlier because orchestration depends on tool availability, permissions, delegation, and runtime quality [ref](../_reference/08-deep-research-agent-source-evaluation-pipeline.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
  - install-level spread can coexist with internal assumption drift (call shapes, year/date assumptions, tool names) [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
- This contrast is now evidence-backed enough to support a simple rule:
  - writing skills are a default “learn-by-reuse” entry point
  - deep research skills are the best stress test for comparing hosts

## 5) Shared规律: maintenance/versioning and interoperability are now the core cost drivers

- Maintenance is increasingly “stack maintenance”, not “file maintenance”:
  - upgrades can change tool availability, subagent behavior, or backend routing in ways that rewrite skill reliability [ref](../_reference/04-cursor-task-tool-issues-persisted-into-2-5.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
  - governance surfaces (approvals/sandbox/search modes/permissions) are now part of the operational contract [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/05-opencode-permissions-granularity-and-command-policy.md)
- Interoperability in 2026 is increasingly achieved by three engineering moves, not by “native equivalence”:
  - `sync` (canonical source + mirror) [ref](../_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](../_reference/06-cross-host-sync-skills-normalization-and-path-drift.md)
  - `translate` (tool names, subagent labels, plan semantics) [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)
  - `delegate` (wrap another host as a worker instead of imitating it) [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md) [ref](../_reference/06-cross-host-codex-claude-loop-example.md)
- Failure modes also concentrate here:
  - path drift and runtime-assumption drift [ref](../_reference/06-cross-host-sync-skills-normalization-and-path-drift.md) [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
  - duplicate loading / version ambiguity when discovery is too broad without precedence/dedup rules [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)

## 6) Entry differences vs capability differences

- `Entry differences` (often solvable by conventions + tooling):
  - discovery/install flows, directory conventions, registry/CLI lifecycle [ref](../_reference/00-shared-agent-skills-quickstart-cross-host-paths.md) [ref](../_reference/00-shared-skills-cli-management-and-updates.md)
- `Capability differences` (runtime-shaped, harder to “port away”):
  - orchestration primitives (subagents/hooks/plugins), tool availability, approvals/sandbox/permissions, execution topology, model/context exposure, constraint visibility [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](../_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
- Practical conclusion: the right question is no longer “which host has skills?”, but “which host makes the relevant runtime contract explicit enough for my workflow?” [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## 7) Host snapshot (evidence-backed tendencies)

- `Claude`:
  - strongest high-maturity workflow composition story (`skill + hook + subagent + MCP + plugin`) [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
  - strongest signal that valuable workflows are not “pure skill only” once composition starts [ref](../_reference/00-shared-claude-code-skills-2026-operational-signals.md)
- `Codex`:
  - strongest engineered clarity around scope/lifecycle/runtime governance and model transparency [ref](../_reference/03-codex-skills-locations-lifecycle-and-policy.md) [ref](../_reference/00-shared-codex-model-requirements-and-context-windows.md)
  - constraints are unusually explicit (approvals/sandbox/search modes/subagent inheritance) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
- `Cursor`:
  - strongest IDE-native layering problem (rules vs skills vs subagents) [ref](../_reference/04-cursor-rules-agents-and-skill-boundary.md)
  - widest execution-topology ambition, but also clearest evidence that hidden backend constraints can change runtime outcomes [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- `OpenCode`:
  - strongest compatibility/bridge/exploration story with explicit permission/provider seams [ref](../_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](../_reference/05-opencode-permissions-granularity-and-command-policy.md)
  - highest drift/debug risk through configuration freedom [ref](../_reference/05-opencode-model-flexibility-and-provider-surface.md)

## 8) Where this synthesis points next (closeout framing)

- The next useful layer is decision-oriented guidance:
  - host selection by constraint visibility + workflow ceiling
  - portability strategy selection: `reuse` vs `sync` vs `translate` vs `delegate` vs `reduce discovery scope`
  - warning signals for “installs everywhere but doesn’t run reliably”
- Related Wave 2 artifacts:
  - [W2-host-capability-matrix.md](./W2-host-capability-matrix.md)
  - [W2-portability-layers-and-breakpoints.md](./W2-portability-layers-and-breakpoints.md)
  - [W2-host-selection-and-portability-decision-framework.md](./W2-host-selection-and-portability-decision-framework.md)
