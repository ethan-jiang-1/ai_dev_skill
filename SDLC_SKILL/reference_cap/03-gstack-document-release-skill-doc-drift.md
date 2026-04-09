# gstack: document-release/SKILL.md (Post-Ship Docs Update, Diff-aware Doc Audit, Consistency Checks)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/document-release/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/document-release` 把“文档同步”提升为发布闭环的一部分（after `/ship`, before merge）：基于 diff 做文档文件发现、逐文件 audit、自动更新与风险分级 AskUserQuestion、跨文档一致性与可发现性检查，并强约束 CHANGELOG 的安全编辑规则，减少文档漂移与历史被误改风险。
- claims_supported:
  - 文档同步是 release pipeline 的能力单元，不是收尾可选项
  - diff-aware 的 doc audit 能把“文档漂移”变成可检测、可修复的工程任务
  - 对 CHANGELOG 的硬规则能降低 agent 误写造成的历史污染
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: git diff/log, find, Edit tool, AskUserQuestion

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: document-release/SKILL.md

## 关键事实

- 定义了运行时序：在 `/ship` 之后、PR merge 之前运行，目标是“确保项目文档全部准确、对用户友好”。
- Step 1 明确使用 `git diff <base>...HEAD` / `git log` / `--name-only` 获取变化上下文，并用 `find` 找出 repo 内所有文档文件进行 audit。
- 把每个 doc 的变更分成两类：
  - Auto-update：由 diff 明确推出的事实性更新（路径、计数、表格项等）
  - Ask user：叙事/哲学/安全模型/大改写/删除章节等高风险变更
- 强约束 CHANGELOG：只允许“语气润色”，禁止重写/替换历史条目，并要求用 Edit 的精确 old_string（避免全量覆盖）。
- 进行跨文档一致性与 discoverability 检查：README/CLAUDE/ARCHITECTURE/CHANGELOG/VERSION 等之间的互相对齐。

## 与本研究的关系

- 支撑 `digested_cap/03` 中“文档同步是发布闭环能力单元”的判断，并提供可迁移的最小动作集（diff-aware audit + risk gates）。
- 也提供了“防漂移机制”的工程化样本：用硬规则避免 agent 覆写 CHANGELOG 等高风险文件。

## 可直接引用的术语 / 概念

- “Post-Ship Documentation Update”
- “Auto-update / Ask user”
- “Cross-doc consistency & discoverability”
- “NEVER CLOBBER CHANGELOG ENTRIES”

## captured_excerpt

摘录（来自 `document-release/SKILL.md`）：

> “This runs after `/ship` … but before the PR merges.”
>
> “CRITICAL — NEVER CLOBBER CHANGELOG ENTRIES.”

## 风险与局限

- 对文档正确性的判定仍依赖 diff 与上下文可得性；对外部依赖（API、第三方系统）的行为变化，可能需要额外验收手段。
- “自动更新”策略需要与企业写作规范和合规审查流程对齐，避免自动写入不合规声明。

