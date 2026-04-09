# GitHub Copilot Policies: Controlling Availability of Features and Models (GitHub Docs)

- source_url: https://docs.github.com/en/copilot/concepts/policies
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: official
- why_it_matters: Team adoption depends on enforceable org/enterprise controls (not just personal preference). This page defines Copilot policy types and the org vs enterprise control model, which is ground truth for enterprise rollout governance.
- claims_supported:
  - Copilot policies control what features/models users can access under an org/enterprise-assigned Copilot license.
  - Policies are grouped into feature, privacy, and models policies with distinct UI surfaces and semantics.
  - Enterprise-level policies can override and disable organization-level control; “No policy” delegates and introduces conflict resolution behavior.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: GitHub Copilot (organization/enterprise administration)

## 关键事实

- 文档说明：当组织/企业给成员分配 Copilot license 后，可以通过 Copilot policies 控制他们可用的功能与模型。
- Policies 类型分组：
  - Feature policy：定义某项 Copilot feature 是否可用
  - Privacy policy：定义潜在敏感动作是否允许（Allowed/Blocked）
  - Models policy：定义除基础模型外的模型可用性（可能涉及额外成本）
- 控制层级：
  - 组织层（organization owners）可为组织分配的用户配置策略（Enabled/Disabled/Unconfigured）
  - 企业层（enterprise owners）可在企业层定义策略或委托给组织；若企业层定义，则组织层控制会被禁用

## 与本研究的关系

- 对 04-path（团队采纳与治理）：
  - 这是“企业级可强制策略”的一手证据，直接决定团队能否一致化地使用某些 Copilot 形态（IDE、CLI、agents、models）。
  - 也为“组织层 rollout 策略”提供了明确操作面（先 Enabled 某些低风险 feature，逐步开放更多）。

## 可直接引用的术语 / 概念

- feature policy / privacy policy / models policy
- organization-level control / enterprise-level control
- policy conflicts

## captured_excerpt

From the doc (selected):

> "Policies are grouped into different types."

## 风险与局限

- 文档是“控制面概念说明”，不直接给出每个 feature 的风险收益评估；eng 报告需要结合具体场景（学习训练 vs 生产变更）定义一套推荐的 policy baseline。

