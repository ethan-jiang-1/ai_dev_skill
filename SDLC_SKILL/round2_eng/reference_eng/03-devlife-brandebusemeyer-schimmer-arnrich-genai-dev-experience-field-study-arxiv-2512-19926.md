# Developers’ Experience with Generative AI: First Insights from an Empirical Mixed-Methods Field Study (Brandebusemeyer et al., 2026; arXiv:2512.19926)

- source_url: https://arxiv.org/abs/2512.19926
- source_type: academic
- accessed_at: 2026-04-09T08:42:58+08:00
- related_topic: 03-devlife
- trust_level: academic
- why_it_matters: Direct empirical evidence about *professional developers’ experience* (workload, efficiency, accuracy) when using GitHub Copilot in real work settings, and how different interaction types (in-code vs chat vs combined) change outcomes. This helps ground “tool choice shapes learning/engagement” claims beyond generic theory.
- claims_supported:
  - In controlled sessions, moderate use of either in-code suggestions or chat prompts improved efficiency (task duration) and reduced perceived workload vs no Copilot; excessive or combined use reduced these benefits.
  - Accuracy (task completion) benefited from chat interaction.
  - In an uncontrolled period, developers perceived both higher cognitive load and higher productivity when interacting with AI during everyday tasks.
- date_scope: arXiv preprint; ICSE SEIP 2026 (per PDF front matter)
- related_tools: GitHub Copilot; IDE telemetry; NASA-TLX; mixed-methods field study; interaction types (in-code vs chat)

## 关键事实

- 研究目标（摘要）：过去研究多聚焦输出质量与生产力，较少研究“开发者在交互过程中的体验”。该研究在企业自然工作环境中，采用 multimodal、developer-centered 的 mixed-methods 设计，分析与 Copilot 的交互体验。
- 研究设计（摘要/方法）：
  - controlled sessions + uncontrolled study periods（企业内真实环境）。
  - 比较不同交互类型：no Copilot、in-code suggestions、chat prompts、两者结合。
  - 关注指标：efficiency（task duration）、accuracy（task completion）、perceived workload 等。
  - 文中描述在 SAP 的两个美国地点开展研究（研究情境信息）。
- 关键发现（摘要）：
  - controlled sessions：moderate use（单一交互形式的适度使用）可提升效率、降低工作负荷；excessive 或 combined use 会减弱这些收益。
  - accuracy：chat interaction 有利于 task completion。
  - uncontrolled period：在日常任务中，开发者主观上同时感知更高 cognitive load 与更高 productivity。

## 与本研究的关系

- 对 03-devlife（工具生态与生命周期）：
  - 给出了“交互形态”这一关键变量：同一个工具（Copilot），不同交互方式（in-code vs chat vs combined）对效率/准确率/负荷的影响不同，这直接支持“工具形态塑造使用方式”的论点。
  - 可用于推导 Skill/规则设计的实践含义：当目标是可控与可持续，可能需要限制/引导交互强度与模式，而不是鼓励“全程 AI 介入”。
- 对 01-scaffold 的交叉：
  - “combined use 可能降低收益”“uncontrolled 期间负荷更高”是重要的 offloading/认知负担信号，提示“更强介入 ≠ 更好结果”，需要在报告中与 ICAP/offloading 机制框架对齐（注意：本研究并不直接证明学习收益）。

## 可直接引用的术语 / 概念

- mixed-methods field study
- developer experience
- interaction types: in-code suggestions vs chat prompts vs combined
- efficiency (task duration)
- accuracy (task completion)
- perceived workload (NASA-TLX)
- controlled vs uncontrolled study periods

## captured_excerpt

From the abstract (PDF text extraction):

> "moderate use of either in-code suggestions or chat prompts improves efficiency ... and reduces perceived workload"  
> "excessive or combined use lessens these benefits."  
> "Accuracy ... profits from chat interaction."

## 风险与局限

- 论文强调的是“体验/负荷/效率/准确率”的短期与过程指标，不能直接推出长期能力提升或方法学内化。
- 企业环境、任务类别与参与者背景会强影响结果；该研究本身也把它定位为“first insights”，需要更多复现与更大样本。

