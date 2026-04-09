# GSD: `gsd:verify-work` (Conversational UAT, Persistent UAT.md, Diagnosis→Fix Planning Routing)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/commands/gsd/verify-work.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: GSD 把“验证是否真的工作”做成持久化的对话式 UAT 工作流：一条一条可观察 truth 测试，结果写入 `{phase}-UAT.md`（含 gaps 的机器可消费 YAML），发现问题后自动进入 diagnosis 与 fix planning，并为下一步 `/gsd-execute-phase` 准备可执行修复计划，避免“宣称完成但没证据”的失真。
- claims_supported:
  - verify/uat 能力单元应落盘成可追溯文件，而不是聊天记录
  - 把 gaps 写成机器可消费结构（YAML）可直接喂给后续 planning/execution，形成闭环
  - verify-work 的“发现问题→诊断→修复计划”路由能系统化减少漏修与重复
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: verify-work workflow, UAT.md template, phase artifacts

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_paths:
  - commands/gsd/verify-work.md
  - get-shit-done/templates/UAT.md
  - get-shit-done/templates/verification-report.md
  - get-shit-done/templates/VALIDATION.md

## 关键事实

- `gsd:verify-work` 的目标明确：用“conversational testing with persistent state”验证从用户视角是否可用，输出 `{phase_num}-UAT.md`。
- UAT.md 模板要求：
  - frontmatter 标注 status/testing lifecycle
  - Current Test 作为单测驱动的状态机（每次 transition 覆盖）
  - Tests 区域逐条记录 expected 与 result（pass/issue/blocked/skipped）
  - Gaps 区域以 YAML 追加写入 failed truths，并在诊断后填充 root cause / artifacts / missing / debug_session，使其可被后续 planning 消费
- VALIDATION.md 模板把每个 phase 的验证策略写成 contract（sampling rate、per-task verification map、manual-only verifications、nyquist_compliant 等），把“验证前置”变成显式门禁面。
- verification-report.md 模板提供 goal-backward 的验证报告框架（observable truths、required artifacts、wiring、anti-patterns、human verification），让 verify 结果可审计。

## 与本研究的关系

- 为 `digested_cap/03` 的“验证闭环必须持久化、可回指”提供一手证据：UAT.md/VALIDATION/verification-report 把验证从口头变成文件资产。
- 也为“迁移价值判断”提供可迁移样本：truth 表格、wiring 检查、anti-patterns 的结构适合企业 QA/交付验收口径。

## 可直接引用的术语 / 概念

- “conversational testing with persistent state”
- “Gaps (YAML format for plan-phase --gaps consumption)”
- “nyquist_compliant”
- “Goal-backward”

## captured_excerpt

摘录（来自 `commands/gsd/verify-work.md` 与 UAT 模板）：

> “Validate built features through conversational testing with persistent state.”
>
> “Gaps … YAML format for plan-phase --gaps consumption”

## 风险与局限

- 对话式 UAT 依赖用户协作与可观察反馈；对复杂系统（需要真实设备/第三方集成/权限）常会落入 human_needed，需要预设人工验收流程。
- 验证结构越强，越需要与团队的需求/验收口径对齐，否则会出现“文档很好看但不被采用”的形式化风险。

