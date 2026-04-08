# cloudflare/skills: README

- source_url: https://github.com/cloudflare/skills
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: Cloudflare 的官方 skills 仓库同时展示了 “跨宿主安装目录映射 + commands vs skills 区分 + 内置 MCP servers”，是研究 skills 与 MCP 共生的高密度一手样本。

## Key Facts

- 仓库定位：面向 Cloudflare 平台/Workers/Agents SDK 的 Agent Skills 集合。
- 安装方式覆盖多宿主：Claude Code plugin marketplace、Cursor marketplace/remote rule、`npx skills` CLI、clone/copy 到宿主约定目录。
- README 给出“各宿主 skill directory”映射表（示例包含 Claude Code、Cursor、OpenCode、OpenAI Codex、Pi），并附对应 docs 链接。
- README 区分：
  - Commands：用户显式调用的 slash commands（示例 `/cloudflare:build-agent`、`/cloudflare:build-mcp`）。
  - Skills：基于对话匹配 triggers 自动加载（auto-loaded）。
- MCP Servers：README 明确该 plugin 包含 Cloudflare 的 remote MCP servers，并列出 server 列表与用途（如 cloudflare-api、cloudflare-docs、cloudflare-bindings 等）。
- README 还给出 Cloudflare Agents 文档与 MCP guide 的官方链接作为资源。

## Claims Supported

- “企业第一方供给把‘skills + commands + MCP servers’打包在同一仓库/插件中，体现了 skills 与 MCP 的运行时共生。”（主题3 supply）
- “跨宿主可用性依赖明确的目录映射与安装方式，不同宿主的落盘约定是现实成本。”（主题1 host；主题2 dist）

## Captured Excerpts (keep short)

> Skills are contextual and auto-loaded based on your conversation.

## Terms / Concepts

- commands vs skills
- triggers / auto-loaded
- remote MCP servers

## Risks / Limits

- README 中包含指向其他宿主 docs 的链接（如 Codex skills guide）；需要以原始官方 docs 作为进一步核验的 ground truth。

