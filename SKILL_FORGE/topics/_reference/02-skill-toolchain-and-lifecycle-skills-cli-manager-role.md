# `skills` CLI As Installer And Compatibility Manager

- `source_urls`:
  - `https://skills.sh/docs/cli`
  - `https://raw.githubusercontent.com/vercel-labs/skills/main/README.md`
- `source_type`: `official-doc-and-readme`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `official`
- `why_it_matters`: `这是当前最清楚的 installer / manager 层对象，直接决定 skill 如何被安装、更新、检查和对接不同 agent。`
- `claims_supported`:
  - `skills` 的主职责是安装与管理 skill，而不是充当样板库
  - 它已经覆盖 add / list / find / remove / check / update / init 等管理动作
  - 它试图把多 agent 目录兼容与 single source of truth 一起纳入工具层

## 关键事实

- `skills.sh/docs/cli` 直接把 `skills` CLI 说成 `the primary way to install and manage skills for your AI agents`。
- 文档明确给出 `npx skills add <skill-name>` 与 `npx skills add vercel-labs/agent-skills` 等安装方式。
- CLI 文档说明安装后会自动配置给 AI agent 使用。
- CLI 文档还说明默认会收集匿名 telemetry，用于 leaderboard 排序，并允许通过 `DISABLE_TELEMETRY=1` 关闭。
- README 则进一步补充:
  - 支持 project scope 与 global scope
  - 支持 `list`、`find`、`remove`、`check`、`update`、`init`
  - 推荐 `symlink` 作为 `single source of truth` 的治理模式

## 与本研究的关系

- 对 `02` 来说，这个对象应被稳定归类为:
  - installer
  - manager
  - compatibility layer
- 它不是内容样板库，也不是治理 / 审计 / 发布工具。
- 如果最终要给自己的 workflow 找一个“装载与分发基座”，这类对象是最接近基座能力的一层。

## 风险与局限

- 这个工具可以负责安装和更新，但不自动承担 skill 内容质量审计。
- telemetry 与 leaderboard 说明它开始接入生态信号层，但这不等于它已经解决信任问题。
