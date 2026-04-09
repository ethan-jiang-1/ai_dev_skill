# GSD: `.clinerules` (Host-facing Context File, Workflow-only Guardrail, Coding + Safety Standards)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/.clinerules
- source_type: official
- accessed_at: 2026-04-09 11:33:06 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: `.clinerules` 是典型“context file / rules file”形态：把工作流门禁（只允许通过 GSD workflows 修改 repo）、架构约定、编码规范与安全约束写成宿主可消费的仓库级指令。这类工件是跨宿主迁移时最常见、成本最低、也最容易产生漂移的配置面，适合纳入能力地图的“迁移价值判断”。
- claims_supported:
  - context file 能把“workflow-only”这类强约束显式化，降低 agent 自由编辑导致的治理失控
  - 把架构/规范/安全要求集中到一个仓库工件，能显著降低新宿主/新 agent 的上手成本
  - rules 文件天然是迁移摩擦点（不同宿主支持程度不同），需要可移植抽象与降级策略
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: Cline rules, context files, workflow gates

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: .clinerules

## 关键事实

- 明确核心门禁：禁止直接编辑 repo，必须通过 `/gsd:plan-phase` → `/gsd:execute-phase` → `/gsd:verify-work` 三段工作流。
- 描述 repo 架构布局（workflows/agents/commands/tests 等），使宿主能快速定位“单一事实源”文件。
- 明确编码标准（CommonJS only、core 无外部依赖、node:test/node:assert、扩展名约定等）。
- 明确安全规则（`execFileSync` 而非 `execSync`，以及路径校验函数）。

## 与本研究的关系

- 为 `digested_cap/04` 提供一手证据：迁移时最常见的可移植对象是“仓库级规则文件”，它承载治理约束与最低工程标准。
- 也可作为“迁移成本”测量点：不同宿主对 `.clinerules` 等 rules file 的读取范围、优先级与长度上限不同，会导致行为差异。

## 可直接引用的术语 / 概念

- “Never Edit Outside a GSD Workflow”
- “Do not make direct repo edits”
- “Safety: Use execFileSync … validate paths …”

## captured_excerpt

摘录（来自 `.clinerules`）：

> “Core Rule: Never Edit Outside a GSD Workflow”

## 风险与局限

- `.clinerules` 属于宿主/工具特定工件（Cline 生态），在其他宿主下可能不生效或语义不同；迁移时需要映射到目标宿主的等价配置面（AGENTS.md/CLAUDE.md 等）。

