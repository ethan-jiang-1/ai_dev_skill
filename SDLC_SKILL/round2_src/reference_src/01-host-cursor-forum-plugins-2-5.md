# Cursor Forum: Cursor 2.5 Plugins (announcement)

- source_url: https://forum.cursor.com/t/cursor-2-5-plugins/152124
- source_type: official_forum
- accessed_at: 2026-04-08
- published_at: 2026-02-17
- related_topic: host
- trust_level: official
- why_it_matters: 这是 Cursor 官方论坛对 plugins 的发布说明，补齐“在产品内如何安装（/add-plugin）”与“plugins 打包哪些 primitives”的一手证据。

## Key Facts

- 发布说明宣称：可以从 Cursor Marketplace 发现并安装 plugins，以扩展 Cursor 的预构建能力。
- 文中明确：plugins 将 skills、subagents、MCP servers、hooks、rules 打包为单次安装的单元。
- 安装方式：可在编辑器内使用 `/add-plugin` 直接安装（文中明确给出命令）。
- 文中列出初期合作伙伴（Amplitude/AWS/Figma/Linear/Stripe 等），并强调覆盖设计、数据库、支付、分析、部署等工作流。

## Claims Supported

- “Cursor 的 plugin 作为宿主扩展单元，安装入口是 editor 内命令（/add-plugin）而非纯文件复制。”（主题1 host）
- “plugin primitives 的集合（skills/subagents/MCP/hooks/rules）在官方发布渠道被重复确认。”（主题1 机制抽象）

## Captured Excerpts (keep short)

> install directly in the editor with /add-plugin

## Terms / Concepts

- Cursor Marketplace
- /add-plugin

## Risks / Limits

- 论坛帖属于发布说明，具体实现细节（落盘路径、权限边界、CLI/IDE 一致性）需要结合 docs 与 bug report 交叉验证。

