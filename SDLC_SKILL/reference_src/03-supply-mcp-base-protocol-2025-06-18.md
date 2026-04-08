# Model Context Protocol: Base Protocol (2025-06-18)

- source_url: https://modelcontextprotocol.io/specification/2025-06-18/basic
- source_type: spec
- accessed_at: 2026-04-08
- published_at: 2025-06-18
- related_topic: supply
- trust_level: official
- why_it_matters: MCP 协议硬事实基线（JSON-RPC、生命周期、模块化组件、HTTP auth vs stdio），用于把“技能/工具生态”从概念争论落到协议层事实。

## Key Facts

- 文档列出 MCP 的关键组件：Base protocol（核心 JSON-RPC 消息类型）、Lifecycle management、Authorization、Server features、Client features、Utilities 等，并声明所有实现 MUST 支持 base protocol 与 lifecycle management。
- 消息约束：所有 client/server 消息 MUST 遵循 JSON-RPC 2.0；协议定义 requests/responses/notifications 的结构与约束（例如 request id 不能为 null、不能复用等）。
- Auth：MCP 提供 HTTP authorization framework；HTTP-based transport SHOULD conform；STDIO transport SHOULD NOT follow（应从环境中取凭据）；也允许自定义 auth 策略协商。
- Schema：文档声明 TypeScript schema 是 protocol 的 source of truth，并有从 TS 自动生成的 JSON schema。

## Claims Supported

- “MCP 是协议层：基于 JSON-RPC 的 client-server 交互，并区分 HTTP vs stdio transport 与授权模型。”（主题3 supply：MCP 定义）
- “skills/MCP 的边界讨论应落到：skills 是静态可版本控制的指令包；MCP 是运行时协议与服务连接。”（主题3 supply：分层抽象）

## Captured Excerpts (keep short)

> All messages between MCP clients and servers MUST follow the JSON-RPC 2.0 specification.

## Terms / Concepts

- JSON-RPC 2.0
- lifecycle management
- authorization (HTTP) vs stdio transport
- TypeScript schema (source of truth)

## Risks / Limits

- 该页是 base protocol；具体 server features（tools/resources/prompts）与实现 SDK 细节需要补抓其它规范章节与官方 servers 仓库。

