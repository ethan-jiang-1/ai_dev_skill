# Vercel Labs `agent-skills` README

- `source_url`: `https://raw.githubusercontent.com/vercel-labs/agent-skills/main/README.md`
- `source_type`: `official-repo-readme`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `official`
- `why_it_matters`: `这是一个高质量官方样板库，能帮助判断“优秀 skill 仓库通常长什么样”。`
- `claims_supported`:
  - 一个 skill 通常不只是 `SKILL.md`，还可包含 `scripts/` 和 `references/`
  - 高质量样板库常把 use-when、分类与结构写得很明确
  - 官方样板与 installer / CLI 是两类不同对象

## 关键事实

- README 将该仓库定义为一组给 AI coding agents 使用的 skills 集合。
- 仓库明确说 skills 是 packaged instructions and scripts，用来扩展 agent capabilities。
- README 说明这些 skills 遵循 `Agent Skills` format。
- 技能结构被清楚写出：
  - `SKILL.md`
  - `scripts/`（可选）
  - `references/`（可选）
- 安装入口使用 `npx skills add vercel-labs/agent-skills`。
- README 展示了多个 skill 的 `Use when` 场景、主题覆盖和适用任务。
- 这类仓库的主要价值不是治理或安装逻辑，而是提供可直接借鉴的结构样板与内容组织方式。

## 与本研究的关系

- 对 `01` 而言，这个仓库是观察 skill 目录结构、描述粒度、触发条件和 supporting docs 组织方式的优质样本。
- 对 `02` 而言，它可以作为“内容 / 样板型对象”的代表，与 installer、loader、audit tool 区分开。
- 对 `03` 而言，它支撑“借鉴现成 skill 能显著缩短成长路径”的论点，因为这类仓库天然是高质量学习样本。

## 可直接引用的术语 / 概念

- `packaged instructions and scripts`
- `Use when`
- `references/`
- `scripts/`

## 风险与局限

- 这是一组官方样板，不等于整个生态都使用相同组织方式。
- 样板库能说明“如何写得好”，但不能单独证明“如何治理、分发、审计”。
