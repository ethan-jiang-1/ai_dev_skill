# GitHub Docs: Copilot CLI Custom Instructions (`.github/*`, `AGENTS.md`, `$HOME/.copilot/copilot-instructions.md`)

- source_url: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 该页是 Copilot CLI 对“指令加载与分层”的官方口径：不仅支持 `.github/copilot-instructions.md` 与 `.github/instructions/*.instructions.md`，还将 `AGENTS.md` 作为 agent instructions，并支持通过 `COPILOT_CUSTOM_INSTRUCTIONS_DIRS` 扩展扫描目录，以及 `$HOME/.copilot/copilot-instructions.md` 的本地指令。这是比较“宿主 discovery scopes/优先级/冲突处理”的关键一手证据。

## Key Facts

- Copilot CLI 支持多种 custom instructions：
  - Repository-wide：`.github/copilot-instructions.md`（仓库 root 的 `.github` 目录）。
  - Path-specific：`.github/instructions/NAME.instructions.md`（可在仓库 root 或当前工作目录下的 `.github/instructions`）。
  - Agent instructions：一个或多个 `AGENTS.md`；可位于仓库 root、当前工作目录，或位于环境变量 `COPILOT_CUSTOM_INSTRUCTIONS_DIRS` 指定的目录中。
  - Local instructions：`$HOME/.copilot/copilot-instructions.md`。
- 冲突处理提醒：当 path-specific instructions 与 repo-wide instructions 同时适用时，两者都会被使用；文档提示应避免潜在冲突，因为 Copilot 对冲突指令的选择可能是 non-deterministic。
- `AGENTS.md` 的作用分层（文档描述）：
  - root directory 的 `AGENTS.md` 被当作 primary instructions。
  - 其它位置的 `AGENTS.md` 被当作 additional instructions（通常影响力更弱）。
  - 若仓库 root 同时存在 root `AGENTS.md` 与 `.github/copilot-instructions.md`，两者会同时使用。
- `COPILOT_CUSTOM_INSTRUCTIONS_DIRS`：可指定额外扫描目录（comma-separated）；Copilot CLI 会在这些目录下查找 `AGENTS.md` 与 `.github/instructions/**/*.instructions.md`。
- 兼容口径：也可使用 `CLAUDE.md` 与 `GEMINI.md`，但要求位于仓库 root。

## Claims Supported

- Copilot CLI 的“指令加载”是多目录、多文件、可扩展扫描的复杂 discovery 规则，不同于仅扫描 `.agents/skills` 的 SKILL.md 生态；跨宿主迁移会有隐性成本。（主题1 host）
- 通过 `AGENTS.md`/`CLAUDE.md`/`GEMINI.md` 把“跨工具统一治理文件”纳入官方兼容口径，说明宿主生态正尝试在规则文件层面收敛。（主题1 host；主题4 framework）

## Captured Excerpts (keep short)

> ...avoid potential conflicts between instructions as Copilot's choice between conflicting instructions is non-deterministic.

## Terms / Concepts

- `COPILOT_CUSTOM_INSTRUCTIONS_DIRS`
- primary vs additional `AGENTS.md`
- local instructions: `$HOME/.copilot/copilot-instructions.md`

## Risks / Limits

- 该页描述的是 Copilot CLI 的指令加载口径；其它 Copilot 运行形态（IDE/云端 agent）可能有不同 scopes、禁用策略与安全约束，需要分别抓取对应 docs 做对齐。

