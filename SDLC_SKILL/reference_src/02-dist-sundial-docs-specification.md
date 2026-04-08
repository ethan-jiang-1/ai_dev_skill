# Sundial Docs: Specification

- source_url: https://sundialhub.com/docs/specification
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: Sundial 给出的 `SKILL.md` 格式参考与实践约束（字段、建议、目录结构）是“registry 对格式与可执行边界”的权威口径之一。

## Key Facts

- 文档定义：skill 是包含 `SKILL.md` 的目录；`SKILL.md` 使用 YAML frontmatter 存元数据、Markdown 写指令。
- Frontmatter 字段表（文档列出）：
  - `name`（必填）：lowercase、允许 dashes、max 64 chars、必须与父目录名匹配。
  - `description`（必填）：one-line summary、max 1024 chars；agents 用于决定何时激活 skill。
  - 可选：`license`（SPDX）、`metadata`（freeform）、`allowed-tools`（experimental）、`compatibility`（环境要求）。
- Markdown body：freeform；文档给出常见模式（When to use、Steps/workflow、Examples、Guardrails 等）。
- 实践约束：建议主 `SKILL.md` 控制在 500 行以内，把详细资料移到 `references/`。
- Optional directories：`references/`（按需读）、`scripts/`（可执行 helper）、`assets/`（模板/配置）。

## Claims Supported

- “registry 会给出对 `SKILL.md` 的字段与实践约束（行数控制、reference 拆分），以提升可加载性与可维护性。”（主题2 dist 与主题1 host）
- “allowed-tools/compatibility 等字段体现出分发与宿主在权限/环境约束上的对齐需求。”（主题1/2 交叉）

## Captured Excerpts (keep short)

> Keep your main SKILL.md under 500 lines.

## Terms / Concepts

- allowed-tools (experimental)
- compatibility
- guardrails

## Risks / Limits

- 需要对比 agentskills.io 与 Sundial 的 spec 是否完全一致（字段、约束、边界），并验证在不同宿主上的兼容性差异。

