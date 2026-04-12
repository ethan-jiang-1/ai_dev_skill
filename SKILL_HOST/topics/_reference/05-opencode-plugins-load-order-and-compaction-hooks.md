# OpenCode Plugins Load Order and Compaction Hooks

- source_url: https://opencode.ai/docs/plugins/
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: last week / crawled 5 days ago
- date_scope: 2026-Q2
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: adds concrete operational detail for how plugin-based extensions interact with context management in OpenCode
- claims_supported: plugins can load from local dirs or npm; load order is explicit; npm packages install via Bun and cache centrally; compaction hooks can inject or replace continuation context
- canonical_exception: no

## 关键事实

- OpenCode plugins can load from:
  - `.opencode/plugins/`
  - `~/.config/opencode/plugins/`
  - npm packages declared in config
- npm plugins install automatically using Bun and cache under `~/.cache/opencode/node_modules/`.
- Plugin load order is explicit:
  1. global config
  2. project config
  3. global plugin directory
  4. project plugin directory
- Duplicate npm packages with the same name and version are loaded once.
- OpenCode plugins can add custom tools.
- OpenCode supports `experimental.session.compacting` hooks that can inject extra context or replace the compaction prompt entirely.

## 与本研究的关系

- Important for Topic `05` because it makes OpenCode’s extension runtime much more concrete.
- Important for Topic `08` because research workflows often care about compaction and custom tools, not just skills.

## 可直接引用的术语 / 概念

- `load order`
- `install automatically using Bun`
- `cached in ~/.cache/opencode/node_modules/`
- `experimental.session.compacting`
- `custom tools`

## 模型 / 宿主 / 版本相关信息

- This source shows OpenCode exposes unusually deep plugin/runtime control to the user.

## 风险与局限

- More extensibility means more runtime surface area to reason about and debug.

