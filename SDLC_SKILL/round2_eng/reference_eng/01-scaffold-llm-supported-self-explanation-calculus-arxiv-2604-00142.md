# Practice Less, Explain More: LLM-Supported Self-Explanation in Calculus (arXiv:2604.00142, 2026)

- source_url: https://arxiv.org/abs/2604.00142
- source_type: academic
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 01-scaffold
- trust_level: academic
- why_it_matters: Provides a recent, LLM-specific learning experiment that distinguishes performance vs explanation quality under fixed-time conditions. This is directly relevant to eng claims about “skills that teach” by eliciting self-explanations, and serves as a time-stamped trend signal.
- claims_supported:
  - Under a fixed 60-minute practice session, LLM-supported open-ended self-explanation can improve explanation quality on certain transfer problems, even if multiple-choice accuracy gains are not significant.
  - Highlights a practical tradeoff: self-explanation consumes time (fewer practice problems), but can improve reasoning articulation.
  - Useful for eng’s claim-strength calibration: LLM scaffolding may improve explanation quality (constructive engagement) without guaranteed immediate test-score lift.
- date_scope: 2026-03 (arXiv v1)
- related_tools: LLM feedback; intelligent tutoring systems; self-explanation scaffolds

## 关键事实

- 研究设计：between-subjects 实验（N=92），比较三种条件：不做 self-explanation（control）、menu-based self-explanation、open-ended self-explanation + LLM 反馈。
- 主要结果（摘要中给出的结论）：
  - 在固定 60 分钟练习时间内，三组都有学习增益；post-test 性能没有显著组间差异。
  - 在 transfer 问题上，open-ended + LLM feedback 组在某类问题（NEI: Not Enough Information）上产出的“解释质量”显著更高（摘要报告了效应量与 p 值）。
  - 该效果出现时，open-ended 组完成的练习题数量更少（解释活动更耗时）。

## 与本研究的关系

- 对 01-scaffold：
  - 直接支撑“逼用户解释（constructive engagement）”可能带来学习收益，而且收益表现不一定是立刻的准确率提升，可能先体现在解释质量、迁移推理上。
- 对 03-devlife：
  - 说明“Evals”不应只看 correctness；如果目标包含训练工程师能力，需要把 explanation quality / transfer reasoning 纳入指标（或至少作为补充指标）。

## 可直接引用的术语 / 概念

- self-explanation
- constructive engagement (ICAP)
- transfer problems
- LLM-generated feedback
- Not Enough Information (NEI)

## captured_excerpt

From the abstract (selected):

> "...open-ended self-explanation with LLM-generated feedback... produced significantly higher-quality explanations... even though learners... completed substantially fewer practice problems..."

## 风险与局限

- 研究场景是数学（微积分）学习环境，不是软件工程；用于 eng 报告需要明确：这是“LLM 支持 self-explanation 的直接实证”，而“迁移到工程师 Skill 学习”仍需额外证据（跨域差异、任务结构、反馈周期不同）。

