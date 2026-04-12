# Wave 2 Round 1 Closeout Summary

- generated_at: 2026-04-12 18:15:00 CST
- status: draft-closeout
- scope: `Topics 01-08` (Round 1)

## What this round established (the reusable ground truth)

- `skills` in 2026 are best modeled as a 3-layer ecosystem:
  - `spec layer`: shared `SKILL.md` + frontmatter + progressive disclosure [ref](../_reference/00-shared-agent-skills-specification.md) [ref](../_reference/00-shared-agent-skills-integration-guide.md)
  - `shared convention layer`: directory conventions + registry/CLI lifecycle (`find/add/check/update`, telemetry signals) [ref](../_reference/00-shared-agent-skills-quickstart-cross-host-paths.md) [ref](../_reference/00-shared-skills-cli-management-and-updates.md) [ref](../_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md)
  - `host runtime/extension layer`: persistent rules, plugins/marketplaces, subagents, hooks, MCP, approvals/sandbox, tool availability, model/context exposure [ref](../_reference/02-claude-code-skills-authoring-discovery-and-frontmatter.md) [ref](../_reference/03-codex-config-reference-policy-and-skill-controls.md) [ref](../_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](../_reference/05-opencode-agent-skills-discovery-and-compatibility-paths.md)

## The most important 2026 shift

- The practical question is no longer “which host has skills”.
- It is “which host makes the runtime contract explicit enough for my workflow”.
- Evidence: approvals/sandbox/search modes and other constraints materially change whether a skill *runs* vs merely *installs* [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/02-claude-code-permission-modes-and-protected-paths.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## Writing vs deep research (the two highest-leverage application lines)

- Writing skills are often portable at the `workflow-method` layer:
  - rules, checklists, examples, style contracts, doc-type templates [ref](../_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](../_reference/07-document-writer-writing-skill-registry-signal.md)
- Deep research skills are the portability stress test:
  - they depend on tool availability, permissions, parallel execution, and evidence discipline
  - they can spread widely at install-level while still carrying stale call-shapes or year/tool assumptions [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
  - “research discipline” can be portable as method, but tool routing often needs translation [ref](../_reference/06-mcp-research-skill-definition-tool-selection-and-quality-rules.md) [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)

## Portability is layered (so “yes/no portability” is the wrong question)

- The practical breakdown is documented here:
  - [W2-portability-layers-and-breakpoints.md](./W2-portability-layers-and-breakpoints.md)
- Key 2026 portability moves are now evidence-backed:
  - `sync` (canonical source + mirror) [ref](../_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](../_reference/06-skills-sync-cli-tool-and-central-skills-yaml.md)
  - `translate` (tool names, plan semantics, subagent labels) [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)
  - `delegate` (wrap another host as a worker) [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
  - `reduce discovery scope` (avoid duplicate-loading/version ambiguity) [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md) [ref](../_reference/06-skills-sync-example-skills-yaml-wildcards-and-exclusions.md)

## Host selection: evidence-backed tendencies (not immutable truths)

- Summary matrix:
  - [W2-host-capability-matrix.md](./W2-host-capability-matrix.md)
- Decision framing:
  - [W2-host-selection-and-portability-decision-framework.md](./W2-host-selection-and-portability-decision-framework.md)

## Skill authoring hygiene that survives host churn

- A useful cross-host authoring rubric is now captured as a real SKILL.md (triggering discipline + progressive disclosure targets) [ref](../_reference/06-optimize-skills-skill-definition-and-quality-heuristics.md)
- This supports a round-level rule:
  - keep `format portability` easy (minimal metadata, clear description)
  - push fragile/deterministic steps into scripts/resources
  - treat runtime assumptions as host-specific shells

## How to use the repo now (for future work / handoff)

- Start from the synthesis and decision artifacts:
  - [W2-cross-topic-synthesis-draft.md](./W2-cross-topic-synthesis-draft.md)
  - [W2-host-selection-and-portability-decision-framework.md](./W2-host-selection-and-portability-decision-framework.md)
  - [W2-portability-layers-and-breakpoints.md](./W2-portability-layers-and-breakpoints.md)
- Then drill into topic seeds for “mechanism + trend + maintenance + model + difficulty”:
  - `SKILL_HOST/topics/01-08-*.md`
- Use `_reference/_INDEX.md` as the 30-second traceability entry point:
  - `SKILL_HOST/topics/_reference/_INDEX.md`

## Remaining gaps / suspended branches (Round 1)

- Official host-sanctioned cross-host migration contracts remain scarce; keep relying on `sync/translate/delegate` evidence until official policy emerges.
- Suspended branches remain valid triggers to reopen:
  - `topic06/official-migration-guidance`
  - `topic06-08/additional-repair-oriented-failure-cases`

