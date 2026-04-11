# AGENTS.md Homepage

- `source_url`: `https://agents.md/`
- `source_type`: `standard-homepage`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `official`
- `why_it_matters`: `这份来源帮助区分“仓库级 agent 指导文件”和“按需加载的 skill”，避免把两类机制混成一个概念。`
- `claims_supported`:
  - `AGENTS.md` 是 agent-facing repo context，而不是 task-specific skill 包
  - `AGENTS.md` 作为开放格式，已经在跨工具生态中扩散
  - `AGENTS.md` 的层级与优先级机制，对 skill engineering 的边界划分很重要

## 关键事实

- `AGENTS.md` 被官方首页描述为一个 simple, open format for guiding coding agents。
- 首页将其类比为 `README for agents`，强调它是给 agent 的专用、可预测入口。
- 首页声称该格式已被 `60k+` 开源项目使用。
- 该格式与 README 分离，是为了让 human-facing docs 保持简洁，同时给 agent 提供稳定指导入口。
- 页面明确说明：
  - 可以把 build steps、tests、conventions 放入 `AGENTS.md`
  - 大仓库可使用 nested `AGENTS.md`
  - 最近目录下的 `AGENTS.md` 优先
  - 显式用户提示优先于 `AGENTS.md`
- 页面还列出多种支持或兼容该格式的 agent / tool。

## 与本研究的关系

- 对 `01` 而言，这份来源帮助划清 skill 与 repo-level agent guidance 的边界。
- 对 `02` 而言，它说明“上下文加载层”不只有 `SKILL.md`，还存在 `AGENTS.md` 这类常驻指导面。
- 对 `03` 而言，开放格式与跨 agent 兼容本身也是生态可信度的重要信号。

## 可直接引用的术语 / 概念

- `README for agents`
- `simple, open format`
- `nested AGENTS.md`
- `closest file wins`

## 风险与局限

- 首页内容主要说明格式定位与采用情况，不提供像 `SKILL.md` 那样的结构化字段规范。
- `60k+` 是站点自述数字，适合用作生态信号，不应单独当作严格审计数据。
