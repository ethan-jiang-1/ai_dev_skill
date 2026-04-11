# Wave 2 Cross Topic Synthesis

- `status`: `in_progress`
- `phase`: `opening`
- `basis`: `01 / 02 / 03 均已完成第一轮 topic-specific 证据包`

## 当前跨 topic 共享事实

- skill 的最小共同层已经相当明确:
  - 目录级对象
  - `SKILL.md`
  - `name`
  - `description`
  - 按需加载
  - supporting files on demand
- `AGENTS.md` 与 skills 的边界已经足够清楚，前者更偏 repo-level / always-on guidance，后者更偏 task-level / on-demand capability package。
- 当前生态中的对象类型已经明显分化，不应再混为一类:
  - sample library
  - installer / manager
  - library manager
  - runtime bridge
  - governance / publish
  - registry / directory
  - community learning hub

## 当前跨 topic 机制链条

- `01` 告诉我们 skill 的方法论核心已经从“写 prompt”转向“设计可发现、可触发、可扩展的目录级能力包”。
- `02` 告诉我们这套能力包在工程上已经分化出多层职责，不存在一个天然的单层对象能自动覆盖全部 lifecycle。
- `03` 告诉我们现成 skill 现在确实很容易找到，学习入口与分发入口都已成形，但 adoptability 仍需单独验证。

## 当前对象地图（跨 topic 视角）

| Object | 01 / 方法论位置 | 02 / 工程位置 | 03 / 采用位置 | 当前综合判断 |
| --- | --- | --- | --- | --- |
| `vercel-labs/agent-skills` | 高质量 skill 结构样板 | `sample-library` | 官方样板池，学习价值强 | 适合作为结构参考与内容样板基座 |
| `vercel-labs/skills` | 把 skill 变成可安装工件 | `installer / manager` | 分发与调用信号强 | 最接近工程基座的一层，但不是完整全链路 |
| `skill-forge` | 强调 discoverable / executable / trustworthy 等质量维度 | `governance / publish` | 方向相关但公共采用仍早期 | 值得重点跟踪的治理层对象，不宜过早当作唯一基座 |
| `skills.sh` | 把 skill 看成开放生态对象 | `registry / directory` | 发现与统计信号强 | 适合做发现入口，不应当成质量背书 |
| `github/awesome-copilot` | 暴露真实 skill 写法与学习材料 | `community learning hub` | 学习入口与社区信号强 | 高杠杆学习入口，不是统一标准本身 |
| `Ai-Agent-Skills` | 强调带 provenance 的 skill library | `library-manager` | 有一定外部信号 | 更适合团队 / 个人 library 管理场景 |
| `open-skills` | 强调 skill 的可执行适配 | `runtime-bridge` | 场景化采用信号 | 适合本地 / MCP / 任意 LLM 场景，不是通用分发层 |

## 当前最强的跨 topic 判断

- 当前最像现实答案的不是“单一赢家”，而是 `组合式 baseline`。
- 如果目标是尽快形成自己的 skill workflow，当前最像最低可行组合的是:
  - 一层结构样板 / sample library
  - 一层 installer / manager
  - 一层 governance / publish
- 如果目标偏学习加速，最像高杠杆组合的是:
  - `skills.sh`
  - `github/awesome-copilot`
  - `vercel-labs/agent-skills`
- 如果目标偏立即工程落地，当前最值得继续深挖的组合是:
  - `SKILL.md` 最小共同层
  - `vercel-labs/skills`
  - `skill-forge`

## 当前仍未解决的跨 topic 问题

- `allowed-tools`、`compatibility`、`metadata` 等扩展字段到底有多可迁移
- installer / manager 与 library-manager 的边界是否会进一步收敛
- governance / publish 层是否已有更多真实失败样本与修复实践
- 生态信号是否足以支撑最终前 `3` 排序，还是更适合给出分角色组合推荐

## 对下一波的含义

- 下一波不应再平均扩搜，而应针对三类缺口定向补证:
  - 客户端差异与失败样本
  - 第三方采用与独立教程
  - baseline 组合的具体落地步骤
- 只有这三类缺口补得足够，最终的前 `3` 判断与 workflow 建议才会真正稳。
