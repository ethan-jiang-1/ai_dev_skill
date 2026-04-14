# GitHub Docs: Repository Custom Instructions for GitHub Copilot (`.github/copilot-instructions.md`, `.github/instructions/*`, `AGENTS.md`)

- source_url: https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 这是 GitHub 对 Copilot “仓库级可版本控制指令资产”的官方规范：明确三类 repo custom instructions（repo-wide/path-specific/agent instructions）、文件落盘位置与优先级（尤其是 `AGENTS.md` 的就近优先），并给出 `CLAUDE.md`/`GEMINI.md` 兼容口径，可用于对齐跨宿主治理文件的真实边界。

## Key Facts

- Copilot 支持三类 repository custom instructions：
  - Repository-wide instructions：对仓库上下文内的所有请求生效；文件位置为 `.github/copilot-instructions.md`（在 `.github` 目录下）。
  - Path-specific instructions：对匹配特定路径的文件上下文请求生效；文件位置为 `.github/instructions/` 目录下的一个或多个 `NAME.instructions.md` 文件。
  - Agent instructions：给 AI agents 使用；可创建一个或多个 `AGENTS.md`，可位于仓库内任意位置；当 Copilot 工作时，“目录树中最近的 `AGENTS.md`”优先。
- 当 path-specific instructions 匹配当前 Copilot 正在处理的文件路径，同时 repo-wide instructions 也存在时，两者会同时生效（instructions from both files are used）。
- 兼容口径：可用单个 `CLAUDE.md` 或 `GEMINI.md` 存放在仓库 root 作为替代（文档明确给出该选项）。
- 文档提供“如何验证 custom instructions 正在被使用”的方式：在 Copilot Chat 的 response References 列表中可看到 `.github/copilot-instructions.md` 作为引用项（并可点击打开）。

## Claims Supported

- “Copilot 的仓库级指令资产”主要不是 `SKILL.md`，而是 `.github/copilot-instructions.md`、`.github/instructions/*.instructions.md` 与 `AGENTS.md` 等文件体系；其核心价值在于可版本控制、可共享、可分层覆写（就近优先）。（主题1 host）
- `AGENTS.md` 被官方纳入 agent instructions 载体，并提供 “nearest takes precedence” 的规则，可作为跨工具统一治理文件的候选基线之一。（主题1 host；与主题4 framework 交叉）

## Captured Excerpts (keep short)

> When Copilot is working, the nearest `AGENTS.md` file in the directory tree will take precedence.

## Terms / Concepts

- repository-wide instructions (`.github/copilot-instructions.md`)
- path-specific instructions (`.github/instructions/NAME.instructions.md`)
- agent instructions (`AGENTS.md`)
- precedence: nearest `AGENTS.md` wins

## Risks / Limits

- 文档强调“哪些 Copilot 功能支持这些指令类型”需要对照其它说明页；此外，不同运行环境（GitHub.com / VS Code / Visual Studio / JetBrains）对指令文件的支持面可能存在差异，需逐环境核验。

