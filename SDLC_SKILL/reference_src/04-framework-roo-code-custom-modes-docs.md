# Roo Code Docs: Customizing Modes (tool permissions + safety + shareability)

- source_url: https://docs.roocode.com/features/custom-modes
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: Roo Code 将“模式（Mode）”作为一等治理单元：不同 mode 可绑定不同 tool 权限、文件访问范围与指令集，并支持全局/项目级与导入导出。这为“阶段性角色隔离、防越权、防污染”的工程化落地提供了官方证据。

## Key Facts

- 自定义 modes：文档说明可创建 custom modes，用于特定任务/工作流；支持 global（跨项目）与 project-specific（单项目）两种作用域。
- 安全与权限：文档明确 custom modes 可限制工具组与文件访问权限，并给出示例：“Review Mode” 可被限制为只读操作。
- mode 构成要素：文档列出 mode 的关键字段/概念，包括 `slug`（内部标识，关联 mode-specific instruction files）、`roleDefinition`（写入 system prompt 开头定义身份）、`groups`（允许的 toolsets 与 file access permissions）、`whenToUse`（供自动选择/编排使用）与可选 `customInstructions`。
- 可分享与模板化：文档描述 import/export 能把 mode 与其 rules 打包成一个可移植 YAML 文件，便于团队共享、备份与跨项目迁移，并提到会打包项目中的 `.roo/rules-{slug}/` 目录。

## Claims Supported

- “模式隔离”是一种可迁移的治理抽象：用 mode 限定工具权限与文件范围，并把阶段性指令分离存放，可以降低越权与上下文污染风险。（主题4 framework）
- 团队采纳往往需要可复制的配置分发与迁移机制（import/export），否则 mode/rules 难以规模化推广。（主题4 framework）

## Captured Excerpts (keep short)

> Restrict a mode's access to sensitive files or commands.

## Terms / Concepts

- mode / mode selector
- tool groups (`groups`)
- file access permissions
- `slug` (links to instruction files)
- import/export (portable YAML)

## Risks / Limits

- 文档描述的是 Roo Code 自身的 mode 能力；要对比其它宿主（例如 Claude/Codex/Windsurf）的类似机制，需要补抓各宿主对应的 rules/permissions/skill scopes 证据后再做横向结论。

