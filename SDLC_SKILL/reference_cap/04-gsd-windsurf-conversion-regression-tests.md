# GSD: Windsurf Conversion Regression Tests (Format Mapping + Portability Guardrails)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/tests/windsurf-conversion.test.cjs
- source_type: official
- accessed_at: 2026-04-09 12:23:21 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 这组回归测试把“跨宿主迁移”落实为可执行的转换与验收：从 frontmatter 标量格式、命令命名差异、路径约定，到 tool 名称映射与已知 bug workaround 清理，都通过 tests 固化为 contract。它直接支撑“迁移成本主因在于宿主差异需要长期维护映射层”的判断。
- claims_supported:
  - 跨宿主迁移需要非平凡的格式/语义转换（不仅是复制 prompt）
  - 转换层需要回归测试防止宿主解析差异导致行为漂移（例如 frontmatter quoted scalar 会被当作字面量）
  - 迁移涉及路径与 tool 名称映射（CLAUDE.md → .windsurf/rules，Bash → Shell，Edit → StrReplace 等）
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: Windsurf, Claude Code, conversion tests, installer

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: tests/windsurf-conversion.test.cjs

## 关键事实

- 该测试文件显式声明其目的：避免 Windsurf 把带引号的 frontmatter `name` 当作字面量，导致 skill/subagent 名称包含引号而失效。
- `convertClaudeCommandToWindsurfSkill` 的回归测试覆盖：
  - frontmatter `name` 必须输出为 plain scalar（不允许 `"gsd-quick"` 这种 quoted scalar）
  - slash command 在 markdown body 的命名映射：`/gsd:execute-phase` → `/gsd-execute-phase`
  - 输出必须包含 `<windsurf_skill_adapter>...</windsurf_skill_adapter>` 适配块，并明确提及 Windsurf 的 `Shell`、`StrReplace` 工具名
- `convertClaudeAgentToWindsurfAgent` 的回归测试覆盖：
  - agent frontmatter 的 `name` plain scalar
  - strip Windsurf 不支持的字段（示例：`color:`、`skills:`）
- `convertClaudeToWindsurfMarkdown` 的回归测试覆盖：
  - 品牌与路径替换：`Claude Code` → `Windsurf`，`CLAUDE.md` → `.windsurf/rules`（无尾随 `/` 以兼容 Node v25）
  - 目录替换：`.claude/skills/` → `.windsurf/skills/`
  - tool 名称替换：`Bash(` → `Shell(`，`Edit(` → `StrReplace(`
  - 变量替换：`$ARGUMENTS` → `{{GSD_ARGS}}`
  - 移除对已知 Claude Code bug 的 workaround 文本（`classifyHandoffIfNeeded`）

## 与本研究的关系

- 为 `digested_cap/04` 的迁移价值判断提供一手证据：跨宿主可移植性需要“转换器 + 回归测试”作为治理资产，否则宿主解析/命名差异会引入隐性故障。
- 也提供了迁移成本的可复核切片：frontmatter/路径/tool 名称等差异会不断引入兼容债，需要持续维护与 CI 回归。

## 可直接引用的术语 / 概念

- “conversion regression tests”
- “plain scalar”
- “adapter block”
- “brand/path/tool rewrites”

## captured_excerpt

摘录（来自文件头注释，保持简短）：

> “Windsurf conversion regression tests.”

## 风险与局限

- 该证据证明“转换与测试的存在”与“差异复杂度”，但不直接量化迁移带来的收益；收益需要结合 04 维度的采用案例与 03 维度的质量/可靠性证据。

