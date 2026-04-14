# 04-map-migration Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `../reference_cap/*.md` 回答或标注“待验证”。

## Open Questions

### P0（决定“能力地图评级”是否可信）

- 迁移价值如何从“主观判断”变成“可复核证据链”？最小证据集是什么（采用案例/基准/失败复盘）？
- 哪些能力单元是跨框架通用抽象（值得投资），哪些是框架包装（不建议迁移）？
- 迁移成本的主因是什么（工具链、权限/隔离、评测与回归、组织流程）？
- 对每个能力单元，能否明确其“可迁移形态”（context file / workflow+gate / installer+converter / host adapter / runtime QA asset）以及对应的最小落盘工件集合？
- portability cost 如何量化或至少结构化描述：
  - 需要维护多少条 rewrites（path/frontmatter/tool/命令名/变量）？
  - 是否需要语义级 adapter（超出 string replace）？
  - 是否存在 conversion regression tests，覆盖范围与维护频率如何？
- 社区 confirmed bugs 线索库如何转化为“企业引入前的风险评估清单”：哪些是结构性问题（宿主差异/转换层不可避免），哪些是实现缺陷（可用测试/门禁/治理显著缓解）？
- “高迁移价值”是否必须满足：有确定性门禁/验证产物/回归资产，而不仅是 prompt 文本？

### P1（趋势与生态）

- agentic SDLC 的成熟度在不同阶段是否不均衡？哪些阶段在 6-12 个月内变化最快？
- `AGENTS.md` 互操作趋势是否会形成事实标准？不同宿主对其读取范围/优先级/长度限制的差异会如何影响互操作？
- Skills/Subagents/Hooks/MCP 的采用是否会从“浅采用（静态指令）”走向“深采用（可执行工作流）”？需要什么触发条件（例如安全/审计/权限模型成熟）？
- 企业层面会更倾向采用哪类工件形态（context files vs hooks/gates vs workflows），其组织原因是什么（合规、审计、可观测性、变更控制）？
- 当 `AGENTS.md` 被宿主写成契约（scope/override/fallback/size cap）后，最佳实践应该是“AGENTS.md 作为 TOC + docs/ 作为事实源 + gates/CI 作为强制执行”吗？最小可执行模板是什么？
- “shell sandboxed 但 MCP tools 不 sandboxed”这类边界差异会如何影响未来的互操作标准？是否会推动 MCP 层出现更强的签名/allowlist/隔离规范？

### P2（安全与失败模式）

- skills/marketplace/MCP 进入供应链风险域后，最小可行治理措施是什么（provenance、仓库上下文校验、签名/锁定、隔离执行、审计）？
- 社区层面“对外部 MCP/插件不信任”的典型理由是什么，哪些可被工程化机制缓解（例如 allow/deny、sandbox、lockfiles、vendorize）？
