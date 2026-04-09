# Windsurf Docs: Cascade Skills (Progressive Disclosure, Scopes, Invocation)

- source_url: https://docs.windsurf.com/windsurf/cascade/skills
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: Official ground truth for a major IDE-hosted agent about how “skills” are discovered, scoped, and invoked (auto vs @mention) with progressive disclosure. This is core evidence for eng tool-ecosystem effects on learning and skill lifecycle.
- claims_supported:
  - Skills are loaded via progressive disclosure (name/description first; full SKILL.md + resources only on invoke).
  - Invocation modes include automatic (description matching) and manual (`@skill-name`).
  - Skills have explicit governance scopes (workspace/global/system enterprise) and defined filesystem locations.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: Windsurf (Cascade skills)

## 关键事实

- Windsurf/Cascade 将 skills 视为 `SKILL.md` + supporting resources（scripts/templates/checklists 等）的打包形式，用于稳定执行复杂多步任务。
- progressive disclosure：默认只展示 skill 的 `name` 与 `description`；只有当 Cascade 决定 invoke（或用户 `@mention`）时，才加载完整 `SKILL.md` 与同目录支持文件。
- 触发机制：
  - Automatic invocation：请求与 description 匹配时触发
  - Manual invocation：`@skill-name`
- 作用域与目录（可用于团队治理 vs 个人偏好隔离）：
  - workspace: `.windsurf/skills/<skill-name>/SKILL.md`（可提交进 repo）
  - global: `~/.codeium/windsurf/skills/<skill-name>/SKILL.md`
  - system (enterprise): OS 级只读路径（由 IT 下发）

## 与本研究的关系

- 对 03-devlife：这是“工具生态塑造 skill 学习路径”的一手证据。
  - 自动触发降低上手门槛，但可能隐藏“为什么触发/触发了什么规则”，从而影响学习收益与可控性。
  - workspace/global/system 的分层让团队可以把“教学/治理类技能”固化为 repo 资产，同时允许个人扩展。
- 对 01-scaffold：progressive disclosure 是“降低初始认知负担、按需暴露方法”的机制基石。

## 可直接引用的术语 / 概念

- progressive disclosure
- automatic invocation
- manual invocation (`@skill-name`)
- scopes: workspace / global / system (enterprise)

## captured_excerpt

> Cascade uses progressive disclosure: only the skill’s name and description are shown...

## 风险与局限

- 文档提供的是产品语义；关于“自动触发”的精确匹配策略（token/embedding/heuristics）未必公开，做机制推断时应标注不确定性。

