# Wave 2 Cross-Dimension Synthesis (cap)

目标：把 4 条研究线收回来做横向综合，明确哪些是硬事实、哪些是分析判断、哪些是趋势推测，并且每条都能回指 `reference_cap/*.md`。

## Shared Vocabulary (Must Be Consistent)

- capability unit（能力单元）：
  - 不是“有名字的 prompt”，而是能改变执行控制流、约束动作空间、并产生可验证产物的机制化单元。
- context files（仓库级指令工件）：
  - `AGENTS.md` / `CLAUDE.md` / rules/instructions 等宿主可消费的 repo-level 配置面，通常承载“最小可运行语境”与行为边界。
- gate / hard gate（门禁）：
  - 以确定性规则阻断流程推进，把质量从“模型自觉”外移为可检查 contract（例如禁止过早写代码、必须先产出设计工件、必须有新鲜验证证据）。
- verification artifacts（验证产物）：
  - `VALIDATION.md` / `UAT.md` / `REVIEW.md` / health-history.jsonl 等可审计、可复用、可回归的证据资产。
- host portability layer（宿主可移植层）：
  - installer/rewrites/adapters/converters/tests，把目录/格式/tool/capability 差异显式映射并通过回归测试治理漂移。
- migration value（迁移价值）：
  - 面向企业落地的“净收益”判断，至少要落到 adoption complexity / governance burden / maintenance overhead / portability cost / team training cost；证据不足时必须标注“待验证”。

## Cross-Dimension Claims → Evidence Pointers

“硬事实：Context Files 仍是最主流的配置机制，但 AGENTS.md 正在走向互操作标准；同时 Skills/Subagents 等高级机制采用整体偏浅（多为静态指令）”：
- `reference_cap/04-arxiv-2602.14690-configuring-agentic-ai-coding-tools.md`

“硬事实：AGENTS.md 在可控实验中与更低 runtime 与更低 token 消耗相关（但 correctness 不在结论范围）”：
- `reference_cap/04-arxiv-2601.20404-impact-of-agents-md-efficiency.md`

“机制判断：跨宿主迁移的核心成本在映射层（paths/frontmatter/tools/capabilities）与其长期维护；需要 installer+converter+tests 将差异固化为 contract”：
- `reference_cap/04-gsd-multi-runtime-installer-and-format-conversion.md`
- `reference_cap/04-gsd-windsurf-conversion-regression-tests.md`
- `reference_cap/04-gstack-host-config-system-multi-host-portability.md`

“机制判断：高迁移价值能力单元的共同点是 determinism + auditability：用 gate/验证产物把‘完成’从语言信号变为可复核证据链”：
- `reference_cap/02-superpowers-verification-before-completion.md`
- `reference_cap/03-gsd-verify-work-uat-and-verification-artifacts.md`
- `reference_cap/03-gstack-health-skill-quality-gates.md`

“机制判断：planning 侧的 hard gate（禁止过早写代码、强制产出设计工件）与 Nyquist-like 验证前置，是把不确定性锁在低成本阶段的关键抽象”：
- `reference_cap/01-gstack-office-hours-hard-gate-design-doc.md`
- `reference_cap/01-gstack-plan-eng-review-completeness-and-coverage.md`
- `reference_cap/01-gsd-features-nyquist-plan-checker-wave-exec.md`

“机制判断：build/debug 的可靠性来自强约束协议（TDD iron law、systematic debugging phases、并发/重试/熔断）而非‘模型更聪明’，并需要把回归测试与验证产物资产化”：
- `reference_cap/02-superpowers-test-driven-development-iron-law.md`
- `reference_cap/02-superpowers-systematic-debugging-iron-law.md`
- `reference_cap/02-gsd-reference-tdd-plan-structure.md`
- `reference_cap/02-gsd-diagnose-issues-parallel-debug-agents.md`

“失败模式：self-review/self-refine 容易放大 self-bias；review 要引入 fresh-context critic、adversarial passes 与 multi-review aggregation 才能提高 issue detection”：
- `reference_cap/03-arxiv-2402.11436-llm-self-bias-self-refinement.md`
- `reference_cap/03-gstack-review-skill-adversarial-and-specialists.md`
- `reference_cap/03-arxiv-2509.01494-swr-bench-llm-code-review-benchmark.md`

