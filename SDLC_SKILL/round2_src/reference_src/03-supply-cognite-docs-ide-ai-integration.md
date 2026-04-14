# Cognite Docs: Connecting your IDE to Cognite documentation (MCP + SKILL.md)

- source_url: https://docs.cognite.com/dev/guides/ide_ai_integration
- source_type: official_docs
- accessed_at: 2026-04-09
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: 这是一个“企业第一方把 skills 与 MCP 一起产品化并写进官方文档”的高信号样本：既提供 MCP server 接入（让 agent 能检索/查询文档），也提供 `SKILL.md` capability file 的安装与更新口径（包含 `npx skills add https://docs.cognite.com` 与 well-known discovery index 链接）。它同时支撑供给层与分发层的真实落地形态。

## Key Facts

- 页面主题为 “Connecting your IDE to Cognite documentation”，并提供一个 “Copy MCP Server” 的入口，用于把预配置 MCP server 复制到 agentic AI 工具的配置中。（Ref: page content）
- 页面提供 “Install the SKILL.md capability file” 的安装指南，并给出 CLI 安装口径：通过 `npx skills add https://docs.cognite.com` 安装，且说明 CLI 会自动找到 `SKILL.md`（无需知道精确路径）。（Ref: page content）
- 页面明确该 skill file 会随着文档部署更新，并建议为获取最新版本重新运行 `npx skills add https://docs.cognite.com`（或纳入 CI/CD 自动更新）。（Ref: page content）
- 页面提供 direct links：
  - skill file：`https://docs.cognite.com/skill.md`
  - discovery index（legacy）：`https://docs.cognite.com/.well-known/skills/index.json`。（Ref: page content）
- 页末显示 “Last modified on February 10, 2026”。（Ref: page content）

## Claims Supported

- “企业第一方正在把 ‘skills（SKILL.md）+ MCP server’ 作为一套组合能力对外发布，并给出安装、更新与安全提示。”（主题 3 supply；趋势/机制）
- “`npx skills add <base-url>` 这种分发入口在真实企业文档中被采用，强化了 well-known/URL discovery 作为分发基础设施的现实价值。”（主题 2 dist；主题 3 supply）

## Captured Excerpts (keep short)

> You can also view the discovery index at https://docs.cognite.com/.well-known/skills/index.json.

## Terms / Concepts

- MCP server
- capability file (`SKILL.md`)
- URL-based install (`npx skills add <base-url>`)
- well-known discovery index

## Risks / Limits

- 该页面主要呈现 Cognite 对其文档能力的集成路径；其适用范围与实际安全边界仍取决于具体宿主（Cursor/Codex/Claude/VSC 等）对 MCP 与 skills 的权限与治理实现。

