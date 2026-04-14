# bmad-code-org/BMAD-METHOD: README

- source_url: https://github.com/bmad-code-org/BMAD-METHOD
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: BMAD-METHOD 是重型敏捷方法论框架，强调“规模自适应（从 bugfix 到企业系统）+ 多角色专家 agents + 34+ workflows + 模块化生态”，并提供 `npx ... install` 的工程化安装器与非交互安装参数，是研究“重框架如何产品化/模块化分发”的一手样本。

## Key Facts

- 定位：README 将其描述为 AI-driven agile development framework，并强调 “Scale-Domain-Adaptive” 会随项目复杂度调整规划深度。
- 框架能力：README 声称包含 structured workflows（分析/规划/架构/实现）、12+ specialized agents（PM/Architect/Developer/UX 等）、Party Mode（多 persona 同会话）、覆盖从 brainstorming 到 deployment 的完整生命周期；并提供 `bmad-help` 作为“下一步指引”入口。
- 安装与依赖：README 给出 `npx bmad-method install` 快速安装；并列出 Node.js v20+、Python 3.10+、uv 等 prerequisites；也给出 non-interactive 安装参数（用于 CI/CD）。
- 模块化生态：README 列出多个官方模块（BMad Builder、Test Architect、Game Dev Studio、Creative Intelligence Suite 等）及对应 GitHub 仓库，说明该框架以 modules 扩展专业领域工作流。
- 演化信号：README 明确提到 roadmap，并提示版本迭代与跨平台 agent team/sub agent、skills architecture 等方向。

## Claims Supported

- “重型敏捷派框架”会把角色分工与工作流命令体系化，并通过安装器把方法论落盘到各宿主/项目中，形成可持续分发与升级链路。（主题4 framework）
- 方法论框架可能通过“模块化”扩展到特定领域（测试策略、游戏开发等），这会影响团队采纳与长期维护成本。（主题4 framework）

## Captured Excerpts (keep short)

> Scale-Domain-Adaptive — Automatically adjusts planning depth based on project complexity

## Terms / Concepts

- scale-domain-adaptive
- workflows / modules
- `npx bmad-method install`
- non-interactive installation

## Risks / Limits

- README 的机制信息仍偏高层；要回答“哪些机制可迁移/哪些是话术”，需要进一步抓取 docs site（how-to/concepts）与仓库内真实工作流文件结构。

