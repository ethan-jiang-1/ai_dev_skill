# modelcontextprotocol/registry: README (MCP Registry Overview)

- source_url: https://github.com/modelcontextprotocol/registry
- source_type: official_repo
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: MCP Registry 是官方“server 发现与发布”基础设施的中心证据点；README 明确其定位（类似 app store）、当前状态（preview/API freeze）与发布时的认证/命名空间验证方法，为“从 Awesome 索引走向 Registry 化”提供一手机制口径。

## Key Facts

- MCP Registry 的定位：为 MCP clients 提供 MCP servers 列表，“like an app store for MCP servers”。（Ref: README）
- 发展状态：
  - 2025-09-08：registry launched in preview（并提示 preview 期间可能有 breaking changes 或 data resets）。（Ref: README）
  - 2025-10-24：Registry API 进入 API freeze（v0.1），在一段时间内保持稳定以便集成方实现支持。（Ref: README）
- 发布（publishing）提供官方 CLI：`mcp-publisher`（在仓库中可通过 `make publisher` 构建）。（Ref: README）
- 发布认证（authentication）支持多种方式：GitHub OAuth、GitHub OIDC（GitHub Actions）、DNS verification、HTTP verification。（Ref: README）
- README 明确“命名空间所有权验证”原则：例如 `io.github.<username>/<server>` 需对应 GitHub 身份；以自有域名为前缀的命名空间需通过 DNS/HTTP challenge 证明域名所有权。（Ref: README）

## Claims Supported

- “MCP 生态已经存在官方 registry 作为发布/发现中心，且发布受命名空间验证约束。”（主题 3 supply；主题 2 dist）
- “MCP Registry 的 API 稳定性开始被显式管理（preview -> API freeze v0.1）。”（趋势证据）

## Captured Excerpts (keep short)

> The MCP registry provides MCP clients with a list of MCP servers, like an app store for MCP servers.

## Terms / Concepts

- MCP Registry
- preview / API freeze (v0.1)
- `mcp-publisher`
- namespace ownership verification (GitHub / DNS / HTTP)

## Risks / Limits

- README 提供的是总体定位与入口；`server.json` 元数据结构、包类型验证细节、聚合器/子注册表治理口径需要结合仓库 docs 进一步核验。

