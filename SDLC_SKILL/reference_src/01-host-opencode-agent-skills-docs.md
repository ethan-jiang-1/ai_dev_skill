# OpenCode Docs: Agent Skills

- source_url: https://open-code.ai/docs/en/skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 这是 OpenCode 对 Agent Skills 的“落盘路径、发现规则、frontmatter 支持字段、权限控制、工具禁用”一手规范，直接支撑“名义兼容 vs 真实运行模型”的比较。

## Key Facts

- OpenCode 的 skills：从 repo 或 home 目录发现可复用指令；通过原生 `skill` 工具按需加载（agents 先看到可用 skills，再在需要时加载全文）。
- 默认搜索路径（文档列举）覆盖：
  - Project: `.opencode/skills/<name>/SKILL.md`
  - Global: `~/.config/opencode/skills/<name>/SKILL.md`
  - Claude-compatible: `.claude/skills/<name>/SKILL.md` / `~/.claude/skills/<name>/SKILL.md`
  - agent-compatible: `.agents/skills/<name>/SKILL.md` / `~/.agents/skills/<name>/SKILL.md`
- 发现规则：对 project-local 路径，OpenCode 从当前工作目录向上遍历直到 git worktree，沿途加载匹配的 skill 目录（并同时识别 `.claude/skills/*/SKILL.md` 与 `.agents/skills/*/SKILL.md`）。
- `SKILL.md` frontmatter 字段：仅识别 `name`、`description`（必填）以及 `license`、`compatibility`、`metadata`（可选）；未知字段会被忽略。
- `name` 约束：1-64；小写字母/数字/连字符（单连字符分隔）；不能以 `-` 开头或结尾；不能包含连续 `--`；且必须与包含 `SKILL.md` 的目录名一致；文档给出等价正则：`^[a-z0-9]+(-[a-z0-9]+)*$`。
- `description` 约束：1-1024；建议足够具体以便 agent 正确选择。
- 权限控制：可在 `opencode.json` 使用 pattern-based permissions 控制 skill 的访问（`allow`/`deny`/`ask`），并支持通配符；`deny` 会让 skill 对 agent 隐身。
- 可按 agent 覆盖权限（custom agents 的 frontmatter 或 `opencode.json` 的 built-in agent 配置）。
- 可禁用 `skill` 工具（custom agent frontmatter 或 `opencode.json`），禁用后 `<available_skills>` 段会完全省略。

## Claims Supported

- “OpenCode 不只是‘支持 SKILL.md’，而是给出清晰的发现路径、加载语义（tool 按需加载）与权限模型（allow/ask/deny）。”（主题1 host）
- “跨宿主兼容在现实中体现为：同一 repo 能被不同工具识别（.claude/.agents 兼容路径），但权限与工具开关属于宿主专有实现差异。”（主题1 兼容边界）

## Captured Excerpts (keep short)

> Skills are loaded on-demand via the native skill tool...

## Terms / Concepts

- available_skills (tool description)
- pattern-based permissions (allow/ask/deny)
- tool disable (omit available_skills)

## Risks / Limits

- 该页描述 OpenCode 的实现语义；其他宿主对“发现范围”“权限语义”“未知 frontmatter 字段处理”可能不同，需分别对齐。

