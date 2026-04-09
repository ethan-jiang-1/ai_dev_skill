# OpenAI Codex Docs: Agent Approvals & Security (Approval Policies, Sandbox Modes, OS Isolation Details)

- source_url: https://developers.openai.com/codex/agent-approvals-security
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: 该文把“agent 执行安全”写成可配置 contract：审批策略（untrusted/on_request/on_request+）、sandbox_mode（read_only/workspace_write/dangerous）、以及不同运行环境的具体隔离实现（macOS Seatbelt、Linux bubblewrap+seccomp、云端 gVisor）。这为“能力单元迁移到企业环境时的治理成本与最小可行安全机制”提供一手事实。
- claims_supported:
  - Codex 支持不同强度的 approval policy，并可在执行潜在危险操作前请求确认
  - Codex 支持不同强度的 sandbox_mode（从只读到允许写工作区到危险模式）
  - 本地与云端 sandbox 有不同实现：macOS Seatbelt、Linux bubblewrap+seccomp、cloud gVisor
  - 通过 network/proxy 等策略可控制外联行为与风险面
- date_scope: accessed 2026-04-09
- related_frameworks: Codex
- related_tools: approval_policy, sandbox_mode, Seatbelt, bubblewrap, seccomp, gVisor, managed proxy

## 关键事实

- approval policy（审批策略）：
  - `untrusted`: 默认不信任外部命令/动作，更多需要确认
  - `on_request`: 仅在模型明确提出需要时请求确认
  - `on_request+`: 更积极地触发确认（更保守）。`source_url`
- sandbox_mode（沙箱模式）：
  - `read_only`: 只读模式（更安全）
  - `workspace_write`: 允许写入 workspace
  - `dangerous`: 低保护/高风险模式。`source_url`
- OS 与环境隔离实现（文中“Sandboxing”段落）：
  - macOS：依赖 App Sandbox / Seatbelt profiles
  - Linux：bubblewrap + seccomp
  - Cloud：gVisor。`source_url`
- 文中同时强调网络与外部访问的风险面，并给出通过 proxy/网络策略限制外联的机制描述。`source_url`

## 与本研究的关系

- 为 `digested_cap/03` 与 `digested_cap/04` 提供“企业迁移价值/治理负担”的硬事实：审批策略与沙箱强度不是抽象讨论，而是可以配置并强制执行的安全控制面。
- 也提示能力单元的边界：同一个“执行/调试/发布”能力单元，在不同 sandbox_mode 与 approval policy 下会表现出不同的自动化程度与风险轮廓。

## 可直接引用的术语 / 概念

- `approval_policy` (`untrusted`, `on_request`, `on_request+`)
- `sandbox_mode` (`read_only`, `workspace_write`, `dangerous`)
- “Seatbelt profiles”
- “bubblewrap + seccomp”
- “gVisor”

## captured_excerpt

摘录（来自 sandbox 描述，保持简短）：

> “Cloud … uses gVisor … Linux uses bubblewrap + seccomp … macOS uses … Seatbelt profiles.”

## 风险与局限

- 该文是 Codex 的实现细节；其他宿主对 sandbox/approval 的支持与语义可能不同，迁移时需要对等能力映射与降级策略。
- 安全控制面越强，自动化程度往往越低（更多 approvals、更多限制）；企业需要按风险分级选择策略组合。

