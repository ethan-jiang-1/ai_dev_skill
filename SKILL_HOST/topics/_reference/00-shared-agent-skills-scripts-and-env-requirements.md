# Agent Skills Scripts and Environment Requirements

- source_url: https://agentskills.io/skill-creation/using-scripts
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled 3 weeks before access; current docs snapshot
- date_scope: current-2026
- related_topic: 01, 07, 08
- trust_level: official
- why_it_matters: this is a clean shared source for operational prerequisites, script execution, and environment assumptions
- claims_supported: skills can bundle executable scripts; prerequisites should be stated explicitly; script paths are relative to skill root; environment assumptions must be declared instead of guessed
- canonical_exception: no

## 关键事实

- Skills can instruct agents to run shell commands and can bundle reusable scripts in `scripts/`.
- The documentation explicitly recommends stating prerequisites in `SKILL.md`, for example required runtimes or tool versions.
- Relative paths in script execution are resolved from the skill root.
- The page treats environment declaration as part of good skill design, not an optional afterthought.

## 与本研究的关系

- Important for Topic `01` because it sharpens the boundary between a pure instruction file and an operational workflow package.
- Important for Topic `07` because many useful writing skills depend on linters, formatters, or local scripts.
- Important for Topic `08` because research skills often require explicit shell, browser, or API prerequisites.

## 可直接引用的术语 / 概念

- `scripts/`
- `state prerequisites explicitly`
- `relative to the skill directory root`

## 模型 / 宿主 / 版本相关信息

- This source is host-agnostic and directly relevant to model/runtime expectations.
- It strengthens the idea that environment requirements are part of skill usability.

## 风险与局限

- It does not define how every host surfaces or validates prerequisites.
- It is stronger for operational design than for host comparison.

