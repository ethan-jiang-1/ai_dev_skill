# SKILL_FORGE Final V1 Playbook Generation Spec

> 用途：这不是通用模板。
>
> 这是一份只服务于本次 `SKILL_FORGE/final_v1` 生产的专用说明文档，用来冻结当前共识、设计边界、文件结构、术语策略、写作纪律与 reviewer 检查点。
>
> 目标读者不是最终 Playbook 的普通读者，而是：
>
> - 将要继续落笔的另一个 agent
> - 将要 review 思路、计划或 final 成品的 reviewer
> - 未来想快速回看这次生产为什么这样设计的人

## 1. 这份文档解决什么问题

当前我们已经有：

- 一套通用的 [`TOPIC_FINAL_PLAYBOOK_GENERATOR.md`](/Users/bowhead/ai_dev_skill/TOPIC_FINAL_PLAYBOOK_GENERATOR.md)
- 一轮已经完成主要收束的四主题 research workspace
- 一个历史 final 草稿层 `final_v0`
- 一个空的 [`final_v1`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1) 目录

真正的问题不是“有没有材料”，而是：

- 这次 `final_v1` 到底是不是完整 final，而不是 `v0` 的补丁
- 这次 final 应该覆盖哪些主题，怎样组织
- 这次 final 的读者画像到底有多宽
- 术语该在正文解释，还是集中到附录
- 哪些材料能进主文，哪些只能做 supporting docs
- 另一个 agent 如果来 review，应该按什么标准判断这套设计是不是成立

这份 spec 专门解决这些问题。

它的功能是：

- 冻结这次生产的目标与边界
- 把对话中已经达成的共识显式写出来
- 告诉执行者 final package 应该怎样搭
- 告诉 reviewer 重点检查什么

它不负责：

- 重做 deep research
- 代替最终 Playbook 成品
- 给普通读者讲 skill 本身
- 泛化成以后所有 topic 都能直接套用的 generator

## 2. 这次生产到底在做什么

这次生产的对象是：

- `SKILL_FORGE` 这轮 research 的完整 final package
- 目标目录：[`/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1)

必须明确：

1. 这不是给 `final_v0` 打补丁。
2. 这不是只补一个 `skill optimization` 章节。
3. 这不是把四个 topic 原文重新排版一下。
4. 这是一套面向实际读者的、完整自足的 `final_v1`。

这次生产必须完整覆盖四个 topic：

- `01` / 方法论与规范接口
- `02` / 工程化工具链与生命周期
- `03` / 生态信号、可信度与采用判断
- `04` / 持续优化、评测闭环与反馈回流

其中：

- `04` 是这轮 research 后期正式补入并被吸收的一层
- 但 `final_v1` 不能被写成“主要讲 `04`，其余主题陪衬”
- `04` 的正确位置是完整最终结构中的第四层，而不是唯一中心

## 3. 当前输入材料与角色分工

本次生产的真实输入不是抽象的“topic 材料”，而是下面这些实际文件层。

### 3.1 Registry 与 topic 层

- [`topics/00-topic-registry.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/00-topic-registry.md)
- [`topics/01-skill-methodology-and-spec.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/01-skill-methodology-and-spec.md)
- [`topics/02-skill-toolchain-and-lifecycle.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/02-skill-toolchain-and-lifecycle.md)
- [`topics/03-ecosystem-signals-and-adoption.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/03-ecosystem-signals-and-adoption.md)
- [`topics/04-skill-optimization-and-feedback-loops.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/04-skill-optimization-and-feedback-loops.md)

它们的角色是：

- 告诉执行者这轮 research 为什么拆成四个 topic
- 提供每条主题线的原始问题意识、边界与语义
- 为 final 提供主题供稿源

它们不是：

- 主文直接拼接来源
- supporting docs 的最终成品

### 3.2 Reference 证据层

- [`topics/_reference/`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference)

它的角色是：

- 作为证据 Source of Record
- 支撑最终判断、推荐、边界、样本拆解和反误读规则

它不是：

- 主文正文
- 直接可读的 Playbook 骨架

### 3.3 Artifacts 中间收束层

最关键的文件包括：

