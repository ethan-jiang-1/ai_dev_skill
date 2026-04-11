# `skills.sh` Homepage

- `source_url`: `https://skills.sh/`
- `source_type`: `official-service-homepage`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `official`
- `why_it_matters`: `这个站点体现了 skill 生态已经出现目录、安装、排行、审计等服务层，不再只是零散仓库。`
- `claims_supported`:
  - skill 生态已经出现专门的 directory / install / leaderboard / audit 服务
  - 生态显式面向多 agent，而不是只围绕单一平台
  - 共享 skill 的发现成本已经显著下降

## 关键事实

- 首页标题为 `The Agent Skills Directory`，描述为 `Discover and install skills for AI agents.`。
- 首页将自己描述为 `The Open Agent Skills Ecosystem`。
- 首页给出统一安装命令：`npx skills add <owner/repo>`。
- 首页直接展示多 agent 可用，包括 `Claude Code`、`Codex`、`Cursor`、`GitHub Copilot` 等。
- 导航中出现了 `Official`、`Audits`、`Docs` 等入口，说明目录站点已不只是“列表”，而开始承载更完整的生态服务。
- 页面数据中暴露了 `totalSkills` 等安装统计字段，说明生态已经在尝试把采用和热度量化成可见信号。

## 与本研究的关系

- 对 `03` 而言，这个来源直接支撑“现成 skill 很容易找到，借鉴现成资源比完全从零摸索更高杠杆”的动机。
- 对 `02` 而言，它说明 installer / discovery / stats / audits 已经开始耦合成一个服务层。
- 对 `01` 而言，它提示 skill 已经不只是文档格式，而是有目录与分发基础设施配套的对象。

## 可直接引用的术语 / 概念

- `The Agent Skills Directory`
- `The Open Agent Skills Ecosystem`
- `npx skills add <owner/repo>`
- `Official`
- `Audits`

## 风险与局限

- 站点上的统计数字是服务端实时或近实时暴露的数据，应视为站点自报信号，不是独立审计结果。
- 目录站点可以证明“能被发现”，但不能直接证明 skill 本身的质量和安全性。
