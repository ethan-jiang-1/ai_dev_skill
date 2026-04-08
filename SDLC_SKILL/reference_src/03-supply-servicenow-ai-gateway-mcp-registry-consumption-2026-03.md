# ServiceNow AI Gateway (March 2026): browse/import from MCP community registry

- source_url: https://www.servicenow.com/community/now-assist-articles/ai-gateway-what-s-new-in-the-march-2026-release/ta-p/3501670
- source_type: official_release_note
- accessed_at: 2026-04-09
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: “MCP Registry 是否被主流产品真实消费”是当前证据缺口之一。该 ServiceNow（企业级平台）官方站点文章明确提到其 AI Gateway/AI Control Tower 能直接浏览并导入 MCP community registry（`registry.modelcontextprotocol.io`），属于生产级消费侧证据，而非愿景/README 推测。

## Key Facts

- 文档主题为 “AI Gateway: What's new in the March 2026 Release”。（Ref: article）
- 文章在 MCP 相关新增能力中明确指出：AI stewards 可以 “browse and import MCP servers directly from the MCP community registry (`registry.modelcontextprotocol.io`)”，并说明其集成在 AI Control Tower 中。（Ref: article）
- 文章说明导入体验包含自动填充（pre-populate）server details 与 connection info（降低把 registry 元数据接入企业治理系统的摩擦）。（Ref: article）

## Claims Supported

- “MCP Registry 不仅是协议/发布工具层基础设施，也开始被企业级治理/平台产品直接消费（至少在 ServiceNow AI Gateway/AI Control Tower 场景中）。”（主题 3 supply；主题 2 dist）

## Captured Excerpts (keep short)

> browse and import MCP servers directly from the MCP community registry (`registry.modelcontextprotocol.io`)

## Terms / Concepts

- MCP community registry (`registry.modelcontextprotocol.io`)
- AI Gateway / AI Control Tower
- import/browse MCP servers

## Risks / Limits

- 该来源证明“存在真实消费侧集成”，但不直接说明所有主流宿主/安装器都已接入 MCP Registry；也不等价于其安全/更新策略细节（需要进一步查阅 ServiceNow 产品文档或实现说明）。

