# Backstage Well-Known: `/.well-known/skills/index.json` (legacy format)

- source_url: https://backstage.io/.well-known/skills/index.json
- source_type: official_well_known_index
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: Backstage 以真实生产域名提供 well-known skills index，且采用 legacy `files` 格式（无 `$schema`/digest），是 well-known 生态“新旧口径并存”的实证样本之一。

## Key Facts

- 顶层为 `skills[]` 数组；每个 entry 包含 `name/description/files`，其中 `files` 为 path list（示例均包含 `SKILL.md`）。（Ref: index.json）
- 该 index.json 不包含 `$schema` 字段，符合 v0.1.0 风格 discovery format。（Ref: index.json）

## Claims Supported

- “生态中存在官方发布者仍在使用 legacy `/.well-known/skills/index.json` 格式，导致安装器需要兼容多版本 schema 与路径口径。”（主题 2 dist；难点）

## Captured Excerpts (keep short)

> "files": ["SKILL.md"]

## Terms / Concepts

- legacy discovery index
- `files` array

## Risks / Limits

- legacy format 不包含 digest，消费方如需完整性/防篡改能力，需要在更上层引入信任策略，或推动迁移到 v0.2.0（agent-skills + digest）。

