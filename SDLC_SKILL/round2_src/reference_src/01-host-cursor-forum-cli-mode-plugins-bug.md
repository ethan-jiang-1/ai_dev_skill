# Cursor Forum Bug: CLI mode does not load plugins

- source_url: https://forum.cursor.com/t/cursor-cli-mode-does-not-load-plugins-that-work-in-cursor-ide/153636
- source_type: community_bug_report
- accessed_at: 2026-04-08
- published_at: 2026-03-05
- related_topic: host
- trust_level: community
- why_it_matters: 这是“宿主名义支持 vs 真实运行模型差异”的典型失败模式证据：同一插件在 IDE 与 CLI mode 行为不一致，直接影响团队/自动化场景的可用性与治理。

## Key Facts

- 报告对象：Cursor CLI（background agent / terminal-based usage）。
- 报告现象：在 Cursor IDE 中已安装的 plugins（示例为 Superpowers plugin）在 CLI mode 中不可用，表现为 plugin 的 skills/agents/commands/hooks/rules 均未加载。
- 复现步骤：安装插件 -> IDE 中验证可用 -> CLI mode 中发现未加载。
- 报告者期望：位于 `~/.cursor/plugins/cache/` 的 plugins 在 IDE 与 CLI mode 都应被加载。
- 报告包含环境信息（OS、CLI version、模型等），属于可复现问题描述。

## Claims Supported

- “同一宿主的不同运行入口（IDE vs CLI）可能导致 plugins/skills 等能力包加载语义不一致，是迁移与团队治理的真实隐性成本。”（主题1 host 的难点/失败模式）
- “‘支持 plugins/skills’需要区分：UI 内是否可用 vs headless/CLI 场景是否可用。”（主题1 难点）

## Captured Excerpts (keep short)

> not available in Cursor CLI mode

## Terms / Concepts

- Cursor CLI mode
- plugin cache path (`~/.cursor/plugins/cache/`)

## Risks / Limits

- 这是单一 bug report（社区来源），需要跟进 Cursor 官方回应/修复版本与根因说明，避免以个案推导普遍结论。

