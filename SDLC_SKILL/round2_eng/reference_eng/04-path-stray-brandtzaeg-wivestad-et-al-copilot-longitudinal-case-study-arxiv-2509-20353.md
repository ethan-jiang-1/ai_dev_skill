# Developer Productivity With and Without GitHub Copilot: A Longitudinal Mixed-Methods Case Study (Stray et al., 2026; arXiv:2509.20353)

- source_url: https://arxiv.org/abs/2509.20353
- source_type: academic
- accessed_at: 2026-04-09T08:42:58+08:00
- related_topic: 04-path
- trust_level: academic
- why_it_matters: A real-world, longitudinal, mixed-methods study in a large organization (NAV IT) that shows how hard “productivity measurement” is and why perceived productivity can diverge from repo-activity metrics after Copilot adoption. This directly supports the eng report’s governance/adoption stance: don’t roll out skills/agents without an eval and measurement protocol.
- claims_supported:
  - Copilot users were consistently more active than non-users even prior to adoption (selection/activation bias risk).
  - The study found no statistically significant changes in commit-based activity for Copilot users after adoption, despite minor increases.
  - There can be a discrepancy between commit-based metrics and subjective experience of productivity, implying measurement protocols must be multi-dimensional (not LOC/commits-only).
- date_scope: arXiv v2 (2026-01-28); two-year period of commits analyzed (per abstract)
- related_tools: GitHub Copilot; productivity metrics; surveys/interviews; SPACE framework (context in paper)

## 关键事实

- 研究对象与场景（摘要）：
  - 组织：NAV IT（large public sector agile organization）。
  - 数据：分析 703 个 GitHub repositories、两年期间 26,317 个 unique non-merge commits。
  - 对比：聚焦 25 名 Copilot users 与 14 名 non-users 的 commit-based activity metrics。
  - 补充方法：survey（角色与 perceived productivity）+ 13 interviews。
- 主要结果（摘要）：
  - Copilot users 在采用前就更活跃（“consistently more active … even prior to Copilot’s introduction”）。
  - 采用后：未发现 commit-based activity 的统计显著变化（尽管有 minor increases）。
  - 作者指出：commit-based metrics 的变化与主观 productivity 体验可能不一致。

## 与本研究的关系

- 对 04-path（团队采纳与治理）：
  - 强化了“不能用单一指标衡量 AI 工具价值”的硬证据：采用后未必在 commits 等活动指标上显著变化，但主观感受可能提升。
  - 这与治理策略直接耦合：团队 rollout 需要在 pilot 阶段定义多维指标（速度、质量、风险、满意度、负荷、返工率等），并把评测协议固化为可复用资产（与 03-devlife 的 evals 交叉）。
- 对 “样本矩阵/跃迁路径”：
  - 提示一个现实约束：AI 工具 adoption 往往与“更活跃的人更愿意用/更早用”耦合，导致简单前后对比误判，必须控制选择偏差。

## 可直接引用的术语 / 概念

- longitudinal mixed-methods case study
- commit-based activity metrics
- perceived productivity
- selection bias / pre-adoption differences
- multidimensional productivity (contextual)

## captured_excerpt

From the abstract (PDF text extraction):

> "Copilot were consistently more active than non-users, even prior to Copilot’s introduction."  
> "We did not find any statistically significant changes in commit-based activity for Copilot users after they adopted the tool..."

## 风险与局限

- 该研究重点是“活动指标与主观感受”的关系；commit-based metrics 本身不等价产出质量或业务价值，因此它证明的是“测量复杂性”，而不是“Copilot 一定无效”。
- 个体差异与组织环境会影响结果；更适合作为治理与评测设计的证据，而不是工具优劣的单点裁决。

