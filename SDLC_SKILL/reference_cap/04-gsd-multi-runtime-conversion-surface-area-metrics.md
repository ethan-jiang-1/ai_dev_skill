# GSD: Multi-Runtime Conversion Surface Area Metrics (install.js LOC + Conversion Targets + Regression Tests)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/bin/install.js
- source_type: official
- accessed_at: 2026-04-09 14:05:03 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: “多宿主迁移”不是一句“支持 X/Y/Z”。GSD 把迁移实现为一个大型 installer+converter（`bin/install.js`），内含大量针对不同宿主的格式/命令/工具映射。该文件的代码规模、转换目标数量与回归测试存在性，可作为 portability cost/maintenance overhead 的可复核度量切片。
- claims_supported:
  - GSD 的跨宿主迁移依赖显式转换器（不是隐式兼容）
  - 转换器覆盖多个目标宿主/格式（Copilot/Cursor/Windsurf/Codex/Gemini/OpenCode/Kiro/Kilo 等），具备显著 surface area
  - 至少对 Windsurf 转换存在回归测试，说明“迁移 contract”需要测试固化
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: installer, converters, conversion regression tests

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- measured_files:
  - bin/install.js
  - tests/windsurf-conversion.test.cjs

## 关键事实

- `bin/install.js` 的代码规模（本地 snapshot `wc -l`）：约 6,259 LOC。
- `bin/install.js` 内部存在大量 Claude→目标宿主的转换函数（以函数名前缀可复核）：
  - `convertClaudeTo*` 约 12 个
  - `convertClaudeCommandTo*` 约 8 个
  - `convertClaudeAgentTo*` 约 7 个
- 这些转换函数覆盖的目标类型（按函数名去重的 suffix，表示存在不同目标的内容/skill/agent/frontmatter/toml 转换）包含：
  - Copilot、Cursor、Windsurf、Codex、Gemini、OpenCode、Kiro/Kilo 等（以及其他目标如 Trae/Augment 等）
- 存在 Windsurf 转换回归测试 `tests/windsurf-conversion.test.cjs`：
  - 覆盖 frontmatter `name` 的 plain scalar 输出（避免引号导致解析失败）
  - 覆盖路径与工具名映射（如 `CLAUDE.md` → `.windsurf/rules`、`Bash` → `Shell`、`Edit` → `StrReplace` 等）
  - 覆盖 slash command 命名转换（`gsd:` → `gsd-`）。

## 与本研究的关系

- 为 `round2_cap/04` 的 portability cost/maintenance overhead 提供强信号：当跨宿主迁移要覆盖多个目标时，转换器会迅速膨胀为千行级代码，并需要回归测试固化 contract；这类 surface area 是企业迁移评估必须计入的长期成本。

## 可直接引用的术语 / 概念

- “installer + converter”
- “conversion regression tests”
- “plain scalar frontmatter”
- “tool/path rewrites”

## captured_excerpt

摘录（来自 windsurf conversion tests 文件头注释，保持简短）：

> “Windsurf conversion regression tests.”

## 风险与局限

- 这里的度量是“转换层规模/目标数量”的 snapshot，不能直接说明每个目标宿主都同等可用或同等可靠；仍需结合真实迁移案例与 breakage 统计评估。

