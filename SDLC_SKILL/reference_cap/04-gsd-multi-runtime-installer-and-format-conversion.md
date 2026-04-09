# GSD: Multi-Runtime Install + Format Conversion (Claude/Codex/Copilot/Cursor/Windsurf/Cline/etc.)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/README.zh-CN.md
- source_type: official
- accessed_at: 2026-04-09 12:08:50 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: GSD 明确把“跨宿主迁移”当作一等能力：同一套 workflow/agents/commands 可以被安装到多个运行时（Claude Code、Codex、Copilot、Cursor、Windsurf、Cline 等），并通过安装器与转换逻辑适配不同宿主的目录结构与工具命名（如 `.github/copilot-instructions.md`、`.windsurf/rules`、`.clinerules` 等）。这为“迁移价值判断”提供官方一手证据与可复核的目录契约。
- claims_supported:
  - 迁移不是手工复制提示词，而是“安装器 + 目录契约 + 转换器”的工程化流程
  - 不同宿主对 context file 与技能目录的约定不同，需要显式映射（`.github/` vs `.codex/` vs `.cursor/` vs `.windsurf/`）
  - rules/context 文件与技能目录属于可迁移的最小抽象层（也是主要摩擦点）
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: get-shit-done-cc installer, runtime-specific dirs, conversion tests

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_paths:
  - README.zh-CN.md
  - get-shit-done/templates/copilot-instructions.md
  - tests/windsurf-conversion.test.cjs
  - get-shit-done/workflows/update.md

## 关键事实

- README（zh-CN）明确支持多运行时安装，并给出非交互式安装目录契约：
  - `--claude` → `~/.claude/` 或 `./.claude/`
  - `--codex` → `~/.codex/` 或 `./.codex/`
  - `--copilot` → `~/.github/` 或 `./.github/`
  - `--cursor` → `~/.cursor/` 或 `./.cursor/`
  - `--cline` → `~/.cline/` 或 `./.clinerules`
  - 并支持 `--windsurf` 等更多运行时
- 模板 `get-shit-done/templates/copilot-instructions.md`：
  - 规定 Copilot 下的命令与技能加载路径（`.github/skills/gsd-*`、`.github/agents`），并给出完成后必须 ask_user 进入下一步的反馈循环。
- Windsurf conversion tests（`tests/windsurf-conversion.test.cjs`）：
  - 验证将 `CLAUDE.md` rewrite 为 `.windsurf/rules`
  - 将 `.claude/skills/` rewrite 为 `.windsurf/skills/`
  - tool naming rewrite（Bash→Shell，Edit→StrReplace）与变量替换（`$ARGUMENTS` → `{{GSD_ARGS}}`）
- update workflow（`get-shit-done/workflows/update.md`）：
  - 通过 execution_context 路径判断 preferred runtime（例如包含 `/.codex/` → codex）
  - 同时支持 env 覆盖（`CODEX_HOME` 等），体现多宿主安装检测与迁移策略。

## 与本研究的关系

- 为 `digested_cap/04` 的“迁移价值”提供可复核的一手证据：同一框架通过 installer + conversion tests 把多宿主差异（路径、规则文件、工具名）工程化治理。
- 也为“迁移成本主因”提供证据：路径契约与转换层的复杂性，是跨宿主迁移的核心成本之一。

## 可直接引用的术语 / 概念

- “运行时（runtime）”
- “安装到 ~/.codex/ / ~/.github/ / ~/.cursor/ …”
- “replaces CLAUDE.md with .windsurf/rules”

## captured_excerpt

摘录（来自 `README.zh-CN.md`）：

> “Codex … 安装到 ~/.codex/ … Copilot … 安装到 ~/.github/ … Cursor … 安装到 ~/.cursor/”

## 风险与局限

- 多宿主支持依赖持续维护转换器与测试；宿主升级或语义变化会导致兼容债与漂移。
- 目录契约并不保证“行为完全一致”，只是保证“工件可被宿主发现与加载”；还需结合 03 维度的验证/门禁闭环保证质量。

