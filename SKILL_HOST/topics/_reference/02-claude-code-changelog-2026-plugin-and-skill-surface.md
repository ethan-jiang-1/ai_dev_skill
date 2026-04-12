# Claude Code Changelog (2026): Plugins, Marketplaces, and Skill Controls

- source_url: https://code.claude.com/docs/en/changelog
- source_type: official_changelog
- accessed_at: 2026-04-12 17:35:00 CST
- published_or_updated_at: release notes include dated entries; latest observed entry in page: `2.1.101` (April 10, 2026)
- date_scope: 2026-Q1 to 2026-Q2
- related_topic: 02, 06
- trust_level: official
- why_it_matters: this is the strongest official time-signal for how Claude Code’s surrounding ecosystem (plugins/marketplaces/permissions/skill controls) evolves; it anchors “maintenance and versioning costs” with concrete 2026 release entries
- claims_supported: plugin marketplaces and plugin version pinning exist; offline marketplace failure modes are addressed; `effort` frontmatter support exists for skills and slash commands; add-dir behavior for plugin governance exists; tooling error messaging evolves across versions
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- The page is explicitly described as release notes by version and is generated from `CHANGELOG.md` on GitHub.
- Example 2026 entries visible in the changelog:
  - `2.1.101` (April 10, 2026): multiple runtime UX improvements including clearer “tool not available” errors.
  - `2.1.90` (April 1, 2026): `CLAUDE_CODE_PLUGIN_KEEP_MARKETPLACE_ON_FAILURE` env var to keep marketplace cache when `git pull` fails (offline environments).
  - `2.1.45` (February 17, 2026): support for reading `enabledPlugins` and `extraKnownMarketplaces` from `--add-dir` directories.
  - `2.1.14` (January 20, 2026): pin plugins to specific git commit SHAs (exact-version installs).
  - A 2026 entry adds `effort` frontmatter support for skills and slash commands to override the model effort level when invoked.

## 核心内容摘录

- The changelog makes “maintenance” concrete:
  - marketplaces can fail to refresh; cache/pull behaviors and warnings matter
  - plugin installs can be pinned to commit SHAs (repeatable deployments)
  - skill runtime can be affected by frontmatter-level knobs (`effort`)
  - add-dir behaviors can expand the effective configuration surface

## 与本研究的关系

- Topic `02`: anchors the thesis that valuable Claude workflows are often “skill + plugin + governance” stacks, and that versioning/marketplace mechanics become part of day-to-day operations.
- Topic `06`: strengthens the claim that portability and interoperability have to include governance and lifecycle controls (pinning, cache behavior, marketplace policies), not only file format.

## 可直接引用的术语 / 概念

- `extraKnownMarketplaces`
- `enabledPlugins`
- `CLAUDE_CODE_PLUGIN_KEEP_MARKETPLACE_ON_FAILURE`
- “pinning plugins to specific git commit SHAs”
- `effort` frontmatter support for skills and slash commands

## 模型 / 宿主 / 版本相关信息

- Changelog ties runtime behavior to explicit versions and dates, supporting 2026 trend claims without relying on undated docs snapshots.

## 风险与局限

- The changelog is high-signal but still needs to be paired with the “current behavior” docs pages when deriving exact runtime semantics.
- Some entries apply to specific interfaces (CLI/VS Code) or deployment modes; interpretation should stay scoped to the described surface.

