# GSD: node-repair Workflow (Retry/Decompose/Prune/Escalate, Repair Budget, Deviation Logging)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/get-shit-done/workflows/node-repair.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: node-repair.md 把“失败后如何修复”写成结构化 operator：强制在 RETRY/DECOMPOSE/PRUNE/ESCALATE 四种策略中二选一，并有预算与日志协议。这是防止 agent 无限重试与盲修的关键机制。
- claims_supported:
  - 失败修复应是结构化策略选择，而不是随机尝试
  - repair budget 是熔断机制，避免无限消耗
  - DECOMPOSE 是把“任务过粗导致失败”转换为可验证子任务的机制
  - 所有偏离计划必须写入 SUMMARY.md（可审计）
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: execute-plan workflow, SUMMARY.md

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: get-shit-done/workflows/node-repair.md

## 关键事实

- Repair directive 要求“选择 exactly one strategy”：
  - RETRY：具体调整后再试
  - DECOMPOSE：拆成最多 3 个可验证子任务（内存中替换，不改 PLAN.md）
  - PRUNE：不可行则跳过并给理由
  - ESCALATE：预算耗尽或需要架构决策则升级给人类
- constraints 明确：
  - repair budget 默认 2（可配置）
  - Never modify PLAN.md on disk
  - 若 node_repair 关闭则直接走 failure gate
- logging 规定所有修复行为必须写入 SUMMARY.md 的“Deviations from Plan”。

## 与本研究的关系

- 直接支撑 round2_cap/02 中的“熔断/重试上限/优雅退出”机制（与 RARV 的 verify+budget 同类）。

## 可直接引用的术语 / 概念

- “RETRY / DECOMPOSE / PRUNE / ESCALATE”
- “Repair budget”
- “Deviations from Plan”

## captured_excerpt

摘录（来自 `node-repair.md`）：

> “Analyze the failure and choose exactly one repair strategy.”

## 风险与局限

- 该机制的有效性取决于“失败信号”的质量（done-criteria/测试是否能真实捕捉 bug），否则可能出现“错误信号驱动错误修复”。

