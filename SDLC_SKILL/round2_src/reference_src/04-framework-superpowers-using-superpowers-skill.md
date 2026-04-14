# obra/superpowers: `using-superpowers` skill (`SKILL.md`)

- source_url: https://github.com/obra/superpowers/blob/main/skills/using-superpowers/SKILL.md
- source_type: official_repo_skill
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这是 Superpowers “强制流程/技能优先级”落地的核心机制文件：它要求在任何响应（包括澄清问题）之前先调用 Skill tool 检查并加载相关 skills，并明确指令优先级（用户 > Superpowers skills > 默认系统提示）。它把“方法论纪律”写进了可执行的启动规则，而不是停留在 README 口号。

## Key Facts

- frontmatter 显式把该 skill 定位为“开始任何对话时使用”，并要求：在任何响应之前（包括澄清问题）必须先用 Skill tool 调用相关 skills。（Ref: SKILL.md）
- 文档以强制性语言规定：只要有 1% 可能某个 skill 适用，就必须 invoke skill；并强调“不可协商/不可选”。（Ref: SKILL.md）
- 定义了 instruction priority：用户显式指令（含 `CLAUDE.md/GEMINI.md/AGENTS.md` 与直接请求）优先级最高；Superpowers skills 次之；默认系统提示最低；并给出“用户禁止 TDD 则应服从用户”的示例。（Ref: SKILL.md）
- 明确不同宿主的 skill 调用入口与适配：
  - Claude Code 用 `Skill` tool；
  - Copilot CLI 用 `skill` tool；
  - Gemini CLI 用 `activate_skill` tool；
  - 并提供 tool mapping 引导（`references/copilot-tools.md`、`references/codex-tools.md`）。（Ref: SKILL.md）
- “核心规则”要求：在任何响应或行动之前先调用相关/可能相关 skills，并建议当多个 skills 可能适用时先用 process skills（brainstorming/debugging）再用 implementation skills。（Ref: SKILL.md）

## Claims Supported

- “Superpowers 的 ‘mandatory workflows’ 并不是抽象口号，而是通过一个启动型 skill 将 ‘先查 skills 再行动’ 写成不可跳过的执行纪律，从而在运行时持续约束 agent 的工作方式。”（主题 4 framework；机制）

## Captured Excerpts (keep short)

> requiring Skill tool invocation before ANY response including clarifying questions

## Terms / Concepts

- Skill tool invocation first
- instruction priority (user > Superpowers skills > system)
- process skills vs implementation skills

## Risks / Limits

- 该机制依赖宿主能正确加载并触发该 skill（或用户/模板确保会话启动时先调用它）；若启动 skill 未被调用，后续纪律约束会显著弱化。

