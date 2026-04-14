# MCP Registry: Supported Package Types + Verification Methods

- source_url: https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/package-types.mdx
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: “Registry 只托管 metadata”并不自动解决 supply chain 信任问题；package-types 文档明确不同包类型的 ownership verification 方法（npm/PyPI/NuGet/OCI/MCPB），是评估“可验证发布链路”与“安全责任边界”的关键 ground truth。

## Key Facts

- MCP Registry 支持多种 package types；不同类型有各自 verification 方法。（Ref: package types）
- npm：
  - 当前仅支持 npm public registry（`https://registry.npmjs.org`）。（Ref: package types）
  - ownership verification：检查 `package.json` 中的 `mcpName`，且必须与 `server.json` 的 server name 完全一致。（Ref: package types）
- PyPI：
  - 当前仅支持官方 PyPI（`https://pypi.org`）。（Ref: package types）
  - ownership verification：检查 package README（PyPI 上的描述）中是否存在 `mcp-name: $SERVER_NAME` 字符串；可隐藏在 comment 中，但 `$SERVER_NAME` 必须与 `server.json` name 匹配。（Ref: package types）
- NuGet：
  - 当前仅支持官方 NuGet index（`https://api.nuget.org/v3/index.json`）。（Ref: package types）
  - ownership verification：同样通过 README 中的 `mcp-name: $SERVER_NAME` 字符串验证。（Ref: package types）
- Docker/OCI images：
  - 支持 docker.io、ghcr.io、`*.pkg.dev`、`*.azurecr.io`、`mcr.microsoft.com`。（Ref: package types）
  - ownership verification：检查镜像的 `io.modelcontextprotocol.server.name` annotation/label，且值必须与 `server.json` name 匹配。（Ref: package types）
- MCPB：
  - 支持通过 GitHub/GitLab releases 托管 MCPB artifacts。（Ref: package types）
  - `server.json` 中 `packages[].fileSha256` 必须提供；registry 不验证该 hash，但 MCP clients 在安装前会验证 hash 以保证完整性。（Ref: package types）

## Claims Supported

- “MCP Registry 的信任与验证链路是‘分包类型’设计的：每种底层分发介质（npm/PyPI/NuGet/OCI/Release artifact）都有对应的所有权/一致性验证方式。”（主题 2 dist；主题 3 supply）
- “registry 与 client 的责任边界被明确：例如 MCPB 的 fileSha256 由 client 校验，而 registry 不校验。”（安全/治理）

## Captured Excerpts (keep short)

> The MCP Registry supports several different package types, and each package type has its own verification method.

## Terms / Concepts

- `registryType` (npm/pypi/nuget/oci/mcpb)
- `mcpName` (npm)
- `mcp-name: $SERVER_NAME` (PyPI/NuGet)
- `io.modelcontextprotocol.server.name` (OCI annotation/label)
- `fileSha256` (MCPB)

## Risks / Limits

- 该文档描述的是 verification 规则；具体 enforcement 细节（publisher/registry 的实现、错误类型、边界条件）仍可能随 preview 阶段迭代，需要结合实现与 API 文档持续跟踪。

