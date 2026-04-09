# From Novice to Expert: Analysis of Token Level Effects in a Longitudinal Eye Tracking Study (Al Madi et al., ICPC 2021)

- source_url: https://doi.org/10.1109/ICPC52881.2021.00025
- source_type: academic
- accessed_at: 2026-04-09T09:33:56+08:00
- related_topic: 02-tier
- trust_level: academic
- why_it_matters: Gives software-engineering-specific, *measurable* evidence that program-reading behavior differs between novices and experienced developers, and that novices gradually acquire certain token-level effects over time. It also demonstrates a feasibility path for “skill-adaptive IDEs” by classifying novice vs expert from eye movement features (≈72% accuracy).
- claims_supported:
  - Token frequency and token length effects appear in source-code reading; novices gradually acquire the frequency effect over a Java course (longitudinal evidence).
  - Eye-movement metrics over code tokens can be used to estimate programming proficiency (Random Forest classification of novice vs experienced; reported mean accuracy ≈72.3%).
  - Eye-tracking-derived features (e.g., first fixation duration, skipping probability, total time) are informative for distinguishing skill levels in program comprehension.
- date_scope: 2021 (ICPC 2021)
- related_tools: program comprehension; eye tracking; proficiency estimation; adaptive IDE; comprehension rubrics

## 关键事实

- 数据与设计：
  - 使用一个既有 longitudinal eye-tracking dataset：novices 在一门 Java 课程期间被记录多次（文中提到 6 次模块记录），experts 通常只记录一次（招募难度）。
  - 分析对象是 *token-level* 的眼动指标，并研究 token frequency / token length 对 fixation duration 等指标的影响。
- 主要结果（与 02-tier 最相关）：
  - 支持存在 token frequency effect 与 token length effect；并显示 novices 在课程过程中逐步获得 frequency effect（“从新手到更熟练阅读者”的过程性信号）。
  - 使用 Random Forest 基于 token-level eye movement 特征做 novice vs experienced 分类，报告 mean accuracy ≈72.3%，并给出 precision/recall/F1（≈77%/75.4%/76.2%）。
  - 特征重要性排序中，first fixation duration、skipping probability、total time、single fixation duration、gaze duration 等对分类贡献较大。
- 论文还提出面向实践的愿景：IDE 可根据检测到的 skill level 做渐进式功能引导（与 eng 的 progressive disclosure 叙事可相互呼应，但证据属于“可行性方向”）。

## 与本研究的关系

- 对 02-tier（能力训练矩阵）：
  - 提供“comprehension 能力可测”的证据线：Tier 2 的核心能力之一是 program comprehension，而眼动特征可作为可观察 proxy（至少在研究与工具原型层面）。
  - 支撑“训练要看过程性指标，而不只是产出”：可把阅读路径/注意力分配作为训练与评估维度之一（与 02-tier 的 system view、chunking、top-down inference 对齐）。
- 对 01-scaffold（脚手架）与 03-devlife（工具生态）：
  - 强化一个机制约束：要想“脚手架式”帮助学习，工具需要让使用者保持可观察的高质量参与方式；眼动/阅读行为可为“参与方式”提供测量入口（仍需谨慎外推）。

## 可直接引用的术语 / 概念

- program comprehension
- fixation / fixation duration
- frequency effect / length effect
- token-level eye movement analysis
- Random Forest classification (novice vs experienced)

## captured_excerpt

From the abstract (PDF text extraction):

> "The results show evidence of the frequency and length effects... and... classify novices from experts with 72% accuracy."

## 风险与局限

- experts 与 novices 的记录频次不对称（novices 多次、experts 一次），存在设计层面的 validity threat；作者也在 threats to validity 中讨论了这一点。
- 分类准确率≈72% 仅能作为“可行性 proof-of-concept”，距离实时 IDE 应用还有显著工程与外推问题。
- 这不是 AI Skill 介入研究；作为 eng 的证据时应表述为“SE 任务中 skill 差异存在可测 proxy”，而不是“证明 Skill 训练一定有效”。

