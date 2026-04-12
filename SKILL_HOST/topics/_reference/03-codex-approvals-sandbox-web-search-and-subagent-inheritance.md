# Codex Approvals, Sandbox, Web Search, and Subagent Inheritance

- source_url: https://developers.openai.com/codex/agent-approvals-security and https://developers.openai.com/codex/config-reference and https://developers.openai.com/codex/subagents and https://developers.openai.com/codex/cloud/internet-access
- source_type: official_docs
- accessed_at: 2026-04-12 17:18:00 CST
- published_or_updated_at: current docs snapshots accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 06, 08
- trust_level: official
- why_it_matters: clarifies the real execution contract for research-like and automation-heavy skills in Codex, including approval presets, sandbox/network tradeoffs, web-search modes, admin restrictions, and what subagents inherit from the parent session
- claims_supported: Codex exposes explicit approval and sandbox modes; web search has configurable modes; network access is separately controlled; workspace-write still protects `.git`, `.agents`, and `.codex`; subagents inherit omitted runtime fields such as sandbox, MCP servers, and skills config; Codex cloud internet access is off by default during the agent phase
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- Codex exposes explicit approval presets and flags:
  - `on-request`
  - `never`
  - `untrusted`
  - `granular`
- `--full-auto` maps to `--sandbox workspace-write --ask-for-approval on-request`.
- `--dangerously-bypass-approvals-and-sandbox` / `--yolo` gives no sandbox and no approvals, and is explicitly marked high risk.
- In the default `workspace-write` sandbox:
  - filesystem and network access are policy-controlled
  - `.git`, `.agents`, and `.codex` under writable roots remain protected read-only
- `sandbox_workspace_write.network_access` separately controls outbound network access in workspace-write mode.
- Codex config exposes `web_search` modes:
  - `disabled`
  - `cached`
  - `live`
- Admin / requirements policy can constrain allowed values for:
  - `approval_policy`
  - `sandbox_mode`
  - `web_search`
- Codex docs explicitly warn that enabling network access or web search raises prompt-injection risk.
- For Codex cloud tasks, agent internet access is off by default during the agent phase; setup scripts still get internet access, and admins can enable agent internet access per environment with domain allowlists and allowed HTTP methods.
- Codex subagent docs say omitted fields such as:
  - `model`
  - `model_reasoning_effort`
  - `sandbox_mode`
  - `mcp_servers`
  - `skills.config`
  inherit from the parent session.

## 核心内容摘录

- Codex’s execution contract is unusually explicit and layered:
  - approvals are not just on/off; there are interactive, non-interactive, untrusted, and granular modes
  - sandboxing is not the same thing as approvals
  - network access is not the same thing as web search
- The approval/sandbox matrix in the docs is especially useful because it maps autonomy to concrete presets:
  - `read-only + on-request` means question answering with approval for edits, commands, or network
  - `workspace-write + on-request` means normal autonomous editing in the workspace, but approval for outside-workspace edits or network
  - `workspace-write + untrusted` means edits are allowed, but risky commands still prompt
  - `danger-full-access` or `--yolo` removes both sandbox and approval protections
- Codex also distinguishes different search/network layers:
  - `web_search` can be `disabled`, `cached`, or `live`
  - outbound network inside workspace-write is a separate sandbox setting
  - for cloud tasks, the agent phase blocks internet by default and only setup scripts retain internet access unless the environment explicitly enables it
- This means research-skill portability in Codex depends on several separate toggles:
  - whether the session can browse at all
  - whether it can do cached versus live search
  - whether commands inside the sandbox can reach the network
  - whether the environment’s admin policy permits these modes
- Codex’s protected-path behavior also matters for shared skill governance:
  - even in writable mode, `.git`, `.agents`, and `.codex` stay read-only under writable roots
  - this makes the host more explicit about protecting repository state and agent-control layers
- Subagent inheritance is also concrete rather than hand-wavy:
  - omitted runtime fields inherit from the parent session
  - that includes `sandbox_mode`, `mcp_servers`, and `skills.config`
  - so delegated workflows do not start from a blank execution contract; they often continue the parent’s one unless explicitly overridden

## 与本研究的关系

- Important for Topic `03` because it sharpens Codex from “engineering-oriented host” into a host with explicit execution-governance layers.
- Important for Topic `06` because it gives a strong counterexample to hosts where some important runtime limits are harder to discover.
- Important for Topic `08` because research skills often fail not on format but on search/network/approval assumptions.

## 可直接引用的术语 / 概念

- `web_search = "disabled" | "cached" | "live"`
- `sandbox_workspace_write.network_access`
- `--full-auto`
- `--dangerously-bypass-approvals-and-sandbox`
- `.git`, `.agents`, and `.codex` remain protected read-only
- `skills.config` inherit from the parent session

## 模型 / 宿主 / 版本相关信息

- This source shows Codex’s host/runtime behavior is partly governed by explicit config and partly by environment-level policy.
- It is especially useful for comparing Codex with Claude’s explicit permission contract, Cursor’s partially hidden backend constraints, and OpenCode’s explicit provider/tool gating.

## 风险与局限

- These docs expose host capabilities and constraints, but they do not prove every community skill correctly models those constraints.
- The cloud internet-access page describes Codex cloud environments specifically, so some details apply more directly to web/cloud tasks than to local CLI sessions.
