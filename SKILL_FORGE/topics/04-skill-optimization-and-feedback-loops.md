# 04 / skill-optimization-and-feedback-loops / Skill 持续优化、评测闭环与反馈回流

## 这个 topic 文件要解决什么

这份文件不是研究执行结果，而是一个可以直接进入 Deep Research 的自说明 seed。

单独打开这一个文件，应该立刻能知道：

- 原始研究为什么不能只停在“写出来、发出去”的 skill engineering
- 为什么“持续优化、评测闭环与反馈回流”必须单独成为一条研究线
- 这条线和 `01 / 02 / 03` 的边界分别在哪里

## 原始 Deep Research 诉求

这轮研究最终不是为了堆更多 skill 链接，而是为了支撑我们自己的 skill workflow 设计。

原始研究想回答的几个核心问题里，其实一直隐含着一个后半程难题：

- skill 写好之后怎么持续更新和验证
- skill 发布之后怎么知道它是真的在帮助 agent，而不是只在 demo 里看起来可用
- skill 的问题到底出在 prompt、metadata、结构、工具约束，还是触发机制
- 每次修订之后怎么知道它是变好了，还是只是换了一种失败方式

如果这部分一直不被单独研究，skill engineering 就会更容易停留在：

- 定义和结构边界
- 工程交付和发布流程
- 生态采用和外部信号

却缺少：

- 发布后的失败分析
- 版本迭代闭环
- 评测驱动的持续精调
- 反馈回流后的系统修订

## 为什么这个 topic 必须单独存在

如果不把这条线单独拆出来，整个研究容易出现两个失真：

- 把“skill 已经可发布”误当成“skill 已经足够成熟”
- 把“prompt 改写”误当成“skill 优化”的全部

但一个真实的 skill artifact，真正影响效果的部分通常不只是正文 instruction，还包括：

- 名称和描述
- 触发词与触发条件
- 元数据与目录结构
- step-by-step workflow 拆法
- 工具调用边界与输出契约
- 示例、反例和失败案例
- 评测集、回放样本与版本治理

这意味着：

- `01` 固定的是定义和结构共识
- `02` 固定的是工程链路和职责边界
- `03` 固定的是可信度和采用判断
- `04` 固定的是发布后如何持续把 skill 打磨得更稳

如果没有 `04`，前面三条线的最终 workflow baseline 仍然是不完整的。

## 这个 topic 与另外三个 topic 的边界

这个 topic 负责回答：

- skill 的持续优化对象到底是什么，为什么不能等同于 prompt tuning
- skill 发布后的失败信号应如何分类、沉淀和回流
- 最小 eval / replay / regression loop 应该怎么设计
- 哪些修订适合自动化生成，哪些必须 human-in-the-loop
- 如何判断一次 skill 修订是真的提升，而不是只是改了表面表述

这个 topic 不负责回答：

- skill 的定义、结构和最小共同层，那属于 `01`
- lifecycle 各层工具、loader、governance、distribution 的职责边界，那属于 `02`
- 候选对象是否值得采用、外部信号是否足够，那属于 `03`

和另外三个 topic 的关系可以简单理解成：

- `01` 告诉我们 skill 是什么
- `02` 告诉我们 skill engineering 链路里谁做了什么
- `03` 告诉我们为什么值得押注某些对象
- `04` 告诉我们 skill 上线后怎么继续稳定变好

## 初始观察方向

这个 topic 初始上不应该只搜 prompt optimization，而应该优先看 skill artifact 级别的持续优化机制：

- skill discoverability 与触发精度优化
- skill structure / workflow executability 优化
- skill metadata、描述和边界条件优化
- skill tool-use contract 与 output contract 优化
- failure taxonomy、trace / replay 与 regression-based revision
- human-in-the-loop 的持续修订与版本治理

初始可关注的问题包括：

- skill 的失败到底落在哪些层，如何避免一律归因为“prompt 不够好”
- 哪些真实失败更值得优先修，例如漏触发、误触发、工具误用、workflow 偏航
- 怎样建立最小 eval set，让 skill 修改不再只靠主观感觉
- 发布后的真实调用轨迹怎样沉淀成可复用的失败样本
- autoresearch / self-critique / candidate generation 这类思路，能否安全映射到 skill artifact 的局部修订

初始可关注的外部对象和模式，不应只停在“通用 prompt 优化框架”，而应优先看下面三类：

### 直接面向 skill artifact 优化的开源对象

