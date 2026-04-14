# Productivity Assessment of Neural Code Completion (Ziegler et al., 2022; arXiv:2205.06537)

- source_url: https://arxiv.org/abs/2205.06537
- source_type: academic
- accessed_at: 2026-04-09T08:42:58+08:00
- related_topic: 04-path
- trust_level: academic
- why_it_matters: A GitHub-led case study that connects self-reported productivity (SPACE dimensions) to measurable telemetry. It demonstrates that “acceptance rate” is a strong driver of perceived productivity, and that more elaborate “persistence” metrics were less predictive. This is directly relevant to team adoption: what to measure, what to avoid overinterpreting, and how perception can diverge from code-level persistence.
- claims_supported:
  - Among Copilot users, acceptance rate (accepted_per_shown) correlates strongly with perceived productivity; persistence of completions in code over time was less predictive.
  - Copilot evaluation and governance requires multi-dimensional measurement; “productivity” cannot be measured directly, and naive proxies can mislead.
  - Telemetry-based funnels (shown→accepted→persistence) provide a concrete measurement vocabulary for pilot rollouts.
- date_scope: arXiv v1 2022-05-13; survey Feb–Mar 2022; telemetry window described in paper
- related_tools: GitHub Copilot; telemetry; SPACE framework; productivity measurement; acceptance/persistence rates

## 关键事实

- 研究定位（摘要）：
  - 研究动机：商业产品宣称提升生产力，但生产力难以直接测量；作者试图把用户对生产力的感知与可测使用数据关联起来。
  - 结论：驱动开发者生产力感知的是 “acceptance rate”，而不是 “completions 在代码里持续存在（persistence）”等更具体指标。
- 数据与方法（论文方法节）：
  - Survey：向 17,420 名 Copilot technical preview 用户发邮件；得到 2,047 份可与使用测量匹配的 responses。
  - 使用数据窗口：论文描述聚焦 survey 前约 4 周的 usage measurements（并说明大多数 survey 在某日期前完成）。
  - 采用 SPACE framework 的多个维度（Satisfaction/Performance/Communication/Efficiency 等）做自评问题集合，并与 telemetry 指标关联分析。
- 论文还定义了一组 measurement funnel：
  - shown rate、acceptance rate、persistence rate、fuzzy persistence 等（并讨论其解释困难与替代指标）。

## 与本研究的关系

- 对 04-path（团队采纳与治理）：
  - 这是一条非常关键的“度量现实主义”证据：团队推行 Copilot/Skill/agent 时，最容易拿来用的指标（acceptance rate）确实与 perceived productivity 强相关，但这并不等价于更高质量或更低风险，需要把它当作“感知与行为信号”，并与质量/安全/维护性指标配套。
  - 也解释了为什么“仅看代码留存/commit 指标”未必能解释主观收益（与后续纵向研究可形成互证链条）。

## 可直接引用的术语 / 概念

- acceptance rate (accepted_per_shown)
- persistence rate / fuzzy persistence
- completion funnel (shown → accepted → persisted)
- SPACE framework (productivity dimensions)
- telemetry terms / usage measurements

## captured_excerpt

From the abstract (PDF text extraction):

> "We find that the rate with which shown suggestions are accepted ... drives developers’ perception of productivity."

## 风险与局限

- 这是 case study（非 RCT）；并且研究目标是“感知与可测数据的对应”，不是证明 Copilot 的真实生产力因果效应。
- acceptance rate 作为 proxy 容易被误用为“真实收益”，论文本身也讨论了人因与指标解释难点；用于报告时必须与局限并列呈现。

