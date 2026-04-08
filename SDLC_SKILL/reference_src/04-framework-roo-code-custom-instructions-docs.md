# Roo Code Docs: Custom Instructions (rules files, load order, AGENTS.md)

- source_url: https://docs.roocode.com/features/custom-instructions
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: Roo Code 的“规则/指令文件”体系把工程治理落到可版本控制的文件与明确加载顺序（global vs workspace、mode-specific、legacy fallback、AGENTS.md 标准），是研究“模式隔离 + 上下文污染控制 + 团队标准化”的一手证据。

## Key Facts

- 指令文件位置分层：文档区分 global rules（如 `~/.roo/rules/`、`~/.roo/rules-{modeSlug}/`）与 workspace rules（如 `project/.roo/rules/`、`project/.roo/rules-{modeSlug}/`），并明确 workspace 在冲突时优先于 global。
- 支持两种形态：目录式（优先，如 `.roo/rules/` 与 `.roo/rules-{modeSlug}/`）与单文件 fallback（如 `.roorules` 与 `.roorules-{modeSlug}`）。
- 规则加载顺序：文档明确先加载 global rules，再加载 project rules（冲突时 project 覆盖）；并提到 legacy files（workspace root 的 `.roorules`、`.clinerules`）仅在“没有加载到通用 rules 目录内容”时作为 fallback。
- 细粒度优先级：文档明确在同一层级内，mode-specific rules 会先于 general rules 加载；并说明文件按文件名排序加载（alphabetical order）。
- AGENTS.md 支持：文档说明 Roo Code 可从 workspace root 加载 `AGENTS.md`（或 `AGENT.md` fallback），默认自动加载，可通过 VSCode 设置项禁用；并给出其在整体优先级链路中的位置（在 mode-specific + `.rooignore` 之后、generic rules 之前）。

## Claims Supported

- “Roo Code rules”不仅是概念，而是可落盘、可版本控制、可分层覆写的规则系统，能用于长期项目的上下文污染控制与团队一致性。（主题4 framework）
- 引入 `AGENTS.md` 这类标准文件作为规则载体，使框架治理更容易在多工具/多团队场景里迁移与复用。（主题4 framework；与主题1/3 交叉）

## Captured Excerpts (keep short)

> Rules are loaded in this order: Global Rules ... Project Rules ... Legacy Files (.roorules, .clinerules) ...

## Terms / Concepts

- global rules vs workspace rules
- `.roo/rules/` / `.roorules`
- mode-specific rules (`rules-{modeSlug}`)
- `.clinerules` (legacy)
- `AGENTS.md` / `AGENT.md`

## Risks / Limits

- 文档给出加载与优先级口径，但“规则如何影响 model 的 system prompt 结构、与 modes/tool permissions 如何组合生效”的细节，需要结合 modes 与工具权限相关文档联合分析。

