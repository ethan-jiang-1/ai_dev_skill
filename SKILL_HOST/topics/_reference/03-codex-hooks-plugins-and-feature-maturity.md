# Codex Hooks, Plugins, and Feature Maturity

- source_url: https://developers.openai.com/codex/hooks
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current hooks docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 06, 08
- trust_level: official
- why_it_matters: this source captures the current operational maturity of adjacent Codex extension surfaces that often combine with skills
- claims_supported: hooks are experimental; hooks are feature-flagged; multiple matching hooks run concurrently; hook discovery is config-layer based; plugins bundle skills/app integrations/MCP servers; plugin permissions still rely on Codex approvals; feature maturity labels define stability expectations
- canonical_exception: no

## 关键事实

- Codex hooks are marked `Experimental` and under active development.
- Windows support for hooks is temporarily disabled.
- Hooks require a feature flag:
  - `[features]`
  - `codex_hooks = true`
- Multiple matching command hooks for the same event launch concurrently.
- Hook discovery uses config-layer-adjacent `hooks.json` files such as `~/.codex/hooks.json` and `<repo>/.codex/hooks.json`.
- Plugins in Codex bundle skills, app integrations, and MCP servers into reusable workflows.
- Installed plugin workflows still obey existing approval settings and external service auth/privacy requirements.
- Codex feature maturity labels define:
  - `Under development`
  - `Experimental`
  - `Beta`
  - `Stable`

## 与本研究的关系

- Important for Topic `03` because it shows that reusable skill workflows often depend on adjacent features with different stability levels.
- Important for Topic `06` because maturity labeling itself becomes a comparison dimension.

## 可直接引用的术语 / 概念

- `Experimental`
- `codex_hooks = true`
- `matching hooks run concurrently`
- `plugins bundle skills, app integrations, and MCP servers`
- `Stable vs Beta vs Experimental`

## 模型 / 宿主 / 版本相关信息

- This is about runtime maturity and extensibility, not direct model capability.
- It strongly affects what kinds of skill workflows are safe for production versus evaluation.

## 风险与局限

- This source spans several extension layers, so it is excellent for lifecycle and stability analysis but not a deep single-feature reference.

