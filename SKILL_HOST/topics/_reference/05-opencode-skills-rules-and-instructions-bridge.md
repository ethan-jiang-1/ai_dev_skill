# OpenCode Skills, Rules, and Instructions Bridge

- source_url: https://opencode.ai/docs/rules/
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: updated 2026-04-06
- date_scope: 2026-04
- related_topic: 05, 06, 07
- trust_level: official
- why_it_matters: OpenCode makes the rules/instructions layer explicit and bridges external instruction systems directly
- claims_supported: OpenCode reads AGENTS.md and CLAUDE.md; AGENTS takes precedence; opencode.json can mount local files, .cursor/rules files, or remote URLs as instructions
- canonical_exception: no

## 关键事实

- OpenCode can read both `AGENTS.md` and `CLAUDE.md`.
- `AGENTS.md` takes precedence over `CLAUDE.md`.
- The rules docs show an `instructions` array in `opencode.json`.
- That array can include:
  - local markdown files
  - `.cursor/rules/*.md`
  - remote URLs
- This makes OpenCode not just skill-compatible but also instruction-bridge capable.

## 与本研究的关系

- Central to Topic `05`.
- Strong support for Topic `06` because it shows a host explicitly designed for cross-ecosystem reuse.

## 可直接引用的术语 / 概念

- `AGENTS.md takes precedence`
- `instructions array`
- `.cursor/rules/*.md`
- `remote URLs`

## 模型 / 宿主 / 版本相关信息

- This is host-level instruction behavior, not just file-format support.

## 风险与局限

- Bridging instructions is powerful, but behavioral equivalence still depends on model/tool/runtime differences.

