# GitHub Docs: Copilot CLI Tool Permissions (`--available-tools`, `--allow-tool`, `--yolo`)

- source_url: https://docs.github.com/en/copilot/how-tos/copilot-cli/allowing-tools
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 该页把 Copilot CLI 的“权限/治理”机制讲成可操作事实：工具能力面、读写默认策略、显式批准、人类在环，以及工具可见性（available/excluded）与执行权限（allow/deny）的两层控制。这是衡量宿主平台是否适合团队沉淀 skills/agents 的核心证据。

## Key Facts

- Copilot CLI 使用多种 tools 完成任务（文档列举能力面）：执行 shell、读写文件、搜索代码库、fetch web content、delegating tasks to specialized sub-agents。
- 默认策略：read-only 操作（搜索、读文件、运行 read-only shell commands）会被自动允许；可能修改系统的工具（destructive shell commands、编辑文件、访问 URLs）需要用户显式批准（explicit approval）。
- 两层 tool controls（文档明确）：
  - 工具可见性控制：`--available-tools`（allowlist，禁用其他所有工具）、`--excluded-tools`（denylist，仅禁用指定工具）。
  - 工具执行权限控制：`--allow-tool` 与 `--deny-tool`（deny 优先于 allow，即使设置 `--allow-all`）。
- 文档提供 allow/deny 示例，覆盖：
  - 允许特定命令模式（如 `shell(git:*)`）并 deny 特定子命令（如 `shell(git push)`）。
  - 允许对特定文件的 write（示例包含 `.github/copilot-instructions.md`）。
  - 允许 MCP server 的特定 tool（示例 `MyMCP(create_issue)`）。
- Permissive options：`--allow-all-tools`、`--allow-all`/`--yolo`（等价于允许所有 tools/paths/urls）；并强烈建议仅在隔离环境使用，且不应通过 alias 让其成为默认启动方式。
- 交互命令：`/reset-allowed-tools` 可撤销本 session 内授予的权限（包括通过交互批准与 `/yolo` 授予的权限）。

## Claims Supported

- Copilot CLI 把“工具权限”显式产品化为可审计配置与交互批准机制，是宿主平台治理能力的重要分水岭。（主题1 host；主题2 dist）
- 工具可见性（available/excluded）与执行权限（allow/deny）分层，使得“最小暴露面”成为可配置策略，而不是仅靠用户每次拒绝。（主题1 host）

## Captured Excerpts (keep short)

> ...tools that can modify your system ... require your explicit approval...

## Terms / Concepts

- tool visibility: `--available-tools` / `--excluded-tools`
- tool permission: `--allow-tool` / `--deny-tool`
- permissive: `--allow-all` / `--yolo`
- MCP tool allow rules (`MyMCP(tool_name)`)

## Risks / Limits

- 文档给出的是 CLI 权限语义；仍需结合企业策略（组织层禁用/强制策略）与真实误用案例，评估默认配置是否足够安全。

