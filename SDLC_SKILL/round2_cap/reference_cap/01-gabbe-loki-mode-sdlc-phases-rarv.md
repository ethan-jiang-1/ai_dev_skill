# GABBE: Loki Mode Orchestration (10-phase SDLC + RARV + Human Gates)

- source_url: https://github.com/andreibesleaga/GABBE/blob/c5528f2b6630710fd82d30c7be7b1726529663ef/agents/skills/brain/loki-mode.skill.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: Loki Mode 展示了“能力单元=控制流与门禁编排”的极端形态：把 SDLC 切成明确阶段、定义 persona 责任、定义输出工件与 human approval gate，并把 RARV（Reason/Act/Reflect/Verify）与 TDD/安全/质量 gate 绑定。
- claims_supported:
  - “Orchestrator 与执行者分离”可降低 context rot，并把决策权从执行细节中抽离
  - “验证闭环前置”与“多 gate 确定性约束”可以把‘看起来完成’压缩成‘可验证完成’
  - “并行/批处理”需要明确的依赖与冲突处理策略（如并行标记、批次 checkpoint）
- date_scope: as of git commit c5528f2b6630710fd82d30c7be7b1726529663ef (2026-04-01)
- related_frameworks: GABBE
- related_tools: Claude Code, Cursor, GitHub Copilot, Gemini, Codex, MCP

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/GABBE
- commit: c5528f2b6630710fd82d30c7be7b1726529663ef
- file_path: agents/skills/brain/loki-mode.skill.md

## 关键事实

- Loki Mode 的目标是“Master multi-agent swarm orchestration”，强调 durable checkpoints、memory 与 human approval gates。
- 明确提出两条强制性总则：
  - Skill/Guide/MCP Selection Mandate：每个 phase/gate/checkpoint 前都要选择最合适的 skill/guide/MCP。
  - Cost & Budget Optimization Mandate：默认节俭；重成本策略必须请求人类批准。
- 定义 10 个 SDLC phases（S01 Requirements 到后续安全/发布等），每阶段都有 persona、任务、输出工件、gate 与 checkpoint 写盘规则。
- Implementation 阶段定义了 RARV Cycle（Reason/Act/Reflect/Verify）并把 TDD Red、safety-scan、lint/type/test/agentic-linter 等 verify 动作显式写成必须项。
- 对失败处理定义预算与升级策略：如 `self-heal` 限次、重复失败触发 `meta-optimize`（改写 skill/prompt）以及 HUMAN_ESCALATION。

## 与本研究的关系

- 作为“能力单元四分类”里 orchestrator/workflow 与 hooks/gates 的一手样本：它不是描述性建议，而是“执行顺序 + 输出工件 + gate + checkpoint”的流程协议。
- 对企业迁移价值：提供了“把 agent 活动写成可审计、可 checkpoint、可分工的 SDLC state machine”的模板，但也暴露成本与治理复杂度。

## 可直接引用的术语 / 概念

- “10 SDLC Phases”
- “HUMAN APPROVAL REQUIRED”
- “RARV Cycle: REASON / ACT / REFLECT / VERIFY”
- “Checkpoint … Save after every batch to prevent state loss”

## captured_excerpt

摘录（来自 `loki-mode.skill.md`）：

> “Coordinate a swarm … through a full SDLC lifecycle, with durable checkpoints, memory, and human approval gates.”
>
> “NO … unless you hit a mandatory Human Approval Gate …”

## 风险与局限

- 该文件是“技能描述/编排协议”，并不等同于宿主一定提供强制执行与自动化验证能力；迁移时需确认哪些是确定性 hook，哪些仍是提示层。
- 相对重流程与重角色划分，可能导致中小团队的落地摩擦与维护成本上升；需要“裁剪版 Loki”策略。

