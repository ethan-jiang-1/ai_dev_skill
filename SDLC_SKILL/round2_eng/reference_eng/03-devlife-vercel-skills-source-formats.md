# Vercel Skills (Mintlify Docs): Source Formats + Source Detection Logic

- source_url: https://www.mintlify.com/vercel-labs/skills/guides/source-formats
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: Makes skill installation “engineerable”: explicit source formats and deterministic parsing logic (including well-known endpoint). This underpins the “Discovery & Scoping” and “Deployment” phases of the eng skill lifecycle.
- claims_supported:
  - Skills CLI supports multiple source formats (GitHub shorthand/URLs, GitLab, generic git, local paths, well-known endpoints).
  - Defines a source detection / parsing order (deterministic behavior).
  - Supports installing a subset of skills from a source (filters via `@skill-name` / `--skill`).
- date_scope: docs page as of access date (2026-04-09)
- related_tools: Vercel Labs `skills` CLI; well-known skills index

## 关键事实

- 文档列出 `npx skills add <source>` 支持的 source formats，包括：
  - GitHub shorthand（`owner/repo`、`owner/repo@skill-name`、`owner/repo/subpath`）
  - GitHub/GitLab 完整 URL（含 branch/path）
  - 任意 git URL（SSH/HTTP/self-hosted）
  - 本地路径（相对/绝对，要求以 `./`/`../`/`/` 等开头避免歧义）
  - well-known endpoint（HTTP(S) + `/.well-known/skills/index.json`）
- 文档定义 Source Detection Logic（解析顺序），使安装行为可预测。

## 与本研究的关系

- 对 03-devlife（Discovery/Deployment）：
  - source formats + parsing order 让“找 skill / 装 skill / 定位来源”变成工程化流程，而不是手工复制粘贴。
  - `@skill-name` / `--skill` 的子集安装能力与“难度分层/渐进采纳”策略兼容：团队可以从一个 repo 里先装低风险低复杂度技能。

## 可直接引用的术语 / 概念

- source detection logic
- well-known endpoint (`/.well-known/skills/index.json`)
- skill filter (`@skill-name` / `--skill`)

## captured_excerpt

> The CLI parses sources in this order...

## 风险与局限

- 文档描述的是 CLI 的解析/安装规则；最终落盘目录、跨宿主兼容与权限边界仍需结合各宿主的官方说明核验。

