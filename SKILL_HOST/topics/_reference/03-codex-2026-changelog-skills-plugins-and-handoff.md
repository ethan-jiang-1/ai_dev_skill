# Codex 2026 Changelog: Skills, Plugins, and Handoff

- source_url: https://developers.openai.com/codex/changelog
- source_type: official_changelog
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: 2026-01-14, 2026-02-02, 2026-03-17, 2026-03-24 relevant entries
- date_scope: 2026-Q1
- related_topic: 03, 06
- trust_level: official
- why_it_matters: gives dated product-evolution evidence rather than only static docs
- claims_supported: custom prompts were deprecated in favor of skills; Codex app launched with skills and parallel agent threads; plugin bundles arrived in March; handoff/subagent navigation fixes were still being shipped in March
- canonical_exception: no

## 关键事实

- `2026-01-14`: Codex changelog says custom prompts are deprecated and reusable instructions/workflows should use `skills` instead.
- `2026-02-02`: the Codex app launched with:
  - agent threads in parallel
  - built-in worktree support
  - `Skills`
  - automations
- `2026-02-03`: the app renamed `Sync` to `Handoff`, making the handoff workflow more explicit.
- `2026-03-17`: Codex fixed thread handoff and subagent navigation issues across worktrees and the VS Code extension.
- `2026-03-24`: Codex added installable plugins that package skills, app integrations, and MCP server configuration.

## 与本研究的关系

- Important for Topic `03` because it proves Codex skill support is actively evolving in dated releases.
- Important for Topic `06` because it adds concrete maturity and rollout signals for comparison with Claude, Cursor, and OpenCode.

## 可直接引用的术语 / 概念

- `custom prompts deprecated`
- `use skills for reusable instructions and workflows`
- `Handoff`
- `parallel agent threads`
- `plugins package skills, app integrations, and MCP server configuration`

## 模型 / 宿主 / 版本相关信息

- This source links skills directly to product evolution across app, CLI, and IDE-related surfaces.

## 风险与局限

- Changelog entries are concise; they reveal trajectory and maintenance seams but not the full usage detail.

