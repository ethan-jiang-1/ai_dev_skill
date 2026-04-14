# OpenAI Codex Docs: Agent Skills

- source_url: https://developers.openai.com/codex/skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 这份官方文档把 Codex 的 skills 机制讲成“可实现的硬事实”：技能结构、progressive disclosure、`.agents/skills` 的扫描与作用域、插件化分发（plugins）、本地安装器（`$skill-installer`）以及启停配置（`~/.codex/config.toml`），是跨宿主对齐与供给侧兼容的关键基线。

## Key Facts

- 定义与分层：技能（skill）打包 instructions/resources/可选 scripts，用于让 Codex 可靠执行工作流；并声明建立在 open agent skills standard 之上。文档同时区分“skills 是可复用工作流的 authoring format”与“plugins 是可安装的 distribution unit（可分发 skills 与 apps）”。
- progressive disclosure：Codex 先读取每个 skill 的 metadata（name/description/path，及可选 `agents/openai.yaml` 元数据），只有在决定使用该 skill 时才加载完整 `SKILL.md` 指令。
- 结构约束：一个 skill 是一个目录，包含 `SKILL.md` 以及可选脚本/参考资料；`SKILL.md` 必须包含 `name` 与 `description`。
- 存放与发现：Codex 从 repository/user/admin/system 多级位置读取 skills；在 repo 内会从当前工作目录向上扫描到 repo root 的各级 `.agents/skills` 目录。若出现同名 skills，Codex 不会合并（both can appear）。
- 典型目录与作用域（文档示例）：`$CWD/.agents/skills`、`$REPO_ROOT/.agents/skills`、`$HOME/.agents/skills`、`/etc/codex/skills`，以及 Codex 内置的 system skills。
- 软链接：文档声明支持 symlink 的 skill folders，并会跟随 symlink target 扫描。
- 本地安装：文档给出用 `$skill-installer` 安装 curated skills 的方式（示例 `$skill-installer linear`），并说明 Codex 会自动检测新安装的 skills（必要时重启）。
- 启用/禁用：文档说明可在 `~/.codex/config.toml` 里用 `[[skills.config]]` 按路径禁用某个 skill（修改后需要重启 Codex）。
- 可选元数据：文档说明可添加 `agents/openai.yaml`，用于 Codex app 的 UI 元数据、invocation policy、以及 tool dependencies 声明。

## Claims Supported

- “Codex 的技能机制是 open agent skills 标准落地的一个强实现：通过 `.agents/skills` 多级扫描 + progressive disclosure，做到可版本控制、可增量注入、且尽量节省上下文。”（主题1 host；主题3 supply）
- “供给侧分发在 Codex 语义下需要区分：skills（工作流内容） vs plugins（可安装分发包），并且 plugins 可捆绑 MCP server 配置等集成资产。”（主题2 dist；主题3 supply）

## Captured Excerpts (keep short)

> Skills use progressive disclosure to manage context efficiently.

## Terms / Concepts

- `.agents/skills` scanning
- progressive disclosure
- plugins (distribution unit)
- `$skill-installer`
- `~/.codex/config.toml` (`[[skills.config]]`)
- `agents/openai.yaml` (optional metadata)

## Risks / Limits

- 文档给出的是 Codex 官方口径；不同宿主（Claude/Cursor/Windsurf/OpenCode/Gemini）在“插件/技能/扩展”的命名与落盘机制上仍不一致，需要分别抓取各宿主官方 docs 做对齐。

