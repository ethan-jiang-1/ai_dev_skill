# 主题 1（host）问题清单更新（Wave 1）

## 已回答（有证据回指）

- OpenCode 的技能发现路径与权限模型：支持 `.opencode/skills`、`.claude/skills`、`.agents/skills` 与全局路径；`opencode.json` 可用 allow/ask/deny 控制 skill 访问并支持禁用 skill tool。（Ref: ../reference_src/01-host-opencode-agent-skills-docs.md）
- Windsurf skills 的目录与作用域：workspace/global/system；支持自动触发与 `@mention` 手动触发；使用 progressive disclosure 控制上下文加载。（Ref: ../reference_src/01-host-windsurf-skills-docs.md）
- Cursor 的宿主抽象（plugin primitives）：plugins 可包含 skills/subagents/MCP/hooks/rules；并在产品内提供 `/add-plugin` 安装入口；官方声明正在推进 team marketplaces（治理与安全控制）。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；Ref: ../reference_src/01-host-cursor-forum-plugins-2-5.md）
- Claude 的 skills 机制（progressive disclosure + 动态加载）与分类（Anthropic/Custom/Org/Partner skills），以及组织级治理入口（启用/预置/分享 view-only）。（Ref: ../reference_src/01-host-claude-what-are-skills.md；Ref: ../reference_src/01-host-claude-using-skills-in-claude.md）
- OpenAI Codex 的 skills 机制与目录约定：skills 使用 progressive disclosure；repo 内向上扫描 `.agents/skills`；并区分 skills（authoring format）与 plugins（installable distribution unit），可在 `~/.codex/config.toml` 禁用 skills。（Ref: ../reference_src/01-host-openai-codex-agent-skills-docs.md）
- Gemini CLI 的 extensions 机制：扩展安装/更新/启停命令、默认拷贝式安装与 symlink 开发模式、扩展目录 `~/.gemini/extensions`，以及 manifest `gemini-extension.json`（可捆绑 MCP servers、agent skills、custom commands、hooks，并支持 `excludeTools` 与 scope）。（Ref: ../reference_src/01-host-google-gemini-cli-extensions-reference.md）
- GitHub Copilot 的仓库级治理资产：repo custom instructions 支持 `.github/copilot-instructions.md`、`.github/instructions/*.instructions.md` 与 `AGENTS.md`（就近优先），并给出 `CLAUDE.md`/`GEMINI.md` 的兼容口径。（Ref: ../reference_src/01-host-github-copilot-repo-custom-instructions.md）
- Copilot CLI 的 skills/权限机制：明确支持 `SKILL.md` skills 并将 `.agents/skills`/`~/.agents/skills` 纳入扫描；同时提供 trusted folders、allow/deny tools、settings scopes 与 `/skills`/`/mcp`/`/plugin` 等治理入口。（Ref: ../reference_src/01-host-github-copilot-cli-command-reference.md；../reference_src/01-host-github-copilot-cli-allowing-tools.md；../reference_src/01-host-github-copilot-cli-configure.md）
- 兼容性边界线索：Claude 自定义技能文档中的字段/约束（如 human-friendly `name`、description 长度、`dependencies`）与 agentskills.io/open spec 的字段/约束存在差异，需要做互操作核验。（Ref: ../reference_src/01-host-claude-creating-custom-skills.md；Ref: ../reference_src/00-shared-agentskills-specification.md）
- 失败模式线索：Cursor CLI mode 与 IDE 对 plugins 的加载语义可能不一致（社区报告），影响 headless/终端场景一致性。（Ref: ../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md）

## 待验证 / 待补搜

- Cursor plugins 的运行时语义：已补齐官方仓库的 manifest/JSON Schema、marketplace 结构与本地默认 plugins 目录 `~/.cursor/plugins/local/` 的证据，并补齐官方示例 plugin 的 hooks 运行时契约（`stop/afterAgentResponse` + `followup_message`）；且已知 manifest schema 层未出现显式权限声明字段（例如 `permissions`）。但权限模型（hooks/commands 的执行授权与审计）、多插件加载顺序与 IDE/CLI 一致性仍缺更直接的一手说明或实现级核验。（Ref: ../reference_src/01-host-cursor-plugins-json-schemas.md；../reference_src/01-host-cursor-plugins-github-readme.md；../reference_src/01-host-cursor-plugins-create-plugin-scaffold-skill.md；../reference_src/01-host-cursor-plugins-hooks-runtime-contract.md；../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md）
- Windsurf “Claude Code config reading” 的开关语义与兼容扫描边界（官方说明）。

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：基本稳定（Copilot CLI/Claude/Codex/OpenCode/Windsurf/Cursor）。
- 新搜到的材料是否主要重复已知事实：开始出现重复（多宿主都在重复 PD/安装/目录规则，但细节仍有差异）。
- 是否已覆盖 6 个固定问题（且每个有证据）：已覆盖（见 `01-host-evidence-summary.md`）。
- 是否已补搜反例、限制、争议：部分覆盖（字段约束差异、CLI/IDE 行为分裂），仍缺更系统的社区实践反例。
- 是否已完成“官方说法 vs 社区实践”交叉核验：未完成（仍缺 Cursor 正式 docs、以及更多真实落地复盘）。
