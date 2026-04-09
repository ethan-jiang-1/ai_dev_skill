# GSD: Architecture (Fresh Context, Thin Orchestrators, File-Based State, Wave Execution)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/docs/ARCHITECTURE.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: 这是对 GSD “为什么这样设计”的一手解释，覆盖 orchestrator→agent 分工、fresh context、wave 执行、并发冲突规避与 file-based state，直接支撑“能力单元=改变执行机制”的核心论点。
- claims_supported:
  - “Fresh context per agent”用架构手段对抗 context rot
  - “Thin orchestrators”作为调度层，避免把执行细节与决策耦合进同一上下文
  - “File-based state”让状态跨会话/跨 agent 可复核、可审计、可版本化
  - “Wave execution + 并发安全”是工程可扩展性的关键机制，不是 prompt 技巧
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: Claude Code, Gemini CLI, OpenCode, Kilo, Codex, Copilot (and others per doc)

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: docs/ARCHITECTURE.md

## 关键事实

- GSD 被定义为“meta-prompting framework”，目标是提供：
  - context engineering
  - multi-agent orchestration
  - spec-driven pipeline
  - state management（落盘于 `.planning/`）
- 明确的设计原则包括：
  - Fresh Context Per Agent（每次 spawn 新 agent 使用干净上下文来消除 context rot）
  - Thin Orchestrators（编排层不做重活，只做 init/spawn/collect/route/state update）
  - File-Based State（所有状态写入 `.planning/`，可 inspect、可 git 提交）
  - Absent = Enabled（feature flags 缺省为 enabled，显式关闭）
  - Defense in Depth（计划执行前验证、任务原子提交、后置 verifier、UAT）
- 文档给出明确的 Orchestrator → Agent Pattern：workflow 通过 `gsd-tools.cjs` 完成 init、model resolution、state update 等确定性动作。
- Wave Execution Model：按依赖分 wave 并行执行；并给出并发安全策略：
  - 并行 agent 使用 `--no-verify` 避免 pre-commit hooks 的资源争用
  - STATE.md lockfile（`O_EXCL`）避免并发写腐化（含超时与抖动重试）
- 还描述了 1M context 模型下的“Adaptive Context Enrichment”，通过 config 读取 `context_window` 来决定是否注入更丰富上下文（SUMMARY/RESEARCH/CONTEXT 等）。

## 与本研究的关系

- 作为 “Orchestrator/Worker 分离 + fresh context + state persistence” 的一手来源，能够直接支撑 round2_cap 里关于“对抗 context rot 的最强抽象之一”的判断。
- 提供“并发执行不可避免的工程冲突点”与可复核的缓解机制（hook contention、state write races）。

## 可直接引用的术语 / 概念

- “Fresh Context Per Agent”
- “Thin Orchestrators”
- “File-Based State”
- “Absent = Enabled”
- “Wave Execution Model”
- “STATE.md file locking”

## captured_excerpt

摘录（来自 `docs/ARCHITECTURE.md`）：

> “Every agent spawned by an orchestrator gets a clean context window … This eliminates context rot …”
>
> “All state lives in `.planning/` as human-readable Markdown and JSON.”

## 风险与局限

- 架构文档反映的是框架作者意图与实现概览；企业迁移仍需结合真实使用复盘（人机协作成本、团队流程冲击、CI 兼容性）。
- 多 agent 并发的冲突规避机制依赖 git 工作流、hook 行为与工具链细节；不同语言生态（Rust/Go/monorepo）可能出现新的瓶颈点。