- `skill-forge`
  - 它虽然不是自动优化器，但明确在做 skill 级别的 discoverability、executability、结构一致性、安全与发布前审计。
  - 它值得优先研究的原因，不是“它会写 prompt”，而是它已经把 skill 当成一个可验证、可修复、可发布、可持续治理的工程产物。
  - 对这个 topic 来说，`skill-forge` 的价值在于：它可能代表一种“skill 优化先从结构、描述、步骤执行性和分发一致性做起”的真实开源路线。

### 可迁移到 skill 的评测与反馈闭环模式

- dataset / trace / replay
- eval-driven iteration
- regression harness
- failure clustering 与 feedback loop

这类模式的价值是：

- 帮我们建立 skill 发布后的观测、回放、对比和修订闭环
- 让 skill 修改不再只靠作者主观感觉

### 可借鉴但不应误当成全部的 prompt / program optimization 原型

- OpenAI 的 eval-driven prompt / workflow 迭代思路
- LangSmith 的 dataset、trace、evaluation、replay 能力
- DSPy 的 optimizer / search / structured improvement 思路
- promptfoo 这类回归测试与 assertion harness

这些对象仍然值得看，但在这个 topic 里它们的定位应该是：

- 提供可迁移的优化机制原型
- 帮助我们设计 skill 的 eval / replay / regression loop

而不是让研究重新退化成“怎么继续调 prompt 文本”。

## 为什么这题对最终交付重要

原始研究最终不是只要“哪几个项目值得看”，而是还要形成一份可落地的 skill workflow baseline。

如果没有 `04`，这个 baseline 最多只能回答：

- skill 怎么组织
- skill 怎么装载
- skill 怎么发布

却还不能稳地回答：

- skill 怎么持续评估
- skill 怎么根据失败样本修订
- skill 怎么做版本比较和回归验证
- 自动化和人工审阅的边界在哪里

这会直接削弱最终交付里“如何落到自己的 skill workflow”的那一部分。

- `status`: `seed`
- `seed_files`:
  - `../_raw_idea/skill-continuous-optimization.md`
  - `../_raw_idea/skill-engineering-research-plan.md`
  - `../_raw_idea/github_skill-forge.md`

- `current_hypothesis`:
  - Skill optimization 的真实对象是完整 artifact，而不是单段 prompt。
  - 发布后真实失败样本、trace、eval case 和用户修正记录，才是 skill 持续精调最有价值的输入信号。
  - 可迁移的 skill workflow baseline，必须包含最小 evaluation loop、failure taxonomy 和 versioned revision 机制。

- `why_it_matters`:
  - 如果没有这条研究线，整个 skill engineering 研究会停在“可写、可装、可发”，缺少“可持续变好”的后半程能力。
  - 最终如果要落到自己的 skill workflow，这一线负责回答“怎么持续更新和验证”。

- `must_answer`:
  - Skill 持续优化的对象边界是什么，为什么不能等同于 prompt tuning。
  - 发布后的失败信号如何分类、沉淀、回流到 skill 修订。
  - 最小 eval / replay / regression loop 应如何定义，才能让 skill 修改可验证。
  - 哪些优化环节适合自动化，哪些必须 human-in-the-loop。
  - 如何判断一次 skill 修订是真的提升，而不是换一种失败方式。

- `non_goals`:
  - 不在本 topic 内给某个具体工具直接排前 3。
  - 不把“自动改 prompt”当成这一题的全部。

- `expected_output_shape`:
  - 一份关于 skill continuous optimization 的对象清单与 failure taxonomy 草案。
  - 一套可迁移的最小 eval / replay / regression loop baseline。
  - 一组关于自动化优化与人工把关边界的工作判断。

## 历史摘要（保留，不修改）

- 这条 topic 由 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/_raw_idea/skill-continuous-optimization.md` 升格而来。
- 它的起点判断是：skill 的调优不能只理解成 prompt 改写，而应覆盖 metadata、触发、结构、工具契约、示例、评测和反馈闭环。

## 本轮新增证据

- 待本轮 Wave 1 正式落库后补充。

## 本轮新增机制理解

- 待本轮 Wave 1 正式推进后补充。

## 本轮新增趋势与难点

- 待本轮 Wave 1 正式推进后补充。

## 当前判断（本轮综合后）

- 当前最稳的判断是：这已经不是 `01/02/03` 内任何一条研究线的局部补件，而是一个独立问题簇，因此应作为 `04` 独立 topic 推进。
- 当前最值得作为 `04` 起步样本的对象之一是 `skill-forge`，因为它已经把 skill 的 discoverability、executability、结构一致性和发布前治理视为可优化对象，而不只是把问题退化成 prompt 改写。
