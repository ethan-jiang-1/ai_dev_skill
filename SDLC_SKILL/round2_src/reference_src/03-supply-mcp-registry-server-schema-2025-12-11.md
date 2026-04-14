# MCP `server.json` Schema (2025-12-11)

- source_url: https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json
- source_type: official_schema
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: `server.json` 是 MCP Registry/聚合器/客户端用于 discovery、installation、configuration 的核心元数据载体；该 JSON Schema 给出字段全集与约束，并显式提示命令注入等安全风险，是把“registry 治理”落到可验证契约的关键 ground truth。

## Key Facts

- 该文件为 JSON Schema draft-07；`$id` 为 `https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json`，root 通过 `$ref` 指向 `definitions/ServerDetail`。（Ref: schema）
- Schema 顶部注释说明其由 `docs/reference/api/openapi.yaml` 自动生成（属于 API/spec 的衍生物）。（Ref: schema）
- `ServerDetail`（静态 server 表示）要求的必填字段为：`name`、`description`、`version`；并提供 `packages[]`（local/package 安装）与 `remotes[]`（remote server）两条描述路径。（Ref: schema）
- `ServerDetail` 支持 `_meta` 作为扩展元数据容器，并显式定义 key `io.modelcontextprotocol.registry/publisher-provided`（object）用于 publisher 提供的下游注册表元数据。（Ref: schema）
- `Package`（`packages[]` item）必填字段：`registryType`、`identifier`、`transport`；并支持可选的 `version`、`environmentVariables[]`、`fileSha256`、`registryBaseUrl`、`runtimeHint`、`runtimeArguments`、`packageArguments` 等。（Ref: schema）
- Schema 在 `Argument` 定义中显式警告：arguments 可能包含用户输入，若客户端用 shell 方式执行命令会引入 command injection 风险；建议优先采用非 shell 执行（如 `posix_spawn`），并在必要时获取用户/agent 同意。（Ref: schema）
- `LocalTransport`（package transport）允许 `stdio`、`streamable-http`、`sse`；`RemoteTransport`（remote transport）基于 `streamable-http`/`sse` 并支持 `variables`（用于 URL `{curly_braces}` 模板变量）。（Ref: schema）
- `streamable-http` transport 要求 `type` 与 `url`，并支持声明 `headers[]`；其 `url` 描述明确：template variables 在 package context 与 remote context 的解析来源不同。（Ref: schema）

## Claims Supported

- “MCP Registry 及其下游生态把 server 发布/发现的元数据契约化为 `server.json` schema，并在 schema 层面显式纳入安全风险提示与扩展点（_meta）。”（主题 3 supply；主题 2 dist；安全/治理）

## Captured Excerpts (keep short)

> ...potential command injection risks... Clients should prefer non-shell execution methods...

## Terms / Concepts

- `server.json`
- `ServerDetail`
- `packages` vs `remotes`
- `_meta.io.modelcontextprotocol.registry/publisher-provided`
- command injection warning (Argument)

## Risks / Limits

- Schema 以日期分版（例如 2025-12-11）；后续版本可能新增/调整字段与约束，需要与 MCP Registry API/openapi 的版本一起跟踪。

