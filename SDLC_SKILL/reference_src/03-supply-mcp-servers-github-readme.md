# modelcontextprotocol/servers: README (Reference Servers + Registry Pointer)

- source_url: https://github.com/modelcontextprotocol/servers
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: 该仓库是 MCP steering group 维护的官方 reference servers 集合，把 prompts/resources/tools 等 server features 从规范落到可运行实现；同时 README 明确区分“Registry（发布列表）”与“Reference servers（少量示例实现）”，并强调安全与生产可用性的边界。

## Key Facts

- 仓库定位：收集 MCP 的 reference implementations（并提供对社区 servers/资源的引用），用于展示 MCP 特性与 SDK 用法。
- README 明确指出：如果要浏览已发布的 MCP servers，应使用 MCP Registry（`registry.modelcontextprotocol.io`）；本仓库只承载 steering group 维护的少量 reference servers。
- 安全边界：README 警告这些 servers 旨在演示 MCP features/SDK usage，不是 production-ready；开发者需要按自身 threat model 评估安全并实现 safeguards。
- README 列出 reference servers（路径在 `src/*`），包括：
  - Everything：包含 prompts/resources/tools 的 reference/test server。
  - Fetch：web 内容抓取与转换（便于 LLM 使用）。
  - Filesystem：带可配置访问控制的安全文件操作。
  - Git：读/搜/操作 Git 仓库的工具集合。
  - Memory：基于知识图谱的持久化记忆系统。
  - Sequential Thinking：以 thought sequences 做动态反思式问题求解。
  - Time：时间与时区转换能力。
- README 列出多个官方 MCP SDK（C#/Go/Java/Kotlin/PHP/Python/Ruby/Rust/Swift/TypeScript），并说明 reference servers 通常基于 SDK 实现。
- README 还提到部分 reference servers 已迁移到 `servers-archived`（另一个官方仓库）。

## Claims Supported

- “MCP 生态存在官方维护的 reference servers”，可用于把协议（base protocol + server features）落到可执行的工程实现与能力面核验。（主题3 supply）
- “Registry vs reference servers 的分工”表明 MCP 供给层正在形成更标准化的发布/发现/教育链路，而不是仅靠 Awesome 索引聚合。（主题3 supply；主题2 dist）

## Captured Excerpts (keep short)

> ...browse published servers on the MCP Registry...

## Terms / Concepts

- MCP Registry
- reference servers / reference implementations
- steering group
- threat model / safeguards

## Risks / Limits

- README 明确声明 reference servers 非生产级；任何“可靠性/安全性”结论都不能从该仓库直接外推到真实生产使用。
- README 中的第三方 server 列表标注为不再维护且未来会移除，因此不宜作为长期索引依据。

