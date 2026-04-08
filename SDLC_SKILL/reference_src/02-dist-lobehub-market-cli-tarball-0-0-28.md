# npm tarball: @lobehub/market-cli@0.0.28 (`lhm`) command surface + install targets

- source_url: https://registry.npmjs.org/@lobehub/market-cli/-/market-cli-0.0.28.tgz
- source_type: practitioner_artifact
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: practitioner
- why_it_matters: 之前对 LobeHub 的证据主要停留在“规模口径 + CLI 包存在性”。该 npm tarball 里包含可读的 CLI 实现（`dist/cli.js`），提供一手、可复现的命令面与落盘语义证据：LobeHub 不只是网页目录，而是一个可通过 CLI 搜索/查看/安装 skills 以及浏览 MCP plugins 的分发入口。

## Key Facts

- 包的可执行入口（bin）为 `lhm`，`node` 要求 `>=22.0.0`。（Ref: `package/package.json` in tarball）
- CLI 读取凭据的方式：
  - 环境变量：`MARKET_CLIENT_ID` / `MARKET_CLIENT_SECRET` / `MARKET_BASE_URL`
  - 或本地文件：`~/.lobehub-market/credentials.json`（并提供保存/删除逻辑）。（Ref: `dist/cli.js`）
- CLI 的顶层命令包含至少：`auth`、`mcp`、`skills`。（Ref: `dist/cli.js`）
- `skills` 命令提供 marketplace browsing + install：
  - `skills search` / `skills view`
  - `skills install <identifier>`：支持 `--version`、`--dir`（覆盖默认 skills 目录）、`--global`（安装到 `~/.agents/skills`）、以及 `--agent <name>`（为特定宿主选择落盘目录）。（Ref: `dist/cli.js`）
- `skills install` 的宿主落盘映射在 CLI 内被硬编码为示例集：
  - `claude-code` -> `./.claude/skills`（local）
  - `codex` -> `./.agents/skills`（local）
  - `cursor` -> `./.cursor/skills`（local）
  - `open-claw` -> `~/.openclaw/skills`（global）。（Ref: `dist/cli.js`）
- `mcp` 命令用于 “Browse and interact with MCP plugins in the marketplace”，并提供 `mcp search/view/rate/comment/comments/react/...` 等交互动作，提示 LobeHub marketplace 将 MCP plugins 也纳入同一分发面。（Ref: `dist/cli.js`）

## Claims Supported

- “LobeHub marketplace 具备 CLI 分发入口，且提供面向多宿主的 skills 安装落盘语义（而非仅网页目录）。”（主题 2 dist）
- “LobeHub marketplace 的对象不仅包含 skills，也包含 MCP plugins（至少在 CLI 交互面上）。”（主题 2 dist；主题 3 supply）

## Captured Excerpts (keep short)

> Browse and install skills from the marketplace

## Terms / Concepts

- `lhm` (LobeHub Market CLI)
- `MARKET_CLIENT_ID` / `MARKET_CLIENT_SECRET` / `MARKET_BASE_URL`
- credentials file: `~/.lobehub-market/credentials.json`
- install targets: `.claude/skills`, `.agents/skills`, `.cursor/skills`, `~/.openclaw/skills`

## Risks / Limits

- 该证据来自 npm tarball（分发工件），能说明“CLI 实际做了什么”；但不直接等价于 marketplace 的治理能力（例如是否有安全扫描、审核、签名、或不可变版本语义），仍需补一手文档或 API 侧证据闭环。

