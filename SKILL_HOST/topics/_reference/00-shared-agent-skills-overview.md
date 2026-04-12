# Agent Skills Overview

- source_url: https://agentskills.io/what-are-skills
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current canonical docs snapshot accessed 2026-04-12; no explicit page timestamp visible
- date_scope: current-canonical
- related_topic: 01, 06, 07, 08
- trust_level: official
- why_it_matters: establishes the baseline definition of what a skill is before comparing host implementations
- claims_supported: skills are an open format; a skill is a folder with SKILL.md; skills can bundle scripts/templates/references; portability and versionability are first-class
- canonical_exception: no

## 关键事实

- Agent Skills are presented as a lightweight, open format for extending agents with specialized knowledge and workflows.
- The minimal unit is a folder containing `SKILL.md`.
- Skills can optionally bundle scripts, templates, and reference materials.
- The format is explicitly framed as portable, easy to audit, easy to version, and easy to share.

## 与本研究的关系

- Supports Topic `01` by grounding the common model of `skill`.
- Supports Topics `07` and `08` by showing why reusable, file-based packaging matters for real workflows.
- Supports Topic `06` because portability is part of the design intent, even if full runtime compatibility is not guaranteed.

## 可直接引用的术语 / 概念

- `open format`
- `SKILL.md`
- `specialized knowledge and workflows`
- `portable`
- `versioned and shareable`

## 模型 / 宿主 / 版本相关信息

- This page defines the format at the abstraction layer, not a single host implementation.
- It does not prescribe model family, context window, or permission model.

## 风险与局限

- This page is definitional and high-level; it does not specify validation rules, loading precedence, or host-specific behaviors.
- It should not be used by itself to prove 2026 trend claims.

