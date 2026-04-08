# obra/superpowers: README

- source_url: https://github.com/obra/superpowers
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: Superpowers 把“工程治理”编码成一组可组合 skills，并明确其是强制触发的端到端开发工作流（从需求澄清到 TDD、代码审查、收尾），是研究“工程操作系统型框架”的高密度一手样本；同时它覆盖多宿主安装路径，能观察跨平台落地差异。

## Key Facts

- 定位：Superpowers 是面向 coding agents 的完整软件开发工作流，建立在一组可组合 skills 与一段“确保 agent 使用这些 skills”的初始指令之上。
- 工作方式：强调 agent 不应直接写代码，而应先引导出 spec，并在设计确认后生成可执行计划；强调 red/green TDD、YAGNI、DRY。
- 自动触发：README 明确 skills 会自动触发，且“在任何任务前会检查相关 skills”，并强调是 mandatory workflows。
- 基础工作流链路（README 列出）：brainstorming → using-git-worktrees → writing-plans → subagent-driven-development/executing-plans → test-driven-development → requesting-code-review → finishing-a-development-branch。
- 安装与分发：README 按宿主给出安装方式，覆盖 Claude Code（官方 marketplace 与自建 marketplace）、Cursor（plugin marketplace）、Codex/OpenCode（分别从 `.codex/INSTALL.md`/`.opencode/INSTALL.md` 获取安装指令）、Copilot CLI、Gemini CLI。

## Claims Supported

- “方法论框架”可以通过可组合技能把 SDLC 的关键治理能力（spec -> plan -> TDD -> review -> finish）写入可执行工作流，而不是停留在口号。（主题4 framework）
- “工程操作系统型框架”在现实落地上必须提供多宿主安装与运行机制，且很容易出现宿主差异导致的行为偏差。（主题4 framework；与主题1/2 交叉）

## Captured Excerpts (keep short)

> The agent checks for relevant skills before any task.

## Terms / Concepts

- composable skills
- auto-triggered / mandatory workflows
- subagent-driven-development
- RED-GREEN-REFACTOR
- git worktrees

## Risks / Limits

- README 主要描述工作流与安装口径；具体“强制性”如何在各宿主实现、哪些环节能被绕过，需要进一步下钻到仓库内各 skill 的 `SKILL.md` 与宿主加载机制。

