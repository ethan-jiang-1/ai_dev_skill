# Expo Docs: Expo Skills for AI agents

- source_url: https://docs.expo.dev/skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: Expo 用官方文档把“第一方 skills 的价值（准确/高效）+ 兼容宿主 + 安装路径（Claude/Cursor/skills CLI）+ 与 MCP 的配套关系”一次讲清楚，是企业第一方供给层的高信号样本。

## Key Facts

- Expo Skills：官方提供的结构化 instruction files，用于构建/部署/调试 Expo 与 React Native apps，目标是让 AI agents 更准确高效。
- 兼容宿主：文档明确可与 Claude Code、Cursor、Codex 等 agents 一起工作。
- 安装方式（文档给出）：
  - Claude Code：通过 plugin marketplace 添加 `expo/skills` 并安装 `expo` plugin（`/plugin marketplace add expo/skills`、`/plugin install expo`）。
  - Cursor：以 Remote Rule 方式添加 GitHub URL（`https://github.com/expo/skills.git`），并注明 skills 不在 `/` 菜单中显示，主要通过 auto-discovery（请求匹配 skill 描述时自动使用）。
  - 任意兼容 agent：可用 skills CLI（示例 `npx skills add expo/skills`）。
- 文档列出 “Available Expo Skills”（具体 skill 名单与描述），并提供示例 prompt -> skill 对应。
- 文档提到 “Expo MCP Server”：作为 companion tooling，给 coding agents 直接访问 Expo/EAS 服务。

## Claims Supported

- “企业第一方 skills 仓库具有长期价值：与自家产品/服务的真实机制与更新同步，并给出可操作的安装/触发路径。”（主题3 supply）
- “skills 与 MCP 存在协同关系：skills 提供过程化指导，MCP Server 提供对外部平台服务的运行时访问能力。”（主题3 MCP 共生）

## Captured Excerpts (keep short)

> Expo Skills are structured instruction files...

## Terms / Concepts

- Remote Rule (Cursor)
- auto-discovery (triggered by description)
- Expo MCP Server

## Risks / Limits

- 文档描述 Cursor/Claude/Codex 的安装与触发口径，仍需结合各宿主官方文档核验细节（目录/权限/版本治理）。

