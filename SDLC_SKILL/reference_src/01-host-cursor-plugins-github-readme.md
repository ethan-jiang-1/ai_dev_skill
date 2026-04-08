# cursor/plugins (GitHub) README

- source_url: https://github.com/cursor/plugins
- source_type: official_repo
- accessed_at: 2026-04-08
- related_topic: host
- trust_level: official
- why_it_matters: Cursor plugins 的“正式落盘结构”与多插件 marketplace 形态在官方仓库 README 中被明确（marketplace.json + 每插件 plugin.json + skills/rules/hooks 等目录约定），可作为比博客/论坛更可复现的 ground truth。

## Key Facts

- 官方仓库定位：`cursor/plugins` 自述为“Official Cursor plugins …”，每个 plugin 是仓库根目录下的独立目录，并包含自己的 manifest：`.cursor-plugin/plugin.json`。（Ref: repo README）
- 仓库为 multi-plugin marketplace：根目录 `.cursor-plugin/marketplace.json` 用于列出所有 plugins。（Ref: repo README）
- 官方 README 给出的典型 plugin 目录结构包含（按需出现）：`skills/`（Agent Skills）、`rules/`（Cursor rules, `.mdc`）、`mcp.json`（MCP server definitions）、以及 `README.md`/`CHANGELOG.md`/`LICENSE` 等。（Ref: repo README）
- root marketplace manifest 的真实示例表明：marketplace `plugins[]` 中每个 entry 至少包含 `name/source/description`，其中 `source` 指向相对路径的 plugin 目录。（Ref: `.cursor-plugin/marketplace.json`）

## Claims Supported

- “Cursor 的 plugin 是一个可安装/可索引的打包单元，且其落盘结构与 manifest 文件名是稳定且机器可读的。”（主题 1 host；主题 2 dist 可用）
- “Cursor plugins 的 packaging 语义不仅是 skills，还包含 rules/hooks/MCP 等多类 primitives 的并置交付。”（主题 1 机制抽象）

## Captured Excerpts (keep short)

> Each plugin is a standalone directory at the repository root with its own `.cursor-plugin/plugin.json` manifest.

## Terms / Concepts

- multi-plugin marketplace repository
- `.cursor-plugin/marketplace.json`
- `.cursor-plugin/plugin.json`
- `skills/`, `rules/`, `hooks`, `mcp.json`

## Risks / Limits

- README/结构约定回答的是“插件如何组织与索引”；插件在 Cursor IDE/CLI 中的实际加载、权限边界与企业治理细节仍需结合 Cursor 产品文档与实现行为进一步核验。