- [`W2-cross-topic-synthesis.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-cross-topic-synthesis.md)
- [`W2-final-recommendation-and-baseline.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-final-recommendation-and-baseline.md)
- [`W2-combination-baseline-workflow-draft.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-combination-baseline-workflow-draft.md)
- [`W2-formal-comparison-table.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-formal-comparison-table.md)
- [`W2-surface-compatibility-appendix-codex-github-claude.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-surface-compatibility-appendix-codex-github-claude.md)
- [`W2-readiness-check.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-readiness-check.md)
- `04-*` 系列 optimization / runner / adapter / case pack 相关 artifacts

它们的角色是：

- 提供 final 的主骨架与稳定判断
- 产出推荐语法、baseline workflow、对象分类、compatibility 边界、optimization layer

它们不是：

- 可以原样交付给最终读者的 final 文本

### 3.4 历史 final 供稿源

- [`final_v0/00-Skill工程从借鉴到编制的实践Playbook.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v0/00-Skill工程从借鉴到编制的实践Playbook.md)
- [`final_v0/附录A-代表性Skill样本与拆解索引.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v0/附录A-代表性Skill样本与拆解索引.md)
- [`final_v0/附录B-证据总表与引用索引.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v0/附录B-证据总表与引用索引.md)
- [`final_v0/附录C-角色分工与组合比较.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v0/附录C-角色分工与组合比较.md)

它们的角色是：

- 历史供稿源
- 证明“先读后编”与“分角色推荐 + baseline 组合”已经形成一版可读语法
- 为 `v1` 提供可以继承、改写、扩展的局部写法

它们不是：

- `v1` 的结构正确答案
- `v1` 的限制条件

### 3.5 通用 generator

- [`TOPIC_FINAL_PLAYBOOK_GENERATOR.md`](/Users/bowhead/ai_dev_skill/TOPIC_FINAL_PLAYBOOK_GENERATOR.md)

它的角色是：

- 提供一套通用的 final synthesis / playbook generation 世界观
- 提供可以参考的阶段、原则与文体边界

它不是：

- 本次生产的最终 spec
- 本次 production 的细化决策文件

## 4. 这次对话中已经冻结的核心决策

下面这些不是待讨论项，而是已经在本轮对话中明确确认过的决定。

### 4.1 `final_v1` 是完整 final，不是补丁

- `final_v1` 必须完整覆盖全部四个 topic
- 不允许只围绕 `04` 或只做 `v0 + optimization`
- `final_v1` 打开后应让读者把四层结构都看明白

### 4.2 读者范围比“纯程序员”更宽

默认读者不是必须重度程序员。

更准确地说，默认读者是：

- 已经在和 AI 协作
- 已经知道 skill 有用，甚至 skill 做得挺顺
- 但不一定熟悉一整套程序或工程化术语

所以：

- 这不是写给“只需要术语速记”的程序员内部材料
- 也不是写给完全小白的科普
- 而是写给“实践经验不弱，但技术术语不一定稳”的读者

### 4.3 中文为主，但关键术语必须中英双写

语言策略已经冻结为：

- 正文以中文为主
- 关键术语第一次出现时必须中英文双写
- 双写后要立刻给一句白话解释
- 如果术语仍然抽象，要再给最小例子或类比

### 4.4 术语不能只靠附录兜底

这次已经明确：

- 术语必须在正文第一次出现时就解释
- 不能把正文写成黑话，然后让读者自己去猜
- 同时还要额外提供一份术语附录，把难术语讲透

也就是说，采用双层策略：

1. 正文现场解释
2. 术语附录系统解释

### 4.5 `final_v1` 的 package 要显式拆文件

当前冻结的默认结构不是“一个大主文”，而是：

- `1` 份主 Playbook
- `5` 份功能型 supporting docs / appendices
- `1` 份术语附录

总计 `7` 个 Markdown 文件。

### 4.6 这份 spec 自己不属于普通读者 final package

这份文档的用途是：

- generation spec
- review context
- reviewer handoff

它不是：

- 主文的一章
- 普通读者阅读路径的一部分

## 5. 这次 production 的核心目标

把目标压缩成一句话：

