# MCP Registry Aggregators + Subregistries

- source_url: https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/registry-aggregators.mdx
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: 该文档把 registry 在生态中的“上游角色”说清楚：官方 registry 提供只读 API、并明确不提供 uptime/durability guarantees；而聚合器/子注册表承担增值能力（评级/扫描/持久化），这直接决定了企业级治理应落在哪一层。

## Key Facts

- 聚合器（aggregators）是 MCP Registry 的下游消费者，可在 registry 数据之上叠加额外价值（例如用户评分与安全扫描）。（Ref: aggregators）
- MCP Registry 提供“未认证的只读 REST API”；聚合器应以较低频率（如每小时一次）抓取并在自己的数据存储中持久化；registry 不提供 uptime 或 data durability guarantees。（Ref: aggregators）
- REST API base URL：`https://registry.modelcontextprotocol.io`；并列出核心端点：
  - `GET /v0.1/servers`
  - `GET /v0.1/servers/{serverName}/versions`
  - `GET /v0.1/servers/{serverName}/versions/{version}`（可用 `latest` 取最新）。（Ref: aggregators）
- `GET /v0.1/servers` 支持 cursor-based pagination（`limit` + `cursor`）与 `updated_since`（RFC3339）过滤。（Ref: aggregators）
- Server metadata 基本不可变，只有 `status` 可能更新（如 `deprecated`/`deleted`）；`deleted` 通常与 moderation policy 相关，建议聚合器保持 status 同步。（Ref: aggregators）
- 子注册表（subregistry）是实现 MCP Registry OpenAPI spec 的聚合器，使 MCP host/client 可通过标准接口消费；subregistry 允许通过 `_meta` 字段注入自定义元数据（评分、下载量、安全扫描结果等），并建议使用反向域名式 key 标识子注册表。（Ref: aggregators）

## Claims Supported

- “官方 registry 是上游元数据源，不承诺强 SLA；企业级价值（安全扫描/评级/持久化/治理）预期由下游聚合器/子注册表提供。”（主题 2 dist；主题 3 supply）
- “`status` 字段为最小治理钩子：deleted/deprecated 可被聚合器用于索引剔除与风险提示。”（治理机制）

## Captured Excerpts (keep short)

> The MCP Registry does not provide uptime or data durability guarantees.

## Terms / Concepts

- aggregator / subregistry
- unauthenticated read-only REST API
- cursor pagination (`nextCursor`)
- `updated_since`
- `_meta` custom metadata injection
- `status` (`active` / `deprecated` / `deleted`)

## Risks / Limits

- 文档强调聚合器抓取与持久化责任，但不等价于“聚合器必然存在且质量可靠”；企业采用仍需评估具体 subregistry 的可信度与安全扫描能力。

