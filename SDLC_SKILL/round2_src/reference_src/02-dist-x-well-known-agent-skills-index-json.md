# X Well-Known: `/.well-known/agent-skills/index.json` (v0.2.0)

- source_url: https://docs.x.com/.well-known/agent-skills/index.json
- source_type: official_well_known_index
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: 这是企业第一方对 Cloudflare well-known RFC v0.2.0 的直接落地实例：包含 `$schema`、`type/url/digest`，并提供可用于缓存与完整性校验的 artifact digest。

## Key Facts

- 顶层包含 `$schema = https://schemas.agentskills.io/discovery/0.2.0/schema.json`。（Ref: index.json）
- `skills[]` entry 包含 `name/type/description/url/digest`；其中 `digest` 采用 `sha256:{hex}` 格式（示例 entry 为 `type: "skill-md"` 并指向 `/.well-known/agent-skills/<name>/SKILL.md`）。（Ref: index.json）

## Claims Supported

- “生态中已存在真实发布者在生产域名上提供 v0.2.0 (`agent-skills`) index.json，说明新口径不仅是 spec/实现层讨论，而是已进入供给发布面。”（主题 2 dist；趋势）

## Captured Excerpts (keep short)

> "$schema": "https://schemas.agentskills.io/discovery/0.2.0/schema.json"

## Terms / Concepts

- discovery index v0.2.0
- `$schema`
- `type` (`skill-md` / `archive`)
- `digest` (SHA-256)

## Risks / Limits

- index.json 反映的是某一时点的发布状态（内容可更新）；消费方仍需按 spec 校验 digest 并做 origin/信任治理。