“机制判断：QA/Operate 的关键是 baseline+delta，把一次性验证变成可回归资产，并尽量只对‘变化’报警降低噪音”：
- `reference_cap/03-gstack-qa-skill-runtime-verification.md`
- `reference_cap/03-gstack-canary-skill-post-deploy-monitor.md`
- `reference_cap/03-gstack-benchmark-skill-perf-regression.md`

“安全边界：skills/marketplace/MCP 进入供应链风险域；仅看 SKILL.md 文本扫描会高误报，引入仓库上下文可显著降假阳性并揭示弃置仓库劫持攻击面”：
- `reference_cap/03-arxiv-2603.16572-repo-context-skill-security.md`

“趋势：review/QA/Debug 的独立基准与拆解式评测在增强（PR-centric/full-context、comment comprehension probes、interactive debugging harness），会推动能力单元走向更可测与更可治理”：
- `reference_cap/03-arxiv-2509.01494-swr-bench-llm-code-review-benchmark.md`
- `reference_cap/03-arxiv-2503.16167-codereviewqa-code-review-comprehension.md`
- `reference_cap/02-arxiv-2604.03610-debugharness-interactive-debugging-for-apr.md`

## Framework Comparison (4 Core Abstractions)

目标：用“控制流分离 / 验证闭环前置 / 确定性门禁+对抗性审查 / 状态持久化”四大抽象，对齐 GSD、gstack、superpowers、GABBE/Loki Mode 的异同，避免只做名词堆叠。

### 1) 控制流分离（orchestrator / specialists / critic）

- GSD：显式 orchestrator→agent 架构、fresh context executor、wave-based execution 与并发冲突规避，属于“有代码与配置面”的控制流编排。`reference_cap/01-gsd-architecture-orchestrator-agent-pattern.md` `reference_cap/01-gsd-features-nyquist-plan-checker-wave-exec.md` `reference_cap/02-gsd-execute-phase-workflow-wave-parallel-runtime-fallback.md`
- gstack：更像“workflow + specialists 的组织方式”，在 `/review` 中固定引入 adversarial passes 与 specialists，并将 review log 落盘，属于“以流程与产物为中心”的控制流拆分。`reference_cap/03-gstack-review-skill-adversarial-and-specialists.md`
- superpowers：主要以“协议/铁律”定义行为边界（无占位符、TDD、系统化调试、验证优先），更偏方法论层而非 runtime 编排器；优势是宿主无关，短板是确定性 enforcement 需要宿主/工具配合。`reference_cap/01-superpowers-writing-plans-no-placeholders.md` `reference_cap/02-superpowers-systematic-debugging-iron-law.md`
- GABBE/Loki Mode：以分阶段 SDLC 编排与 gates/human checkpoints 组织控制流，更偏“治理流程框架”。`reference_cap/01-gabbe-loki-mode-sdlc-phases-rarv.md`

### 2) 验证闭环前置（validation artifacts / preflight）

- GSD：Nyquist Validation + plan checker，把“验证前置”写成明确产物与约束（`{phase}-VALIDATION.md` / UAT artifacts）。`reference_cap/01-gsd-features-nyquist-plan-checker-wave-exec.md` `reference_cap/03-gsd-verify-work-uat-and-verification-artifacts.md`
- gstack：在 `/ship` 做 preflight，并以 `/qa` 的 evidence tiers 与 health rubric 作为验证与回归资产入口。`reference_cap/03-gstack-ship-skill-preflight-telemetry.md` `reference_cap/03-gstack-qa-skill-runtime-verification.md`
- superpowers：用“无 failing test 不准写 production code”与“无新鲜验证证据不准宣称完成”把验证当成硬门禁，但需要宿主侧保证执行与产物落盘。`reference_cap/02-superpowers-test-driven-development-iron-law.md` `reference_cap/02-superpowers-verification-before-completion.md`
- GABBE/Loki Mode：以 gates 的形式将验证/审查嵌入阶段推进（更多依赖流程强制与人工门禁）。`reference_cap/01-gabbe-loki-mode-sdlc-phases-rarv.md`

### 3) 确定性门禁 + 对抗性审查（gates / adversarial）

