# MCP Registry Quickstart: Publish a Server (mcp-publisher)

- source_url: https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/quickstart.mdx
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: Quickstart 把“发布到 MCP Registry”的流程、约束与验证机制讲清楚（registry 只托管 metadata、server.json schema、mcpName/package 绑定、以及 v0.1 API 验证），是讨论 registry 治理与 supply chain 责任边界的关键一手来源。

## Key Facts

- MCP Registry 仍处于 preview，GA 之前可能出现 breaking changes 或 data resets。（Ref: quickstart）
- Registry 只托管 metadata，不托管 artifacts；以 npm 为例，需要先把 server 的 package 发布到 npm。（Ref: quickstart）
- Quickstart 指出 registry 会验证“底层 package 与 metadata 匹配”，并要求 npm 的 `package.json` 增加 `mcpName` 字段，且必须与 `server.json` 的 `name` 一致。（Ref: quickstart）
- `mcp-publisher` 安装方式包括：从 GitHub releases 下载预编译二进制或使用 Homebrew；CLI 提供 `init/login/logout/publish` 等命令。（Ref: quickstart）
- `mcp-publisher init` 会生成 `server.json` 模板，并在示例中引用 `https://static.modelcontextprotocol.io/schemas/.../server.schema.json` 作为 `$schema`；`server.json` 典型字段包括 `name/description/repository/version/packages[].registryType/identifier/version/transport`，并支持声明 `environmentVariables[]` 的描述/格式/是否 secret。（Ref: quickstart）
- 发布流程：`mcp-publisher login github`（设备授权）后，通过 `mcp-publisher publish` 发布到 `https://registry.modelcontextprotocol.io`；可通过 `GET /v0.1/servers?search=...` 验证是否发布成功。（Ref: quickstart）
- Troubleshooting 明确了典型失败模式：registry validation failed（缺少验证信息）、JWT 过期需重新 login、以及“无权限发布”通常是认证方法与命名空间不匹配。（Ref: quickstart）

## Claims Supported

- “MCP Registry 只做 metadata 托管与验证，不承担 artifacts 分发。”（主题 2 dist；主题 3 supply）
- “发布到 registry 需要显式的 package 绑定与命名空间约束，属于 supply chain 的一部分。”（安全/治理）

## Captured Excerpts (keep short)

> The MCP Registry only hosts metadata, not artifacts.

## Terms / Concepts

- `mcp-publisher`
- `server.json`
- `mcpName` (package verification)
- Registry API `v0.1`

## Risks / Limits

- Quickstart 以 TypeScript + npm 为例，其他包类型与 remote servers 的细节需要结合对应文档（package types / remote servers / authentication）进一步补齐。

