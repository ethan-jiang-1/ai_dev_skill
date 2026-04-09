# gstack: review/SKILL.md (Pre-Landing PR Review, Specialist Dispatch, Always-on Adversarial Review, Persisted Findings)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/review/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/review` 把“代码审查”写成可执行工作流：base branch 检测、scope drift 检测、checklist 驱动的结构化审查、specialist 分派、fix-first 流水线、文档漂移提示，以及默认开启的 adversarial review（fresh-context subagent + 可选 Codex challenge）。同时把审查结果落盘为 JSONL，成为 `/ship` 的可追溯 gate 输入。
- claims_supported:
  - “Review 能力单元”可以通过 checklist + specialist + fix-first 变成可复用控制流，而不是泛泛点评
  - “单模型自审偏差”可以通过 fresh-context 的 adversarial subagent + cross-model challenge 缓解
  - “审查结论持久化”让后续 ship/ops 具备稳定、可复核的 gate 输入
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: git, gh/glab, Greptile, codex, Agent tool, gstack-review-log

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: review/SKILL.md

## 关键事实

- “Pre-landing PR review”：对当前分支相对 base branch 的 diff 做结构化审查（不仅依赖测试）。
- Step 0：检测平台与 base branch（GitHub/GitLab CLI 优先，git-native 兜底），随后所有 diff/log 都以 base branch 为准。
- Step 1.5：显式做 scope drift 检测（对照 TODOS.md / PR body / commit messages 抽取 intent，再对照 diff）。
- Step 5.6：显式包含“文档漂移检查”，把 `/document-release` 作为推荐修复动作。
- Step 5.7：默认开启 adversarial review：
  - Claude adversarial subagent（fresh context、attack/chaos 视角）总是运行。
  - Codex adversarial/structured review 在可用且满足条件时运行，并把 `[P1]` 作为 gate 语义信号。
- Step 5.8：持久化审查结果到本地 review log（JSONL，含 severity 计数、quality_score、specialists stats、commit 等），使其他能力单元可“读状态”。

## 与本研究的关系

- 为 `digested_cap/03` 的关键判断提供一手证据：成熟的 review 能力单元必须具备“独立审查 + gate + 可追溯落盘”，而不仅是同一 agent 的自我审查。
- 提供可迁移的机制样本：scope check、fix-first、specialist 分派、adversarial passes、review 结果持久化（后续 `/ship` 可引用）。

## 可直接引用的术语 / 概念

- “Scope Drift Detection”
- “Fix-First Review”
- “Adversarial review (always-on)”
- “fresh context”
- “Persist Eng Review result”

## captured_excerpt

摘录（来自 `review/SKILL.md`）：

> “Every diff gets adversarial review from both Claude and Codex.”
>
> “This genuine independence catches things the primary reviewer is blind to.”

## 风险与局限

- 强依赖 hosting CLI（`gh`/`glab`）与本地命令可用性；企业环境需要对接自有 PR/CI 系统与权限模型。
- “always-on adversarial”会带来额外成本与时延；需要配套阈值与采样策略（例如按 diff size 或风险等级触发）。

