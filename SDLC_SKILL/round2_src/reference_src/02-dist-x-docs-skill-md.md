# X Docs: `skill.md` (Agent Skills + well-known discovery)

- source_url: https://docs.x.com/tools/skill-md
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: X 官方文档明确声明其通过 well-known endpoints 暴露 skills 发现入口，并给出 “agent-skills 0.2.0 spec” 与 “original discovery format” 两套 endpoint；同时给出 `npx skills add https://docs.x.com` 的安装口径，是 well-known 生态采用与新旧口径并存的高价值一手证据。

## Key Facts

- 文档给出两个 discovery endpoints：
  - “agent-skills 0.2.0 spec”：`https://docs.x.com/.well-known/agent-skills/index.json`
  - “Original discovery format”：`https://docs.x.com/.well-known/skills/index.json`（Ref: X docs page）
- 文档明确给出安装方式：可通过 `npx skills add https://docs.x.com` 将 X API capabilities 添加到支持 skills CLI 的 agent。（Ref: X docs page）

## Claims Supported

- “well-known endpoint 已被企业第一方文档用于分发安装入口（npx skills add <domain>），且同一发布者可能同时维护新旧两套 discovery 口径以兼容生态。”（主题 2 dist；趋势/难点）

## Captured Excerpts (keep short)

> You can add X API capabilities to any agent that supports the skills CLI:

## Terms / Concepts

- well-known discovery endpoint
- `/.well-known/agent-skills/index.json` (0.2.0)
- `/.well-known/skills/index.json` (legacy)
- `npx skills add <domain>`

## Risks / Limits

- 该页描述的是“分发入口与 endpoints”；对 endpoints 的 schema/内容需要结合实际 `index.json` 实例进一步核验（见对应 well-known index 文件）。