> 生产一套完整、自足、对实践者友好的中文 Playbook 包，让读者从“知道 skill 有用”推进到“知道如何借鉴、如何搭 baseline、如何判断对象角色、如何持续演进 skill 体系”。

更细一点，`final_v1` 应至少帮读者完成下面几件事：

1. 看懂 skill 到底是什么，不是什么。
2. 看懂为什么现成样本比闭门硬写更有杠杆。
3. 看懂生态对象为什么不能混成一类。
4. 看懂当前最稳的答案为什么是分角色推荐 + baseline 组合。
5. 看懂 cross-surface 时哪些部分可迁移，哪些不能想当然。
6. 看懂为什么 skill 上线不等于成熟。
7. 看懂怎样用 evaluation、versioning 和 feedback loop 持续让 skill 变稳。

## 6. `final_v1` 的文件结构与职责

当前冻结的 file map 如下。

### 6.1 主文

- [`00-Skill实践Playbook-从借鉴到持续演进.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/00-Skill实践Playbook-从借鉴到持续演进.md)

作用：

- 作为整套包的主导航与主叙事
- 连续串起四个 topic
- 把读者从“理解对象”带到“理解最小 workflow”再带到“理解持续演进”

承接 topic：

- `01 + 02 + 03 + 04`

应写什么：

- 读者问题
- skill 的边界
- 先读后编
- 生态分层
- baseline 组合
- 最小 workflow
- 持续优化闭环的高层逻辑
- 下一步练习路径

不应写什么：

- 长比较表
- 大量 evidence matrix
- 详细 field-by-field compatibility
- runner / adapter / schema 细节
- 术语长篇辞典式解释

### 6.2 附录 A：代表性样本与阅读路径

- [`附录A-代表性样本与阅读路径.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/附录A-代表性样本与阅读路径.md)

作用：

- 让“先读后编”落地
- 帮读者知道先看哪些样本、看什么、怎么读

承接 topic：

- `01 + 03`

应写什么：

- 代表性样本对象
- 每个样本该看什么
- 怎样拆 `Use when`、结构、supporting files、scripts、边界
- 怎样抽模式，而不是抄模板

不应写什么：

- 大段生态排名
- 工具职责大比较

### 6.3 附录 B：对象分层与 Baseline 组合比较

- [`附录B-对象分层与Baseline组合比较.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/附录B-对象分层与Baseline组合比较.md)

作用：

- 固化对象角色、推荐结构和 anti-misread 规则

承接 topic：

- `02 + 03`

应写什么：

- sample library
- installer / manager
- governance / publish
- discovery / directory
- runtime bridge
- library manager
- 最值得先学的入口
- 最值得先搭的 baseline 组合
- 只在特定场景下追加的增强层

不应写什么：

- 无语义总榜
- 只看热度不看职责的排名文风

### 6.4 附录 C：Cross-Surface 兼容边界与 Portable Core

- [`附录C-Cross-Surface兼容边界与Portable-Core.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/附录C-Cross-Surface兼容边界与Portable-Core.md)

作用：

- 处理 `01` 中最容易被误读的兼容边界问题

承接 topic：

- `01 + 02`

应写什么：

- 什么是最小共同层
- 什么是 `portable core`
- 哪些字段不该默认视为通用基线
- 为什么 `surface-specific extensions` 不能误写成统一规范
- Codex / GitHub / Claude 的兼容性理解方法

不应写什么：

- 失控扩成平台百科
- 只贴字段表不解释使用边界

### 6.5 附录 D：持续优化闭环与评测操作

- [`附录D-持续优化闭环与评测操作.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/附录D-持续优化闭环与评测操作.md)

作用：

- 把 `04` 正确纳入 final 的操作层

承接 topic：

- `04`

应写什么：

- 为什么 final answer pass 不等于 workflow pass
- failure taxonomy
- regression harness
- offline / online feedback loop
- candidate revision
- human promotion gate

不应写什么：

- 让主文承担的高层叙事
- 直接把 mock runner artifacts 原样搬运成正文

### 6.6 附录 E：证据总表与引用索引

- [`附录E-证据总表与引用索引.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/附录E-证据总表与引用索引.md)

作用：

