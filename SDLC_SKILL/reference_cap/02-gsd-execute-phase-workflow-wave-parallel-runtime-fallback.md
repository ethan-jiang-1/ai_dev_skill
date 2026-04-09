# GSD: execute-phase Workflow (Wave-Based Parallel Execution, Runtime Compatibility, Spot-Check Completion)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/get-shit-done/workflows/execute-phase.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: execute-phase.md 是“wave-based execution”如何真正编排落地的工作流协议，包含并发/依赖分组、runtime 差异（Copilot completion signal 不可靠）、以及“用 git/文件 spot-check 判定完成”的防阻塞策略。
- claims_supported:
  - Orchestrator stays lean：只协调不执行
  - 并行执行必须处理 runtime 差异与 completion signal 不可靠问题
  - 通过“文件存在 + git 提交 + SUMMARY.md”等 spot-check 把完成判定外置为可复核证据
  - context enrichment/工作树隔离/auto-chain 清理等属于执行稳定性的确定性机制
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: gsd-tools.cjs, Task(subagent_type=...), worktrees, git

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: get-shit-done/workflows/execute-phase.md

## 关键事实

- Purpose：按 wave 并行执行 phase 内所有 plans；Orchestrator：discover→analyze deps→group waves→spawn agents→handle checkpoints→collect results。
- Runtime compatibility 明确指出：
  - Claude Code 可 `Task(subagent_type="gsd-executor")` 并等待完成
  - Copilot 下 subagent completion signal 不可靠，默认改为 sequential inline execution
  - “Never block indefinitely waiting for a signal”，要用 filesystem/git spot-check 判断成功并继续
- required_reading 指向 agent-contracts/context-budget/gates（说明这些是执行编排的约束模块）。
- initialize 阶段通过 `gsd-tools.cjs init execute-phase` 一次性加载 context，并读取 worktrees 与 context window 配置，决定是否做更丰富注入。
- 明确的反“auto-chain stale flag”机制：非 `--auto` 调用必须清理临时 chain flag，避免错误 auto-advance。

## 与本研究的关系

- 为 digested_cap/02 的“wave-based execution”提供工作流级证据：不仅有概念，还有运行时兼容与防阻塞策略。
- 作为失败模式的直接回应：completion signal 不可靠时如何保证 pipeline 不挂死，并仍可用证据推进。

## 可直接引用的术语 / 概念

- “Orchestrator coordinates, not executes.”
- “Fallback rule … verify via filesystem and git state.”
- “Never block indefinitely waiting for a signal”

## captured_excerpt

摘录（来自 `execute-phase.md`）：

> “Never block indefinitely waiting for a signal — always verify via filesystem and git state.”

## 风险与局限

- spot-check 依然可能漏掉语义层错误（文件存在但不正确）；必须与 verifier/测试门禁配合，避免“结构完成但功能错误”。

