# Wave 2 Cross Topic Synthesis

- `status`: `in_progress`
- `phase`: `mid_stage`
- `basis`: `01 / 02 / 03 已完成第一轮 topic-specific 证据包，并补入第二轮 portability limit、orchestration gap、independent effectiveness、clone / security / quality 风险与 third-party tutorial layer`
- `paired_scorecard`: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-candidate-scorecard-draft.md`

## 当前跨 topic 共享事实

- skill 的最小共同层已经相当明确:
  - 目录级对象
  - `SKILL.md`
  - `name`
  - `description`
  - 按需加载
  - supporting files on demand
- 但这层共同层已经不能再被误读成“各 surface 行为完全一致”:
  - portable core 更小
  - client-specific frontmatter 更多
  - runtime constraints 还会继续切分真实可用边界
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
- `02` 告诉我们这套能力包在工程上已经分化出多层职责，而且 install 并不是终点，selection、evaluation、versioning 与 monitoring 也是 lifecycle 的一部分。
- `03` 告诉我们现成 skill 现在确实很容易找到，学习入口与分发入口都已成形，但 adoptability 还必须继续拆成 discovery、learning、trust 与 effectiveness。

## 第二轮补上的冲突与限制证据

- `01` 的新增限制:
  - “有共同格式”不等于“字段与运行语义完全可迁移”
  - Claude Code CLI、SDK、API runtime 已足以证明 surface-specific extensions 会持续存在
- `02` 的新增限制:
  - skill 太多时会出现 recall / selection failure
  - 因此单纯扩库不是答案，role-based bundles、orchestration 与 fallback 也必须进入 baseline
- `03` 的新增限制:
  - public skills 效果分布很不均匀，平均收益并不高
  - clone inflation 会放大“生态规模”的表面信号
  - validation 与行为效果脱钩，说明结构上看起来正常并不等于真正有用
- 但第二轮也补上了一条正向信号:
  - 第三方 tutorial layer 已经形成
  - 这说明“先借鉴现成 skill，再通过实验转成自己的经验”确实是现实存在的成长路径

## 当前对象地图（跨 topic 视角）

| Object | 01 / 方法论位置 | 02 / 工程位置 | 03 / 采用位置 | 当前综合判断 |
| --- | --- | --- | --- | --- |
| `vercel-labs/agent-skills` | 高质量 skill 结构样板 | `sample-library` | 官方样板池，学习价值强 | 适合作为结构参考与内容样板基座 |
| `vercel-labs/skills` | 把 skill 变成可安装工件 | `installer / manager` | 分发与调用信号强 | 最接近工程基座的一层，但仍不提供充分的 trust / effectiveness 保证 |
| `skill-forge` | 强调 discoverable / executable / trustworthy 等质量维度 | `governance / publish` | 方向相关但公共采用仍早期 | 值得重点跟踪的治理层对象，但还需要更多外部验证 |
| `skills.sh` | 把 skill 看成开放生态对象 | `registry / directory` | 发现与统计信号强 | 适合做 discovery / learning 入口，不应当成质量背书 |
| `github/awesome-copilot` | 暴露真实 skill 写法与学习材料 | `community learning hub` | 学习入口与社区信号强 | 高杠杆学习入口，不是统一标准或评测层本身 |
| `Ai-Agent-Skills` | 强调带 provenance 的 skill library | `library-manager` | 有一定外部信号 | 更适合团队 / 个人 library 管理场景，不是主流生态统一入口 |
| `open-skills` | 强调 skill 的可执行适配 | `runtime-bridge` | 场景化采用信号 | 适合本地 / MCP / 任意 LLM 场景，但不是通用 discovery / distribution 层 |

## 当前最强的跨 topic 判断

- 当前最像现实答案的不是“单一赢家”，而是 `组合式 baseline`。
- 这套 `组合式 baseline` 现在比 opening 阶段更具体了:
  - 一层结构样板 / sample library
  - 一层 installer / manager
  - 一层 governance / publish
- 另外还必须外加两条 discipline，而不能只看工具清单:
  - evaluation / versioning / fallback
  - trust gate / audit before install
- 如果目标偏学习加速，当前最像高杠杆组合的是:
  - `skills.sh`
  - `github/awesome-copilot`
  - `vercel-labs/agent-skills`
- 如果目标偏立即工程落地，当前最值得继续深挖的组合是:
  - `SKILL.md` 最小共同层
  - `vercel-labs/skills`
  - `skill-forge`
- 因此，最终推荐口径大概率不该只写一个总榜，而应至少拆成:
  - learning / discovery layer
  - engineering baseline layer
  - trust / governance layer

## 当前仍未解决的跨 topic 问题

- `allowed-tools`、`compatibility`、`metadata` 等扩展字段在 GitHub / Claude / Codex 等 surface 上到底有多可迁移
- installer / manager 与 library-manager 的边界是否会进一步收敛
- 当前候选对象各自对 clone / security / quality 风险的应对能力有多强
- 在缺少平台级 analytics 的情况下，baseline workflow 的 evaluation loop 应该如何最小化实现
- 最终交付到底更适合写“前 `3` 总榜”，还是“按角色拆开的组合推荐”

## 对下一波的含义

- 下一波不应再平均扩搜，而应开始把新增反证映射回具体候选对象:
  - 谁更适合当 learning layer
  - 谁更适合当 install / distribution layer
  - 谁更适合当 governance / trust layer
- 还需要把 `组合式 baseline` 写成可执行 workflow:
  - authoring baseline
  - audit / evaluation gate
  - versioning / rollout / rollback 节奏
- 只有把对象 scorecard 和 workflow baseline 同时补齐，最终的前 `3` 判断与落地建议才会真正稳。
