# Echoes of AI: Investigating the Downstream Effects of AI Assistants on Software Maintainability (Borg et al., 2026; arXiv:2507.00788)

- source_url: https://arxiv.org/abs/2507.00788
- source_type: academic
- accessed_at: 2026-04-09T08:42:58+08:00
- related_topic: 03-devlife
- trust_level: academic
- why_it_matters: A rare, large (n=151; 95% professional) preregistered controlled experiment that evaluates not only “does AI make you faster” but the downstream maintainability impact when *other developers* later evolve AI-co-developed code. This directly supports the eng report’s need to separate short-term productivity from longer-term engineering outcomes.
- claims_supported:
  - In Phase 1, AI assistance reduced completion time (median ~30.7% faster); habitual AI users showed an estimated ~55.9% speedup (observational within the experiment).
  - In Phase 2 (RCT), other developers evolving code written with vs without AI showed no significant differences in completion time or code quality; Bayesian analysis suggests any effect is at most small and uncertain.
  - Within the scope/tasks/measures, the study did not detect systematic maintainability advantages or disadvantages, but explicitly flags future risks (e.g., code bloat, cognitive debt from offloading).
- date_scope: arXiv v3 (2026-02-26); study conducted late 2024 (per paper)
- related_tools: GitHub Copilot; Cursor; AI assistants; CodeScene CodeHealth; SPACE framework

## 关键事实

- 研究问题：AI assistants（如 Copilot、Cursor）提升生产力已有研究，但“对可维护性（maintainability）是否有下游影响”缺少证据。本研究关注“别人是否更容易演进（evolve）AI 共建的代码”。
- 方法：two-phase、preregistered controlled experiment。
  - Phase 1：参与者在 Java web application 上加新 feature，分为 with AI assistance vs without。
  - Phase 2：新的参与者在不使用 AI 的情况下演进 Phase 1 的解法；这是 randomized controlled trial（RCT）。
- 样本：151 名参与者；论文摘要指出其中 95% 为 professional developers。
- 关键结果（摘要）：
  - Phase 2：在 completion time 或 code quality 上“no significant differences”。
  - Bayesian analysis：AI 带来的 speed/quality improvements “at most small and highly uncertain”。
  - Phase 1（观察性）：AI 使用带来 30.7% median completion time reduction；habitual AI users estimated 55.9% speedup。
- 研究还提到将使用 CodeScene CodeHealth、test coverage 等测量来补充 maintainability 评估（在正文引言/方法里说明）。

## 与本研究的关系

- 对 03-devlife（生命周期/工具生态）：
  - 把“工具引入后的稳态影响”从感受拉回到可测层：不仅看当下速度，还看后续演进成本与质量指标。
  - 支撑一个重要判断：即便短期生产力显著提升，下游 maintainability 的净影响可能很小或不确定，必须用 eval/回归与长期指标来判断，而不能只看当下产出。
- 对 01-scaffold（脚手架 vs 卸载）的交叉：
  - 论文明确提出“cognitive debt”作为未来风险方向，正好与 offloading/belief offloading 讨论口径衔接（但它本身不直接证明学习收益或损失）。

## 可直接引用的术语 / 概念

- preregistered controlled experiment
- randomized controlled trial (Phase 2)
- maintainability / evolvability
- downstream effects
- CodeHealth (CodeScene)
- SPACE framework
- cognitive debt (as a future risk direction)

## captured_excerpt

From the abstract (PDF text extraction):

> "a two-phase, preregistered controlled experiment involving 151 participants, 95% of whom were professional developers."  
> "Phase 2 revealed no significant differences ... completion time or code quality."  
> "using an AI assistant yielded a 30.7% median reduction in completion time ..."

## 风险与局限

- 结论边界来自任务、语言与度量：Java web app + 指定任务；maintainability 以“他人演进的容易程度”等 proxy 度量；对更大规模系统、不同语言/框架、以及 agentic coding 的外推需要谨慎。
- Phase 1 的生产力结果包含“habitual AI users”的观察性子分析，不等价严格因果结论。

