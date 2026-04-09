# GitHub Copilot CLI: Tool Permissions (`--available-tools`, `--allow-tool`, `--yolo`)

- source_url: https://docs.github.com/en/copilot/how-tos/copilot-cli/allowing-tools
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: official
- why_it_matters: Team adoption of Skills/agents requires explicit permission boundaries. This page documents Copilot CLI’s permission model as productized, auditable controls (visibility allow/deny + execution allow/deny + human-in-the-loop approvals).
- claims_supported:
  - Copilot CLI distinguishes read-only vs potentially destructive tools and requires explicit user approval for higher-risk actions.
  - Tool controls include both visibility (available/excluded) and execution permissions (allow/deny), enabling least-privilege configurations.
  - “YOLO/allow-all” exists but is explicitly discouraged for default usage (safety posture is a first-class concern).
- date_scope: docs page as of access date (2026-04-09)
- related_tools: GitHub Copilot CLI; tool calling governance

## 关键事实

- 文档描述 Copilot CLI 的 tools 能力面（例如 shell、读写文件、fetch web content、delegating tasks 等）。
- 默认策略强调人类在环：可能修改系统的操作需要用户显式批准；并提供 allow/deny 规则来控制工具可见性与执行权限。
- 文档同时提供 permissive 开关（如 `--yolo` / allow-all），但强调应仅在隔离环境使用且不应成为默认。

## 与本研究的关系

- 对 04-path（团队采纳与治理）：
  - 这是“可迁移治理抽象”的一手证据：把 agent 的能力面拆成可配置的权限面，而不是只靠提示词自律。
- 对 03-devlife（开发与迭代）：
  - 当 Skills/agents 进入“部署与稳态运营”，权限配置是不可绕开的工程要素（尤其在 CI、脚本、文件写入场景）。

## 可直接引用的术语 / 概念

- tool visibility: `--available-tools` / `--excluded-tools`
- tool permission: `--allow-tool` / `--deny-tool`
- permissive: `--yolo` / allow-all
- human-in-the-loop approvals

## captured_excerpt

> ...tools that can modify your system ... require your explicit approval...

## 风险与局限

- 这是 Copilot CLI 的治理语义，并不自动代表其他 IDE/agent 宿主具备同等可配置性；跨工具比较时必须避免外推。

