# Agent Skills Integration Guide

- source_url: https://agentskills.io/client-implementation/adding-skills-support
- source_type: official_implementation_guide
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current guide snapshot accessed 2026-04-12; no explicit page timestamp visible
- date_scope: current-canonical
- related_topic: 01, 06
- trust_level: official
- why_it_matters: this is the clearest source for what "skills-compatible" means at implementation time
- claims_supported: three-tier loading; `.agents/skills/` convention; precedence guidance; direct user activation patterns; context compaction protection; dedup behavior
- canonical_exception: no

## 关键事实

- The guide defines a three-tier loading model:
  - catalog: `name + description`
  - instructions: full `SKILL.md`
  - resources: scripts, references, assets
- It explicitly treats `.agents/skills/` as a widely adopted cross-client convention, while clarifying that the specification itself does not mandate scan locations.
- Recommended scan locations include project-local and user-level skill directories.
- Recommended precedence: project-level skills override user-level skills when names collide.
- It recommends exposing explicit user activation via slash commands or mentions, not just model-chosen activation.
- It recommends protecting activated skill content from context compaction.
- It recommends deduplicating repeated activations in a session.

## 与本研究的关系

- This is a key bridge between `format` and `runtime`.
- It provides the most defensible baseline for comparing Claude, Codex, Cursor, and OpenCode on discovery and activation behavior.

## 可直接引用的术语 / 概念

- `catalog / instructions / resources`
- `.agents/skills/ convention`
- `project overrides user`
- `protect skill content from compaction`
- `deduplicate activations`

## 模型 / 宿主 / 版本相关信息

- The guide is implementation-oriented and host-agnostic.
- It is especially relevant when evaluating whether a host is truly `skills-compatible` or only partially compatible.

## 风险与局限

- This is guidance, not a hard compliance test suite.
- A host may intentionally diverge while still claiming support for the file format.

