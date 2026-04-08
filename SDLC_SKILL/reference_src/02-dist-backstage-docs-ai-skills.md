# Backstage Docs: AI Skills (well-known index + skills CLI)

- source_url: https://backstage.io/docs/next/ai/skills
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: Backstage 官方 docs 把 well-known index 与 `npx skills add` 的消费关系写成明确口径（命中 `https://backstage.io/.well-known/skills/index.json`），并描述更新合并策略，是 “well-known 作为分发入口被真实采用” 的一手证据。

## Key Facts

- Backstage 文档明确：`npx skills add` 会读取其已发布的 index：`https://backstage.io/.well-known/skills/index.json`，并允许用户选择要安装到仓库的 skills。（Ref: Backstage docs）
- 文档明确：安装后可以修改本地 skills 以适配项目约定；后续再次运行 `npx skills add` 会提供合并 upstream changes 的选项。（Ref: Backstage docs）
- 文档在“contributing new skills”部分提到需要向 `docs/.well-known/skills/index.json` 增加条目（说明其内部也以同一 index 机制维护发布列表）。（Ref: Backstage docs）

## Claims Supported

- “well-known index + skills CLI 已被大型开源项目官方文档采用，用于把 skills 作为‘发布面’暴露给安装器消费；且更新语义涉及 upstream merge（而不是简单覆盖）。 ”（主题 2 dist；难点/趋势）

## Captured Excerpts (keep short)

> This command reads the published index from https://backstage.io/.well-known/skills/index.json

## Terms / Concepts

- `npx skills add`
- `/.well-known/skills/index.json`
- upstream merge of updates

## Risks / Limits

- 该页描述的是 Backstage 的发布与安装口径；对 index.json 的 schema 版本（legacy vs v0.2.0）需结合实际 index 文件核验。

