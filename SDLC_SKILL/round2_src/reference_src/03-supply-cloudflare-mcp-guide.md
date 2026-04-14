# Cloudflare Docs: Model Context Protocol (MCP)

- source_url: https://developers.cloudflare.com/agents/model-context-protocol/
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: Cloudflare 官方把 MCP 解释为连接 AI 与外部应用的开放标准，并给出 Host/Client/Server 术语、remote vs local 连接方式与 best practices，可用于澄清“skill 与 MCP 的边界与分层”。

## Key Facts

- 文档将 MCP 定义为连接 AI 系统与外部应用的 open standard，并用 “USB-C port for AI applications” 作类比。
- 术语定义（文档列出）：
  - MCP Hosts：AI assistants/agents/applications（例如 Claude、Cursor）。
  - MCP Clients：嵌入在 host 内，与 MCP server 建立单一连接并调用 tools。
  - MCP Servers：暴露 tools/prompts/resources 给 clients 使用的应用。
- 连接模式：
  - Remote：通过 Streamable HTTP，经 OAuth 授权。
  - Local：同机，通过 stdio 作为本地 transport。
- Best practices（文档列出）：tool 设计不要机械映射全 API；应做 scoped permissions；完善 tool descriptions；用 evals 回归测试工具使用能力等。
- 文档标注 Last updated: Feb 21, 2026（页面底部）。

## Claims Supported

- “MCP 是运行时工具层：host 内嵌 client，通过 server 暴露 tools/resources 提供外部能力；skill 更偏过程化指令与编排。”（主题3 supply：边界与共生）
- “remote vs local 连接方式与授权模型决定了企业部署与安全边界。”（主题2 dist 与主题3 supply 交叉）

## Captured Excerpts (keep short)

> Think of MCP like a USB-C port for AI applications.

## Terms / Concepts

- MCP host/client/server
- Streamable HTTP
- OAuth
- stdio transport

## Risks / Limits

- 该页是 Cloudflare 对 MCP 的解释与最佳实践；MCP 的协议硬细节仍需回到 MCP 规范本身核验。

