# GSD: Feature Reference (Nyquist Validation, Plan Checking, Wave Execution, Orchestration Contracts)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/docs/FEATURES.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: FEATURES.md 用“REQ-*”把关键能力单元写成可检验的需求条款，尤其是 Nyquist（验证前置）与 Phase Execution（wave 并行 + fresh context + verifier），是把“机制”从口号变成工程协议的一手证据。
- claims_supported:
  - Nyquist-like 验证前置可作为 planning 阶段的确定性契约（产生 VALIDATION.md）
  - Plan Checker 用多维度 checklist 阻断“不可执行/不可验证”的计划
  - Wave-based execution 需要并发安全策略（hook contention、STATE locking）
  - Orchestration contracts: 结果必须落盘后再被 orchestrator 消费，防止“口头汇报式完成”
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: Claude Code (and other runtimes)

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: docs/FEATURES.md

## 关键事实

- Nyquist Validation 的定义是“在写任何代码之前，把自动化验证信号映射到每条需求”，并产出 `{phase}-VALIDATION.md` 作为 test coverage contract。
- Nyquist 的 REQ-NYQ 约束包含（节选）：
  - 探测现有测试基础设施
  - 把每条 requirement 映射到具体 test command
  - 识别 Wave 0（先补脚手架）
  - plan checker 把 Nyquist compliance 作为 8th verification dimension
  - 支持 `/gsd-validate-phase` 做 retroactive validation
- `/gsd-validate-phase` 的约束（节选）：
  - 可生成 tests（max 3 attempts）
  - “Never modifies implementation code”，只改测试与 VALIDATION 工件
- Plan Checker 的 8 维校验包含 Nyquist compliance、verification commands、task atomicity、dependency ordering、file scope 等。
- Phase Execution 的定义显式绑定：
  - wave-based parallelization
  - per executor fresh context window
  - atomic git commits
  - post-execution verifier（验证 phase goals）
  - 并发安全：并行 agent 提交使用 `--no-verify`，orchestrator 每 wave 后统一跑 hooks；STATE.md locking 防止并发写冲突。
- Multi-Agent Orchestration 的 REQ-ORCH 明确：
  - 每个 agent 必须 fresh context
  - orchestrator 必须 thin
  - agent results 必须先写入磁盘再处理
  - 必须检测“失败 agent 的假失败/假成功”。

## 与本研究的关系

- 这是 Nyquist Layer 是否为“确定性机制”而非“提示词号召”的关键一手来源：它明确产物、命令、约束与禁止项（如 validate-phase 不改实现代码）。
- 为 build/debug/verify 的闭环提供了可迁移的协议化表达方式（REQ-*）。

## 可直接引用的术语 / 概念

- “Nyquist Validation”
- “Test coverage contract”
- “Plan Checker Verification (8 Dimensions)”
- “Wave Execution”
- “Atomic git commits”
- “Agent results MUST be written to disk before orchestrator processes them”

## captured_excerpt

摘录（来自 `docs/FEATURES.md`）：

> “Map automated test coverage to phase requirements before any code is written.”
>
> “Never modifies implementation code — only test files and VALIDATION.md”

## 风险与局限

- REQ 列表表达的是目标与规范，实际执行质量仍依赖宿主工具（例如并发执行能力、git hook 行为、测试基础设施）与团队约束力。
- validate-phase “不改实现代码”会把发现的实现 bug 推给人工处理；企业落地需要定义“谁来接这个 escalation”。

