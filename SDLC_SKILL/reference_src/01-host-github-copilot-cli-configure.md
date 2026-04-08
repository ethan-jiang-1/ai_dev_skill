# GitHub Docs: Configure Copilot CLI (`~/.copilot/config.json`, trusted folders)

- source_url: https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/configure-copilot-cli
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 该页把 Copilot CLI 的“可信目录（trusted directories）+ 工具/路径/URL 权限”讲清楚，并给出本地配置文件路径与 `COPILOT_HOME` 覆写方式，是对比其它宿主（OpenCode/Codex/Gemini）治理入口的关键一手证据。

## Key Facts

- Trusted directories 决定 Copilot CLI 在哪里可以 read/modify/execute files；启动 session 时会提示确认信任当前目录。
- 对目录信任有两种范围：仅当前 session；或本次及未来 session（后者会让信任提示不再显示，但有安全风险）。
- 可编辑长期信任目录列表：打开 `config.json` 并编辑 `trusted_folders` 数组。
- 默认配置文件路径：
  - macOS/Linux：`~/.copilot/config.json`
  - Windows：`$HOME\\.copilot\\config.json`
- 可通过 `COPILOT_HOME` 环境变量更改配置位置。
- 该页还覆盖：allowed tools、path permissions、URL permissions，以及 “allowing all tools, paths, and URLs” 的风险提示。

## Claims Supported

- Copilot CLI 把“可操作范围”显式绑定到 trusted folders 与配置文件，这是一类可迁移的治理抽象（目录信任 + 权限分层）。（主题1 host）
- `~/.copilot/config.json` + `COPILOT_HOME` 的治理入口为企业与个人提供了可脚本化的控制面。（主题1 host；主题2 dist）

## Captured Excerpts (keep short)

> Trusted directories control where Copilot CLI can read, modify, and execute files.

## Terms / Concepts

- trusted folders
- `~/.copilot/config.json`
- `trusted_folders`
- `COPILOT_HOME`

## Risks / Limits

- 该页强调信任与权限的安全影响，但仍需要结合 Copilot CLI 的工具清单、默认允许行为与组织策略，才能完成完整风险评估。

