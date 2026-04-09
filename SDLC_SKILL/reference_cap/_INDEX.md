# reference_cap Index

目标：快速回答“cap 的某个判断的证据在哪里”，减少翻找成本，支持 30 秒回指。

维护方式：新增或更新 `reference_cap/*.md` 后，同步补一行到这里即可。

| File | related_dimension | trust_level | Supports (short) |
|---|---|---|---|
| _TEMPLATE-reference.md | shared | official | Template only |
| 01-gabbe-agents-md-governance-and-commands.md | 01-planning | official | GABBE 用 AGENTS.md 作为“单一事实源”约束命令/流程/安全与研究门禁 |
| 01-gabbe-loki-mode-sdlc-phases-rarv.md | 01-planning | official | Loki Mode 10-phase SDLC 编排 + RARV 循环 + human gates + 质量门禁 |
| 01-gsd-architecture-orchestrator-agent-pattern.md | 01-planning | official | GSD 的 orchestrator→agent 架构、fresh context、file-based state、并发波次与冲突规避 |
| 01-gsd-features-nyquist-plan-checker-wave-exec.md | 01-planning | official | Nyquist Validation、计划检查 8 维、wave-based execution、并发安全与验证闭环 |
| 01-gsd-configuration-schema-and-gates.md | 01-planning | official | `.planning/config.json` 的 schema、workflow toggles、gates/safety/parallelization/hook 的确定性配置面 |
| 01-gstack-office-hours-hard-gate-design-doc.md | 01-planning | official | /office-hours 的“硬门禁”与 forcing questions：只产出设计文档不写代码，先诊断再给方案 |
| 01-gstack-plan-ceo-review-scope-modes-and-directives.md | 01-planning | official | /plan-ceo-review 的 scope 模式 + completeness cheap + zero silent failures 等 CEO review 规则 |
| 01-gstack-plan-eng-review-completeness-and-coverage.md | 01-planning | official | /plan-eng-review 的 Step0 scope challenge、search/check、coverage diagram 与“完整性”偏好 |
| 01-superpowers-writing-plans-no-placeholders.md | 01-planning | official | 写计划的“无占位符 + 原子步骤 + 明确命令/路径/测试/commit”协议 |
| 01-arxiv-2511.12884-agent-readmes-context-files.md | 01-planning | academic | 大样本研究 context files：像配置代码一样演化；功能指令多，安全/性能等非功能指令稀缺 |
| 01-arxiv-2602.11988-evaluating-agents-md-helpfulness.md | 01-planning | academic | 实证评估 AGENTS.md：不当/冗余上下文可能降低成功率并提高成本；建议最小化要求 |
| 02-superpowers-test-driven-development-iron-law.md | 02-build-debug | official | “无 failing test 不准写 production code”的硬规则与 RED-GREEN-REFACTOR 流程 |
| 02-superpowers-systematic-debugging-iron-law.md | 02-build-debug | official | 系统化调试四阶段 + 禁止未找根因就修复 + 3 次失败触发架构质疑 |
| 02-superpowers-verification-before-completion.md | 02-build-debug | official | “没有新鲜验证证据就不能宣称完成”的 gate，防止 false completion 与信任破产 |
| 02-gstack-investigate-skill-root-cause-hooks.md | 02-build-debug | official | gstack /investigate：四阶段调试 + root-cause-first + Edit/Write scope boundary hooks |
| 02-gsd-execute-phase-workflow-wave-parallel-runtime-fallback.md | 02-build-debug | official | execute-phase 编排：wave 并发、fresh executor、runtime 兼容与“以 git/文件 spot-check 替代 completion signal” |
| 02-gsd-node-repair-autonomous-operator.md | 02-build-debug | official | node-repair：失败后 RETRY/DECOMPOSE/PRUNE/ESCALATE 的结构化修复与预算/日志协议 |
| 02-gsd-diagnose-issues-parallel-debug-agents.md | 02-build-debug | official | diagnose-issues：UAT gaps → 并行 debug agents 找 root cause → 回填 UAT → 交给 gaps-only planning |
| 02-gsd-reference-tdd-plan-structure.md | 02-build-debug | official | GSD 的 TDD plan 类型、RED/GREEN/REFACTOR 产物与 commit 模式、以及 context budget 约束 |
| 02-gsd-reference-context-budget-rules.md | 02-build-debug | official | orchestrator context budget 规则与“context rot 早期信号”（silent partial completion 等） |
| 02-arxiv-2506.09289-utboost-swebench-test-augmentation.md | 02-build-debug | academic | SWE-Bench 评测失败模式：测试不足导致错误 patch 也能过；UTGenerator/UTBoost 用 test augmentation 改善可靠性 |
| 02-arxiv-2510.18327-inspectcoder-interactive-debugger.md | 02-build-debug | academic | 交互式 debugger 动态分析 + 双 agent（inspector/coder）将调试从 trial-and-error 变为根因诊断 |
| 02-arxiv-2604.03610-debugharness-interactive-debugging-for-apr.md | 02-build-debug | academic | 2026 趋势：APR 引入“实时运行时查询/交互调试”模拟人类 debug，弥补静态 agent 易卡在 symptom 的缺陷 |
| 03-gstack-architecture-browser-daemon-security.md | 03-review-ship-ops | official | 持久化浏览器 daemon、localhost+token 安全模型、ref/locator 交互机制、SKILL.md 防漂移生成 |
| 03-gstack-skill-browse-qa-routing.md | 03-review-ship-ops | official | gstack 的技能路由规则 + browse/QA 工作流（snapshot/refs/diff/console/network/cookie） |
| 03-gstack-ship-skill-preflight-telemetry.md | 03-review-ship-ops | official | gstack /ship 的 preflight、测试/审查/PR 流水线、以及遥测/路由注入等治理机制 |
| 03-arxiv-2602.14690-configuring-agentic-ai-coding-tools.md | 04-map-migration | academic | “配置机制谱系”与 OSS 采用基线：Context Files 占主导、AGENTS.md 走向互操作标准、Skills/Subagents 浅采用 |
| 03-arxiv-2603.16572-repo-context-skill-security.md | 03-review-ship-ops | academic | 技能生态安全：仅看 SKILL.md 会高误报；引入仓库上下文可显著降假阳性并揭示“弃置仓库劫持”攻击面 |
| 04-community-gsd-copilot-integration-reddit.md | 04-map-migration | community | GSD 向 Copilot/Kilo 等宿主迁移的真实摩擦点：语言依赖、MCP 供应链顾虑、互操作路径讨论 |
