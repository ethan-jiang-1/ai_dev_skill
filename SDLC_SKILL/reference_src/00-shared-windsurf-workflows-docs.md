# Windsurf Docs: Cascade Workflows

- source_url: https://docs.windsurf.com/windsurf/cascade/workflows
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: shared
- trust_level: official
- why_it_matters: 给出 Windsurf 中 Workflow 的硬机制边界（manual-only、文件位置、发现规则、大小限制、可组合调用），用于对比“skills vs workflows”的宿主抽象差异。

## Key Facts

- Workflows：用于在 Cascade 中自动化重复任务，以 Markdown 文件定义并保存，作为可复用流程。
- 触发方式：slash command `/<workflow-name>`。
- 关键约束：Workflows 是 manual-only，Cascade 不会自动触发；如需自动拾取流程，应使用 Skill。
- 机制描述：Workflows 提供“结构化步骤序列”，指导模型按步骤串行执行；并支持在 Workflow 内调用其他 Workflows（可组合）。
- 存储位置与范围：
  - Workspace：`.windsurf/workflows/*.md`（可随 repo 提交）
  - Global：`~/.codeium/windsurf/global_workflows/*.md`
  - Built-in：Windsurf 内置模板（如 `/plan`）
  - System（Enterprise）：OS 级位置（例如 `/etc/windsurf/workflows/`），面向 IT 下发只读
- 发现规则：会扫描当前 workspace 与子目录；对于 git repo 会向上搜索到 git root；多文件夹 workspace 会去重并显示最短相对路径。
- 文件大小限制：workflow 文件限制为 12000 characters。

## Claims Supported

- “同名概念（skills/workflows/rules）在不同宿主中的机制边界不同，不能只看术语。”（主题1 host）
- “Windsurf 通过 manual-only workflow 把破坏性/大动作流程显式化，skills 则承载可自动匹配的程序化知识。”（主题1 机制差异）

## Captured Excerpts (keep short)

> Workflows are manual-only — Cascade will never invoke a workflow automatically.

## Terms / Concepts

- manual-only
- workflow discovery
- storage locations (workspace/global/system)

## Risks / Limits

- 该页描述 Workflows；Windsurf 对 Skills 的目录/加载/权限需要单独抓官方文档核验。

