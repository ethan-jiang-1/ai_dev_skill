# 01-planning Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_cap/*.md` 回答或标注“待验证”。

## Open Questions

### P0（决定“前置规划机制”是否可迁移）

- 哪些规划/门禁机制是“确定性实现”（schema/脚本/CI gate），而不是仅靠 prompt 约束？
- 验证前置（Nyquist-like）如何与真实测试基础设施对接？哪些约束最常失效？
- 需求澄清与设计评审的质量如何客观度量？哪些指标最容易被 Goodhart？
- context files（AGENTS.md/CLAUDE.md）应“最小到什么程度”才不会降低成功率？哪些内容必须从 context files 外移到确定性 gate/hook？（对照 `01-arxiv-2602.11988`）
- “硬门禁（禁止写代码）”在不同宿主里如何强制执行并可审计？如果只能软约束，最小可行的替代机制是什么？（对照 `/office-hours`）

### P1（影响企业迁移）

- 规划阶段把“风险与治理”前置到什么程度才合理？如何避免过度流程化拖慢？
- 规划输出的标准化格式（XML/JSON/Markdown templates）在不同宿主与工具链的迁移成本多大？
- “Completeness is cheap / boil the lake”这类偏好如何与企业交付节奏、变更风险分级、合规审计融合？哪些场景必须 scope reduction？
- plan review 的“coverage diagram / distribution check / observability is scope”哪些属于通用工程抽象，哪些是 gstack 风格化实现？