- GSD：用 `.planning/config.json` 与 workflow gates 把安全/并发/门禁外显化；review/verify 有明确产物。`reference_cap/01-gsd-configuration-schema-and-gates.md` `reference_cap/03-gsd-code-review-command-and-artifact.md` `reference_cap/03-gsd-verify-work-uat-and-verification-artifacts.md`
- gstack：planning 侧以 hard gate（例如 `/office-hours` 禁止写代码只产出设计文档）阻断过早执行；review/文档同步等以流程与日志资产化治理漂移。`reference_cap/01-gstack-office-hours-hard-gate-design-doc.md` `reference_cap/03-gstack-document-release-skill-doc-drift.md`
- superpowers：通过强规则把“可交付的最小单元”定义得更严格（无占位符、原子步骤、明确命令/路径/测试/commit），但其 enforcement 仍需宿主与团队流程配合。`reference_cap/01-superpowers-writing-plans-no-placeholders.md`
- GABBE/Loki Mode：以 Gate 体系与 AGENTS.md 的“单一事实源”治理命令/流程/安全门禁。`reference_cap/01-gabbe-agents-md-governance-and-commands.md` `reference_cap/01-gabbe-loki-mode-sdlc-phases-rarv.md`
- 为什么需要对抗性审查：self-bias 研究支持“builder self-review 不可靠”，需要外部反馈与 adversarial passes。`reference_cap/03-arxiv-2402.11436-llm-self-bias-self-refinement.md`

### 4) 状态持久化（handoff / checkpoints / logs）

- GSD：context monitor hook + pause-work 通过 `.continue-here.md` 做交接与 WIP commit，把长程任务的“可恢复性”外显化。`reference_cap/03-gsd-pause-work-and-context-monitor.md` `reference_cap/02-gsd-reference-context-budget-rules.md`
- gstack：`/checkpoint` 明确 no-code hard gate 与结构化 checkpoint 文件；同时 review/health/canary 等以 JSONL 形式落盘形成时间序列。`reference_cap/03-gstack-checkpoint-skill-state-persistence.md` `reference_cap/03-gstack-health-skill-quality-gates.md` `reference_cap/03-gstack-review-skill-adversarial-and-specialists.md`
- superpowers：作为方法论框架，更多通过“步骤化协议”实现可恢复性，但缺少宿主级状态系统的确定性实现证据（需要结合具体宿主/工具落盘方式）。`reference_cap/01-superpowers-writing-plans-no-placeholders.md`
- GABBE：通过 AGENTS.md 与阶段化 gates 强化“单一事实源”，但其状态持久化更多表现为文档治理与命令治理。`reference_cap/01-gabbe-agents-md-governance-and-commands.md`

### 可迁移 vs 专有实现（总结）

- 最可迁移：验证产物、门禁规则、review/QA 的证据链与回归资产化（因为 determinism/auditability 更强）。
- 专有实现风险高：宿主相关的 tools、frontmatter 约束、目录约定、权限/审批模型（需要 host portability layer）。`reference_cap/04-gsd-multi-runtime-installer-and-format-conversion.md` `reference_cap/04-gstack-host-config-system-multi-host-portability.md`

## Open Gaps (Blockers to Report Readiness)

- “迁移价值评级”的硬证据仍偏稀缺：
  - 目前能证明配置机制的采用基线与部分效率收益，但 correctness/质量净收益仍缺更强因果证据与企业试点复盘。
- 多宿主映射层的长期维护成本缺可复核度量：
  - rewrites 数量增长率、回归失败频率、宿主升级引入的 breakage 统计等。
- 供应链安全治理的“最小可行方案”仍需落到可执行政策与工具链，并补真实案例：
  - 签名/锁定/隔离/审计/审批链等。

## Report Readiness Check (Self-Audit)

- [x] 能力地图每一行评级都能给出最小证据集回指（证据不足则标注“待验证”）
  - 入口：`digested_cap/04-能力地图与迁移价值判断.md`
- [x] 能就任意 SDLC 阶段写出“失控模式 + 机制 + 实证来源”的连贯段落（至少到 01-03 维度）
  - 入口：`digested_cap/01-能力单元本质与前置规划机制.md` `digested_cap/02-构建执行与系统化调试闭环.md` `digested_cap/03-审查发布运维与状态持久化.md`
- [x] 能写出“4 个框架核心抽象异同”的横向综合判断，并明确可迁移 vs 专有实现边界
  - 入口：本文件 + `digested_cap/04-能力地图与迁移价值判断.md`
- [ ] 第三方可继续深入（按 gap 列表补齐 hard evidence 与企业案例），且不需要反复重搜
  - 当前仍需要补：更多企业案例/失败复盘与 correctness 净收益证据
