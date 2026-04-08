# 主题 1（host）问题清单更新（Wave 1）

## 已回答（有证据回指）

- OpenCode 的技能发现路径与权限模型：支持 `.opencode/skills`、`.claude/skills`、`.agents/skills` 与全局路径；`opencode.json` 可用 allow/ask/deny 控制 skill 访问并支持禁用 skill tool。（Ref: ../reference_src/01-host-opencode-agent-skills-docs.md）
- Windsurf skills 的目录与作用域：workspace/global/system；支持自动触发与 `@mention` 手动触发；使用 progressive disclosure 控制上下文加载。（Ref: ../reference_src/01-host-windsurf-skills-docs.md）
- Cursor 的宿主抽象（plugin primitives）：plugins 可包含 skills/subagents/MCP/hooks/rules；并在产品内提供 `/add-plugin` 安装入口；官方声明正在推进 team marketplaces（治理与安全控制）。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；Ref: ../reference_src/01-host-cursor-forum-plugins-2-5.md）
- Claude 的 skills 机制（progressive disclosure + 动态加载）与分类（Anthropic/Custom/Org/Partner skills），以及组织级治理入口（启用/预置/分享 view-only）。（Ref: ../reference_src/01-host-claude-what-are-skills.md；Ref: ../reference_src/01-host-claude-using-skills-in-claude.md）
- 兼容性边界线索：Claude 自定义技能文档中的字段/约束（如 human-friendly `name`、description 长度、`dependencies`）与 agentskills.io/open spec 的字段/约束存在差异，需要做互操作核验。（Ref: ../reference_src/01-host-claude-creating-custom-skills.md；Ref: ../reference_src/00-shared-agentskills-specification.md）
- 失败模式线索：Cursor CLI mode 与 IDE 对 plugins 的加载语义可能不一致（社区报告），影响 headless/终端场景一致性。（Ref: ../reference_src/01-host-cursor-forum-cli-mode-plugins-bug.md）

## 待验证 / 待补搜

- OpenAI Codex 的 skills/能力包机制与目录约定（官方 docs/仓库）。
- GitHub Copilot 的 skills 支持机制（目录、注册/扩展点、触发语义）与团队共享治理入口（官方 docs）。
- Cursor plugins 的正式 docs（落盘位置、权限模型、CLI/IDE 一致性、企业治理机制的细节）。
- Windsurf “Claude Code config reading” 的开关语义与兼容扫描边界（官方说明）。

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：
- 新搜到的材料是否主要重复已知事实：
- 是否已覆盖 6 个固定问题（且每个有证据）：
- 是否已补搜反例、限制、争议：
- 是否已完成“官方说法 vs 社区实践”交叉核验：
