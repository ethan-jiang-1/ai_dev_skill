# cursor/plugins JSON Schemas: plugin.json + marketplace.json

- source_url: https://github.com/cursor/plugins/tree/main/schemas
- source_type: official_repo_schema
- accessed_at: 2026-04-08
- related_topic: host
- trust_level: official
- why_it_matters: Cursor 将 plugin manifest 与 marketplace index 明确为 JSON Schema（draft-07），为“plugins 打包哪些 primitives、字段约束、索引/来源语义”提供可验证的一手 ground truth，可用于对齐跨宿主的 installable unit 抽象与安全/治理评估。

## Key Facts

- plugin manifest schema：
  - schema 标识：`$id = https://cursor.com/schemas/cursor-plugin/plugin.json`，描述为 `.cursor-plugin/plugin.json` 的 schema。（Ref: `schemas/plugin.schema.json`）
  - `type=object` 且 `additionalProperties=false`，要求严格；`required=["name"]`。（Ref: `schemas/plugin.schema.json`）
  - `name` 约束为 kebab-case（允许 `.` 与 `-`）并给出正则模式。（Ref: `schemas/plugin.schema.json`）
  - 可声明的打包组件字段包括：`commands`、`agents`、`skills`、`rules`、`hooks`、`mcpServers`（多数字段允许 string 或 string array；`hooks` 允许 path 或 inline object；`mcpServers` 允许 path / object / array）。这为“plugins 包含哪些 primitives”提供机器可读的正式口径。（Ref: `schemas/plugin.schema.json`）
  - schema 未定义显式的权限/授权字段（例如 `permissions`），且由于 `additionalProperties=false`，意味着 manifest 在契约层不支持通过新增字段表达权限声明。（Ref: `schemas/plugin.schema.json`）
- marketplace schema：
  - schema 标识：`$id = https://cursor.com/schemas/cursor-plugin/marketplace.json`，描述为 `.cursor-plugin/marketplace.json` 的 schema。（Ref: `schemas/marketplace.schema.json`）
  - `required=["name","plugins"]` 且 `additionalProperties=false`。（Ref: `schemas/marketplace.schema.json`）
  - `plugins[]` 的每个 entry `required=["name","source"]`，其中 `source` 的描述允许“相对 marketplace root 的路径或 remote URL”。这意味着 marketplace index 在模型层支持把 plugin 来源指向远端。（Ref: `schemas/marketplace.schema.json`）

## Claims Supported

- “Cursor plugins 的 packaging 与索引是 schema-first 的：plugin.json/marketplace.json 是可被校验的契约，能承载 skills/rules/hooks/MCP/agents/commands 等多类资产。”（主题 1 host；Wave 2 横向术语对齐）
- “Cursor marketplace index 的 `source` 语义允许 remote URL，这为企业私有 marketplace 或第三方分发形态留出了模型空间。”（主题 2 dist；趋势/机制）
- “Cursor plugin manifest 目前更偏向 ‘组件打包契约’，在 schema 层并未出现显式权限声明字段；因此权限/安全控制更可能依赖宿主运行时与 marketplace 治理层（需进一步证据闭环）。”（主题 1 host；机制/缺口）

## Captured Excerpts (keep short)

> Schema for .cursor-plugin/plugin.json — defines a single Cursor plugin's metadata, components, and configuration.

## Terms / Concepts

- Cursor Plugin Manifest (`.cursor-plugin/plugin.json`)
- Cursor Plugin Marketplace (`.cursor-plugin/marketplace.json`)
- `additionalProperties: false`
- `mcpServers`, `hooks`, `agents`, `rules`, `skills`, `commands`

## Risks / Limits

- 这些 schema 描述的是“manifest 可声明什么”；不直接等价于“Cursor 在所有运行形态下都会加载并生效”。需要结合 Cursor IDE/CLI 的行为一致性与权限模型证据进一步闭环。
