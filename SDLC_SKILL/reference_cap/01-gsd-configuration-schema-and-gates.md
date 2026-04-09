# GSD: Configuration Schema (.planning/config.json), Workflow Toggles, Gates, Safety, Parallelization, Hooks

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/docs/CONFIGURATION.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: CONFIGURATION.md 把“哪些能力单元开启/关闭、哪些阶段必须人类确认、并行度与安全策略”收敛为可版本化的 JSON schema，是典型的“确定性门禁与治理控制面”，可直接用于企业迁移时的政策映射。
- claims_supported:
  - “Absent = enabled” 是降低配置摩擦的 feature-flag 约定
  - Nyquist、plan_check、verifier、node_repair、code_review 等是可显式开关的 workflow primitives
  - gates/safety/hook/parallelization 是企业迁移的关键控制面（合规、风险、成本）
  - prompt injection guard 属于不可关闭的安全层（defense in depth）
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: `.planning/config.json`, hooks, worktrees, gh

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: docs/CONFIGURATION.md

## 关键事实

- GSD 的项目级配置文件为 `.planning/config.json`，由 `/gsd-new-project` 创建、`/gsd-settings` 更新。
- schema 覆盖：
  - workflow toggles（research/plan_check/verifier/nyquist_validation/ui_phase/node_repair 等）
  - hooks（context_warnings/workflow_guard）
  - parallelization（max_concurrent_agents/min_plans_for_parallel/plan_level 等）
  - gates（confirm_project/confirm_plan/confirm_transition 等）
  - safety（always_confirm_destructive / always_confirm_external_services）
  - security_enforcement 与 block policy（ASVS level / security_block_on）
  - agent_skills 注入（按 agent type 注入目录）
- 明确指出：workflow toggles 采用 “absent = enabled” 模式（缺省开启）。
- 说明 “prompt injection guard hook” 永远开启且不可关闭（定位为安全功能而非可选工作流）。
- 提供“recommended presets”（prototyping vs normal dev vs production release）的配置组合建议。

## 与本研究的关系

- 为 digested_cap/01 的“Hook/Gate 的确定性为什么更可靠”提供一手证据：gates/hook 不是口头建议，而是配置面与行为约束。
- 为 digested_cap/04 的迁移评估提供素材：企业落地核心在于把 workflow primitives 映射到组织政策（审批点/并行度/安全门禁/成本档位）。

## 可直接引用的术语 / 概念

- “absent = enabled”
- “workflow toggles”
- “gates”
- “safety”
- “prompt injection guard … always active”

## captured_excerpt

摘录（来自 `docs/CONFIGURATION.md`）：

> “All workflow toggles follow the absent = enabled pattern.”
>
> “The prompt injection guard hook … is always active and cannot be disabled.”

## 风险与局限

- schema 的存在不等于执行一定合规：仍需要宿主 runtime 对 gates/hook 的强制执行与审计（否则可能被绕过）。
- “absent = enabled” 在企业环境可能与“默认最小权限/最小功能”治理冲突，需要迁移时重新定义默认值与审批策略。

