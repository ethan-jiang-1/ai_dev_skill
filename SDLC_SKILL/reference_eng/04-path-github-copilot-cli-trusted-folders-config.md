# GitHub Copilot CLI: Trusted Folders + Config (`~/.copilot/config.json`, `COPILOT_HOME`)

- source_url: https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/configure-copilot-cli
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: official
- why_it_matters: Establishes a concrete governance primitive for team adoption: “trusted directories” constrain where the agent can read/modify/execute. This is directly usable in eng’s team rollout playbook (progressive enablement).
- claims_supported:
  - Copilot CLI uses trusted directories to control where it can operate; users explicitly trust a directory per session or persistently.
  - Trusted folders are stored in a local config file (`~/.copilot/config.json`) and can be relocated via `COPILOT_HOME`.
  - Ties tool/path/URL permissions to a durable configuration surface (scriptable governance).
- date_scope: docs page as of access date (2026-04-09)
- related_tools: GitHub Copilot CLI

## 关键事实

- 文档定义 trusted directories：决定 Copilot CLI 在哪些目录可以 read/modify/execute files；启动 session 会提示确认信任当前目录。
- 支持临时信任（仅当前 session）与长期信任（未来 session 也信任），并提示长期信任的安全风险。
- 提供配置落盘位置与可覆写机制：
  - `~/.copilot/config.json`（macOS/Linux）
  - 通过 `COPILOT_HOME` 改变配置位置

## 与本研究的关系

- 对 04-path（团队采纳）：
  - trusted folders 是一种“渐进式开放权限”的组织 rollout 策略：先限制在 sandbox/训练仓库，再逐步扩大。
- 对 01-scaffold：
  - 把“安全边界”做成确定性约束，有助于减少团队恐惧和滥用风险，从而为学习/训练体系留出空间。

## 可直接引用的术语 / 概念

- trusted directories / trusted folders
- `~/.copilot/config.json`
- `trusted_folders`
- `COPILOT_HOME`

## captured_excerpt

> Trusted directories control where Copilot CLI can read, modify, and execute files.

## 风险与局限

- 该文档描述配置入口与概念；对“默认允许哪些操作”“企业层是否可强制策略”等仍需进一步补充一手证据（组织策略/管理面）。

