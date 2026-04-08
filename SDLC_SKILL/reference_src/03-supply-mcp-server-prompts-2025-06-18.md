# Model Context Protocol: Server Features - Prompts (2025-06-18)

- source_url: https://modelcontextprotocol.io/specification/2025-06-18/server/prompts
- source_type: spec
- accessed_at: 2026-04-08
- published_at: 2025-06-18
- related_topic: supply
- trust_level: official
- why_it_matters: Prompts 是 MCP 的 user-controlled 原语，天然对应 “slash commands/menu” 等交互面；该页提供 prompts capability negotiation、核心 methods 与安全要求，可用于把“prompt 模板供给”从泛概念落到协议级硬事实。

## Key Facts

- Prompts 定位：server 暴露 prompt templates；client 可 discover prompts、取回内容，并传入 arguments 定制。
- User interaction：prompts 设计为 user-controlled，通常经由用户显式触发（例如 slash commands），但协议不强制具体 UI。
- Capabilities：支持 prompts 的 servers MUST 在 initialization 时声明 `prompts` capability；可选 `listChanged` 表示会在 prompt 列表变化时发通知。
- Protocol messages（核心 methods）：
  - 列表：`prompts/list`（支持 pagination）。
  - 获取具体 prompt：`prompts/get`（支持 arguments；arguments 可通过 completion API 自动补全）。
  - 列表变化通知：`notifications/prompts/list_changed`（当声明 `listChanged` 时，server SHOULD 发送）。
- 实现与安全：
  - Servers SHOULD 在处理前校验 prompt arguments；并返回标准 JSON-RPC errors（例如 -32602/-32603）。
  - 实现 MUST 校验 prompt inputs/outputs，以防 injection attacks 或未授权访问资源。

## Claims Supported

- “prompts 是 user-controlled 原语，天然对应 slash commands”，因此常会与 host 的 commands/workflows 交互面耦合，而不是纯模型自动触发。（主题1 host；主题3 supply；主题4 framework）
- “prompts 具备明确的 capability negotiation + list/get + list_changed 通知”，可作为 MCP 生态下 prompt 供给与更新治理的协议基线。（主题2 dist；主题3 supply）

## Captured Excerpts (keep short)

> Prompts are designed to be user-controlled...

## Terms / Concepts

- prompts capability
- `prompts/list` / `prompts/get`
- `notifications/prompts/list_changed`
- prompt arguments

## Risks / Limits

- 文档提到 completion API 与 embedded resources 等能力点；如需评估“可用性/风险/治理”，还要结合 client 行为与 host UI 实现做交叉验证。

