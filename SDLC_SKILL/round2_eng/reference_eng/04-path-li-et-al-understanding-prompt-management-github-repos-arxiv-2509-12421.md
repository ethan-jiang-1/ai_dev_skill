# Understanding Prompt Management in GitHub Repositories: A Call for Best Practices (Li et al., arXiv:2509.12421)

- source_url: https://arxiv.org/abs/2509.12421
- source_type: academic
- accessed_at: 2026-04-09T09:43:27+08:00
- related_topic: 04-path
- trust_level: academic
- why_it_matters: Direct empirical evidence that “prompts as assets” (promptware) create real governance and maintainability problems when managed in GitHub repos. This supports eng’s claim that team-level Skill/prompt assets must be governed like code (formatting standards, duplication control, QA gates), and explains why ad hoc prompt libraries degrade.
- claims_supported:
  - Empirical analysis of 24,800 open-source prompts from 92 GitHub repositories finds major prompt-management quality issues (format inconsistencies, internal/external duplication, readability and spelling problems).
  - GitHub’s Git-based workflows have limitations for prompts: prompts are semi/unstructured; mismatch with line-based management; lack of prompt-specific QA gatekeeping analogous to code quality tooling.
  - The paper provides actionable recommendations to improve usability and maintainability of prompts in repositories.
- date_scope: 2026-01 (arXiv v3: 4 Jan 2026)
- related_tools: promptware; prompt libraries; prompt versioning; QA gates; repo governance; duplication detection

## 关键事实

- 定义与动机：
  - 作者把“用自然语言 prompt 构建的软件”称为 promptware，并强调 prompt 的存储、组织、版本、维护与 QA 具有工程重要性。
- 数据与方法：
  - 收集并分析 92 个 GitHub 仓库中的 24,800 个开源 prompts（规模化实证）。
  - 进行 prompt 管理实践与质量属性的分析（包含 topic analysis 等流程）。
- 主要发现（abstract 级别）：
  - prompt formatting 不一致严重。
  - internal/external duplication 明显。
  - readability 与拼写问题频繁。
  - 基于发现提出可执行建议（best practices）。
- 关键机制解释（对 04-path 直接有用）：
  - prompts 半结构化，和 GitHub 以“文件/行”为单位的管理范式存在阻抗不匹配；
  - GitHub 的 gatekeeping 工具（如 Actions）对“prompt 质量”缺少对应的质量保障体系。

## 与本研究的关系

- 对 04-path（团队采纳与治理）：
  - 这是一条“prompt/skill 资产治理必须工程化”的直接证据：没有格式规范、重复控制、质量门禁，prompt 库会迅速腐化，变成不可维护的知识堆。
  - 报告中可以把它作为“为什么需要把指令资产像代码一样治理”的实证支撑之一（与 repo instructions、权限模型等控制面形成闭环：资产治理 + 执行控制）。
- 对 03-devlife（稳态维护）：
  - 说明 eval/回归与 lint/QA（prompt lint、dup detection、readability checks）应成为 prompt/skill 生命周期的一部分。

## 可直接引用的术语 / 概念

- promptware
- prompt management practices
- formatting inconsistency / prompt duplication
- usability & maintainability of prompts
- impedance mismatch (prompts vs GitHub line-based management)

## captured_excerpt

From the abstract (PDF text extraction):

> "Our findings reveal critical challenges such as considerable inconsistencies in prompt formatting, substantial... prompt duplication, and frequent readability and spelling issues."

## 风险与局限

- 研究样本来自开源 prompt 仓库；企业内私有 prompt/skill 的治理形态可能不同（但问题类型大概率相通）。
- 该文关注 prompt 管理，不直接提供“从使用者到作者/治理者的跃迁案例链条”，更适合支撑“治理必要性与常见问题面”。

