# skills CLI Management and Updates

- source_url: https://skills.sh/docs/cli
- source_type: official_cli_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled last month before access
- date_scope: current-2026
- related_topic: 06, 07, 08
- trust_level: official
- why_it_matters: this is a direct shared source for lifecycle management rather than only installation
- claims_supported: the CLI is the primary install/manage surface; it supports add/check/update flows; telemetry can be disabled; package-manager-like lifecycle is emerging around skills
- canonical_exception: no

## 关键事实

- The `skills` CLI is described as the primary way to install and manage skills.
- It can be run directly with `npx`.
- The CLI supports:
  - `npx skills add <skill-name>`
  - `npx skills find [query]`
  - `npx skills check`
  - `npx skills update`
- Telemetry is enabled by default for leaderboard ranking, but can be disabled with `DISABLE_TELEMETRY=1`.

## 与本研究的关系

- Important shared evidence for lifecycle and version-management behavior.
- Supports Topic `06` on how the ecosystem is becoming package-manager-like.
- Supports Topic `07` and `08` because practical reuse depends on install, check, and update flows.

## 可直接引用的术语 / 概念

- `skills CLI`
- `check for updates`
- `update all installed skills`
- `DISABLE_TELEMETRY=1`

## 模型 / 宿主 / 版本相关信息

- This is ecosystem tooling rather than a host-native feature.
- It is useful because it introduces a shared management layer that may sit above host-specific installation surfaces.

## 风险与局限

- The CLI’s existence does not mean every host honors every installed skill equally.
- Update mechanics alone do not solve runtime incompatibility.

