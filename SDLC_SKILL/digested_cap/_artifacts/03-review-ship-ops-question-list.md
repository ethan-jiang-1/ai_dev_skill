# 03-review-ship-ops Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_cap/*.md` 回答或标注“待验证”。

## Open Questions

### P0（决定“review/ship/ops 能力单元”是否可信）

- builder self-review 的系统性偏差在“代码审查/安全审查”场景中如何量化？self-bias 研究给出机制证据，但在代码 review 的可观测信号与度量是什么？
- “fresh-context critic + multi-review aggregation + cross-model synthesis”的最小可落地实现是什么？哪些触发条件最合理（diff size / 风险分级 / 组件敏感度）？
- PR-centric/full-context 的 review 评价怎么做才不被文本相似度误导？如何把“覆盖 ground-truth issues”工程化为组织内的 review 质量指标（避免 LLM 评分偏差）？
- 运行时 QA（headless/截图/console/perf/交互前后差异）如何与回归资产绑定：baseline 版本化策略、不同环境（staging/prod/multi-tenant）如何避免误报？
- 发布后监控与基准（canary/benchmark）的 baseline 代表性如何保证？“只对变化报警”的阈值与 transient tolerance 在不同业务上如何调参？
- 文档同步的“最小文件集”与落地边界是什么（README/ARCHITECTURE/CLAUDE/CHANGELOG/VERSION/TODOS 等）？哪些内容必须 AskUserQuestion gate（合规/安全/叙事）？
- 状态持久化的“最小可迁移协议”是什么：checkpoint/handoff 文件应写入 repo 还是写入用户 home？如何满足团队共享、权限与审计？

### P1（风险与治理）

- 在 release/ops 里引入 agent 的最常见事故模式是什么（误改高风险文件、误报/漏报、环境不可达、权限越界、baseline 漂移）？哪些 guardrails 最有效（hard gates、artifact 落盘、hooks、CI 门禁、人工签字点）？
- 对抗性审查与多 pass 会带来成本与时延：如何定义“可接受的 review 成本预算”和降级策略（何时只做轻量检查，何时必须 full review）？
- 运行时验证链条的安全边界：browse daemon/自动化登录/cookie 注入等能力在企业合规下如何治理（审计、最小权限、密钥处理）？
