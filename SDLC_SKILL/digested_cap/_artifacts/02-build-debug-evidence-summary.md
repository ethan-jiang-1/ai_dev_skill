# 02-build-debug Evidence Summary (Wave 1/2)

目标：把“构建执行与系统化调试闭环”的关键判断，压缩成可复用的 evidence map（每条都有 `reference_cap/*.md` 回指）。

## Key Claims → Evidence Pointers

“Build 阶段最致命的问题是 context rot；架构性缓解来自 orchestrator/worker 分离 + fresh context + wave 执行”：
- GSD 架构原则：Fresh Context Per Agent、Thin Orchestrators、Wave Execution Model（`reference_cap/01-gsd-architecture-orchestrator-agent-pattern.md`）
- execute-phase 工作流：wave-based execution + runtime fallback（completion signal 不可靠时用 git/文件 spot-check）+ context enrichment（`reference_cap/02-gsd-execute-phase-workflow-wave-parallel-runtime-fallback.md`）
- 编排层 context budget 规则：read depth scaling + context rot 早期信号（silent partial completion / vagueness / skipped steps）（`reference_cap/02-gsd-reference-context-budget-rules.md`）

“并行执行要可落地，必须显式处理冲突与确定性门禁（hooks contention、state 写竞争、完成信号不可靠）”：
- Wave 并行安全：`--no-verify` 避免 hooks 争用、STATE.md lockfile 防止并发写腐化（`reference_cap/01-gsd-architecture-orchestrator-agent-pattern.md`）
- runtime compatibility：Copilot 下默认顺序执行；不因 completion signal 挂死 pipeline（`reference_cap/02-gsd-execute-phase-workflow-wave-parallel-runtime-fallback.md`）

“强制 TDD 的价值在于改变控制流：无 failing test 不准写实现；并把 TDD 作为 plan type 协议化”：
- superpowers TDD Iron Law（`reference_cap/02-superpowers-test-driven-development-iron-law.md`）
- GSD TDD plan type：一 feature 一 plan + RED/GREEN/REFACTOR 的 commit 协议（`reference_cap/02-gsd-reference-tdd-plan-structure.md`）

“系统化调试的关键是剥夺盲改权限：先根因调查，再最小实验，再修复；必要时用 hooks 限制写入范围”：
- superpowers systematic debugging Iron Law + 四阶段 + 3 次失败触发架构质疑（`reference_cap/02-superpowers-systematic-debugging-iron-law.md`）
- gstack /investigate：root-cause-first + Edit/Write 前的 scope boundary hooks（`reference_cap/02-gstack-investigate-skill-root-cause-hooks.md`）

“失败后修复不应无限重试，应结构化选择策略并设预算（RETRY/DECOMPOSE/PRUNE/ESCALATE）”：
- GSD node-repair operator（`reference_cap/02-gsd-node-repair-autonomous-operator.md`）

“先诊断（WHY）再计划修复（WHAT TO CHANGE）可以规模化：UAT gaps → 并行 debug agents → 回填 root cause → gaps-only 计划”：
- GSD diagnose-issues workflow（`reference_cap/02-gsd-diagnose-issues-parallel-debug-agents.md`）

“没有新鲜验证证据就不能宣称完成；否则会产生系统性 false completion 与信任破产”：
- superpowers verification-before-completion gate（`reference_cap/02-superpowers-verification-before-completion.md`）

“验证信号本身可能是坏的：弱测试会把错误 patch 标成通过；需要 test augmentation/更强 oracle”：
- UTBoost 揭示 SWE-Bench false positives，并用 UTGenerator/test augmentation 改善可靠性（`reference_cap/02-arxiv-2506.09289-utboost-swebench-test-augmentation.md`）

“趋势：调试能力从静态分析/日志走向动态分析与交互式 debugger，会话级状态与过程奖励成为关键”：
- InspectCoder：interactive debugger control + dual-agent（inspector/coder）（`reference_cap/02-arxiv-2510.18327-inspectcoder-interactive-debugger.md`）
- DebugHarness：主动查询 live runtime + watchpoints + closed-loop validation（`reference_cap/02-arxiv-2604.03610-debugharness-interactive-debugging-for-apr.md`）

## Notes

- 仅记录可回指证据，不在此处做长篇推理。
