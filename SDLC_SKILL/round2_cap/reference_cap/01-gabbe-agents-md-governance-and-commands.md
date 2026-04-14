# GABBE: AGENTS.md as Single Source of Truth (Governance + Exact Commands)

- source_url: https://github.com/andreibesleaga/GABBE/blob/c5528f2b6630710fd82d30c7be7b1726529663ef/agents/AGENTS.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: GABBE 把“项目上下文 + 运行命令 + 质量/安全门禁 + 研发流程”收敛到一个可审计的静态文件，属于最典型的“确定性约束”能力单元形态。
- claims_supported:
  - “Context file 不是装饰性 prompt，而是可迁移的、可审计的项目治理载体”
  - “要求精确命令（install/test/typecheck/lint 等）能显著降低 agent 幻觉与跑偏”
  - “把安全禁令、secret policy、PR 格式等前置写入上下文，可形成工程门禁”
- date_scope: as of git commit c5528f2b6630710fd82d30c7be7b1726529663ef (2026-04-01)
- related_frameworks: GABBE
- related_tools: Claude Code, Cursor, GitHub Copilot, Gemini, Codex

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/GABBE
- commit: c5528f2b6630710fd82d30c7be7b1726529663ef
- file_path: agents/AGENTS.md

## 关键事实

- 明确宣称 AGENTS.md 是“single source of truth”，并会被多宿主配置所引用/同步（`.cursorrules`、`.claude/CLAUDE.md`、`.gemini/settings.json`、`.codex/AGENTS.md`）。
- 通过 YAML 模板强制项目身份信息补全（语言/运行时/框架/包管理/CI/CD 等），避免“上下文缺失导致的默认假设”。
- “Operational Commands”要求提供可执行的精确命令（install/dev/test/typecheck/lint/format/build/security_scan/migrate/docs），并明确禁止模糊表述。
- 给出强制的 agent 工作流顺序（Plan Before Coding → TDD → Verify → Refactor → Log & Complete），属于前置流程门禁。
- Security/Governance 部分用“Forbidden Actions”列举未经人类批准禁止的动作（例如推 main、改 CI、禁 lint/test、提升权限等）。
- Research Policy 里显式禁止猜测/幻觉，并在特定行为前要求“Research Gate”（引入新库、调用未证实 API、安全/监管解释等）。

## 与本研究的关系

- 作为“能力单元不是 prompt 包装”的一手证据：它把工程约束固化为可被任何 agent 读取的确定性上下文工件。
- 作为企业迁移价值证据的输入：该文件形态天然可 code review / git diff / 合规审计，可作为组织级规范的落点。

## 可直接引用的术语 / 概念

- “single source of truth”
- “These are the EXACT commands agents must use. No approximations.”
- “Forbidden Actions (agents must never do these without explicit human approval)”
- “Research Gate”

## captured_excerpt

摘录（来自 `agents/AGENTS.md`，为避免断章取义仅保留最关键约束语句）：

> “This file is the single source of truth for all AI coding agents on this project.”
>
> “These are the EXACT commands agents must use. No approximations.”

## 风险与局限

- 文档强约束并不等价于真实执行一定遵守：需要宿主工具对“必须运行的命令/门禁”提供可验证的 hook 或自动化校验，否则仍可能退化为软约束。
- 模板含大量 `[PLACEHOLDER]`，实际效果高度依赖团队是否认真维护与持续更新。

