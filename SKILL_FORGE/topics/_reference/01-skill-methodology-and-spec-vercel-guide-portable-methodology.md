# Vercel Guide: Portable Methodology For Skills

- `source_url`: `https://vercel.com/kb/guide/agent-skills-creating-installing-and-sharing-reusable-agent-context`
- `source_type`: `official-guide`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这份 guide 把规范、写法、安装、触发和边界放进了一套连贯方法论里，是 `01` 最强的实践型补充。`
- `claims_supported`:
  - skill package 与单个 skill 的区分已经在实践层明确
  - `AGENTS.md` 与 skill 的边界在实践层已经相当清楚
  - 一套 portable 的最小 skill 写法已经基本成型

## 关键事实

- Vercel KB 明确区分:
  - `skill`: 单个包含 `SKILL.md` 的文件夹
  - `skill package`: 含有一个或多个 skills 的 repo / directory
- 同文还明确区分:
  - passive context 用 `AGENTS.md`
  - active context 用 skills
- 文中把 progressive disclosure 讲成三层:
  - metadata
  - full instructions
  - resources
- 文中将下列字段视为 `portable`:
  - `license`
  - `compatibility`
  - `metadata`
  - `allowed-tools`
- 文中还明确指出 `description` 应被当作 routing rule，而不是标题。

## 与本研究的关系

- 对 `01` 而言，这份来源最大的价值是把规范层与工作流层连在了一起。
- 它说明我们已经可以写出一套“跨生态尽量可迁移”的 baseline，而不必等一个完全统一的大标准出现。

## 风险与局限

- 这是 Vercel 视角的 guide，带有明显实践导向与产品视角。
- 它强调 portable fields，但也明确承认某些支持在不同 agent 间仍有差异。
