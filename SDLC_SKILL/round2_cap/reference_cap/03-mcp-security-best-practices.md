# Model Context Protocol (MCP) Spec: Security Best Practices (Confused Deputy, Tool Poisoning, SSRF, Session Hijacking, Least Privilege)

- source_url: https://modelcontextprotocol.io/specification/2025-06-18/basic/security_best_practices
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: 该文是 MCP 官方规范中的安全最佳实践章节，系统枚举了 MCP 生态的主要攻击面（confused deputy、tool poisoning、SSRF、session hijacking 等）与缓解建议（最小权限 scopes、明确授权边界、隔离敏感 token、把 tool 输出视为不可信输入等）。它为“skill/MCP 进入供应链风险域后，最小可行治理策略是什么”提供权威一手依据。
- claims_supported:
  - MCP 的威胁模型包含：confused deputy、token passthrough、SSRF、session hijacking（prompt injection）、local server compromise 等
  - 安全策略强调：least privilege、明确用户同意、敏感能力隔离、把 tool 输出视为不可信、分层授权 scopes
  - 建议通过能力 scopes 与 progressive authorization 降低被诱导调用高权限工具的风险
- date_scope: spec dated 2025-06-18; accessed 2026-04-09
- related_frameworks: MCP
- related_tools: authorization scopes, progressive authorization, tool outputs, SSRF mitigations, token handling

## 关键事实

- 文档的“Purpose and scope”明确：该章节提供 MCP 实现与部署的安全指南，重点面向 integrators/developers。`source_url`
- 文档列出的核心攻击面包括（按章节标题与要点）：
  - Confused Deputy Problem
  - Token Passthrough
  - Server-Side Request Forgery (SSRF)
  - Session Hijacking / Prompt Injection
  - Local MCP Server Compromise。`source_url`
- 文档对“scopes”给出明确建议：
  - 尽量细粒度（granular）
  - 支持 progressive authorization（逐步授权）
  - 避免默认授予跨资源的广域权限。`source_url`
- 文档强调“tool outputs / server responses 不可信”的观点：需要把来自 MCP server 的内容视为潜在恶意输入，避免被其诱导越权调用其他工具（confused deputy）。`source_url`

## 与本研究的关系

- 为 `round2_cap/03` 与 `round2_cap/04` 提供“供应链治理”的权威依据：当能力单元通过 MCP 扩展到外部 server 时，安全边界不再是 repo 内 prompt，而是授权 scopes、token 隔离、以及对 tool 输出的信任策略。
- 可用于把“社区顾虑（不信任 MCP）”转成可执行治理清单（allowlist/scopes/审批/隔离/审计）。

## 可直接引用的术语 / 概念

- “Confused Deputy Problem”
- “Token Passthrough”
- “SSRF”
- “Session Hijacking”
- “Local MCP Server Compromise”
- “(granular) scopes” / “progressive authorization”

## captured_excerpt

摘录（来自章节标题或定义性句子，保持简短）：

> “This document provides security best practices for implementing and deploying MCP.”

## 风险与局限

- 这是规范级 best practices，提供“应该做什么”，但不直接提供企业落地的工程度量与事故复盘；需要结合具体宿主实现（approval/sandbox/allowlist）与真实案例进一步细化。

