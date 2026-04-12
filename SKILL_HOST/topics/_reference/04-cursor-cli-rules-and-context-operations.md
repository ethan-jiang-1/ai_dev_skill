# Cursor CLI Rules and Context Operations

- source_url: https://docs.cursor.com/en/cli/using
- source_type: official_docs_search_snippet
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs search result snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 04, 06
- trust_level: official
- why_it_matters: strengthens the claim that Cursor’s CLI participates in the same rules/context stack as the IDE, not a separate minimal shell mode
- claims_supported: Cursor CLI reads AGENTS.md and CLAUDE.md as rules alongside .cursor/rules; resume/compress/non-interactive flows exist; command approval is explicit
- canonical_exception: no

## 关键事实

- The official docs search result for Cursor CLI states the CLI reads:
  - `AGENTS.md`
  - `CLAUDE.md`
  - `.cursor/rules`
- The same result highlights:
  - `/compress` for freeing context space
  - `--resume` and `cursor-agent resume` for continuing prior threads
  - explicit command approval
  - `--print` / non-interactive mode for scripts and CI

## 与本研究的关系

- Important for Topic `04` because it shows Cursor CLI inherits the rules/context model rather than bypassing it.
- Important for Topic `06` because it makes Cursor more directly comparable with Codex and Claude CLI-style workflows.

## 可直接引用的术语 / 概念

- `reads AGENTS.md and CLAUDE.md as rules`
- `/compress`
- `--resume`
- `non-interactive mode`

## 模型 / 宿主 / 版本相关信息

- This source is particularly useful for understanding Cursor outside the GUI-only framing.

## 风险与局限

- The direct page open redirected poorly in browsing, so this note is based on the official search-result snippet.
- It should be treated as strong directional evidence, with room for later page-level confirmation if needed.

