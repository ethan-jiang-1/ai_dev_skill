# 02-build-debug Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_cap/*.md` 回答或标注“待验证”。

## Open Questions

### P0（决定“Build/Test/Debug 抽象”是否能稳态）

- context rot 的“可观测信号”是什么？哪些架构机制能实证缓解？
- orchestrator/worker 分离的最小实现是什么？哪些变体在真实项目里最有效？
- TDD enforcement 与 systematic debugging 的“硬约束点”应落在哪里（git hooks/CI gates/patch rollback/sandbox permissions）？
- 何时自动重试，何时熔断？熔断后的人工介入接口如何设计？

### P1（影响迁移成本）

- 不同宿主（IDE vs GitHub Actions vs self-hosted runners）对执行隔离、权限与成本的约束差异？

