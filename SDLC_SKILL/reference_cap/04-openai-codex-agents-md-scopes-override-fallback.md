# OpenAI Codex Docs: Custom Instructions with AGENTS.md (Scopes, Overrides, Fallback Order, Size Limits)

- source_url: https://developers.openai.com/codex/guides/agents-md
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 该文是 Codex 对 `AGENTS.md` 的官方“契约级”定义，明确其作用域（global vs project）、目录向上搜索与 override 机制、缺省 fallback 文件顺序，以及单文件大小限制。这些细节决定了“跨宿主迁移/互操作”时应该如何落盘与如何治理漂移。
- claims_supported:
  - Codex 支持 project-scope 的 `AGENTS.md`：从当前目录向上搜索到 repo root
  - 支持 global-scope 的 `AGENTS.md`：放在 `$CODEX_HOME/AGENTS.md`
  - 支持同目录的 `AGENTS.override.md`：以 override 方式附加或替换指令
  - 若不存在 `AGENTS.md`，Codex 会按顺序查找 `CODEX.md` → `CONTEXT.md` → `README.md`
  - 对 `AGENTS.md`（以及这些 fallback 文件）存在大小限制（每个文件 32 KiB）
- date_scope: accessed 2026-04-09
- related_frameworks: Codex, AGENTS.md
- related_tools: $CODEX_HOME, repository-level instructions, overrides

## 关键事实

- “Project scope”行为：Codex 会从当前工作目录向上查找 `AGENTS.md`（直到 repo root），用其作为 project instructions 的来源。`source_url`
- “Global scope”行为：用户可在 `$CODEX_HOME/AGENTS.md` 放置全局指令，用于多项目复用一致口径。`source_url`
- override 机制：同目录下的 `AGENTS.override.md` 可用于覆盖或补充指令（用于局部变体/临时策略/实验分支口径）。`source_url`
- fallback 顺序：当 `AGENTS.md` 不存在时，Codex 会按 `CODEX.md` → `CONTEXT.md` → `README.md` 作为替代指令源。`source_url`
- 大小限制：`AGENTS.md` 以及上述 fallback 文件“each … up to 32 KiB”。`source_url`

## 与本研究的关系

- 为 `digested_cap/04` 的“仓库级配置工件”提供一手规范：`AGENTS.md` 不只是趋势命名，而是有明确 precedence、scope 与 override 的可执行协议，适合作为企业治理的最小抽象。
- 也为“迁移成本”提供事实：不同宿主对指令文件的搜索路径、override 语义与大小上限不同，会引入互操作摩擦与兼容债。

## 可直接引用的术语 / 概念

- “Project scope”
- “Global scope”
- “AGENTS.override.md”
- “CODEX.md / CONTEXT.md / README.md fallback”
- “up to 32 KiB”

## captured_excerpt

摘录（来自 fallback 描述，保持简短）：

> “If you don't have an AGENTS.md, Codex will look for … CODEX.md, CONTEXT.md, or README.md.”

## 风险与局限

- 该文描述的是 Codex 的具体实现契约，可能随产品迭代调整；企业落地应配合 CI 校验与实际行为测试，避免规则漂移。

