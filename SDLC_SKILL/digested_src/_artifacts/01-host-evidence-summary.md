# 主题 1（host）证据摘要（Wave 1）

## 证据包清单

<!--
列出本主题相关的 reference_src 文件；建议按 official -> academic -> practitioner -> community 排序。
目标：让任意结论都能在 30 秒内定位到证据文件。
-->

- `../reference_src/00-shared-agentskills-overview.md`
- `../reference_src/00-shared-agentskills-specification.md`
- `../reference_src/00-shared-anthropic-skills-readme.md`
- `../reference_src/00-shared-anthropic-engineering-agent-skills-2025.md`
- `../reference_src/00-shared-windsurf-workflows-docs.md`
- `../reference_src/00-shared-vercel-skills-cli-readme.md`
- `../reference_src/00-shared-cursor-vs-windsurf-blott-2025.md`
- `../reference_src/01-host-claude-what-are-skills.md`
- `../reference_src/01-host-claude-using-skills-in-claude.md`
- `../reference_src/01-host-claude-creating-custom-skills.md`
- `../reference_src/01-host-openai-codex-agent-skills-docs.md`
- `../reference_src/01-host-google-gemini-cli-extensions-reference.md`
- `../reference_src/01-host-opencode-agent-skills-docs.md`
- `../reference_src/01-host-windsurf-skills-docs.md`
- `../reference_src/01-host-cursor-plugins-blog-2026-02-17.md`
- `../reference_src/01-host-cursor-plugins-github-readme.md`
- `../reference_src/01-host-cursor-plugins-json-schemas.md`
- `../reference_src/01-host-cursor-plugins-create-plugin-scaffold-skill.md`
- `../reference_src/01-host-cursor-plugins-hooks-runtime-contract.md`
- `../reference_src/01-host-cursor-forum-plugins-2-5.md`
- `../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md`
- `../reference_src/01-host-github-copilot-repo-custom-instructions.md`
- `../reference_src/01-host-github-copilot-cli-custom-instructions.md`
- `../reference_src/01-host-github-copilot-cli-allowing-tools.md`
- `../reference_src/01-host-github-copilot-cli-configure.md`
- `../reference_src/01-host-github-copilot-cli-command-reference.md`

## 关键判断 -> 证据回指

