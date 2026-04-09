# 03-review-ship-ops Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_cap/*.md` 回答或标注“待验证”。

## Open Questions

### P0（决定“review/ship/ops 能力单元”是否可信）

- builder self-review 的系统性偏差有哪些可复核证据？critic/consensus 机制在哪些场景显著改善？
- 运行时 QA（Playwright/headless/视觉 diff/性能）与发布监控（canary/benchmark）怎样形成回归资产？
- 文档同步与状态持久化的“最小文件集”是什么？如何防止“文档漂移”？

### P1（风险与治理）

- 在 release/ops 里引入 agent 的最常见事故模式是什么？哪些 guardrails 最有效？

