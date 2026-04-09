# Comprehension-Performance Gap in GenAI-Assisted Brownfield Programming: A Replication and Extension (Qiao et al., arXiv:2511.02922)

- source_url: https://arxiv.org/abs/2511.02922
- source_type: academic
- accessed_at: 2026-04-09T09:43:27+08:00
- related_topic: 01-scaffold
- trust_level: academic
- why_it_matters: Directly measures a central risk to eng’s “Skill as cognitive scaffolding” narrative: GenAI assistance can improve *task performance* without improving *codebase comprehension*. This is a strong negative/limit evidence item that forces honest boundary-setting (learning vs performance).
- claims_supported:
  - In a within-subjects brownfield programming experiment (Copilot vs no Copilot), Copilot significantly reduced task time and increased the number of test cases passed.
  - Comprehension scores did not differ across conditions, yielding a comprehension–performance gap (higher test passing does not imply higher understanding).
  - The study failed to find a correlation between comprehension and task performance in their setup.
- date_scope: 2025-11 (arXiv v1: 4 Nov 2025)
- related_tools: GitHub Copilot; brownfield programming; comprehension assessment; productivity metrics; tests-as-harness

## 关键事实

- 研究对象：brownfield programming（维护与增强 legacy code base 的任务），并显式评估 code comprehension。
- 研究设计：within-subjects experimental study，18 名 CS graduate students，分别在“无 Copilot/有 Copilot”条件下完成 feature implementation tasks。
- 主要结果（abstract 级别即可支撑的硬结论）：
  - Copilot 显著降低任务耗时，并显著提高通过的测试用例数（performance 增益）。
  - comprehension scores 在两种条件下无显著差异（comprehension 不随 performance 增长）。
  - 未发现 comprehension 与 task performance 的相关性。

## 与本研究的关系

- 对 01-scaffold（认知脚手架与逆向学习）：
  - 这是一个必须并列呈现的“反例/局限”证据：**即便工具让人更快、更能通过测试，也不必然带来更好的理解**。
  - 因此把 Skill/assistant 称为“脚手架”时必须加条件：脚手架需要显式要求解释、对比、审查与验证（Constructive/Interactive 参与），否则更可能只提升表现而不提升理解。
- 对 03-devlife（Evals/稳态）：
  - “通过更多测试”也不是“理解更好”的充分条件；评估体系需要区分 output correctness 与 human comprehension。

## 可直接引用的术语 / 概念

- comprehension–performance gap
- brownfield programming
- within-subjects experiment
- tests passed (as a performance proxy)

## captured_excerpt

From the abstract (PDF text extraction):

> "Copilot significantly reduced task time and increased the number of test cases passed. However, comprehension scores did not differ across conditions..."

## 风险与局限

- 样本量较小（n=18）且为 CS graduate students；外推到专业工程师与不同规模代码库需谨慎。
- “comprehension test”的构造方式与有效性是关键；需要结合正文方法部分进一步核验其测量质量（当前条目以 abstract 可支撑的结论为主）。

