# Evolution of Programmers’ Trust in Generative AI Programming Assistants (Shah et al., arXiv:2509.13253)

- source_url: https://arxiv.org/abs/2509.13253
- source_type: academic
- accessed_at: 2026-04-09T09:43:27+08:00
- related_topic: 03-devlife
- trust_level: academic
- why_it_matters: Trust calibration is a core “developer experience” and safety mechanism: over-trust causes incorrect/vulnerable code, under-trust leaves productivity unrealized. This study measures trust changes after immediate (1h) and extended (10 days) Copilot use on a legacy code base (n=71), and surfaces concrete factors educators/managers can target (correctness evidence, context understanding, verification skills).
- claims_supported:
  - Student trust in Copilot increased on average over the study (immediate vs extended use).
  - After completing a project with Copilot, students reported Copilot still requires a competent programmer to complete some tasks manually.
  - Trust increases were attributed to perceived correctness and understanding how Copilot uses context; trust decreases were attributed to perceived errors, limitations, and missing features.
  - The paper provides pedagogical recommendations emphasizing comprehension/debugging/testing to verify outputs (verification skills as a counterweight to over-trust).
- date_scope: 2025-09 (arXiv v1: 16 Sep 2025; Koli Calling ’25 context)
- related_tools: GitHub Copilot; HCI trust models; SE education; brownfield/legacy codebase tasks; AI literacy

## 关键事实

- 研究动机：trust 影响“依赖程度”；过度信任带来错误/漏洞风险，过低信任则放弃潜在收益。
- 方法：
  - 通过 survey + 开放问答，研究 upper-division CS students 在 legacy code base 上使用 Copilot 的信任变化。
  - 比较 immediate use（约 1 小时）与 extended use（10 天）后的 trust。
- 主要发现（abstract 级别）：
  - 平均 trust 随时间上升。
  - 但在完成项目后，学生认为 Copilot 仍需要“competent programmer”去手动完成部分任务（工具不是替代品）。
  - trust 上升的原因包括看到正确性、理解 Copilot 如何利用上下文、以及学习一些 NLP 基础；信任下降多与错误、限制、缺失功能有关。
- 论文给出 4 条教学建议，其中一条直指 eng 的关键点：需要继续教 comprehension/debugging/testing 来验证输出。

## 与本研究的关系

- 对 03-devlife（工具生态与工作方式）：
  - 解释“为什么 combined/excessive use 不一定更好”：信任校准与验证成本会改变使用策略与心理负荷（与 field study 的交互强度结论互补）。
- 对 01-scaffold（脚手架 vs 卸载）：
  - trust 的演化与校准可视为“脚手架是否成功”的副产物指标之一：如果工具让人不再练习验证与解释，信任可能变成盲信（风险）。
- 对 04-path（采纳与治理）：
  - 团队试点应把“如何建立证据来信任/如何快速验证”作为 SOP，而不是只推工具使用。

## 可直接引用的术语 / 概念

- trust calibration (over-trust vs under-trust)
- immediate vs extended use (1 hour vs 10 days)
- legacy / brownfield code base tasks
- pedagogical recommendations (verification skills)

## captured_excerpt

From the abstract (PDF text extraction):

> "Student trust, on average, increased throughout the study... [but] Copilot requires a competent programmer to complete some tasks manually."

## 风险与局限

- 研究对象是 upper-division CS students（即将入职人群），不等价于资深工程师；外推到企业团队仍需更多组织研究与纵向数据。
- 该研究主要回答 trust 演化与原因，不直接给出“长期能力提升”的因果证据；在 eng 论证中应定位为“使用心理与治理要点”的实证。

