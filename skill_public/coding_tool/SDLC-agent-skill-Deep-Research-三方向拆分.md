# SDLC Agent Skill Deep Research 三方向拆分建议

## 判断

原始上下文确实有一点“单次研究装太多目标”的问题。

它实际上同时在回答三类不同问题：

- 去哪里找：哪些 GitHub 仓库、marketplace、宿主生态、安装入口里可能有高价值 skill
- 找到的东西是什么：这些包到底属于 skill、workflow、command、agent、hook 还是别的结构化能力单元
- 拿回来怎么用：哪些东西真的可安装、可迁移、可复用，值得优先纳入自己的 skill 库

这三个问题都重要，但不适合塞进一次 Deep Research 里一起推进。  
因为这样会导致：

- 搜索面过大，来源扫描和样本深挖互相抢注意力
- 评估过早开始，样本池还没稳定就进入细节比较
- 输出形态混杂，最后很难合并成可执行结论
- agent 容易在“找新东西”和“分析旧东西”之间来回摆动

所以建议不要按“想研究什么都塞进去”的方式写，而是按研究流水线拆成三个方向：

- Direction 1：上游供给面
- Direction 2：中游能力面
- Direction 3：下游落地面

这样拆的好处是，三个方向既能并行，又能在最后自然汇总。

## 推荐切法

### Direction 1：来源与供给地图

主问题：

**公开生态里，哪些地方最可能持续产出偏软件开发的 agent skill / workflow / plugin / command / subagent？**

这个方向只负责“找得到东西的地方”，不要在这里深挖每个 skill 的内部设计。

重点看：

- GitHub 上的框架、工具集、仓库组织
- 各宿主生态的 marketplace、插件页、skills 入口、examples
- coding agent 官方或半官方生态
- 开发者社区里被反复提及的 skill 包来源
- 可安装入口，而不只是展示页

优先来源可以包括：

- Claude Code 相关 skill 仓库与 marketplace
- Codex skill / plugin / agent 相关生态
- Cursor / Windsurf / OpenCode 等宿主的插件或工作流入口
- GitHub topics、awesome lists、组织仓库、模板仓库
- 公开教程、文档、讨论区中反复出现的 skill 入口

输出物：

- 一张“来源地图”
- 一个候选池清单
- 每个来源下有哪些代表性项目
- 每个来源的密度、活跃度、偏 SDLC 程度

这一方向的评价重点：

- 候选密度
- 公开可见性
- 安装入口是否明确
- 是否偏向软件开发
- 是否持续更新

明确不要做：

- 不要深入分析某个 skill 的内部工作流
- 不要在这一步做复杂的优先级排序
- 不要试图总结全部 SDLC 方法论

### Direction 2：能力单元与 SDLC 覆盖

主问题：

**在已经找到的候选项目中，哪些 skill-like 单元真正值得研究，它们分别在 SDLC 哪些环节创造了约束、编排或质量收益？**

这个方向只负责“这些东西本质上在解决什么问题”，不要把注意力过多放在安装细节上。

重点看：

- 它把什么开发动作做成了结构化单元
- 它解决了 agent 的哪类典型失控问题
- 它覆盖 SDLC 的哪个阶段
- 它是 prompt 包装，还是流程约束，还是验证闭环
- 它的抽象是否能迁移到其他宿主

可按两层来拆：

- SDLC 阶段：Define / Design / Plan / Build / Test / Debug / Review / Ship / Operate
- 问题类型：跑偏、漏验证、上下文丢失、任务过粗、缺少评审、缺少回归、缺少交付闭环

输出物：

- 一张“能力地图”
- 每个候选项目的 skill 单元拆解
- 哪些单元是高迁移价值的
- 哪些设计模式值得复刻

这一方向的评价重点：

- 结构化程度
- 可验证性
- 复用性
- 规则密度
- 失败模式覆盖
- 宿主无关抽象能力

明确不要做：

- 不要在这里扩张来源面
- 不要把研究重点放在 stars 或热度
- 不要把“概念不错”误判成“skill 可直接复用”

### Direction 3：获取、安装、迁移与优先级

主问题：

**哪些 skill 或 skill 包是真正能拿下来使用的，安装成本多高，迁移到自己环境里值不值得？**

这个方向最贴近你的核心目标：不是只知道市场上有什么，而是要形成“可拿、可装、可改、可复用”的 shortlist。

重点看：

- 安装路径是否真实存在
- 依赖宿主是否过重
- 配置和前置条件是否复杂
- 是否可拆出独立 skill 单元
- 是否支持多宿主迁移
- 用户反馈是在夸想法还是夸可用性

这个方向的核心不是“全”，而是“能落地”。

输出物：

- 一张“可落地优先级清单”
- Top N 值得拿下来的 skill / repo
- 每个对象的安装成本、迁移成本、维护成本
- 建议采用方式：直接使用 / 局部摘取 / 重写迁移 / 仅作参考

这一方向的评价重点：

- 可安装性
- 可迁移性
- 真实使用证据
- 学习成本
- 维护负担
- 近期活跃度

明确不要做：

- 不要继续扩张候选池
- 不要把“概念完整”当成“值得接入”
- 不要忽略宿主绑定和工具链依赖

## 为什么这三方向比按来源硬切更好

如果只按来源切，比如 GitHub、marketplace、社区讨论各一块，最后通常会遇到两个问题：

- 每个方向都在重复做“找到项目后怎么评价”的工作
- 合并时只能得到来源清单，得不到真正的可用 shortlist

按“上游供给面 / 中游能力面 / 下游落地面”来切，三条线的职责更清楚：

- Direction 1 负责解决广度
- Direction 2 负责解决深度
- Direction 3 负责解决实用性

这正好对应你说的“既要增加丰富度，也要最终能拿 skill 来用”。

## 合并时的统一字段

为了后面容易合并，三个方向最好共用一套最小字段。  
每个候选对象至少记录：

- `name`
- `repo_or_package_url`
- `source_channel`
- `host_ecosystem`
- `artifact_type`
- `sdlc_stage`
- `problem_solved`
- `reusable_unit`
- `install_entry`
- `dependency_weight`
- `portability`
- `evidence_of_real_use`
- `community_signal`
- `recommended_action`

建议含义：

- `source_channel`：GitHub、marketplace、官方文档、社区帖子、教程等
- `host_ecosystem`：Claude Code、Codex、Cursor、Windsurf、OpenCode 等
- `artifact_type`：skill、workflow、plugin、command、subagent、hook、template 等
- `reusable_unit`：真正值得摘出来的 skill-like 单元
- `recommended_action`：直接采用 / 拆出改造 / 观察 / 放弃

这样三个方向最后就能统一回收到一张总表，而不是三份难以对齐的笔记。

## 给原文的迁移建议

原文里的内容可以这样迁移：

- `研究目标`：拆成三个方向各自的主问题
- `研究对象`：保留为通用纳入/排除标准
- `重点关注`：主要放进 Direction 2
- `SDLC 维度`：主要放进 Direction 2
- `评估视角`：Direction 2 和 Direction 3 共用
- `用户评价`：主要放进 Direction 3
- `宿主生态`：Direction 1 和 Direction 3 共用

也就是说，原文不需要推翻，问题只是它现在把“入口扫描、能力分析、落地筛选”放在了同一层。

## 一句话版本

可以把这项 Deep Research 重写成三条并行线：

- 先找哪里有 skill
- 再分析这些 skill 本质上在解决什么 SDLC 问题
- 最后筛出哪些 skill 值得拿下来直接使用或迁移

这是比“把所有来源和所有评估都混在一个研究里”更稳的拆法。