- 让主文与附录中的关键判断都能回指到证据

承接 topic：

- `01 + 02 + 03 + 04`

应写什么：

- judgment 编号
- judgment 对应 artifact
- judgment 对应 reference
- judgment 对应主文或附录位置

不应写什么：

- 无结构的大量引用摘抄

### 6.7 附录 F：术语解释与常见误解

- [`附录F-术语解释与常见误解.md`](/Users/bowhead/ai_dev_skill/SKILL_FORGE/final_v1/附录F-术语解释与常见误解.md)

作用：

- 照顾程序背景稍弱、但实践经验不弱的读者
- 把高难术语真正讲透

承接 topic：

- 全局附录，不只属于某一个 topic

应写什么：

- 关键术语
- 中文直译
- 在本 Playbook 里的具体意思
- 常见误解
- 一个最小例子
- 什么时候不用太在意这个术语

不应写什么：

- 只有一句翻译的 glossary
- 与正文完全脱节的抽象定义堆积

## 7. 主文的叙事规则

这次主文不是研究档案，不是百科，不是执行报告。

主文必须是：

- 一份能连续阅读的实践 Playbook
- 一份能把读者带起来的主指南
- 一份四主题被自然吸收的整合叙事

主文的默认推进顺序固定为：

1. 这份 Playbook 要帮谁解决什么问题
2. skill 到底是什么，不是什么
3. 为什么先读后编
4. 当前生态该怎样分层理解
5. 最值得先学的入口与最值得先搭的 baseline
6. 从样本到自己的 skill：最小 workflow
7. 为什么 skill 上线不等于成熟
8. 持续优化闭环如何让 skill 变稳
9. 读者下一步先练什么

主文写法要求：

- 每章先给判断
- 再给例子、类比或图示
- 再讲边界与反误读
- 最后给下一步动作

## 8. 术语处理规范

这次术语策略已经被明确加严。

### 8.1 正文第一现场必须解释

所有关键难术语第一次出现时，都要做到：

1. 中英文双写
2. 紧跟一句白话解释
3. 必要时再给最小例子

例如：

- `portable core（可移植核心）`
  - 指不严重依赖某一个平台、换个宿主仍大体能沿用的核心写法
- `feedback loop（反馈闭环）`
  - 指不是做完就结束，而是把真实使用中的问题重新带回下一轮修改
- `regression harness（回归测试框架）`
  - 指每次修改 skill 后，用一组固定检查确认没有把原来有效的东西改坏

### 8.2 术语附录必须讲透

附录 F 不是简单 glossary，而是一份小型解释手册。

默认术语分四类：

- 基础对象术语
- 方法与结构术语
- 工作流术语
- 评测与优化术语

每个术语条目至少包含：

- 术语
- 中文直译
- 在本 Playbook 里的意思
- 最容易和什么混淆
- 一个最小例子
- 什么时候你其实不必太在意它

### 8.3 术语使用纪律

- 能先用中文讲清时，不抢着上英文
- 但真正关键、后文会重复出现的术语，第一次必须双写
- 不允许把英文堆在一段里让读者自行猜测
- 专有项目名不翻译，但第一次要补一句中文角色说明

## 9. 推荐语法与判断语法

这次 final 的推荐主语法已经冻结，不再回退成“总榜”。

固定语法为：

- `最值得先学的入口`
- `最值得先搭的 baseline 组合`
- `使用时必须保留的纪律`
- `Cross-surface 时必须保留的边界`
- `上线后必须保留的持续优化闭环`
- `只在特定场景下追加的增强层`

这套语法的原因是：

- 当前证据更支持分角色推荐，而不是单一赢家
- 当前最稳的现实答案是组合式 baseline
- `04` 加入后，推荐结构必须含有 optimization / feedback loop layer

## 10. 明确禁止事项

下面这些写法在这次 production 中被明确禁止。

### 10.1 禁止写成 topic 拼盘

不能：

- `01` 一章
- `02` 一章
- `03` 一章
- `04` 一章

然后结束。

必须重组为读者路径，而不是研究路径。

### 10.2 禁止写成过程报告

不能出现或大量保留：

