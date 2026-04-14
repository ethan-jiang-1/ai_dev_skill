# Sea Change in Software Development: Economic and Productivity Analysis of the AI-Powered Developer Lifecycle (Dohmke, Iansiti, Richards, 2023; arXiv:2306.15033)

- source_url: https://arxiv.org/abs/2306.15033
- source_type: practitioner
- accessed_at: 2026-04-09T08:42:58+08:00
- related_topic: 04-path
- trust_level: practitioner
- why_it_matters: A large-sample (n≈934k) GitHub Copilot telemetry analysis and an economic projection narrative. While not a peer-reviewed academic paper, it documents the “acceptance-rate-as-impact” measurement framing and claims about effects increasing over time and being higher for less experienced users. It is useful as an industry-positioned trend signal and as a source to critique/qualify measurement assumptions in governance sections.
- claims_supported:
  - Reports that Copilot users accept ~30% of code suggestions on average, and that acceptance rate tends to increase over time (as a proxy for impact).
  - Claims benefits are greater for less experienced users (defined by prior GitHub activity).
  - Provides a set of citations to earlier controlled experiments and telemetry studies (e.g., Peng et al., Ziegler et al.) and makes explicit that acceptance rate is used as an indicator of impact/productivity.
- date_scope: arXiv 2023-06 (per id); analyzes early post-GA usage period for Copilot (per report narrative)
- related_tools: GitHub Copilot; telemetry; acceptance rate; econometric regression appendix (per report); productivity/economic impact framing

## 关键事实

- 报告式结构：开头列出 findings（接受率约 30%、影响随时间上升、对“经验更少”用户更大等）。
- 明确的度量口径：作者说明使用 acceptance rate 作为 impact/productivity 的 indicator，并引用 survey/telemetry 研究作为佐证。
- 大样本口径：文中声称分析 Copilot users 样本量 n=934,533。
- 同时包含宏观经济投影（例如 GDP 增量估计），属于模型推演而非软件工程因果实证。

## 与本研究的关系

- 对 04-path：
  - 作为“行业叙事与趋势信号”：说明在企业决策者视角里，acceptance rate 常被当作核心 KPI；eng 报告应利用这一点解释为什么“只看 acceptance rate”会诱发误用，并需要与质量/安全/维护性指标组合。
  - 作为“可质疑的证据”：它强化我们需要在治理章节显式区分“硬事实/分析判断/趋势推测”，并提醒读者这类报告的假设边界与潜在偏差。

## 可直接引用的术语 / 概念

- acceptance rate as an indicator of impact
- effect increases over time (acceptance rate trend)
- less experienced developers benefit more (as defined by prior activity)
- economic projection (GDP impact)

## captured_excerpt

From the “Findings” page (PDF text extraction):

> "Analysis ... (n = 934,533) ... users accept nearly 30% of code suggestions ..."  
> "this productivity impact increases with time, and the benefits are greatest for less experienced users."

## 风险与局限

- 证据强度：属于 practitioner report/industry analysis，即便放在 arXiv，也不等价严格同行评审因果研究；且把 acceptance rate 作为 productivity proxy 存在已知解释风险。
- 经济影响部分是投影模型，不能与软件工程实证混用；用于最终报告必须与假设、方法与不确定性并列呈现。

