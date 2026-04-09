# gstack: checkpoint/SKILL.md (File-based Checkpoints, Session Handoff Across Branches, No-Code Hard Gate)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/checkpoint/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/checkpoint` 把“状态持久化”做成硬门禁能力单元：明确禁止实现代码（context-only hard gate），通过 git 状态/差异/日志采集当前工作状态，并写入带 frontmatter 的 checkpoint 文件到持久化目录，支持跨 session、甚至跨 branch 的恢复与交接。
- claims_supported:
  - 文件型 checkpoint 是可复核、可迁移的项目记忆机制（比聊天记忆更可靠）
  - “不写代码的 hard gate”能避免在保存状态时引入未审查变更
  - checkpoint 文件格式化（frontmatter + remaining work）支持可靠 resume
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: git status/diff/log, frontmatter markdown, AskUserQuestion

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: checkpoint/SKILL.md

## 关键事实

- 明确硬门禁：checkpoint skill 不允许实现代码变更，只做 state capture/restore。
- Save flow 采集分支、git status、diff stat、recent log，并把“目标/决策/剩余工作/备注”结构化写入 checkpoint 文件。
- checkpoint 文件保存到 `~/.gstack/projects/$SLUG/checkpoints/{timestamp}-{title}.md`，带 YAML frontmatter（branch、timestamp、files_modified、session_duration_s 等）。
- Resume flow 从持久化目录列出最近 checkpoints（跨分支），读取后输出 Summary/Remaining Work/Notes，并在分支不一致时提醒。

## 与本研究的关系

- 为 `round2_cap/03` 的“文件型状态持久化是最可靠项目记忆机制之一”提供一手工作流证据。
- 也提供了企业可迁移的“最小 checkpoint 文件协议”样本：frontmatter + decisions + remaining work。

## 可直接引用的术语 / 概念

- “HARD GATE: Do NOT implement code changes.”
- “checkpoint saved on one branch can be resumed from another”
- “files_modified”

## captured_excerpt

摘录（来自 `checkpoint/SKILL.md`）：

> “HARD GATE: Do NOT implement code changes.”

## 风险与局限

- 默认落盘位置在用户 home 目录；企业环境可能需要将 checkpoints 纳入 repo（或内部工单系统）以便团队共享与审计。
- 该协议主要覆盖“会话交接”；对长期决策与架构演进仍需要额外的 decisions log / ADR 机制。

