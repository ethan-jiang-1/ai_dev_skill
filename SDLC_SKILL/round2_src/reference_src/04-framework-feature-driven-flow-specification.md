# Feature-Driven-Flow: Runtime & Artifact Specification (`docs/specification.md`)

- source_url: https://github.com/QuasarByte/feature-driven-flow/blob/main/docs/specification.md
- source_type: official_repo_doc
- accessed_at: 2026-04-09
- published_at: 2026-03-04
- related_topic: framework
- trust_level: official
- why_it_matters: README 之外的机制细节一手来源，直接定义 FDF 的“运行时语义与工件契约”：固定七阶段、规则/档案/矩阵的关系、显式 gate 与 checklist、设置与优先级栈、packs/persistence/manifest/validation 边界。它能支撑“FDF 是审计治理派框架”的可验证机制证据，而非仅口号。

## Key Facts

- FDF 的运行必须按固定七阶段顺序执行：`Scope -> Explore -> Clarify -> Architect -> Implement -> Verify -> Summarize`。（Ref: specification.md）
- Rule 定义为 phase-scoped policy unit（markdown），包含适用阶段、可验证 checks（用于 checklist 派生）与 required outputs。（Ref: specification.md）
- Profile 是可复用 policy bundle；profile 只是输入，编译出的 Effective Rule Matrix 才是 canonical execution artifact。（Ref: specification.md）
- Effective Rule Matrix（按 phase 列出 rule IDs）在 Scope 阶段被导入/编译并校验，并必须被用户显式确认；Scope 之后变更 matrix 需要 before/after diff + 显式批准。（Ref: specification.md）
- Gates 与 checklists：phase checklist 由 active rules 的 checks 并集导出；记录 `passed|blocked|n/a`；存在 blocking item 时 gate_status 必须为 `blocked`；phase 迁移要求 `gate_status: ready`。（Ref: specification.md）
- 明确给出 precedence（高到低）与冲突处理：conductor invariants -> `AGENTS.md` policy -> settings precedence（global -> repo -> snapshot -> user-confirmed）-> pack enablement -> user-confirmed matrix -> active rules（shared then local refinements）。（Ref: specification.md）
- Settings 是可版本化 JSON，包含 global defaults、repo-local overrides 与可选 run snapshot；settings 控制 matrix 与 effective instructions 的 import/export 策略与路径策略。（Ref: specification.md）
- Packs 是可选资产包（rules/profiles/templates/references），通过 settings 启用；并列出 async-collab、quality、hardening、presets 等 pack。（Ref: specification.md）
- persistence/async team workflow 通过 pack 定义：在 run 目录下产出 phase files、shared logs、team packets 与可选 portability exports（RUNBOOK/state.json 等）。（Ref: specification.md）
- Manifests 是“可发现/工具输入”，由脚本生成（core + packs），不是额外的行为源。（Ref: specification.md）
- Validation boundary：验证对 runtime 可选但对贡献者/发布推荐；validator 脚本会校验 settings 与 effective artifacts 是否符合 JSON schema。（Ref: specification.md）

## Claims Supported

- “FDF 把工程治理从 prompt 口号落为可验证工件与显式 gate：用 checks 派生 checklist、用 gate_status 控制阶段迁移，并把执行计划固化为用户确认的 Effective Rule Matrix。”（主题 4 framework；机制）
- “FDF 的优先级栈把核心不变量、repo 政策（AGENTS.md）与 settings/matrix/规则覆写关系显式化，使团队能在不破坏核心不变量的前提下做本地定制。”（主题 4 framework；团队治理）
- “FDF 通过 packs + persistence 把异步协作与可移植状态导出纳入框架机制，而不是依赖‘聊天记忆’。”（主题 4 framework；趋势/难点）

## Captured Excerpts (keep short)

> FDF always runs 7 phases in fixed order.

## Terms / Concepts

- phases (Scope/Explore/Clarify/Architect/Implement/Verify/Summarize)
- rule / profile
- Effective Rule Matrix
- gates / checklists / `gate_status`
- settings precedence
- packs / async-collab
- manifests / validation boundary

## Risks / Limits

- 该规范是仓库内的“框架自定义义”；在不同宿主（Codex/Claude 等）上的真实强制性，仍依赖对应 skill/command 的实现与宿主的执行边界。

