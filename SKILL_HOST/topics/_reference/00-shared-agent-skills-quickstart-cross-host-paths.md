# Agent Skills Quickstart Cross-Host Paths

- source_url: https://agentskills.io/skill-creation/quickstart
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled 3 weeks before access; current quickstart snapshot
- date_scope: current-2026
- related_topic: 01, 03, 06
- trust_level: official
- why_it_matters: gives a concrete cross-host example instead of abstract portability claims
- claims_supported: the same skill format is presented as compatible with Claude Code and OpenAI Codex; `.agents/skills/` is shown as a default path in at least one client context
- canonical_exception: no

## 关键事实

- The quickstart explicitly says Agent Skills are an open format.
- It explicitly states that the same skill can work in compatible agents, including Claude Code and OpenAI Codex.
- The tutorial uses `.agents/skills/roll-dice/SKILL.md` as the default project-relative location in the demonstrated workflow.

## 与本研究的关系

- Helps Topic `01` show that portability is not only a marketing claim but appears in official onboarding material.
- Helps Topic `03` because Codex is named directly in a standard-format quickstart.
- Helps Topic `06` because it anchors `.agents/skills/` as a real interoperability convention.

## 可直接引用的术语 / 概念

- `open format`
- `.agents/skills/`
- `Claude Code and OpenAI Codex`

## 模型 / 宿主 / 版本相关信息

- This source is about a simple example skill, not about advanced runtime behavior.

## 风险与局限

- Compatibility here means the format and basic workflow can travel.
- It does not prove that complex host-specific skills will execute identically.

