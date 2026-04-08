# Vercel Labs Skills Docs (Mintlify): Source Formats

- source_url: https://www.mintlify.com/vercel-labs/skills/guides/source-formats
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 该页把 `npx skills add <source>` 的“源类型识别、支持格式、解析优先级、well-known 端点”形式化，是分发层“像包管理器一样工作”的关键一手证据。

## Key Facts

- Skills CLI 支持多种 source formats，并会自动检测源类型并按对应策略安装。
- 支持格式（文档列出并给出示例）包括：
  - GitHub shorthand（`owner/repo`、`owner/repo@skill-name`、`owner/repo/subpath`）
  - 完整 GitHub URLs（含 branch、含指向 skill folder 的 path）
  - GitLab URLs（含 subgroups、`/-/tree/` pattern、含 branch/path）
  - 任意 git URLs（SSH/HTTP/self-hosted）
  - 本地路径（相对/绝对/Windows 路径等），并要求以 `./`、`../`、`/` 等开头以避免与 shorthand 歧义
- 文档给出 Source Detection Logic（解析顺序），覆盖：
  - local paths
  - GitHub/GitLab URLs（含 branch/path 的多种形式）
  - GitHub shorthand（含 `@skill` filter、含 path）
  - well-known endpoints：HTTP(S) URL 带 `/.well-known/skills/index.json`
  - direct git URLs
- 文档同时说明可用 `--skill` 或 `@skill-name` 过滤安装特定 skills，并支持从指定 branch/ref 安装。

## Claims Supported

- “分发层具备明确的 source detection 与安装策略，不再只是‘到 GitHub 复制文件’。”（主题2 dist）
- “well-known endpoint（`/.well-known/skills/index.json`）体现出 registry/目录标准化方向。”（主题2 dist 趋势）

## Captured Excerpts (keep short)

> The CLI parses sources in this order...

## Terms / Concepts

- source detection logic
- well-known endpoint (`/.well-known/skills/index.json`)
- skill filter (`@skill-name` / `--skill`)

## Risks / Limits

- 该页描述 CLI 的解析与安装规则；不同 agent 的最终落盘路径与兼容性仍需结合 CLI 的 “available agents/targets” 文档核验。

