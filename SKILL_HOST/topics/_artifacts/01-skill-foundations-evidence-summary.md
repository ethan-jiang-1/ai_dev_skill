# Topic 01 Evidence Summary

- generated_at: 2026-04-12 18:35:42 CST
- topic: `01-skill-foundations-and-common-model`
- status: near_evidence_complete

## New local evidence gathered

- Public Agent Skills spec:
  - required frontmatter (`name`, `description`), naming/description constraints, and `progressive disclosure` as a first-class principle [ref](../_reference/00-shared-agent-skills-specification.md)
- Official client integration guide:
  - the 3-tier loading model (`catalog / instructions / resources`)
  - `.agents/skills/` as a widely adopted convention (not spec-mandated)
  - precedence guidance (project overrides user), compaction protection, and dedup recommendations [ref](../_reference/00-shared-agent-skills-integration-guide.md)
- Official quickstart portability signal:
  - “open format” positioning and explicit cross-host mention (Claude Code + OpenAI Codex) [ref](../_reference/00-shared-agent-skills-quickstart-cross-host-paths.md)
- Best-practices / token-economy guidance:
  - keep SKILL.md concise, push bulky context into `references/`, and document scripts/env requirements explicitly [ref](../_reference/00-shared-agent-skills-best-practices.md) [ref](../_reference/00-shared-agent-skills-scripts-and-env-requirements.md)
  - treat `description` as a discoverability contract, not decoration [ref](../_reference/00-shared-agent-skills-description-optimization.md)
- Registry / CLI / telemetry lifecycle layer:
  - `skills.sh` shows registry governance language, audit posture, telemetry signals, and leaderboard-style discovery [ref](../_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](../_reference/00-shared-skills-sh-ecosystem-usage-signals.md)
  - `skills` CLI exposes package-manager-like lifecycle actions (`find/add/check/update`) [ref](../_reference/00-shared-skills-cli-management-and-updates.md)
- Boundary evidence and “where it should live” examples:
  - always-on instruction layers differ across hosts (`AGENTS.md` chain, Cursor rules, Claude CLAUDE.md, OpenCode instructions bridge) [ref](../_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](../_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](../_reference/02-claude-code-memory-claude-md-rules-and-auto-memory.md) [ref](../_reference/05-opencode-skills-rules-and-instructions-bridge.md)
  - `skill + MCP + rules` composition is a real 2026 pattern (Docs MCP + Docs Skill) [ref](../_reference/00-shared-openai-docs-mcp-cross-host-support.md)
  - plugins/hooks and subagents are the main “host runtime layer” surfaces that break naive portability [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](../_reference/03-codex-hooks-plugins-and-feature-maturity.md) [ref](../_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
  - discovery-surface failures exist (duplicate loading/version ambiguity without dedup/precedence) [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)

## Provisional direction

- `skills` in 2026 are now best understood as a layered standard-plus-runtime ecosystem, not just “long prompts in folders”:
  - spec layer (format + progressive disclosure) exists and is stable enough to treat as ground truth [ref](../_reference/00-shared-agent-skills-specification.md)
  - convention layer (discovery paths + lifecycle tooling) is emerging rapidly but remains non-binding [ref](../_reference/00-shared-agent-skills-integration-guide.md) [ref](../_reference/00-shared-skills-cli-management-and-updates.md)
  - host runtime layer (rules, plugins, subagents, hooks, MCP, approvals/sandbox) dominates real portability outcomes [ref](../_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
