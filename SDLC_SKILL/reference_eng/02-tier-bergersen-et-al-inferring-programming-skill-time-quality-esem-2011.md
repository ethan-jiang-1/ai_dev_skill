# Inferring Skill from Tests of Programming Performance: Combining Time and Quality (Bergersen et al., ESEM 2011)

- source_url: https://doi.org/10.1109/ESEM.2011.39
- source_type: academic
- accessed_at: 2026-04-09T09:33:56+08:00
- related_topic: 02-tier
- trust_level: academic
- why_it_matters: Provides a software-engineering-specific method for *measuring programming skill* using small representative tasks, explicitly combining *time + quality* into an ordinal performance score and aggregating across tasks. This is directly useful for making eng’s “tier” and “training matrix” measurable (and for controlling skill as a confounder in studies).
- claims_supported:
  - Skill measurement in software engineering is often ad hoc; validated testing should infer skill from multiple representative tasks rather than proxies like “years of experience”.
  - Time and quality can be combined into a single task-performance ordinal score, then aggregated across tasks as an approximation of programming skill.
  - The proposed aggregated measure correlates (positively) with seniority, lines of code written, and self-evaluated expertise (construct validity signal).
- date_scope: 2011 (ESEM 2011; IEEE)
- related_tools: skill measurement; controlled experiments; training metrics; tiering criteria; hiring/work-sample tests

## 关键事实

- 研究问题：在有一组小而代表性的编程任务时，如何把“做得快但质量低”与“做得慢但质量高”的 trade-off 变成可比的 skill 近似指标。
- 方法核心：
  - 明确把“time + quality”视为共同定义 skill 的性能表现，并提出一种把二者合并成单一 ordinal performance score 的方法。
  - 再把多个任务上的 performance score 聚合，得到对 programming skill 的 ordinal 近似。
- 经验性信号（作者报告的构念关联）：
  - 聚合后的 skill 近似指标与 seniority、LOC written、自评 expertise 等变量呈显著正相关（用于支持“这不是拍脑袋指标”）。
- 论文也强调研究设计层面动机：skill 差异会显著影响工具/过程评估结果，因此需要更可靠的 skill 测量来控制混淆。

## 与本研究的关系

- 对 02-tier（难度分层与能力训练矩阵）：
  - 支撑“分层必须可测”：Tier 不能只靠主观印象或年限；可用“代表性任务上的 time+quality”作为最低限度的可测 proxy。
  - 为“训练矩阵”提供度量语言：训练的目标不是“更快产出”，而是“在质量约束下更高效/更稳定”。
- 对 03-devlife / 04-path（评估与治理）：
  - 可作为企业/团队试点时“能力变化”评估的一种思路：用任务集做前测/后测（或对照），避免只看 acceptance rate 或产出数量。

## 可直接引用的术语 / 概念

- work sample tests（工作样本测试）
- theory-driven generalization / economy of artificiality（从小任务推到工作表现的理论外推）
- combine time and quality（把时间与质量合成性能指标）
- ordinal performance / ordinal approximation of skill

## captured_excerpt

From the paper abstract (PDF text extraction):

> "we show how time and quality... can be combined as task performance and subsequently be aggregated as an approximation of skill."

## 风险与局限

- 这是对 skill 的 *ordinal 近似*，不是“能力的完整测量”：不同任务类型（comprehension/debugging/review/architecture）可能需要不同测量设计。
- “代表性小任务 → 真实工作表现”的外推依赖任务设计质量与理论解释，不能把指标当作万能真值。
- 与 eng 的 Skill（AI skill 资产）并非同一概念：该文测的是编程 skill/表现，不直接回答“AI Skill 作为脚手架能否带来长期能力提升”的因果问题。

