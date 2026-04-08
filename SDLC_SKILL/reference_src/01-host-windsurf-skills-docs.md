# Windsurf Docs: Cascade Skills

- source_url: https://docs.windsurf.com/windsurf/cascade/skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 给出 Windsurf/Cascade 对 skills 的加载语义（progressive disclosure、自动/手动触发）、目录与作用域（workspace/global/system enterprise）以及跨 agent 扫描路径，是宿主抽象对比的核心一手证据。

## Key Facts

- Skills 的定位：用于把 scripts/templates/checklists 等支持资源与 `SKILL.md` 一起打包，帮助 Cascade 稳定执行复杂多步任务。
- progressive disclosure：默认仅向模型展示 skill 的 `name` 与 `description`；完整 `SKILL.md` 与支持文件只会在 Cascade 决定 invoke skill（或用户 `@mention`）时加载。
- 创建方式：
  - UI：可创建 workspace（project-specific）或 global skill。
  - 手动：workspace 目录 `.windsurf/skills/<skill-name>/SKILL.md`；global 目录 `~/.codeium/windsurf/skills/<skill-name>/SKILL.md`。
- `SKILL.md`：需要 YAML frontmatter，至少包含 `name` 与 `description`；文档强调 name 只能包含 lowercase letters / numbers / hyphens。
- 支持资源：可在 skill 目录内放置其它文件，与 `SKILL.md` 同级；在 skill invoked 时对 Cascade 可用。
- 触发方式：
  - Automatic invocation：请求匹配 description 时自动触发（description 是关键匹配信号）。
  - Manual invocation：输入 `@skill-name` 强制启用。
- 作用域与目录：
  - Workspace：`.windsurf/skills/`（repo 可提交）
  - Global：`~/.codeium/windsurf/skills/`（不提交）
  - System (Enterprise)：OS 级路径（由 IT 下发只读；文档示例给出 macOS 路径 `/Library/Application Support/Windsurf/skills/`）
- 跨 agent 兼容扫描：文档明确 Windsurf 也会发现 `.agents/skills/` 与 `~/.agents/skills/`；若开启 Claude Code config reading，也会扫描 `.claude/skills/` 与 `~/.claude/skills/`。

## Claims Supported

- “Windsurf 对 skills 的触发语义包含自动触发与 `@mention` 手动触发，且通过 progressive disclosure 控制上下文体积。”（主题1 host）
- “同为 SKILL.md 生态，宿主会定义自己的目录与作用域模型（workspace/global/system）并提供 cross-agent 扫描兼容。”（主题1 兼容与治理）

## Captured Excerpts (keep short)

> Cascade uses progressive disclosure: only the skill’s name and description are shown...

## Terms / Concepts

- progressive disclosure
- skill scopes (workspace/global/system)
- cross-agent discovery (.agents/.claude)

## Risks / Limits

- 该页描述 Windsurf 的具体行为；“Claude Code config reading”开关的精确语义与实现边界需要在 Windsurf/Claude 官方文档中进一步核验。

