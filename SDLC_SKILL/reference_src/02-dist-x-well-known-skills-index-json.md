# X Well-Known: `/.well-known/skills/index.json` (legacy format)

- source_url: https://docs.x.com/.well-known/skills/index.json
- source_type: official_well_known_index
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: 该文件展示了 legacy discovery format（无 `$schema`/digest，使用 `files` 数组），用于解释为何安装器需要兼容新旧 schema，并为“agent-skills vs skills”口径收敛提供实证对照。

## Key Facts

- 顶层为 `skills[]` 数组；每个 entry 包含 `name/description/files`，其中 `files` 为 path string 列表（常见仅包含 `SKILL.md`）。（Ref: index.json）
- 该 legacy format 不包含 `$schema` 与 artifact digest，无法在 index 层直接提供完整性校验与变更检测信号。（Ref: index.json）

## Claims Supported

- “现实发布者会同时保留 legacy `/.well-known/skills/index.json` 以兼容旧客户端；因此安装器/聚合器需要明确 schema 版本与向后兼容策略。”（主题 2 dist；难点）

## Captured Excerpts (keep short)

> "files": ["SKILL.md"]

## Terms / Concepts

- legacy discovery index
- `files` array

## Risks / Limits

- legacy format 不提供 digest，因此消费方如需完整性保障，必须在更上层引入信任策略（例如固定来源、签名、hash pinning、或迁移到 v0.2.0）。

