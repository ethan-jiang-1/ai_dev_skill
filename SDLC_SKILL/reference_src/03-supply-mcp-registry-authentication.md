# MCP Registry: Authentication (GitHub / DNS / HTTP)

- source_url: https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/authentication.mdx
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: MCP Registry 将“发布权限”绑定到 server name 的 namespace 规则，并提供 GitHub 与域名（DNS/HTTP）两类认证链路；这是 registry 信任与治理模型的核心机制证据。

## Key Facts

- 发布前必须认证；不同认证方法决定 `server.json` 的 name namespace 格式。（Ref: authentication）
- GitHub-based authentication 的 name 格式：`io.github.username/*` 或 `io.github.orgname/*`。（Ref: authentication）
- Domain-based authentication 的 name 格式：`com.example.*/*`（reverse-DNS），其中 `com.example` 对应域名。（Ref: authentication）
- GitHub auth 通过 `mcp-publisher login github` 触发 OAuth device flow。（Ref: authentication）
- DNS auth 依赖 DNS TXT record，内容形如 `v=MCPv1; k=<algo>; p=<public_key>`；文档给出 Ed25519、ECDSA P-384，以及通过 Google KMS / Azure Key Vault 生成与使用密钥的流程示例。（Ref: authentication）
- HTTP auth 依赖在域名下托管 `/.well-known/mcp-registry-auth` 文件（内容同样是 `v=MCPv1; ...` 的 proof）；文档同样给出多种密钥与云 KMS/Key Vault 的流程示例。（Ref: authentication）

## Claims Supported

- “MCP Registry 的发布/命名空间不是任意可写，而是通过 GitHub 身份或域名所有权完成验证。”（主题 3 supply；安全/治理）
- “registry 通过 well-known 路径与 DNS TXT 记录引入域名级验证，这是供给侧从‘链接目录’走向‘可验证发布渠道’的标志。”（趋势/机制）

## Captured Excerpts (keep short)

> Which authentication method you choose determines the namespace of your server's name.

## Terms / Concepts

- GitHub-based authentication
- domain-based authentication (reverse-DNS)
- DNS TXT record proof (`v=MCPv1; ...`)
- `/.well-known/mcp-registry-auth`

## Risks / Limits

- 该文档说明的是“发布身份与命名空间验证”；包内容与元数据的一致性验证需要结合 package types 文档与 publisher 实现进一步核验。

