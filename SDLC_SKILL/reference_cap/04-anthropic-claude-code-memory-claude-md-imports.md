# Anthropic Claude Code Docs: Memory (CLAUDE.md, .claude/rules, Imports incl. AGENTS.md Interop)

- source_url: https://docs.anthropic.com/en/docs/claude-code/memory
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 该文是 Claude Code 的官方“仓库级记忆/规则工件”说明，明确 `CLAUDE.md` 与 `.claude/` 下 rules/memory 的作用域、目录搜索与加载方式，并特别提供“Imports”机制（可导入 `AGENTS.md` 等跨工具文件）。这为“AGENTS.md 互操作趋势”“多宿主迁移的最小工件集合”“规则分层与漂移治理”提供一手证据。
- claims_supported:
  - Claude Code 支持 project-level `CLAUDE.md` 作为持久化 instructions/memory
  - 支持 `.claude/` 目录下的 rules（可按目录/范围组织）
  - 支持 Imports：可以从一个文件中导入另一个文件（包括 `AGENTS.md`），用于跨工具互操作与分层维护
  - 强调把持久化指令拆分与结构化（避免单一巨型文件）并提升可维护性
- date_scope: accessed 2026-04-09
- related_frameworks: Claude Code, CLAUDE.md, AGENTS.md
- related_tools: repo memory, imports, rules organization

## 关键事实

- 文档描述 Claude Code 的“Memory”机制：使用项目内持久化文件（如 `CLAUDE.md`）来存放对 agent 的长期指令与项目约定。`source_url`
- 文档描述 `.claude/` 目录下的规则/记忆组织方式（按范围分层），用于把规则拆分成更易维护的单元。`source_url`
- Imports（导入）机制：
  - 文档明确示例包含导入 `AGENTS.md`
  - 以此实现跨工具（Codex/Claude Code 等）之间的指令互操作与复用。`source_url`

## 与本研究的关系

- 为 `digested_cap/04` 的“仓库级配置工件”提供官方证据：不仅 Codex 支持 `AGENTS.md`，Claude Code 也提供将其纳入自身记忆体系的路径（imports）。
- 为“迁移成本”提供事实：不同宿主对指令文件的命名、目录结构与加载语义不同；imports/rules 分层是一种降低漂移与兼容债的工程手段。

## 可直接引用的术语 / 概念

- “Memory”
- `CLAUDE.md`
- `.claude/`
- “Imports”
- `AGENTS.md` (interop)

## captured_excerpt

摘录（来自 Imports 的示例列表，保持简短）：

> “AGENTS.md … (Codex)”

## 风险与局限

- 该文描述 Claude Code 的具体实现；其他宿主可能没有 imports 机制或语义不同。跨宿主迁移时仍需做映射与回归验证。

