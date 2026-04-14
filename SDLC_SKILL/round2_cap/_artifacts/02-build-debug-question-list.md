# 02-build-debug Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `../reference_cap/*.md` 回答或标注“待验证”。

## Open Questions

### P0（决定“Build/Test/Debug 抽象”是否能稳态）

- context rot 的“可观测信号”是什么？哪些架构机制能实证缓解？
- context rot 的早期退化信号中，哪些最可操作（silent partial completion / vagueness / skipped steps）？如何自动检测？
- orchestrator/worker 分离的最小实现是什么？哪些变体在真实项目里最有效？
- wave-based 并行执行的最小必要条件是什么（依赖图、文件冲突、hook contention、完成信号不可靠时的 spot-check fallback）？
- TDD enforcement 与 systematic debugging 的“硬约束点”应落在哪里（git hooks/CI gates/patch rollback/sandbox permissions）？
- 何时自动重试，何时熔断？熔断后的人工介入接口如何设计？
- 失败后的修复策略（RETRY / DECOMPOSE / PRUNE / ESCALATE）如何与企业的 escalation 流程、权限边界与审计要求对齐？
- 当现有测试不足时，如何保证“验证信号可靠性”（Nyquist/test augmentation/更强 oracle）而不引入不可控成本？
- 动态分析/交互式调试（debugger session）落地的最低工程前置条件是什么（可复现环境、隔离、权限、日志、可回放）？

### P1（影响迁移成本）

- 不同宿主（IDE vs GitHub Actions vs self-hosted runners）对执行隔离、权限与成本的约束差异？
- TDD enforcement 在遗留系统与缺测试基建团队的渐进落地路径：Wave 0 应如何定义、谁来维护？
- 如何把 “Verification Before Completion” 这类 gate 转成可自动执行的 CI 门禁（避免依赖执行者自觉）？
