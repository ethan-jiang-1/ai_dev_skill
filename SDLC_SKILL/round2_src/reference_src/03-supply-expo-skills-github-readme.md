# expo/skills: README

- source_url: https://github.com/expo/skills
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: 作为企业第一方 skills 仓库 README，它给出了跨宿主安装路径，并明确指出 Cursor 中 “skills 不在 / 菜单出现、通过 auto-discovery 工作” 等易踩坑点。

## Key Facts

- 仓库定位：Expo 团队提供的官方 AI agent skills，用于构建/部署/调试 Expo apps。
- Claude Code：通过 `/plugin marketplace add expo/skills` 与 `/plugin install expo` 安装。
- Cursor：通过 Remote Rule（GitHub）添加 `https://github.com/expo/skills.git`。
- Cursor 机制说明（README 明确）：
  - skills 会基于上下文与 skill descriptions 自动被 agent 发现并使用（auto-discovery）。
  - skills 不会出现在 `/` slash command menu；`/` 菜单是给 `.cursor/commands/` 的自定义 commands 使用，而不是 skills。
- 任意 agent：示例命令 `bunx skills add expo/skills`，并提示会把 skills 单独解包，升级需要人工处理。
- License：MIT。

## Claims Supported

- “企业第一方仓库能提供最直接的‘如何安装/如何验证/如何触发’操作指南，并暴露宿主易错差异（skills vs commands）。”（主题3 supply；主题1 host）

## Captured Excerpts (keep short)

> Skills won't appear in the `/` slash command menu.

## Terms / Concepts

- `.cursor/commands/` vs skills
- auto-discovery
- Remote Rule (GitHub)

## Risks / Limits

- README 提到的宿主路径/机制可能随宿主版本变化；需要结合宿主官方文档做时间范围标注。

