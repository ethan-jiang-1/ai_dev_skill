# GazePrinter: Visualizing Expert Gaze to Guide Novices in a New Codebase (Kuang et al., arXiv:2603.19855)

- source_url: https://arxiv.org/abs/2603.19855
- source_type: academic
- accessed_at: 2026-04-09T09:33:56+08:00
- related_topic: 02-tier
- trust_level: academic
- why_it_matters: Provides SE-specific empirical evidence that *visualizing expert gaze patterns* can change novices’ comprehension behavior in a new codebase. Importantly, it reports a nuanced result: behavior/path changes significantly, while time/performance/cognitive load improvements are weaker or not statistically significant. This is a good “scaffolding mechanism” evidence with built-in negative/limit findings.
- claims_supported:
  - Expert-gaze visualization can significantly affect novices’ navigation/path through a codebase (file reading order becomes closer to experts; DTW distance difference significant, with a meaningful effect size reported).
  - Efficiency/effectiveness/cognitive load improvements are not statistically significant in the reported controlled experiment (weak indications only), highlighting limits and measurement nuance.
  - Gaze can be used as an assistance modality in developer tools, aligning with “joint attention” and attention-orienting support ideas.
- date_scope: 2026-03 (arXiv v1: 20 Mar 2026; manuscript)
- related_tools: program comprehension tools; onboarding new codebase; gaze visualization; controlled experiments; cognitive load measurement (NASA TLX)

## 关键事实

- 研究对象：program comprehension（在新 codebase 中完成理解任务）。
- 系统：GazePrinter，通过可视化来自 expert 的 gaze patterns，为 novices 提供 gaze-orienting cues（注意力引导提示）。
- 研究设计：mixed-methods（survey + controlled experiment + interviews），样本为 40 novices。
- 主要量化结果（作者报告）：
  - RQ1（效率/效果/负荷）：以 response time、task performance、NASA TLX 测 cognitive load；整体上 experiment vs control 在这些指标上未观察到统计显著差异（p>0.05），但在描述统计与置信区间上存在“弱证据”提示 experiment 组可能更快、负荷更低。
  - RQ2（阅读策略/路径）：file reading order 与 experts 的距离（DTW distance）在 experiment vs control 之间存在统计显著差异（p≈0.021），并报告 Cohen’s d≈0.773（中到大效应），表明 experiment 组的阅读路径更接近 experts。
  - module reading order 的相似度也显示 experiment 组更接近 experts，并且任务间 transfer 更强的迹象。

## 与本研究的关系

- 对 02-tier（难度分层与训练矩阵）：
  - 强化“Tier 2 的可训练目标”可以落到 *阅读路径与注意力分配*：专家不是只更快，而是走不同路径；工具可以用“引导注意力与路径”做脚手架。
  - 也提供一个诚实边界：即便改变了行为策略（路径更像专家），在短期任务层面的 time/performance/NASA-TLX 未必显著提升，提示“学习/能力变化”与“短期效率指标”可能分离。
- 对 01-scaffold（脚手架 vs 卸载）：
  - 这是更接近“脚手架”而非“直接给答案”的介入：它试图塑形过程（attention/path），而不是替代推理。
- 对 04-path（组织采纳/培训）：
  - 可作为“新 codebase onboarding”训练/工具化方向的证据来源之一，但需要结合成本与隐私约束评估可行性。

## 可直接引用的术语 / 概念

- gaze-orienting assistance
- joint attention
- file reading order / module reading order
- Dynamic Time Warping (DTW) distance
- NASA TLX (cognitive load)
- mixed-methods study

## captured_excerpt

From the abstract (PDF text extraction):

> "visualization of expert gaze can have a significant effect on novice programmers’ behavior... [and] indications of reduced time and cognitive load"

## 风险与局限

- 研究结论是“路径行为显著变化 + 时间/得分/负荷未显著变化（弱迹象）”，不能被误读为“显著提升效率/正确率/负荷”。
- gaze 采集与可视化在真实企业环境下的成本、隐私与可用性挑战很大；外推到不同语言/不同 codebase/不同任务需谨慎。

