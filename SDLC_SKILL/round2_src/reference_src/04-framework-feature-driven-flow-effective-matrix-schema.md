# Feature-Driven-Flow: Effective Rule Matrix JSON Schema (`fdf-effective-matrix.schema.json`)

- source_url: https://github.com/QuasarByte/feature-driven-flow/blob/main/shared/fdf/schemas/fdf-effective-matrix.schema.json
- source_type: official_repo_schema
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这是 FDF “执行计划工件（Effective Rule Matrix）”的机器可校验契约。它把 7-phase 的规则选择固化为严格 JSON（`additionalProperties=false` + required 字段 + phases keys），为“可审计/可验证/可复用”的框架化治理提供可验证的结构证据。

## Key Facts

- schema 使用 JSON Schema 2020-12（`$schema: https://json-schema.org/draft/2020-12/schema`）。（Ref: schema file）
- 顶层 `type=object` 且 `additionalProperties=false`，并要求必填字段：
  - `schema`（const: `fdf/effective-rule-matrix.v1`）
  - `fdf_version`
  - `created_at`
  - `selected_profiles`
  - `profile_overrides`
  - `enabled_packs`
  - `rule_matrix`。（Ref: schema file）
- `selected_profiles` 与 `enabled_packs` 都是 string array 且 `uniqueItems=true`。（Ref: schema file）
- `rule_matrix` 为 object 且 `additionalProperties=false`，并强制包含 7 个 phase keys：
  - `scope/explore/clarify/architect/implement/verify/summarize`；每个 phase 的值为 rule id list（string array，`uniqueItems=true`）。（Ref: schema file）
- 可选字段包含 `context_model`（允许任意键值）与 `notes`。（Ref: schema file）

## Claims Supported

- “FDF 的核心执行工件（Effective Rule Matrix）不是自然语言约定，而是严格 schema 驱动的可校验对象，为自动化校验、diff、导入/复用提供基础。”（主题 4 framework；机制）

## Captured Excerpts (keep short)

> "schema": { "const": "fdf/effective-rule-matrix.v1" }

## Terms / Concepts

- Effective Rule Matrix
- `schema: fdf/effective-rule-matrix.v1`
- seven-phase keys (`scope`..`summarize`)
- `additionalProperties: false`

## Risks / Limits

- schema 证明“工件结构可校验”，但不直接证明宿主一定会在运行时强制校验；仍需结合 validator/tooling 与宿主集成做闭环核验。

