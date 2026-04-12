# Claude Code Skills Roles and Plugin Architecture

- source_url: https://code.claude.com/docs/en/features-overview
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12; no explicit page timestamp visible
- date_scope: current-canonical
- related_topic: 02, 06
- trust_level: official
- why_it_matters: clarifies how Claude distinguishes persistent repo instructions, skills, subagents, and larger multi-agent coordination
- claims_supported: CLAUDE.md vs Skill vs Subagent are distinct; plugin system packages skills alongside agents/hooks/MCP; Claude skills are embedded in a broader agent architecture
- canonical_exception: no

## 关键事实

- Claude Code’s feature overview distinguishes:
  - `CLAUDE.md` as persistent context loaded every conversation
  - `Skill` as reusable instructions, knowledge, and workflows
  - `Subagent` as isolated execution context returning summarized results
  - `Agent teams` as coordination across multiple independent sessions
- Claude’s plugin reference states that a plugin can bundle skills, agents, hooks, MCP servers, and LSP servers.
- In the plugin system, skills live as directories with `SKILL.md` and optional supporting resources.
- Skills exposed through plugins become slash-invocable capabilities.

## 与本研究的关系

- Critical for Topic `02` because it shows skills are one layer in a richer Claude extension stack.
- Critical for Topic `06` because comparing hosts requires separating `skill` from `persistent rules` and `subagent execution`.

## 可直接引用的术语 / 概念

- `CLAUDE.md`
- `Skill`
- `Subagent`
- `Agent teams`
- `plugin components`

## 模型 / 宿主 / 版本相关信息

- This is Claude-specific architecture, not a generic Agent Skills rule.
- It suggests that high-end Claude workflows often rely on combinations of skills plus hooks / MCP / agents.

## 风险与局限

- This source explains role boundaries but not operational pain points, maintenance overhead, or changelog-driven stability issues.