- `wave`
- `round`
- `reopened`
- `refreshed`
- `handoff`
- `deliverable_ready`
- `stop_allowed`

这些词只对制作过程有意义，不对最终读者有意义。

### 10.3 禁止写成无语义总榜

不能把 final 的中心写成：

- 总冠军是谁
- 排行榜前几名是谁

必须坚持角色分工与组合推荐。

### 10.4 禁止让主文承载中间工件

不能把下面这些中间工件直接塞进主文：

- runner prototype
- mock adapter
- schema
- yaml/json case pack
- matcher spec

它们最多只能转化为附录 D 中的操作性说明或未来扩展说明。

### 10.5 禁止默认读者懂工程黑话

不能因为读者做 skill 做得挺顺，就默认他：

- 熟悉所有工程术语
- 理解所有英文表达
- 不需要白话解释

## 11. Reviewer Checklist

另一个 agent 或 reviewer 来 review 时，应优先检查下面这些问题。

### 11.1 覆盖度

- 是否真的覆盖了四个 topic
- 是否把 `04` 吸收到整体，而不是喧宾夺主
- 是否遗漏了 `01` 的定义边界、`02` 的 lifecycle、`03` 的 adoptability、`04` 的 optimization layer

### 11.2 结构合理性

- 主文是否承担了正确的叙事负载
- 附录拆分是否合理
- 是否有内容放错层级
- 是否某个附录其实应并入主文，或相反

### 11.3 文体控制

- 是否仍残留研究报告、状态报告或 handoff 文风
- 是否仍有 topic 拼盘痕迹
- 是否主文读起来像连续指南，而不是资料堆叠

### 11.4 读者适配

- 程序背景稍弱的读者会不会在前几章就被术语绊住
- 正文首次出现的术语是否有即时解释
- 附录 F 是否真的把难术语讲透

### 11.5 推荐结构

- 是否继续坚持分角色推荐 + baseline 组合
- 是否错误回退成总榜逻辑
- 是否把 discovery、installer、governance、optimization 混成一个层

### 11.6 证据与判断

- 关键 judgment 是否 evidence-backed
- 主文的结论能否在附录 E 找到回指
- 有没有把 working notes 假装成 final judgment

## 12. 验收标准

只有当下面这些条件同时成立，才算这次 `final_v1` 生产达到预期。

1. 普通读者不需要知道 `v0` 或 research 执行历史，也能独立读懂。
2. 四个 topic 都有稳定落点，而不是只突出其中一个。
3. 主文可连续阅读，不像归档材料。
4. supporting docs 的边界清楚，不互相打架。
5. 关键术语第一次出现时就能被读者基本理解。
6. 术语附录足够深入，能当回查手册使用。
7. 推荐结构保持“分角色推荐 + baseline 组合 + 持续优化闭环”。
8. 关键判断都有证据回指。

## 13. 默认项与不再讨论项

除非后续明确推翻，否则下面这些都视为默认项。

- `final_v1` 用中文为主
- 关键术语首次出现时中英文双写
- 术语采用“正文即时解释 + 附录系统解释”的双层策略
- `final_v1` 是完整 final，不是 patch
- file map 默认是 `1 主文 + 5 功能附录 + 1 术语附录`
- 主推荐语法不是总榜，而是分角色推荐 + baseline 组合
- 读者范围比纯程序员更宽
- `04` 是整套 final 的一层，不是唯一中心

## 14. 给后续 agent 的直接指令

如果你是接手这份 spec 的 agent，请直接按下面原则执行：

1. 不要重新争论 `v1` 是否覆盖四个 topic。
2. 不要把 `04` 改写成唯一主轴。
3. 不要把通用 generator 当作本次 production 的最终决策文档。
4. 不要把 `final_v0` 当结构限制，只把它当供稿源。
5. 优先保证主文可读，再保证附录完整。
6. 术语先在正文讲明，再在附录讲透。
7. reviewer 若指出“术语仍偏硬”或“主文仍像研究报告”，优先修这两类问题。

这份 spec 的目的不是展示研究过程，而是让接手者和 reviewer 在进入写作或审核前，已经知道本次 `final_v1` 到底该怎样做，哪些事情已经决定，哪些写法不能再回头。