<!--
每条判断必须标注类型：hard_fact / analysis / trend。
每条至少 1 个 ../reference_src/*.md 回指；关键判断尽量 2+ 交叉来源。
-->

- [hard_fact] progressive disclosure 已被多个宿主写入官方文档并落地：启动仅加载 skills 元数据，按需加载完整 `SKILL.md`（并可能进一步加载引用文件）。（Ref: ../reference_src/01-host-claude-what-are-skills.md；../reference_src/00-shared-anthropic-engineering-agent-skills-2025.md；../reference_src/01-host-windsurf-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- [analysis] `SKILL.md`/Agent Skills 更像最低层可交换协议，但“真实差异”由宿主的发现范围、冲突优先级、触发语义、权限/禁用、以及组织治理入口决定。（Ref: ../reference_src/00-shared-agentskills-specification.md；../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-claude-using-skills-in-claude.md）
- [hard_fact] Codex、Cursor、Gemini CLI 都在官方材料中明确了“可安装打包单位”的语义：Codex 区分 skills vs plugins；Cursor 以 plugin 打包 skills/subagents/MCP/hooks/rules，并在官方仓库用 `marketplace.json` + `plugin.json`（含 JSON Schema）把插件结构与可声明组件字段契约化；Gemini CLI 以 extension 打包 MCP servers、skills、commands、hooks，并提供 `excludeTools` 等治理入口。（Ref: ../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-cursor-forum-plugins-2-5.md；../reference_src/01-host-cursor-plugins-github-readme.md；../reference_src/01-host-cursor-plugins-json-schemas.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md）
- [hard_fact] Cursor plugins 的本地落盘路径在官方仓库中被显式写明：`~/.cursor/plugins/local/<plugin-name>/` 可使 plugin 无需安装步骤即可立即可用（至少在本地开发/落盘语义上）。（Ref: ../reference_src/01-host-cursor-plugins-create-plugin-scaffold-skill.md）
- [hard_fact] Cursor plugins 的 hooks 运行时语义存在实现级证据：官方示例 plugin 通过 `hooks.json` 声明 `stop/afterAgentResponse` 等事件并执行命令，且 `stop` hook 可通过输出 `followup_message` 驱动 agent 继续下一轮；示例中也出现 `CURSOR_PROJECT_DIR/CURSOR_PLUGIN_ROOT` 等环境变量约定。（Ref: ../reference_src/01-host-cursor-plugins-hooks-runtime-contract.md）
- [hard_fact] Cursor plugins 的 marketplace index（`marketplace.json` schema）把每个 plugin entry 的 `source` 定义为“相对路径或 remote URL”，意味着 marketplace 形态在模型层可同时覆盖“多插件仓库索引”与“索引远端来源”。（Ref: ../reference_src/01-host-cursor-plugins-json-schemas.md）
- [hard_fact] Copilot CLI 明确支持 skills（`SKILL.md`）与多目录 discovery（含 `.agents/skills` 与 `~/.agents/skills`），并提供 repo/local settings scopes、slash commands（`/skills`、`/mcp`、`/plugin`）等治理入口。（Ref: ../reference_src/01-host-github-copilot-cli-command-reference.md）
- [hard_fact] 权限/治理能力存在显著分层：Copilot CLI 有 trusted folders + allow/deny tools + `--yolo`/reset；OpenCode 有 allow/ask/deny 与 tool 禁用；Codex 可通过 `~/.codex/config.toml` 禁用 skills；Gemini extensions 支持按 user/workspace scope 启停并可通过 `excludeTools` 限制工具；Claude 有 Team/Enterprise 的组织预置与分享机制。（Ref: ../reference_src/01-host-github-copilot-cli-configure.md；../reference_src/01-host-github-copilot-cli-allowing-tools.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md；../reference_src/01-host-claude-using-skills-in-claude.md）
- [trend] 企业治理方向正在产品化：Cursor 明确提出 private team marketplaces（central governance + security controls），意味着“宿主平台”将成为企业分发与风险控制的关键抓手。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md）
- [hard_fact] 已发现宿主一致性风险：Cursor 社区报告指出 plugins 在 IDE 可用但在 CLI mode 不加载，提示 headless/自动化场景会遇到平台语义分裂问题。（Ref: ../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md）

## 6 个固定问题覆盖情况

- 这个主题当前的硬事实是什么：多个宿主已实现并公开文档化 skills 的发现/加载（含 progressive disclosure）、安装/分发入口（marketplace/plugins），以及一定程度的权限与治理机制；其中 Copilot CLI 也明确支持 `SKILL.md` skills，并提供 settings scopes 与 tool permissions。（Ref: ../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-claude-using-skills-in-claude.md；../reference_src/01-host-github-copilot-cli-command-reference.md；../reference_src/01-host-github-copilot-cli-allowing-tools.md）
- 背后的根本机制是什么：通过“按需加载（PD）+ 目录扫描（scopes）+ 打包分发（plugins）+ 权限/禁用/组织治理”把 skills 从长提示词升级为可版本控制、可管理的工程资产。（Ref: ../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/00-shared-anthropic-engineering-agent-skills-2025.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md）
- 生态最近在往哪里演化：向 team/enterprise governance 与私有分发能力演化（team marketplace、组织预置、central controls），并逐步把 `.agents/skills` 作为跨宿主中间层吸收进 discovery 规则；Copilot CLI 也把 `.agents/skills` 纳入 skills locations。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-claude-using-skills-in-claude.md；../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-github-copilot-cli-command-reference.md）
- 采用或落地的难点在哪里：术语与触发语义不一致（workflows vs skills vs plugins）；跨宿主迁移需对齐字段约束/目录优先级/禁用与权限策略；且 headless 场景存在 IDE/CLI 行为分裂风险。（Ref: ../reference_src/00-shared-windsurf-workflows-docs.md；../reference_src/01-host-claude-creating-custom-skills.md；../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md）
- 社区争议和失败模式在哪里：字段/规范差异导致互操作失败；插件/技能在不同运行形态下不可用；以及“把能力包当成错误入口（slash commands vs auto skills）”导致的发现失败。（Ref: ../reference_src/01-host-claude-creating-custom-skills.md；../reference_src/00-shared-windsurf-workflows-docs.md；../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md）
- 哪些对象最值得继续追踪：Copilot CLI（skills/MCP/plugins + settings scopes + tool permissions）、Codex skills/plugins docs、OpenCode 权限模型、Windsurf scope/PD、Cursor team marketplace/enterprise governance、Claude 组织技能治理与 partner skills/MCP connector 结合。（Ref: ../reference_src/01-host-github-copilot-cli-command-reference.md；../reference_src/01-host-github-copilot-cli-allowing-tools.md；../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-windsurf-skills-docs.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-claude-what-are-skills.md）

## 缺口与下一步补搜

- Cursor plugins 的运行时与权限模型证据：已补齐官方仓库的 manifest/JSON Schema、marketplace 结构与本地默认 plugins 目录 `~/.cursor/plugins/local/`，并补齐了官方示例 plugin 的 hooks 运行时契约（`stop`/`afterAgentResponse` + `followup_message`）；但多插件加载顺序、权限边界（hooks/commands 的执行授权）、以及 IDE/CLI 一致性仍需更直接的一手说明或实现级核验。（缺口）
- Windsurf “Claude Code config reading” 的开关语义与兼容扫描边界（官方说明）。（缺口）
