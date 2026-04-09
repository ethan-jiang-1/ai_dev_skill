# Skill 难度分层与能力训练矩阵

## 第一轮摘要（保留，不修改）

## 这份片段在讲什么

这份上下文聚焦一个核心问题：

**不同 skill 的复杂度差异很大，工程师在不同层级上需要的能力不同，而长期使用这些 skill 又会反向训练出不同层级的工程能力。**

## 从原始研究提炼出的核心结论

### 1. Skill 至少可以分成三层

原始研究把 skill 分成三类：

- 特别简单：拿来即用型
- 中等简单：日常稳定复用型
- 复杂：方法学、团队治理、自定义流程型

这不是按文件长度分，  
而是按使用者所需心智模型分。

### 2. 第一层 skill 解决“敢不敢用”的问题

这类 skill 的特点是：

- 目标很局部
- 上手门槛低
- 能快速见效

典型例子包括：

- Git 提交信息生成
- 代码格式化与简单转换
- 局部报错修复

它训练的主要不是架构能力，  
而是最基础的标准化意识和协作信心。

### 3. 第二层 skill 是能力提升的主战场

原始研究认为，这一层最关键。

它通常要求工程师开始具备：

- 上下文管理能力
- 判断输入哪些文件和约束的能力
- 对输出质量做初步审查的能力

典型对象包括：

- TDD 测试生成器
- 代码审查 skill
- 技术栈最佳实践规则

这一层对工程师最重要的训练是：

- 代码审查能力
- 架构约束意识
- 上下文依赖管理能力

### 4. 第三层 skill 更接近方法学设计与组织能力

原始研究把高复杂度 skill 看成一种认知跃迁：

- 工程师不再只是 skill 使用者
- 而是开始抽象流程、定义规则、编写组织级方法学

这类 skill 通常需要：

- 系统架构设计能力
- 流程抽象能力
- Tool calling / MCP 理解
- 容错和边界条件设计能力

长期训练出来的则是：

- 领域建模能力
- 方法学设计能力
- 组织知识显性化能力

### 5. 不同层级对应不同采用策略

原始研究给出的隐含结论很实用：

- 第一层：更适合直接用
- 第二层：更适合改着用
- 第三层：更适合作为灵感，自建或深度重写

这说明“开源 skill 拿来怎么用”不能一刀切。

## 这一片段里最值得继续研究的对象

- 特别简单 / 中等简单 / 复杂 skill 的分类方法
- 人类能力要求与 skill 难度的映射
- adoption path：直接用 / 改着用 / 自建

## 适合继续 Deep Research 的问题

- 如何判断一个 skill 属于哪一层
- 哪些能力是使用 skill 的前置条件，哪些能力会被 skill 反向训练出来
- 为什么中等简单这一层最适合工程师成长
- 开源 skill 在不同复杂度层上应该怎么采纳

## 这一片段的用途

如果下一轮 Deep Research 想回答下面这些问题，这份片段最适合直接当上下文：

- “怎么给软件开发 skill 做难度分层？”
- “不同 skill 层级分别要求工程师具备什么能力？”
- “工程师应该在哪一层开始从直接使用走向改造和自建？”

## 二轮新增证据

- 专家能力阶段框架（Novice→Expert）可用 Dreyfus 五阶段模型描述：新手更依赖规则与去情境的指令；随经验增长，决策越来越基于情境辨识与优先级选择。（ref: `../reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`）
- deliberate practice 理论指出：专家能力来自长期、目标明确、带反馈的练习闭环，而不是“做得多就会”。（ref: `../reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`）
- desirable difficulties 强调：短期表现更好不代表学得更好；“恰当难度与延迟收益”是训练设计的核心矛盾。（ref: `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`）
- 编程教育中存在明显的 deliberate practice 落地障碍（任务、反馈、认知与动机误区等），需要软脚手架与反馈机制帮助“练得起来”。（ref: `../reference_eng/02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md`）
- 软件开发 expertise 理论提醒：经验年限与专业度并不等价；能力评估与自我评估可能强依赖情境且存在偏差。（ref: `../reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`）
- 调试（debugging）任务中的专家/新手差异可通过过程性指标刻画：chunking 能力、system view、breadth-first vs depth-first 策略等。（ref: `../reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`）
- 程序理解（OO comprehension）中专家更偏 top-down、inference-driven，并使用 multiple guidance；新手更偏 execution-based guidance，且对继承/组合等 OO 关系利用差。（ref: `../reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`）
- Shu-Ha-Ri（实践框架）可作为阶段跃迁的可沟通语言，但证据强度应视为 practitioner/类比。（ref: `../reference_eng/02-tier-shu-ha-ri-agile-leadership-dreyfus-model.md`）

## 二轮新增机制理解

