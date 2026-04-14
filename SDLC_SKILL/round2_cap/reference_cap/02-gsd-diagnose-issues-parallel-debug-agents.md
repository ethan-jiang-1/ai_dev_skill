# GSD: diagnose-issues Workflow (UAT Gaps → Parallel Debug Agents → Root Cause Backfill)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/get-shit-done/workflows/diagnose-issues.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: diagnose-issues.md 把“先诊断再修复”落成可复用编排：从 UAT 的 gap 列表提取症状，按 gap 并行 spawn debug agents 找 root cause，然后把诊断回填到 UAT.md，再交给 gaps-only planning 生成精准修复计划，避免猜测式修复。
- claims_supported:
  - “Diagnose before planning fixes”是可编排的机制，不必靠自觉
  - 并行 debug agents 的输入应预填症状（UAT），减少重复收集成本
  - root cause 回填到工件（UAT.md）可作为后续修复计划的 ground truth
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: UAT.md (YAML gaps), Task(subagent_type=gsd-debugger), `.planning/debug/`

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: get-shit-done/workflows/diagnose-issues.md

## 关键事实

- core principle：UAT 提供 WHAT（symptoms），debug agents 找 WHY（root cause），然后 plan-phase --gaps 才做 fixes。
- 规定 debug session 文件写入 `.planning/debug/`。
- spawn_agents 步骤要求：
  - 读取 agent skills 注入
  - 期望 base 分支检查（worktree branch base 修正）
  - “All agents spawn in single message”（并行）
- update_uat 步骤把 root_cause、artifacts、missing、debug_session 等字段写回 UAT gaps（形成可追踪工件）。

## 与本研究的关系

- 这是“调试闭环”里把调查与修复解耦的典型机制，与 superpowers/systematic-debugging 形成互证。

## 可直接引用的术语 / 概念

- “Diagnose before planning fixes.”
- “UAT tells us WHAT … Debug agents find WHY”
- “Spawning parallel debug agents”

## captured_excerpt

摘录（来自 `diagnose-issues.md`）：

> “UAT tells us WHAT is broken (symptoms). Debug agents find WHY (root cause).”

## 风险与局限

- root cause 诊断质量仍依赖可复现环境与可观测性；若 gap 无法复现或日志不足，可能产生“inconclusive”并需要人工介入。

