# gsd-build/get-shit-done: README

- source_url: https://github.com/gsd-build/get-shit-done
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: shared
- trust_level: official
- why_it_matters: 提供“跨宿主安装 + 状态/门禁/验证”的工程治理样本，且 README 直接描述了不同宿主的安装落盘格式差异。

## Key Facts

- 项目定位：面向多宿主的 meta-prompting / context engineering / spec-driven development 系统，目标之一是解决 context rot。
- 安装入口：README 给出 `npx get-shit-done-cc@latest`。
- 支持多 runtime/宿主（README 明确列出 Claude Code、OpenCode、Gemini CLI、Codex、Copilot、Cursor、Windsurf、Antigravity 等）。
- 安装时选择：
  - runtime（可多选）
  - location（global vs local）
- README 明确不同宿主的“落盘格式差异”与兼容策略：
  - Claude Code 2.1.88+ 与 Codex：以 skills 形式安装（`skills/gsd-*/SKILL.md`）
  - 更旧 Claude Code：使用 `commands/gsd/`
  - Cline：通过 `.clinerules` 配置
  - 安装器会自动处理不同格式
- README 以示例说明它内置了“质量门禁/治理”类能力（如 schema drift detection、security enforcement、scope reduction detection 等），属于工程治理导向样本。

## Claims Supported

- “跨宿主兼容不是一句‘支持’就结束，而是涉及落盘路径/格式转换与安装器逻辑。”（主题1 host 与主题2 dist）
- “方法论框架把治理能力编码进流程与工具链（漂移检测、质量门禁等）。”（主题4 framework）

## Captured Excerpts (keep short)

> Solves context rot — the quality degradation that happens as Claude fills its context window.

## Terms / Concepts

- context rot
- runtime selection
- install format compatibility

## Risks / Limits

- README 中包含大量自述与评价语句；关键机制需在 docs/源码与真实使用反馈中继续交叉核验。

