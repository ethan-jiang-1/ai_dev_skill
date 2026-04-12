# Claude Code Skills Loading and Invocation

- source_url: https://code.claude.com/docs/en/features-overview
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 02
- trust_level: official
- why_it_matters: this page is the cleanest official explanation of how skills coexist with CLAUDE.md, MCP, subagents, and hooks at runtime
- claims_supported: skills load descriptions at session start and full content when used; disable-model-invocation removes ambient context cost; bundled skills exist; subagents preload passed skills
- canonical_exception: no

## 关键事实

- Claude distinguishes runtime loading behavior across features:
  - `CLAUDE.md`: full content every request
  - `Skills`: descriptions at start, full content when used
  - `MCP servers`: tool names at start, schemas on demand
  - `Subagents`: fresh isolated context
  - `Hooks`: zero context unless they return additional context
- For skills, Claude sees names and descriptions in every request by default and loads full content when the skill is invoked or selected.
- `disable-model-invocation: true` hides a skill from Claude until the user invokes it, reducing context cost to zero until use.
- Bundled Claude skills already exist, including examples like `/simplify`, `/batch`, and `/debug`.
- In subagents, skills behave differently: passed skills are fully preloaded into the subagent context at launch.

## 与本研究的关系

- Strongly supports Topic `02` on context economics and skill triggering.
- Helps separate Claude’s `ambient persistent guidance` from `on-demand workflow packaging`.

## 可直接引用的术语 / 概念

- `descriptions at start, full content when used`
- `disable-model-invocation: true`
- `bundled skills`
- `preloaded into subagent context`

## 模型 / 宿主 / 版本相关信息

- This is Claude-specific runtime behavior.
- It implies that skills with side effects or large context footprints should often be manual-only.

## 风险与局限

- This source explains runtime semantics but not plugin distribution, versioning, or maintenance mechanics in depth.

