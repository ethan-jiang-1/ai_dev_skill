# Towards a Theory of Software Development Expertise (Baltes & Diehl, ESEC/FSE 2018; arXiv:1807.06087)

- source_url: https://arxiv.org/abs/1807.06087
- source_type: academic
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 02-tier
- trust_level: academic
- why_it_matters: Provides a software-engineering-specific expertise framing (grounded in a mixed-methods survey of 335 developers + expertise literature). This strengthens eng’s tier model by anchoring it in what “expertise” means in software, and cautions against equating years-of-experience with competence.
- claims_supported:
  - Software development expertise involves multiple tasks and factors; objective measurement is hard.
  - Developer self-assessed expertise is context-dependent; experience is not necessarily related to expertise.
  - Expertise formation can be fostered or hindered; performance may decline over time (relevant to training/maintenance).
- date_scope: 2018-11 (ESEC/FSE ’18; arXiv v4 dated 2018-11-04)
- related_tools: skill tiers; competency models; hiring/training; measurement

## 关键事实

- 论文指出软件开发包含多类任务（实现新功能、分析需求、修 bug 等），成为这些任务的专家需要技能/知识/经验的组合，但缺少“全面理论”。
- 论文提出一个初版概念理论，基于对 335 名开发者的 mixed-methods survey 与专家研究文献。
- 摘要给出对 eng 很关键的结论线索：
  - 开发者的 expertise 自我评估是 context-dependent
  - experience 不一定与 expertise 相关
  - performance 可能随时间下降

## 与本研究的关系

- 对 02-tier：
  - 支撑“难度分层要看能力结构而不是资历”：高复杂度 Skill 的有效使用与改造，不能简单按年限判断，需要设计可观察的能力指标与训练闭环。
- 对 04-path：
  - 团队采纳 Skill 体系时，应避免把“最资深的人”当作默认推广对象；更应基于任务/上下文匹配选择试点人群，并用可测指标评估。

## 可直接引用的术语 / 概念

- software development expertise (SDExp)
- context-dependent self-assessment
- experience ≠ expertise
- performance decline over time

## captured_excerpt

From the abstract (selected):

> "...developers’ expertise self-assessments are context-dependent and... experience is not necessarily related to expertise."

## 风险与局限

- 论文给出的是概念理论与 survey 证据，仍需要与更细粒度实验/任务测量（例如调试、代码审查、架构设计）结合，才能转化成可执行的 training matrix 指标体系。

