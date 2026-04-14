# Cognite Well-Known: `/.well-known/agent-skills/index.json` (v0.2.0)

- source_url: https://docs.cognite.com/.well-known/agent-skills/index.json
- source_type: official_well_known_index
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: 这是继 X 之后的另一个生产域名实例，直接展示了 Cloudflare Agent Skills Discovery RFC v0.2.0 的落地（`agent-skills` 路径 + `$schema/type/url/digest`）。它把“well-known 迁移与 digest 完整性信号”从 spec/CLI 讨论，推进到真实发布者采纳的层面。

## Key Facts

- 顶层包含 `$schema = https://schemas.agentskills.io/discovery/0.2.0/schema.json`。（Ref: index.json）
- `skills[]` entry 包含 `name/type/description/url/digest`：
  - `type` 示例为 `skill-md`
  - `url` 指向 `/.well-known/agent-skills/<name>/SKILL.md`
  - `digest` 采用 `sha256:{hex}` 格式。（Ref: index.json）

## Claims Supported

- “生态中已存在多个真实发布者（至少 X 与 Cognite）在生产域名提供 v0.2.0 discovery index（含 digest），说明 `agent-skills` 新口径正在从规范走向实际采用。”（主题 2 dist；趋势）

## Captured Excerpts (keep short)

> "$schema":"https://schemas.agentskills.io/discovery/0.2.0/schema.json"

## Terms / Concepts

- discovery index v0.2.0
- `$schema`
- `type` (`skill-md`)
- `url`
- `digest` (SHA-256)

## Risks / Limits

- index.json 是发布者随时可更新的资源；消费方仍需按规范做 digest 校验，并在更上层引入来源/信任治理（例如固定 origin、签名或组织级 allowlist）。

