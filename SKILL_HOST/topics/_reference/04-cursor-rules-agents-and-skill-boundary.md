# Cursor Rules, AGENTS, and Skill Boundary

- source_url: https://docs.cursor.com/context/rules
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled around 2026-01
- date_scope: current-2026
- related_topic: 04, 06
- trust_level: official
- why_it_matters: this is the cleanest official source for Cursor’s persistent-instruction layer, which is the main boundary users confuse with skills
- claims_supported: project rules live in `.cursor/rules`; user rules are always on; AGENTS.md is a simple root-level markdown alternative; `.cursorrules` is deprecated; agent-requested rules are metadata-based dynamic rules
- canonical_exception: no

## 关键事实

- Cursor rules provide persistent reusable context at the prompt level.
- Rule types include:
  - `Always`
  - `Auto Attached`
  - `Agent Requested`
- Project rules live in `.cursor/rules`, are version-controlled, and can be scoped with path patterns.
- User rules are global and always included in model context.
- `AGENTS.md` is a simple markdown alternative to `.cursor/rules`.
- `AGENTS.md` is currently root-level only and has no scoping or metadata.
- `.cursorrules` remains supported but is deprecated.
- The docs explicitly recommend migrating to Project Rules for more control and visibility.

## 与本研究的关系

- Essential for Topic `04` because the first job is distinguishing what should live in rules versus skills.
- Useful for Topic `06` because Cursor’s rule architecture differs materially from Claude and Codex.

## 可直接引用的术语 / 概念

- `.cursor/rules`
- `Agent Requested`
- `AGENTS.md`
- `.cursorrules (Legacy)`
- `persistent reusable context`

## 模型 / 宿主 / 版本相关信息

- This source is about Cursor’s persistent instruction layer, not skills directly.
- It is exactly what must be contrasted against on-demand skills.

## 风险与局限

- This page is strongest on rules, not on the full runtime details of skills or subagents.

