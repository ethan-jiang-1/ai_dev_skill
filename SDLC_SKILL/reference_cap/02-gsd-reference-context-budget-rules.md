# GSD Reference: Context Budget Rules (Keep Orchestrator Lean, Read-Depth Scaling, Early Context Rot Signals)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/get-shit-done/references/context-budget.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: context-budget.md 将“如何对抗 context rot”落到编排层规则：禁止把大文件 inline 到 prompts、按 context window 调整 read depth、以及列出“silent partial completion”等早期退化信号。这些规则是 build 阶段稳定性的关键护栏。
- claims_supported:
  - orchestrator/worker 分离必须配合 context 预算管理，否则编排层也会腐化
  - read depth 应随 context window 规模动态调整（200k vs 1M）
  - context rot 有可观测的早期信号（vagueness、skipped steps、silent partial completion）
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: `.planning/config.json` (context_window), orchestrator workflows

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: get-shit-done/references/context-budget.md

## 关键事实

- Universal rules 包含：
  - 不读 agent definitions（subagent_type 自动加载）
  - 不把大文件 inline 到 subagent prompts（让 agent 自己读盘）
  - read depth 按 context window scaling（<500k 只读 frontmatter/summary；>=500k 可读 full body）
  - orchestrator 只路由，不执行重活
- 给出 context degradation tiers（PEAK/GOOD/DEGRADING/POOR）与行为调整建议。
- 列出 context degradation warning signs：
  - silent partial completion（宣称完成但不完整）
  - increasing vagueness（“appropriate handling”等）
  - skipped steps（协议步骤被省略）

## 与本研究的关系

- 直接补足 digested_cap/02 关于 context rot 的“可操作护栏”：不仅是 fresh context，还要控制 orchestrator 的 context 预算与早期信号。

## 可直接引用的术语 / 概念

- “Read depth scales with context window”
- “silent partial completion”
- “Context Degradation Tiers”

## captured_excerpt

摘录（来自 `references/context-budget.md`）：

> “Silent partial completion — agent claims task is done but implementation is incomplete.”

## 风险与局限

- 这些规则更多是编排层 best practices；企业环境若缺少统一的 context telemetry 与强制 hook，仍难自动化执行。

