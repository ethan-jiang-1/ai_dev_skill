# gstack: /office-hours (Hard Gate Before Code, Forcing Questions, Design Doc as Only Deliverable)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/office-hours/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: /office-hours 将“先诊断再执行”做成硬门禁（禁止写代码），并通过 forcing questions 与阶段化流程强制产出设计文档，属于 Define/Design 阶段最典型的“前置规划机制”一手样本。
- claims_supported:
  - Define/Design 阶段的关键机制是“禁止过早写代码”，以设计文档为唯一交付物
  - 通过 AskUserQuestion 的“一次一个问题 + 追问到具体证据”抑制模糊需求
  - 通过本地 learnings 搜索与历史设计文档回读，形成跨会话持续改进与复用
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: AskUserQuestion, Grep/Glob, git, local learnings store

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: office-hours/SKILL.md

## 关键事实

- 明确声明 “HARD GATE”：不得调用 implementation skill、不得写代码、不得 scaffold；唯一输出是 design document。
- Phase 1 Context Gathering 包含确定性的上下文加载动作（读 CLAUDE.md/TODOS.md、git log/diff、grep/glob、列出历史设计文档）。
- 引入 “Prior Learnings” 检索机制，并允许用户选择是否启用“跨项目 learnings 搜索”（本地不出机）。
- 通过 AskUserQuestion 询问用户目标，并映射到 Startup mode（Phase 2A）或 Builder mode（Phase 2B）。
- Startup mode 给出“Operating Principles”与“Six Forcing Questions”的问法约束：
  - 强制具体性与证据（反对泛化的市场/用户描述）
  - 强制区分 interest vs demand
  - 强制收敛 wedge（Narrow beats wide）
- 多处写盘协议：设计文档写入项目目录，并写入 `~/.gstack/projects/{slug}/...-design-...md` 作为可复用资产（便于后续 /plan-ceo-review /plan-eng-review 复用）。

## 与本研究的关系

- 直接支撑 round2_cap/01 “Define/Design 阶段要阻止模型过早写代码”的论点：这里是硬门禁，不是建议。
- 为“能力单元=改变执行机制”提供样本：通过阶段化与持久化设计文档，把需求澄清变成可审计工件。

## 可直接引用的术语 / 概念

- “HARD GATE”
- “This skill produces design docs, not code.”
- “Six Forcing Questions”
- “Ask these questions ONE AT A TIME”

## captured_excerpt

摘录（来自 `office-hours/SKILL.md`）：

> “HARD GATE: Do NOT … write any code … Your only output is a design document.”

## 风险与局限

- “强迫问答”对企业场景的适配性取决于组织文化与时间压力；需要可裁剪版（例如只保留最关键 forcing questions）。
- 本技能的价值在于产出可复用设计文档；如果团队不把该文档纳入 review/变更流程，它会退化成一次性对话记录。

