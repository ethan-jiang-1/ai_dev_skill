# Agent Skills Specification

- source_url: https://agentskills.io/specification
- source_type: official_spec
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current specification page accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 01, 06
- trust_level: official
- why_it_matters: this is the strongest source for what the standard actually requires versus what hosts add on top
- claims_supported: required frontmatter fields; naming and description constraints; progressive disclosure guidance; validation and reference layout rules
- canonical_exception: no

## 关键事实

- A skill directory must contain a `SKILL.md`.
- `SKILL.md` must contain YAML frontmatter followed by Markdown content.
- Required frontmatter fields are `name` and `description`.
- `name` must be `1-64` characters, lowercase alphanumeric plus hyphens, cannot start or end with `-`, cannot contain consecutive `--`, and must match the parent directory name.
- `description` must be `1-1024` characters and should describe both what the skill does and when to use it.
- Optional fields include `license`, `metadata`, `compatibility`, and experimental fields depending on implementation.
- Progressive disclosure is part of the spec guidance:
  - startup loads metadata only
  - activation loads the full `SKILL.md`
  - resources load on demand
- Recommended limits:
  - keep `SKILL.md` under `500` lines
  - keep the main instruction body under roughly `5000` tokens
- Validation is explicitly supported via `skills-ref validate`.

## 与本研究的关系

- Critical for Topic `01` because it separates `spec` from `host convention`.
- Critical for Topic `06` because cross-host comparison must begin from format-level obligations before runtime differences.

## 可直接引用的术语 / 概念

- `YAML frontmatter`
- `progressive disclosure`
- `skills-ref validate`
- `compatibility`
- `metadata`

## 模型 / 宿主 / 版本相关信息

- The spec defines file format and recommended loading shape.
- It does not mandate where clients must scan for skills or how permissions, marketplaces, or subagents behave.

## 风险与局限

- The specification is not the same thing as complete interoperability.
- Host-specific features like plugin systems, slash-command invocation, sandboxes, and permission gating sit above the spec.

