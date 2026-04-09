# OpenAI: Harness Engineering (Agent-First Development, AGENTS.md as TOC, Docs-as-System-of-Record, PR/Review Loop at Scale)

- source_url: https://openai.com/index/harness-engineering/
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: 这是一份罕见的“官方工程复盘级”材料：OpenAI 团队用 Codex 构建内部产品 Harness，强调 docs/ 作为系统事实源、AGENTS.md 作为 knowledge base 的 TOC、以及以 PR 为单位的 review loop 与持续迭代。它为“状态持久化/文档治理/评审闭环/可追溯性”提供真实组织级案例与量级信息（PR 数、团队规模、迭代节奏）。
- claims_supported:
  - agent-first 的开发流程可通过文档资产化（docs/）与 repo-level 指令（AGENTS.md）实现“可持续协作”
  - AGENTS.md 被用作 knowledge base TOC，引导模型按需读取 docs 而非把所有指令塞进一个巨型文件
  - 工程实践依赖 PR/review loop，且在较大团队规模下可运行（文中提及 1,500 PRs、20+ engineers）
  - 强调“keeping the knowledge base fresh（doc gardening）”是长期可靠性的关键
- date_scope: accessed 2026-04-09
- related_frameworks: Codex, AGENTS.md, docs-as-contract
- related_tools: PR review loop, documentation governance, repo knowledge base

## 关键事实

- 文中描述 Harness 的核心“可持续机制”：将系统知识沉淀到 `docs/`，作为系统的事实源（system of record），并在 `AGENTS.md` 中维护 knowledge base 的“目录/索引”（TOC），引导模型按需定位与读取。`source_url`
- 文中明确建议“不要把所有指令塞进一个巨型 AGENTS.md”，而应该用 AGENTS.md 作为入口索引，配合结构化 docs 分层。`source_url`
- 规模信息（文中量级表述）：提到“over 1,500 PRs”与“20+ engineers”；并强调 PR/review loop 的持续运转与知识库维护。`source_url`
- 文中强调长期可靠性关键在于“keeping the knowledge base fresh”，需要持续的 doc gardening（把新知识写回 docs、删旧、保持一致性）。`source_url`

## 与本研究的关系

- 为 `round2_cap/03` 的“状态持久化/文档治理/审查闭环”提供真实案例：从“说要持久化”升级为“如何用 docs/ + AGENTS.md + PR loop 实现组织级可持续协作”。
- 也为 `round2_cap/04` 的“迁移价值”提供佐证：AGENTS.md 作为互操作趋势不仅是理论，已被用作大规模协作的入口索引；但其价值依赖于 docs 体系与维护机制，而不是文件名本身。

## 可直接引用的术语 / 概念

- “knowledge base”
- “AGENTS.md … table of contents”
- “system of record”
- “doc gardening”
- “PRs / review loop”

## captured_excerpt

摘录（来自对 AGENTS.md 的定位，保持简短）：

> “AGENTS.md … should be the table of contents for the knowledge base.”

## 风险与局限

- 这是 OpenAI 自身的工程实践总结，具备权威性但也有场景偏置（工具链、组织文化、内部基础设施）。
- 文中更多强调机制与流程，不提供严格对照实验来量化净收益；对企业迁移仍需补充独立案例与失败复盘。

