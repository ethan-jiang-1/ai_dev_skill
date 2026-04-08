# cursor/plugins: create-plugin scaffold skill (local plugin directory)

- source_url: https://github.com/cursor/plugins/blob/main/create-plugin/skills/create-plugin-scaffold/SKILL.md
- source_type: official_repo_doc
- accessed_at: 2026-04-09
- related_topic: host
- trust_level: official
- why_it_matters: Cursor plugins 的“本地落盘/可用性”在该官方 SKILL.md 中被直接写明（默认写入 `~/.cursor/plugins/local/...` 且无需安装步骤即可被 Cursor 使用），补齐了 blog/forum 之外的可复现实证据。

## Key Facts

- 该 SKILL.md 的目标是生成一个新的 Cursor plugin scaffold，并使其可用于本地或 marketplace 提交。（Ref: SKILL.md）
- 默认输出位置（Output Location）：`~/.cursor/plugins/local/<plugin-name>/`；文档明确该路径使 plugin “immediately available to Cursor without any install step”。如用户明确要求其它目录，应尊重。（Ref: SKILL.md）
- Required Inputs 明确 plugin 可能包含的组件集合：`rules`、`skills`、`agents`、`commands`、`hooks`、`mcpServers`。（Ref: SKILL.md）
- Workflow 明确基础文件：`.cursor-plugin/plugin.json`、`README.md`、`LICENSE`（可选 `CHANGELOG.md`）；并在 multi-plugin marketplace 形态下要求把 entry 写入 `.cursor-plugin/marketplace.json`。（Ref: SKILL.md）
- Guardrails 要求：默认保存到 `~/.cursor/plugins/local/<plugin-name>/`，并避免绝对路径与父目录穿越等不安全路径引用。（Ref: SKILL.md）

## Claims Supported

- “Cursor 至少在本地开发/落盘语义上存在明确的 plugin directory 约定（`~/.cursor/plugins/local/`），并把 ‘放进去即可可用’ 作为默认工作流。”（主题 1 host；落盘与治理）

## Captured Excerpts (keep short)

> This path makes the plugin immediately available to Cursor without any install step.

## Terms / Concepts

- local plugin directory: `~/.cursor/plugins/local/<plugin-name>/`
- per-plugin manifest: `.cursor-plugin/plugin.json`
- marketplace index: `.cursor-plugin/marketplace.json`

## Risks / Limits

- 该来源是官方仓库中的 SKILL.md（工作流/约定层证据），能说明推荐落盘路径与期望行为；但对 Cursor IDE/CLI 的真实加载一致性与权限边界，仍需结合产品实现与更多官方说明交叉验证。

