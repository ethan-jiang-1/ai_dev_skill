# vercel-labs/skills: README

- source_url: https://github.com/vercel-labs/skills
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: shared
- trust_level: official
- why_it_matters: 提供 `npx skills` 安装/查找/更新能力，是“分发层像包管理器演进”的关键一手证据。

## Key Facts

- 项目定位：open agent skills ecosystem 的 CLI。
- README 明确支持多个 agents（示例列出 OpenCode、Claude Code、Codex、Cursor 等）。
- 安装技能的核心命令形态：`npx skills add <source>`。
- 支持多种 source formats：
  - GitHub shorthand（`owner/repo`）
  - 完整 GitHub URL
  - repo 内指向某个 skill 的路径 URL
  - GitLab URL
  - 任意 git URL（含 SSH）
  - 本地路径
- 支持按 agent 过滤安装（`--agent`）与按 skill 名过滤安装（`--skill` / `@skill` 语法）。
- 安装范围区分 project vs global；安装方法区分 symlink（推荐） vs copy。
- 附带命令：list/find/remove/check/update/init 等，体现“像包管理器”的操作面。

## Claims Supported

- “分发层正在产品化为 CLI 安装器，具备 source format、agent 适配、更新检查等包管理器能力。”（主题2 dist）
- “同一来源可被安装到不同宿主/agent，分发层承担‘兼容适配’与‘落盘位置选择’。”（主题2/主题1 交叉）

## Captured Excerpts (keep short)

> The CLI for the open agent skills ecosystem.

> npx skills add vercel-labs/agent-skills

## Terms / Concepts

- source formats
- install scope (project/global)
- symlink vs copy

## Risks / Limits

- README 描述的是 CLI 能力与接口；具体每个 agent 的落盘路径/兼容细节仍需结合“Available Agents”与各宿主文档核验。

