# Model Context Protocol: Server Features Overview (2025-06-18)

- source_url: https://modelcontextprotocol.io/specification/2025-06-18/server
- source_type: spec
- accessed_at: 2026-04-08
- published_at: 2025-06-18
- related_topic: supply
- trust_level: official
- why_it_matters: 把 MCP “server capabilities 的能力面”落到可比对的硬事实（prompts/resources/tools 三大原语 + 控制权层级），用于澄清“skills 与 MCP 的分层边界”并支撑供给侧/宿主侧的打包策略分析。

## Key Facts

- MCP server 向 client/host 暴露三类核心原语（primitives）：Prompts、Resources、Tools。
- 文档给出控制权层级（control hierarchy）对照：
  - Prompts：user-controlled（例如 slash commands / menu options）。
  - Resources：application-controlled（例如 file contents、git history 由 client 管理/附加上下文）。
  - Tools：model-controlled（例如 API POST、写文件等可执行动作）。
- 该页作为入口将三类原语链接到更细的规范页：`/server/prompts`、`/server/resources`、`/server/tools`。

## Claims Supported

- “MCP 的 server features 不是单一‘工具调用’，而是 prompts/resources/tools 三类原语，且控制权分层不同”，这直接影响 host UI/权限/审计与企业落地边界。（主题3 supply；主题1 host；主题2 dist）
- “skills（过程化指令）与 MCP（运行时上下文与动作能力）更符合分层共生模型”，供给侧/宿主侧往往会以插件/扩展把两者一起交付。（主题3 supply）

## Captured Excerpts (keep short)

> Tools: Executable functions that allow models to perform actions or retrieve information

## Terms / Concepts

- server primitives: prompts / resources / tools
- control hierarchy (user-controlled / application-controlled / model-controlled)

## Risks / Limits

- 该页是 overview；具体协议消息（methods/notifications）、数据结构与安全要求需要进一步下钻到各原语的详细规范页。

