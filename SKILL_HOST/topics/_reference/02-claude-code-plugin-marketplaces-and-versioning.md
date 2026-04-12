# Claude Code Plugin Marketplaces and Versioning

- source_url: https://code.claude.com/docs/en/plugins
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 02
- trust_level: official
- why_it_matters: Claude’s plugin system is the clearest proof that reusable skills in Claude have already moved beyond loose folder-copying into distribution and versioned packaging
- claims_supported: plugins are the shareable distribution unit; plugin manifests use semver; skills are namespaced inside plugins; local plugin dirs can override installed marketplace versions for testing; reload and marketplace submission flows exist
- canonical_exception: no

## 关键事实

- Claude plugin docs explicitly say to start with standalone `.claude/` configuration for quick iteration, then convert to a plugin when ready to share.
- Plugin manifest includes a `version` field and the docs explicitly say to track releases using semantic versioning.
- Plugin skills are always namespaced, for example `/my-plugin:hello`, which prevents conflicts.
- During local development, `--plugin-dir` can load a local plugin copy for testing.
- If a `--plugin-dir` plugin has the same name as an installed marketplace plugin, the local copy takes precedence for that session.
- Claude supports `/reload-plugins` to load plugin changes without restarting.
- Plugins can package skills, agents, hooks, MCP servers, LSP servers, and default settings.
- Official marketplace submission paths exist for Claude.ai and Console.

## 与本研究的关系

- Critical for Topic `02` on distribution, updates, and version management.
- Shows that in Claude, skills are increasingly part of a plugin-mediated supply chain rather than only raw folders.

## 可直接引用的术语 / 概念

- `semantic versioning`
- `namespaced skills`
- `--plugin-dir`
- `local copy takes precedence`
- `/reload-plugins`

## 模型 / 宿主 / 版本相关信息

- These are Claude-specific packaging mechanics.
- Plugin packaging is especially relevant for team sharing and marketplace-based lifecycle management.

## 风险与局限

- Plugin docs emphasize happy-path packaging more than long-term operational risks.
- They should be paired with changelog and directory/persistence docs for maintenance analysis.

