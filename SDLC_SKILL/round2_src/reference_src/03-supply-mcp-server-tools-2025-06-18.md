# Model Context Protocol: Server Features - Tools (2025-06-18)

- source_url: https://modelcontextprotocol.io/specification/2025-06-18/server/tools
- source_type: spec
- accessed_at: 2026-04-08
- published_at: 2025-06-18
- related_topic: supply
- trust_level: official
- why_it_matters: Tools 是 MCP 的 model-controlled 原语，是外部动作与数据访问的主要扩展点；该页明确 tool schema、核心 methods、list_changed 通知、人类在环建议与安全条目，是把“tool 调用风险与治理”落到协议级硬事实的关键来源。

## Key Facts

- Tools 定位：server 暴露可被 language model 调用的 tools；工具用于访问外部系统（DB/API/计算等），每个 tool 由 `name` 唯一标识，并携带 schema 元数据。
- User interaction：tools 设计为 model-controlled（模型可基于上下文发现并发起调用）；但协议不强制 UI。文档明确建议 “SHOULD always be a human in the loop with the ability to deny tool invocations”。
- Capabilities：支持 tools 的 servers MUST 声明 `tools` capability；可选 `listChanged` 表示工具列表变化时会发通知。
- Protocol messages（核心 methods/notifications）：
  - 列表：`tools/list`（支持 pagination）。
  - 调用：`tools/call`。
  - 列表变化通知：`notifications/tools/list_changed`（当声明 `listChanged` 时，server SHOULD 发送）。
- Tool definition 字段（文档列出）：`name`、`title`（可选）、`description`、`inputSchema`（JSON Schema）、`outputSchema`（可选）、`annotations`（行为描述的可选属性）。
- 信任边界：文档指出 clients MUST consider tool annotations to be untrusted unless they come from trusted servers。
- Tool results：可包含 structured 或 unstructured content；并支持多种 content types（text/image/audio/resource links/embedded resources）与可选 annotations；若提供 output schema，则 servers MUST 生成符合 schema 的 structured results，clients SHOULD 校验。
- Security considerations（文档条目式给出）：
  - Servers MUST validate all tool inputs / implement proper access controls / rate limit tool invocations / sanitize tool outputs。
  - Clients SHOULD prompt for user confirmation on sensitive operations / show tool inputs before calling to avoid data exfiltration / validate tool results / implement timeouts / log tool usage for audit。

## Claims Supported

- “tools 是 model-controlled 扩展点，但协议层已明确把 human-in-the-loop 与输入/输出校验当作默认安全建议/要求”，这为宿主权限模型与分发扫描提供了可对齐的底线口径。（主题1 host；主题2 dist）
- “tool schema（input/output）+ structured results 校验”让 tools 不只是 prompt engineering，而是可审计、可验证、可治理的接口契约。（主题4 framework；主题2 dist）

## Captured Excerpts (keep short)

> There SHOULD always be a human in the loop with the ability to deny tool invocations.

## Terms / Concepts

- tool schema (`inputSchema` / `outputSchema`)
- `tools/list` / `tools/call`
- `notifications/tools/list_changed`
- tool annotations trust boundary

## Risks / Limits

- 该页给出协议层安全清单与建议，但实际效果高度依赖 host 实现（UI 确认、权限/隔离、审计落盘）与 server 侧的访问控制与限流实现质量。