### 1) 分层应以“心智动作/治理责任”定义，而不是以 Skill 文本复杂度定义

- 从 Vessey（debugging）与 Burkhardt（comprehension）的实证看，专家与新手差异落在“系统视角 + chunking + top-down 推断 + 多重引导关系”，而不是“更会敲代码”。因此，Skill 分层最稳的口径是：使用者必须具备哪些心智动作才能安全使用/改造该 Skill。（ref: `../reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`, `../reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`）

### 2) “能力训练矩阵”要把学习收益与效率收益拆开，避免被自动化吞噬

- desirable difficulties 与 deliberate practice 共同指向一个约束：训练必须保留必要摩擦与反馈闭环，否则只能提升短期表现，难以内化。（ref: `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`, `../reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`）
- 因此，训练矩阵的单位不应是“用了哪些 Skill”，而应是：
  - 练习任务类型（comprehension/debugging/review/spec/test）
  - 目标能力维度（system view、chunking、推断、证据链、约束协作）
  - 反馈机制（评审、测试、回归、rubric、对照样例）
  - 难度梯度（从规则驱动到情境判断，呼应 Dreyfus 分阶段）
  - （ref: `../reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`）

### 3) “中等层（Tier 2）”为何是成长主战场：它对应最可训练、也最容易被卸载掉的能力

- Scott/Ghinea 指出编程实践的主要困难在于练习与反馈的组织，而非“没有更多理论”。Tier 2（上下文管理、审查、调试）恰好可以通过 Skill 把反馈与步骤固化出来，使练习可持续。（ref: `../reference_eng/02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md`）
- 反面风险是：如果 Tier 2 技能被设计成“自动产出”，就会绕开这些能力训练目标，形成“效率提升但能力不涨”的错配（需要在最终报告中明确此风险为推论）。（ref: `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`）

## 二轮新增趋势与难点

- 趋势：组织会更倾向用“工具化/资产化”方式推动能力一致性，但若缺少明确的反馈与评估闭环，容易把训练退化为“工具使用熟练度”。（ref: `../reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`）
- 难点：deliberate practice 在编程领域的障碍真实存在（反馈成本高、任务难分解、学习者误区等），所以“训练矩阵”需要把反馈机制内建到 Skill/流程里，而不是仅列能力名词。（ref: `../reference_eng/02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md`）
- 难点：如果 AI 自动化让任务过于容易，可能削弱 desirable difficulties；需要引入“摩擦预算”概念，明确哪些步骤必须保留给人完成（解释、审查、测试、证据链）。（ref: `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`）

## 当前判断（二轮综合后）

### 1) 更新后的三层口径（建议）

- Tier 1（adopt）：以规则驱动的调用与基本审查为主，目标是建立基本规范与协作信心。
- Tier 2（adapt）：以理解/约束协作/审查/调试为主，目标是形成 system view、chunking 与 top-down 推断能力，并建立可反馈的练习闭环。（ref: `../reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`, `../reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`）
- Tier 3（create/govern）：把经验写成可治理的规范与资产，并能用 eval/回归维护其稳态（该部分需要与 03-devlife/04-path 交叉对齐）。

### 2) 六个固定问题回答（二轮）

1. 这个主题当前的硬事实是什么
   - SE 任务中存在可观察的 expert-novice 策略差异（debugging 与 comprehension），可作为“分层的可测靶点”。（ref: `../reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`, `../reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`）
   - 专业度不等价于经验年限，且评估强依赖情境。（ref: `../reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`）
2. 背后的根本机制是什么
   - 阶段跃迁可用 Dreyfus 描述为从规则驱动走向情境化优先级选择；训练机制需要 deliberate practice 与反馈闭环。（ref: `../reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`, `../reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`）
   - 学习收益与短期表现可分离（desirable difficulties），因此需要刻意设计难度梯度。（ref: `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`）
3. 生态最近在往哪里演化
   - 更可能从“个体经验”走向“流程与资产化训练”，但这要求更强的评估与反馈工程化，否则会退化为工具熟练度训练。（ref: `../reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`）
4. 采用或落地的难点在哪里
   - 编程领域 deliberate practice 的落地障碍显著，训练矩阵必须把反馈机制工程化，否则不可持续。（ref: `../reference_eng/02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md`）
5. 社区争议和失败模式在哪里
   - 失败模式：把“效率提升”误认为“能力提升”，导致 Tier 2 被自动化吞噬，长期形成能力空心化（该条需要在报告中标注为推论，并建议用更多实证补强）。（ref: `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`）
6. 哪些对象最值得继续追踪
   - 能把 comprehension/debugging/review 能力维度转成可测 rubrics 的研究或企业实践。
   - 直接研究“AI/Skill 介入后能力跃迁”的纵向数据与对照实验。
