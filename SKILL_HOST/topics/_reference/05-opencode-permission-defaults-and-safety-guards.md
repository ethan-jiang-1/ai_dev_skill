# OpenCode Permission Defaults and Safety Guards

- source_url: https://opencode.ai/docs/permissions
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: 2026-Q2 page snapshot accessed 2026-04-12
- date_scope: 2026-Q2
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: clarifies that OpenCode’s permission system includes both convenience defaults and explicit safety guard concepts
- claims_supported: permissive defaults exist; .env reads are blocked by default; external_directory and doom_loop are first-class guards; permission rules key off tool names and patterns
- canonical_exception: no

## 关键事实

- If nothing is specified, OpenCode starts from permissive defaults for most tools.
- `external_directory` and `doom_loop` default to `ask`.
- `read` is generally `allow`, but `.env` and `.env.*` files are denied by default while `.env.example` remains allowed.
- Permission rules are keyed by tool name and input pattern.
- `task`, `skill`, `webfetch`, `websearch`, and `codesearch` are all explicit permission surfaces.

## 与本研究的关系

- Important for Topic `05` because it reveals where OpenCode is permissive by default and where it adds safety rails.
- Important for Topic `06` because permission philosophy is a major cross-host comparison axis.

## 可直接引用的术语 / 概念

- `doom_loop`
- `external_directory`
- `.env denied by default`
- `skill` as a permission surface
- `task` as a permission surface

## 模型 / 宿主 / 版本相关信息

- This is execution-governance behavior and strongly shapes what skills and agents can safely do.

## 风险与局限

- Permissive defaults are convenient, but they also mean users need to understand the permission model to avoid accidental overreach.

