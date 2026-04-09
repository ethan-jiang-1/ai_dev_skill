# OpenAI Codex Docs: Managed Configuration (requirements.toml, Managed Defaults, MCP Allowlist, Org Guardrails)

- source_url: https://developers.openai.com/codex/enterprise/managed-configuration
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 该文提供企业级“可执行治理控制面”：`requirements.toml`（管理员强制约束，用户不可覆盖）与 `managed_config.toml`（启动默认值），并明确可约束 approval policy/sandbox mode/web search mode 以及可选 MCP server allowlist（按 name+identity 匹配）。同时提供前缀命令规则（prefix_rules）在 requirements 层的强制方式与 precedence。它直接支撑“企业迁移价值评估必须包含治理负担与可执行政策”。
- claims_supported:
  - 企业可用 `requirements.toml` 强制约束安全敏感配置（approval/sandbox/web search/MCP servers）
  - 若用户配置与 requirements 冲突，Codex 回退到兼容值并通知用户
  - requirements 有分层 precedence（云端/MDM/系统文件），并按 field merge（早层优先）
  - 可在 requirements 中强制 prefix_rules（且必须是 prompt/forbidden）
  - 可通过 MCP allowlist 限制可启用的服务器（按 identity：command 或 url）
  - managed defaults 在每次启动时重置为受管默认值（会覆盖 CLI overrides 的起始值）
- date_scope: accessed 2026-04-09
- related_frameworks: Codex (Enterprise governance)
- related_tools: requirements.toml, managed_config.toml, MDM, prefix_rules, MCP allowlist, OTel settings

## 关键事实

- 两类企业控制面：
  - Requirements：管理员强制约束，用户不可覆盖
  - Managed defaults：启动默认值，用户会话内可改，但下次启动会重新应用。`source_url`
- `requirements.toml` 约束范围（文中明确）：
  - approval policy、sandbox mode、web search mode
  - 可选：限制可启用的 MCP servers（当配置 `mcp_servers` allowlist 时，只有 name+identity 匹配的 server 才能启用；否则禁用）。`source_url`
- requirements precedence（Locations and precedence）：
  - Cloud-managed（Business/Enterprise）
  - macOS MDM managed preferences（base64 注入）
  - system `/etc/codex/requirements.toml`
  - merge 规则按字段：早层设置过的字段不被后层覆盖。`source_url`
- 可在 requirements 中强制命令规则：
  - `[rules] prefix_rules = [...]`
  - 与 `.rules` 合并时“更严格”的 decision 生效
  - requirements rules 的 decision 只能是 `prompt` 或 `forbidden`（不能是 allow）。`source_url`
- 示例明确可禁止 `--yolo`（即 `--ask-for-approval never` / `--sandbox danger-full-access`）并 pin `allowed_web_search_modes = ["cached"]` 等。`source_url`
- 文中还给出 managed defaults 的示例（`managed_config.toml`），包含 `network_access = false`、以及 OTel exporter 配置与 prompt logging 建议。`source_url`

## 与本研究的关系

- 为 `round2_cap/04` 的“迁移价值评估维度模板”提供一手证据：企业落地的关键在于能否把 approval/sandbox/MCP/web search 等风险面纳入“可执行、可强制、可回归”的配置与策略层，而不是依赖团队自觉。
- 为“最小可行供应链治理”提供落地点：MCP allowlist（按 identity）是把外部扩展能力纳入审批/信任边界的一种可操作机制。

## 可直接引用的术语 / 概念

- “Admin-enforced requirements (requirements.toml)”
- “Managed defaults (managed_config.toml)”
- “allowed_approval_policies / allowed_sandbox_modes”
- `[rules] prefix_rules`
- `mcp_servers` allowlist with identity matching

## captured_excerpt

摘录（来自 requirements 约束描述，保持简短）：

> “Requirements constrain … approval policy, sandbox mode, web search mode, and optionally which MCP servers users can enable.”

## 风险与局限

- 该文描述的是 Codex 的企业治理机制；其他宿主的等价能力与粒度可能不同，迁移时需要对等映射与降级。
- allowlist/requirements 解决的是“能否被启用/如何被约束”，不等价于“扩展本身没有安全漏洞”；仍需配套审计、隔离与供应链验证。

