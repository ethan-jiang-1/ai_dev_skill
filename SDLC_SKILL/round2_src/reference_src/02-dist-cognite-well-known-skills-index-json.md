# Cognite Well-Known: `/.well-known/skills/index.json` (legacy format)

- source_url: https://docs.cognite.com/.well-known/skills/index.json
- source_type: official_well_known_index
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: Cognite 同时提供 legacy `/.well-known/skills/index.json`（`files` 数组格式）。该样本与 X/Backstage 一起说明：即便发布者已采用 v0.2.0，也可能需要保留 legacy 格式以兼容旧客户端，从而让“迁移期双栈兼容”成为分发层的现实负担。

## Key Facts

- 顶层为 `{"skills":[...]}`；每个 entry 包含 `name/description/files`，其中 `files` 为相对路径列表（示例包含 `SKILL.md`）。（Ref: index.json）
- 该 legacy format 不包含 `$schema` 与 digest 字段，因此 index 层无法提供 artifact 完整性校验或变更检测信号。（Ref: index.json）

## Claims Supported

- “真实发布者会保留 legacy discovery index（files format）以兼容旧消费侧；因此安装器需要明确 schema 版本与向后兼容策略，不能假设生态已收敛到 v0.2.0。”（主题 2 dist；难点）

## Captured Excerpts (keep short)

> "files":["SKILL.md"]

## Terms / Concepts

- legacy discovery index
- `files` array

## Risks / Limits

- legacy format 不包含 digest。若需要完整性与防篡改能力，必须引入更上层治理（固定来源、签名、hash pinning，或推动迁移到 v0.2.0）。

