# Gemini CLI Docs: Extension Reference (`gemini extensions`, `gemini-extension.json`)

- source_url: https://geminicli.com/docs/extensions/reference.md
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 这份官方文档把 Gemini CLI 的“扩展分发单位”与治理机制讲清楚：extensions 的安装/更新/启停命令、默认拷贝式安装与 symlink 开发模式、扩展根目录与 manifest（`gemini-extension.json`）字段，以及可捆绑 MCP servers、agent skills、custom commands、hooks 等能力。这是跨宿主对齐“skills vs extensions/plugins”的关键一手证据。

## Key Facts

- 管理命令组：通过 `gemini extensions *` 管理扩展；并明确 `gemini extensions install` 等管理命令不支持在 interactive mode 内运行（interactive mode 中可用 `/extensions list` 查看已装扩展）；更新与 slash commands 变更需要重启 CLI 会话后生效。
- 安装：`gemini extensions install <source> [--ref <ref>] [--auto-update] [--pre-release] [--consent] [--skip-settings]`；source 可以是 GitHub URL 或本地路径；默认安装为“拷贝一份扩展目录”；从 GitHub 安装需要本机有 `git`；并提供 `--consent` 用于确认安全风险并跳过确认提示。
- 更新/启停：提供 `gemini extensions update <name>` 与 `--all`；支持 enable/disable 并可按 `--scope user|workspace` 控制作用域；支持 uninstall。
- 开发链接：`gemini extensions link <path>` 创建到 Gemini CLI extensions 目录的符号链接，以便无需重装即可测试变更。
- 目录与格式：Gemini CLI 从 `<home>/.gemini/extensions` 加载扩展；每个扩展根目录必须有 `gemini-extension.json`。
- manifest 关键能力（`gemini-extension.json`）：
  - `mcpServers`：可在扩展中声明 MCP servers（与 `settings.json` 同样在启动时加载；若同名，`settings.json` 优先；并说明不支持 MCP server 配置项 `trust`）。
  - `excludeTools`：可排除某些工具（甚至支持类似 `run_shell_command(rm -rf)` 的命令级限制）。
  - `contextFileName`：扩展级上下文文件（若未设置但存在 `GEMINI.md`，会被加载）。
  - 其它：`migratedTo`（迁移仓库并自动切换更新源）、`plan.directory`（规划工件目录 fallback）等。
- 扩展可捆绑的能力面（文档列出）：custom commands（`commands/` 目录 TOML，支持 `/gcs:sync` 这类命名空间）、hooks（`hooks/hooks.json`）、agent skills（`skills/<name>/SKILL.md`），以及 preview 的 sub-agents。

## Claims Supported

- “Gemini CLI 的扩展单元不仅承载命令，还能捆绑 MCP servers 与 agent skills，并提供 tool exclusion 等治理入口”，这使得扩展在语义上更接近 Cursor 的 plugins 而不是单纯的 skills 文件夹。（主题1 host；主题3 supply）
- “拷贝式安装 + 显式 update + consent 风险确认”体现了宿主在分发与安全之间的取舍：可用性优先，但要求用户显式确认与重启生效。（主题2 dist；主题1 host）

## Captured Excerpts (keep short)

> Gemini CLI creates a copy of the extension during installation.

## Terms / Concepts

- `gemini extensions install/update/enable/disable/link`
- `gemini-extension.json`
- `<home>/.gemini/extensions`
- `mcpServers` (extension-bundled MCP config)
- `excludeTools`
- `commands/` (TOML) and namespaced slash commands
- `skills/<name>/SKILL.md`

## Risks / Limits

- 这是 Gemini CLI 的扩展机制；其它宿主（Codex/Cursor/Claude/OpenCode/Windsurf）在命名、权限模型与落盘路径上并不一致，跨宿主兼容仍需要逐个宿主官方文档对齐。

