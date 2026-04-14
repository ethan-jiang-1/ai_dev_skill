# gstack: /plan-ceo-review (Scope Modes, Completeness Is Cheap, Zero Silent Failures)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/plan-ceo-review/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: /plan-ceo-review 把“计划审查”塑造成强约束的交互式 gate：用四种 scope mode、显式 opt-in 机制（每个 scope 变化必须 AskUserQuestion）、以及“zero silent failures/diagrams/observability”等 prime directives，系统性提高计划质量与可交付性。
- claims_supported:
  - “计划不是待办清单”，必须包含 failure modes、错误路径、可观测性与可验证性
  - “用户主权”通过显式 opt-in 防止模型暗自扩张/缩减 scope
  - “Completeness is cheap”体现 AI 降边际成本后的计划审查新取向（偏好完整实现而非捷径）
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: AskUserQuestion, WebSearch, git

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: plan-ceo-review/SKILL.md

## 关键事实

- 四种 mode：
  - SCOPE EXPANSION
  - SELECTIVE EXPANSION
  - HOLD SCOPE
  - SCOPE REDUCTION
- 关键规则：
  - “每个 scope 变化必须显式 opt-in（AskUserQuestion）”，禁止 silent add/remove，且选定 mode 后不得漂移。
  - “Do NOT make any code changes”，该技能只做 plan review。
- Prime Directives 包含：
  - Zero silent failures（任何 failure mode 必须可见）
  - Every error has a name（反对笼统“处理错误”）
  - Data flows / interactions 的 shadow paths 与 edge cases
  - Observability 是 scope
  - Diagrams mandatory（ASCII 图强制）
  - TODO 书面化（defer 必须落盘）
  - 安全与 threat modeling 不可选
- PRE-REVIEW SYSTEM AUDIT 要求先跑固定命令（git log/diff、TODO 扫描等），再读 CLAUDE.md/TODOS.md/设计文档。

## 与本研究的关系

- 为 round2_cap/01 的“前置规划机制”提供一手门禁样本：不仅产出观点，还规定审查顺序与“必须覆盖的 failure surfaces”。
- 对企业迁移：展示“交互式审查 + 显式决策点 + 落盘工件（handoff/design doc）”如何构成可治理流程。

## 可直接引用的术语 / 概念

- “SCOPE EXPANSION / HOLD SCOPE / SCOPE REDUCTION”
- “Completeness is cheap”
- “Zero silent failures”
- “Do NOT make any code changes”

## captured_excerpt

摘录（来自 `plan-ceo-review/SKILL.md`）：

> “Critical rule: … Every scope change is an explicit opt-in … never silently add or remove scope.”

## 风险与局限

- 该技能高度依赖 AskUserQuestion 的交互能力；在非交互环境（批处理、spawned session）可能需要降级策略。
- “Completeness is cheap”在企业环境可能与交付周期/风险控制相冲突，迁移时需要明确“何时值得 boil the lake，何时必须 scope reduction”。

