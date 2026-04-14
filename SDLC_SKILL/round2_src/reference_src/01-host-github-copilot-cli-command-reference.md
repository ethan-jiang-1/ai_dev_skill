# GitHub Docs: Copilot CLI Command Reference (Slash Commands + MCP + Config Scopes)

- source_url: https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-command-reference
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 该页给出 Copilot CLI 的可发现能力面（slash commands）、命令行选项、环境变量、配置文件作用域与 MCP 相关选项，是把“宿主的真实运行模型/治理面/扩展点”落到可比对事实的关键来源。

## Key Facts

- Slash commands 覆盖多类治理与工作流操作（文档列举），包括：
  - `/plan`（先做实现计划）
  - `/mcp`（管理 MCP servers：show/add/edit/delete/disable/enable/auth/reload）
  - `/plugin`（管理 plugins 与 marketplaces）
  - `/skills`（list/info/add/remove/reload）
  - `/init`（初始化仓库的 custom instructions 与 agentic features）
  - `/reset-allowed-tools`（重置允许的工具权限）
- CLI options 与 MCP（文档列举）：
  - `--acp`：启动 Agent Client Protocol server。
  - `--additional-mcp-config=JSON`：为当前 session 追加 MCP server 配置（JSON string 或 `@file`），并覆盖同名已安装 MCP 配置。
  - `--disable-builtin-mcps`：禁用所有 built-in MCP servers（文档示例提到当前为 `github-mcp-server`）。
  - `--add-github-mcp-tool=TOOL` / `--add-github-mcp-toolset=TOOLSET` / `--enable-all-github-mcp-tools`：调整 GitHub MCP server 的可用工具集合。
- Environment variables（文档列举）包含：
  - `COPILOT_CUSTOM_INSTRUCTIONS_DIRS`：扩展 custom instructions 扫描目录。
  - `COPILOT_SKILLS_DIRS`：扩展 skills 扫描目录。
  - `COPILOT_HOME`：覆写配置与状态目录（默认 `$HOME/.copilot`）。
  - `COPILOT_AUTO_UPDATE`：关闭自动更新。
  - `COPILOT_ALLOW_ALL`：等价于 `--allow-all`。
- 配置文件作用域与级联（文档明确）：
  - User：`~/.copilot/config.json`
  - Repository：`.github/copilot/settings.json`（共享、提交到仓库）
  - Local：`.github/copilot/settings.local.json`（个人覆盖，应加入 `.gitignore`；schema 与 repository settings 相同且优先级更高）
  - 更高优先级：命令行 flags 与环境变量总是最高优先级。
- Repository settings 支持的 key 子集（文档列举）包含 `enabledPlugins`（declarative plugin auto-install）、`extraKnownMarketplaces`（plugins marketplaces）等。
- Skills reference（文档明确）：
  - skills 是 Markdown files，且每个 skill 位于一个包含 `SKILL.md` 的目录内；当 skill 被触发（通过 `/SKILL-NAME` 或 agent 自动调用）时，其内容会被注入到对话上下文中。
  - frontmatter 字段包括：`name`、`description`（必填），以及 `allowed-tools`（自动允许的 tools 列表，支持 `"*"`）、`user-invocable`、`disable-model-invocation` 等。
  - skills 的加载位置与优先级（first found wins for duplicate names）覆盖：`.github/skills/`、`.agents/skills/`、`.claude/skills/`、父目录 `.github/skills/`（monorepo inherited）、`~/.copilot/skills/`、`~/.agents/skills/`、`~/.claude/skills/`、plugin directories、`COPILOT_SKILLS_DIRS` 额外目录、以及 CLI 内置 skills（最低优先级，可被覆盖）。
  - Commands 是替代格式：以单文件 `.md` 存于 `.claude/commands/`，优先级低于同名 skills。
- MCP servers（文档明确）：
  - CLI 包含 built-in MCP servers（示例含 `github-mcp-server`、`playwright`、`fetch`、`time`），并支持禁用 built-in 或禁用特定 server。
  - MCP servers 会从多来源加载并带不同 trust level（内置/仓库/工作区/Dev Container/用户配置/远端）；且所有 MCP tool invocations 都需要显式权限批准（即使是对外部服务的只读操作）。
- Custom agents reference（文档明确）：custom agents 是 Markdown files，且有 project/user/plugin 三种位置与优先级；文档列出多个 built-in agents（例如 `explore`/`research`/`task` 等）及其默认模型与用途。

## Claims Supported

- Copilot CLI 的宿主抽象已包含：skills、plugins、MCP servers、以及 ACP server 等多扩展点，并提供显式配置作用域（user/repo/local）与权限控制接口。（主题1 host；主题2 dist；主题3 supply）
- `.github/copilot/settings.json` 与 `.github/copilot-instructions.md` 共同构成“仓库可提交的 agent 治理资产”，并可与 `AGENTS.md` 分层协作。（主题1 host；主题4 framework）

## Captured Excerpts (keep short)

> Settings cascade from user to repository to local...

## Terms / Concepts

- `.github/copilot/settings.json`
- `.github/copilot/settings.local.json`
- `COPILOT_SKILLS_DIRS`
- built-in MCP server (`github-mcp-server`)
- ACP (Agent Client Protocol)

## Risks / Limits

- 命令参考页描述的是接口与配置；具体默认启用的 MCP/skills/plugins 内容、以及企业组织层策略约束，需要进一步抓取对应概念页（Agents/Access management/MCP）与实现细节。
