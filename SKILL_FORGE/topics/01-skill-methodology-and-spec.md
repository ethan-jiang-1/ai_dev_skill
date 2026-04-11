# 01 / skill-methodology-and-spec / Skill 方法论与规范接口

## 这个 topic 文件要解决什么

这份文件不是研究结论，而是一个可直接进入 Deep Research 的自说明 seed。

单独打开这一个文件，应该就能明白三件事：

- 我们为什么会发起这轮关于 skill engineering 的 Deep Research
- 为什么“方法论与规范接口”必须被单独拆成一个 topic
- 这个 topic 和另外两个 topic 的边界分别在哪里

## 原始 Deep Research 诉求

这轮研究的根本目的，不是多看几个 skill 仓库，也不是做一篇泛泛的生态笔记。

真正想回答的是下面四个问题：

- 社区里是否已经存在比较成熟的 skill engineering 方法论
- 是否有适合 coding agent 的开源工具链，能降低 skill 打磨、复用、发布成本
- 哪些项目只是 skill 内容集合，哪些项目已经具备工程化流水线能力
- 最终能否筛出 `1` 到 `3` 个最值得持续跟踪或直接采用的基座项目

换句话说，这轮 Deep Research 最终服务的，不是“理解 skill 是什么”本身，而是要反过来支撑我们自己的 skill workflow 设计：

- skill 应该怎么组织
- skill 应该怎么评审
- skill 应该怎么跨 agent 装载
- skill 应该怎么持续更新和验证

## 为什么这个 topic 必须单独存在

如果不先回答“skill 到底是什么、边界在哪里、有哪些事实标准或结构共识”，后续两个更偏执行层的话题都会失焦：

- 你无法准确判断某个项目到底是在做“工程化工具链”，还是只是在提供“内容样板”
- 你也无法判断一个项目的社区采用，究竟是在采用它的内容、它的结构，还是它背后的隐含方法论

因此，这个 topic 的职责不是给项目排名，而是先建立一套后续研究必须共享的地基：

- skill 的定义
- skill 的结构元素
- skill 的质量维度
- skill 和 prompt / rule / agent instruction / recipe 的边界
- 哪些约定已经接近事实标准，哪些仍只是局部习惯

## 这个 topic 与另外两个 topic 的边界

这个 topic 负责回答：

- skill engineering 有没有方法论层
- skill 的结构和接口有没有跨项目共识
- “可发现性”“可执行性”“可治理性”为什么会成为 skill 质量的一部分

这个 topic 不负责回答：

- 哪个项目在工程链路上最强，那属于 `02`
- 哪个项目最值得采用、外部信号最强，那属于 `03`

和另外两个 topic 的关系可以简单理解成：

- `01` 提供术语、定义和判断框架
- `02` 研究工程实现与生命周期覆盖
- `03` 研究生态验证与采用可信度

## 初始观察方向

这个 topic 初始上应该优先看下面几类材料，而不是先做项目排行：

- 官方或半官方的 skill 结构样板
- 明确讨论 skill 组织、触发、发现、执行的文档
- 带有结构约束、元数据约束或接口约束的项目说明
- 在多个项目里重复出现的目录约定、字段约定、触发约定

初始可关注的证据来源类型：

- 官方 skill 样板仓库
- runtime / loader 项目的接口约定说明
- 工程化工具对 skill 结构的假设
- 讨论 `SKILL.md`、`AGENTS.md`、安装方式、触发约定的材料

## 为什么这题对最终交付重要

原始研究最终要形成：

- 一份候选对象池
- 一份横向对比表
- 一份前 `3` 名推荐结论
- 一份“如何落到自己的 skill workflow”建议

其中最后一项其实高度依赖本 topic。因为如果没有方法论和结构共识，所谓 workflow 建议只能停留在工具层拼装，缺少长期可迁移的规则。

- `status`: `seed`
- `seed_files`:
  - `../_raw_idea/skill-engineering-research-plan.md`

- `current_hypothesis`:
  - Skill engineering 已经开始从“写 prompt 内容”转向“设计可复用、可发现、可治理的技能资产”，但方法论仍然分散。
  - 现阶段更可能存在若干事实标准和结构共识，而不是完整统一的官方标准。
  - 官方样板、社区 skill 仓库、工程化工具之间，可能共同定义了一个隐含接口层。

- `why_it_matters`:
  - 如果不先澄清 skill 的定义、边界和结构共识，后续对工具链和候选项目的比较会失真。
  - 最终要落到自己的 skill workflow，就必须先知道哪些约定值得固化，哪些只是个别仓库习惯。

- `must_answer`:
  - 在 coding agent 语境下，什么才能算一个可复用的 skill，而不只是提示词片段、规则文件或示例 recipe。
  - 当前主流 skill 结构通常由哪些组成部分构成，例如说明、触发条件、步骤、元数据、安装入口、分发信息。
  - 哪些结构约定是跨项目重复出现的事实共识，哪些只是单个生态或仓库私有格式。
  - “可发现性”和“可执行性”为什么会被视为 skill 质量的一部分，而不只是附加属性。
  - 是否已经存在可迁移的方法论框架，能指导 skill 的编写、组织、审计和复用。

- `non_goals`:
  - 不直接评估某个具体项目是否应进入前 3。
  - 不在本 topic 内做社区热度排序或采用判断。

- `expected_output_shape`:
  - 一份关于 skill 定义、结构要素、事实标准和方法论分层的稳定框架。
  - 一组后续 topic 共用的术语和判断口径。

## 本轮新增证据（Wave 0 共享地基）

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/00-shared-github-about-agent-skills.md`
  - GitHub 官方已经把 skill 定义为按需加载的 instructions / scripts / resources 文件夹，并明确 project / personal 两层存放位置。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/00-shared-github-create-agent-skills.md`
  - `SKILL.md`、YAML frontmatter、`name`、`description`、`allowed-tools` 等字段已经构成一套事实接口。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/00-shared-agents-md-home.md`
  - `AGENTS.md` 是 repo-level agent guidance，而不是 task-level skill 包，应与 `SKILL.md` 区分。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/00-shared-vercel-agent-skills.md`
  - 官方样板库显示一个高质量 skill 通常不止 `SKILL.md`，还可带 `scripts/` 和 `references/`。

## 本轮新增机制理解

- 当前生态至少存在两个互补层：
  - repo-level、常驻的 agent guidance
  - task-level、按需加载的 skill package
- skill engineering 的最小单位更接近“目录级可加载工件”，而不是单条提示词。
- skill 的质量判断已经不止“内容对不对”，还包含 discoverability、executability、结构一致性等工程维度。

## 本轮新增趋势与难点

- 趋势上，`SKILL.md` 作为 skill 入口文件已经越来越具体，但跨平台字段与目录约定是否完全收敛仍待验证。
- 难点在于：很多生态讨论仍把 `AGENTS.md`、custom instructions、skills 混在一起，导致比较对象不干净。

## 当前判断（Wave 0）

- 这一 topic 已经具备进入 Wave 1 的共享地基。
- 当前最稳的判断是：skill 不是泛化概念，而是一个有明确载体、可按需加载、可附带脚本与资源的目录级能力包。
- 当前还不能下的判断是：整个生态已经形成统一、无歧义、跨平台完全一致的 skill 标准。
