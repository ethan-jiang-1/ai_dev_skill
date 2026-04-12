# OpenCode 2026 Changelog Operational Signals

- source_url: https://opencode.ai/changelog
- source_type: official_changelog
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: 2026-03 to 2026-04 entries
- date_scope: 2026-Q1 to 2026-Q2
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: the changelog reveals how fast OpenCode’s runtime surface is evolving and which operational seams matter in practice
- claims_supported: plugin version pinning exists; package install scripts are blocked; skill presentation was adjusted to reduce token usage; CLAUDE.md compatibility toggles exist; compaction and provider-specific limit handling are active concerns
- canonical_exception: no

## 关键事实

- `2026-03-31` changelog entries state:
  - explicit plugin versions are pinned during install
  - package install scripts are blocked
- `2026-03-12` entries mention:
  - skill presentation adjusted to reduce token usage
  - symlink resolution to prevent duplicate contexts
- `2026-03-30` entries mention:
  - `OPENCODE_DISABLE_CLAUDE_CODE_PROMPT` fix for project-level `CLAUDE.md`
- `2026-04-04` entries mention:
  - respecting model-specific input limit overrides
  - sessions getting stuck after tool calls with OpenAI-compatible providers were fixed
- Other entries show ongoing work on prompt caching, async plugin hooks, and subagent call UI state.

## 与本研究的关系

- Important for Topic `05` because it shows OpenCode is rapidly iterating on compatibility, token cost, plugin safety, and provider/runtime stability.
- Important for Topic `06` because changelog depth is part of operational maturity analysis.

## 可直接引用的术语 / 概念

- `pin explicit plugin versions`
- `block package install scripts`
- `skill presentation to reduce token usage`
- `model-specific input limit overrides`

## 模型 / 宿主 / 版本相关信息

- This source strongly connects runtime maintenance to both provider diversity and extension flexibility.

## 风险与局限

- Changelog entries are terse; they reveal seams but not always the full mechanism or severity.

