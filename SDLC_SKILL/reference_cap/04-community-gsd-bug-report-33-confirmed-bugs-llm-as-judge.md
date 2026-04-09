# GSD Bug Report: 33 Confirmed Bugs and Issues (LLM-as-judge) (2026-02-01)

- source_url: https://gist.github.com/mikeyobrien/4cfeb39f610f824c7e5ce7777f1fa9d6
- source_type: community
- accessed_at: 2026-04-09 14:46:33 +0800
- related_dimension: 04-map-migration
- trust_level: community
- why_it_matters: “迁移价值/可落地性”必须包含真实失败模式与维护风险，而不是只看框架作者的 happy path。这份社区 bug report 把一次真实使用的故障面系统整理为可复核清单：在 138 个 issues 中用 LLM-as-judge 标注出 33 个 confirmed bugs，并按 phase/领域分类（install/update/planning/execution/research/map-codebase/platform/migration 等），提供了非常密集的 adoption risk 证据，用于校准“高迁移价值”评级的风险面与治理成本。
- claims_supported:
  - GSD 在真实使用中存在跨阶段的已确认故障面，涉及安装/更新、规划/讨论阶段、执行与 agent 可靠性、研究/映射性能、平台兼容、迁移工作流等
  - 迁移与长期运维风险不仅是“prompt 漂移”，还包括工具链/运行时/依赖/平台差异带来的硬故障
  - “完成信号不可靠/进度不一致/长任务耗时”是实际落地时必须用 gates、验证产物与状态持久化来治理的风险类目
- date_scope: 2026-02-01（gist 标注）；覆盖的仓库状态指向 commit `726737a`（gist 内说明）
- related_frameworks: get-shit-done (GSD)
- related_tools: installer/update workflow, planning/discuss/execution phases, map-codebase, migration workflow, UI/session state

## 关键事实

- 该 gist 自称为 “GSD bug report”，并给出：
  - total issues reviewed：138
  - total confirmed bugs：33
  - 方法：LLM-as-judge（文中给出 rubric，并按分类整理）
- 该 report 将 confirmed bugs 分布在多个类别（原文分类，按条数汇总）：
  - Installation and Update Issues: 4
  - Planning and Discussion Issues: 4
  - Execution and Agent Reliability Issues: 4
  - Research and Mapping Phase Issues: 4
  - Platform and Compatibility Issues: 4
  - Tool/Command Issues: 4
  - UI and Session Management Issues: 3
  - Migration and Codebase Support Issues: 2
- 报告中点名的一些“落地级”痛点类型（摘取代表性描述，需回到原 gist 逐条核对）：
  - update/install 对本地安装与版本的破坏性行为
  - 并发/并行配置不生效、或行为与预期不一致
  - 长任务（例如 map-codebase）耗时极长（小时级）
  - 平台/运行时兼容问题（例如 ESM/CJS、依赖版本）
  - 迁移现有代码库的工作流失败或不稳定

## 与本研究的关系

- 为 `digested_cap/04` 的“迁移价值评级”补齐失败模式证据：
  - 不是抽象争论，而是可枚举的 bug surface（并按阶段分类），可直接映射到 adoption complexity / maintenance overhead / portability cost / team training cost。
- 反向支撑 `digested_cap/02` 与 `digested_cap/03` 的必要性：
  - “验证闭环前置”“无新鲜验证不准宣称完成”“状态持久化交接”等机制，正是对这些常见故障类别的工程化回应。

## 可直接引用的术语 / 概念

- “LLM-as-judge”
- “confirmed bugs”
- phase-scoped bug taxonomy（install/update/planning/execution/research/migration）

## captured_excerpt

> “Total confirmed bugs: 33”

## 风险与局限

- 该材料是社区 gist，并非同行评审论文；且使用 LLM-as-judge 方法，结论可能受提示词、采样与评判偏差影响。
- “confirmed” 的证据标准与复现条件依赖原作者的记录与 issue 内容；适合作为风险清单与线索库，而不应单独作为最终结论来源。
