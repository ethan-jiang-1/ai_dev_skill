# Cursor Blog: Extend Cursor with Plugins (Marketplace + Team Governance Trend, 2026-02-17)

- source_url: https://cursor.com/blog/marketplace
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: official
- why_it_matters: Official statement that the host is moving from ad-hoc prompts to a curated marketplace and explicitly toward private team marketplaces with central governance and security controls. This is direct trend evidence for team adoption and governance of skills/plugins.
- claims_supported:
  - Cursor plugins bundle multiple primitives (skills/subagents/MCP/hooks/rules) as a distribution/governance unit.
  - The marketplace is curated initially; distribution is an explicit platform layer.
  - Cursor explicitly signals “private team marketplaces” with central governance/security controls (team-scale adoption direction).
- date_scope: 2026-02-17 (post)
- related_tools: Cursor plugins; marketplace; team marketplaces

## 关键事实

- Cursor 官方将 plugins 定义为能力打包单位，可包含 MCP servers、skills、subagents、rules、hooks 等 primitives。
- 分发入口是 Cursor Marketplace（初期高度 curated），并允许社区提交与分享。
- 明确趋势信号：正在做 private team marketplaces，用于组织内部分享插件，并提供 central governance 与 security controls。

## 与本研究的关系

- 对 04-path（团队采纳）：
  - 这是“团队级 Skill/插件共享”将被平台化的直接证据：团队市场 + 治理/安全控制成为产品路线的一部分，而不是事后补丁。
- 对 03-devlife（生命周期）：
  - 一旦分发进入 marketplace，技能资产的发布/更新/审核会被平台约束，推动从“个人笔记”走向“工程化制品”。

## 可直接引用的术语 / 概念

- plugins / marketplace
- plugin primitives: skills / subagents / MCP servers / hooks / rules
- private team marketplaces
- central governance / security controls

## captured_excerpt

> Plugins bundle capabilities like MCP servers, skills, subagents, rules, and hooks...

## 风险与局限

- 这篇文章是概念与路线层面的官方说明；具体权限边界、审计、执行沙箱等实现细节仍需进一步下钻到 docs/schema/runtime contract。

