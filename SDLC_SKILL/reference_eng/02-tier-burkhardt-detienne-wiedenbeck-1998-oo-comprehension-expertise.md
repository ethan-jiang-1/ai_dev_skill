# The Effect of Object-Oriented Programming Expertise in Several Dimensions of Comprehension Strategies (Burkhardt, Detienne, Wiedenbeck, 1998)

- source_url: https://arxiv.org/abs/cs/0702002
- source_type: academic
- accessed_at: 2026-04-09T05:26:53+08:00
- related_topic: 02-tier
- trust_level: academic
- why_it_matters: An empirical expert-vs-novice program comprehension study in object-oriented code. It provides concrete dimensions (scope, top-down vs bottom-up direction, guidance) that map cleanly onto “tiers” and “training matrix” design, especially for the “intermediate” tier where comprehension and navigation dominate.
- claims_supported:
  - OO expertise correlates with more top-down, inference-driven behaviors and “multiple guidance” during comprehension.
  - Novices show more execution-based guidance and less top-down processing, and exploit OO static relationships (inheritance/composition) poorly.
  - Experts tend to consult more files even when the overall comprehension scope is broadly similar, suggesting broader context integration as a skill marker.
- date_scope: 1998 (IWPC’98; C++ program comprehension)
- related_tools: program comprehension; OO navigation; inheritance/composition; calling hierarchy; think-aloud protocols

## 关键事实

- 研究问题：比较 OO 专家与新手在程序理解（program comprehension）策略上的差异。
- 三个分析维度（作者定义）：
  - scope of comprehension（读了多少、读了哪些信息）
  - top-down vs bottom-up direction（知识驱动推断 vs 数据驱动）
  - guidance（理解活动由哪些关系/表征引导：execution、includes、inheritance、composition、methods、variables 等）
- 方法与材料（摘要与方法部分）：
  - IWPC’98 论文；收集 verbal protocols，并记录文件访问与文件间转换。
  - 材料是一段 OO C++ 程序：约 550 行、10 个 classes、21 个文件；受试者 35 分钟阅读以准备后续任务（reuse 或 documentation 取向）。
- 关键结果（摘要）：
  - scope：总体相似，但 experts 倾向于 consult more files。
  - direction/guidance：experts 有强 evidence 的 top-down, inference-driven behaviors，并使用 multiple guidance；novices 更偏 execution-based guidance，且较少 top-down 过程。
  - OO 静态关系（inheritance/composition）：
    - 不是 dominant guidance，但在 expert comprehension 中“played a substantial role”；
    - novices 对这些更 OO-特有的静态关系“exploited poorly”。

## 与本研究的关系

- 对 02-tier（难度分层与训练矩阵）：
  - 给出“能力差异可观察维度”，可用来把“中等层 skill 的训练目标”落到可测行为：能否进行 inference-driven top-down 理解、能否用多种关系（调用、继承、组合、数据）交叉引导理解，而不是只靠执行路径或局部试错。
  - 支撑一个关键判断：工程实践里，技能跃迁常体现为“更宽上下文的整合能力”和“更高层次抽象的引导能力”，而不仅是写代码速度。
- 对 01-scaffold（认知脚手架）有间接支撑：
  - 如果 Skill 通过强制问题表述、要求推断与反证、引导多视角（调用/数据/继承）来组织理解，更可能促进从 novice 向 expert 的策略迁移；如果 Skill 只给执行步骤或结果，可能强化 execution-based 依赖。

## 可直接引用的术语 / 概念

- program comprehension
- top-down vs bottom-up processes
- inference-driven behaviors
- multiple guidance
- execution-based guidance
- inheritance / composition relationships
- verbal protocols

## captured_excerpt

From the abstract (PDF text extraction):

> "We found strong evidence of top-down, inference-driven behaviors, as well as multiple guidance in expert comprehension."  
> "We also found evidence of execution-based guidance and less use of top-down processes in novice comprehension."

## 风险与局限

- 研究时间较早（1998），语言与工具链生态与当前不同；材料规模（约 550 行）仍比真实工业代码库小很多。
- 结果主要描述 comprehension 阶段的策略差异，未直接给出“训练干预如何改变策略”的因果证据；用于训练矩阵时应把它作为“能力维度定义/诊断依据”，而不是直接作为“某训练方法有效”的证明。

