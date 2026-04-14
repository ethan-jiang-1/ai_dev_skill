# Model Context Protocol: Server Features - Resources (2025-06-18)

- source_url: https://modelcontextprotocol.io/specification/2025-06-18/server/resources
- source_type: spec
- accessed_at: 2026-04-08
- published_at: 2025-06-18
- related_topic: supply
- trust_level: official
- why_it_matters: Resources 是 MCP 的 application-driven 原语，代表“由 host/client 管理并附加的上下文数据”；该页给出 URI 标识、list/read、templates 与 subscribe/list_changed 通知等硬事实，可用于解释“为什么 MCP 不等同于 tools 调用”。

## Key Facts

- Resources 定位：server 暴露 resources 给 client；resources 提供上下文数据（files、schemas、app-specific info 等），每个 resource 由 URI 唯一标识。
- User interaction：resources 设计为 application-driven，由 host/client 决定如何纳入上下文（UI 选择、搜索过滤、或自动纳入等），协议不强制 UI。
- Capabilities：支持 resources 的 servers MUST 声明 `resources` capability；其中 `subscribe` 与 `listChanged` 为可选特性（可都不支持/只支持其一/都支持）。
- Protocol messages（核心 methods/notifications）：
  - 列表：`resources/list`（支持 pagination）。
  - 读取内容：`resources/read`（通过 `uri` 参数指定）。
  - 参数化资源：`resources/templates/list`（使用 URI templates；arguments 可通过 completion API 自动补全；支持 pagination）。
  - 列表变化通知：`notifications/resources/list_changed`（当声明 `listChanged` 时，server SHOULD 发送）。
  - 订阅与更新通知：`resources/subscribe`（可选）与 `notifications/resources/updated`（资源变化通知）。
- Security considerations（文档条目式给出）：
  - Servers MUST validate all resource URIs。
  - Access controls SHOULD be implemented for sensitive resources。
  - Binary data MUST be properly encoded。
  - Resource permissions SHOULD be checked before operations。

## Claims Supported

- “resources 是 application-driven 上下文层”，因此更适合表达‘可审计/可控的上下文注入’，而不是把所有能力都塞进 tools。（主题3 supply；主题1 host）
- “resources 的 URI 与 subscribe/listChanged 机制”使其可被纳入分发/治理体系（变更可通知、可分页发现、可权限检查）。（主题2 dist；主题3 supply）

## Captured Excerpts (keep short)

> Each resource is uniquely identified by a URI.

## Terms / Concepts

- resource URI
- `resources/list` / `resources/read`
- `resources/templates/list`
- `resources/subscribe` / `notifications/resources/updated`

## Risks / Limits

- 文档给出协议层安全要求，但具体“URI scheme 设计、访问控制模型、host 如何选择自动纳入策略”的落地差异需要结合各宿主实现继续核验。

