# Sundial Docs: CLI

- source_url: https://sundialhub.com/docs/cli
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 给出 CLI 的安装、agent 目标目录映射、鉴权与“public vs private”发现边界，是分发层“跨宿主落盘 + 团队治理”的硬证据。

## Key Facts

- 推荐安装方式：通过 agent 运行 `npx sundial-hub add skill && claude`，然后输入 `/skill` 激活。
- 也支持直接安装 CLI：`npm install -g sundial-hub`，并提供 `sun add <skill>`、`sun find "query"` 等命令形态。
- Install targets：CLI 会 auto-detect agent 并安装到对应文件夹（文中列出示例映射）：
  - `.claude/skills/`（Claude Code）
  - `.cursor/skills/`（Cursor）
  - `.codex/skills/`（Codex CLI）
  - `.gemini/skills/`（Gemini / Antigravity）
- Auth：发布需要鉴权，且鉴权会解锁 CLI 的 private skill discovery；命令形态 `npx sundial-hub auth login`。
- Global vs local：在项目目录内运行会添加到 local；否则添加到用户目录（`~/`）。

## Claims Supported

- “分发平台的关键价值之一是：跨宿主自动映射落盘目录（agent targets）。”（主题2 dist 与主题1 host）
- “私有技能发现与发布需要鉴权，分发层天然引入‘公共 vs 团队/私有’的治理分裂。”（主题2 dist）

## Captured Excerpts (keep short)

> The CLI auto-detects your agent and installs to the right folder.

## Terms / Concepts

- agent targets / install targets
- public vs private discovery
- auth login

## Risks / Limits

- 文档列出的目录映射是 Sundial CLI 的实现口径；不同宿主是否额外支持更多路径仍需进一步核验。

