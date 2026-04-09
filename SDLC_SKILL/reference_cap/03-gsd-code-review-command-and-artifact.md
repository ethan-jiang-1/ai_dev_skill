# GSD: `gsd:code-review` (Phase-scoped Code Review, Depth Levels, REVIEW.md Artifact)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/commands/gsd/code-review.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: GSD 把“代码审查”变成 phase-scoped 的可执行能力单元：通过命令层解析参数并委派到 workflow，按 quick/standard/deep 深度生成结构化 REVIEW 产物（带 severity 分类），并内置 config gate 与文件范围裁剪策略，让 review 具备可复用、可治理的控制面。
- claims_supported:
  - review 可以被标准化为“按 phase 取变更范围 + 深度策略 + 审查产物落盘”
  - config gate（workflow.code_review 等）可以把“是否审查/审查深度”变成可配置治理面
  - review 产物（REVIEW.md）是后续 ship/verify/retro 的可追溯输入
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: gsd-code-reviewer agent, phase artifacts, workflow gates

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: commands/gsd/code-review.md

## 关键事实

- 命令目标：review 指定 phase 的变更文件，输出 `{padded_phase}-REVIEW.md`（severity-classified findings）。
- 支持 `--depth=quick|standard|deep`：
  - quick：模式匹配（约 2 分钟）
  - standard：逐文件语言检查（默认）
  - deep：跨文件分析（import graphs、call chains）
- 支持 `--files` 显式文件列表 override（最高优先级），否则由 SUMMARY 或 git diff 兜底裁剪审查范围。
- 文档明确：命令本身是 thin dispatch layer，真正的 gates 由 workflow 执行（phase validation、config gate、empty scope skip、agent spawning、result presentation）。

## 与本研究的关系

- 为 `digested_cap/03` 的“review 能力单元如何落地”为一手证据：review 不是“同一 agent 自审”，而是可配置的 workflow + 独立 reviewer agent + 产物落盘。
- 也为“迁移价值”提供支撑：phase-scoped + artifacts 的做法对企业流程更可集成。

## 可直接引用的术语 / 概念

- “thin dispatch layer”
- “severity-classified findings”
- “quick/standard/deep”
- “config gate”

## captured_excerpt

摘录（来自 `commands/gsd/code-review.md`）：

> “Produces REVIEW.md artifact … with severity-classified findings.”

## 风险与局限

- 依赖“phase 目录 + SUMMARY/git”对变更范围裁剪的准确性；如果 phase 边界定义不清，review 容易漏掉跨 phase 风险。
- 深度策略的时间成本差异较大，企业落地需要定义触发阈值（风险分级、diff size、变更类型）。

