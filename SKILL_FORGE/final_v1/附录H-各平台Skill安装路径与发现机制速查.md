# 附录 H：各平台 Skill 安装路径与发现机制速查

你在主文第 6 节学了怎么写 portable core，在附录 C 学了怎么区分共同层和平台扩展层。但真正要把 skill 装进某个平台时，一个非常实际的问题是：**文件放哪个目录？**

不同平台的 skill 安装路径不同，同一个平台还可能有项目级和全局级两种装法。这份附录把当前主流平台的路径规则和发现机制集中呈现，当作速查表用。

> **注意：** 各平台的路径约定仍在快速演化中。下面的信息基于 2026 年 4 月的官方文档和社区实践。如果你在未来阅读本文时发现某条路径不对了，以各平台当前官方文档为准。

---

## H1. 速查总表

| 平台 | 项目级路径 | 全局 / 个人级路径 | 触发方式 | 备注 |
| --- | --- | --- | --- | --- |
| **Codex** | `.agents/skills/`（从当前目录向上扫到 repo root） | `$HOME/.agents/skills`、`/etc/codex/skills`、系统内置 | 显式 `/skills` 或 `$skill`；隐式 `description` 匹配 | 还支持 `~/.codex/config.toml` 中 `[[skills.config]]` 按路径启停 |
| **Claude Code** | `.claude/skills/`（支持嵌套发现） | `~/.claude/skills/` | 显式 `/skill-name`；隐式 `description` 匹配（除非 `disable-model-invocation: true`） | 也兼容 `.agents/skills/`；支持 plugin manifest 和 session-start hooks |
| **Cursor** | `.cursor/skills/`、`.agents/skills/` | `~/.cursor/skills/`、`~/.agents/skills/` | 任务相关性自动加载 | 也兼容 `.claude/skills/`、`.codex/skills/` 的扫描 |
| **GitHub Copilot** | `.github/skills/`、`.claude/skills/`、`.agents/skills/` | `~/.copilot/skills/`、`~/.claude/skills/`、`~/.agents/skills/` | 任务相关性自动加载 | 多路径约定支持最广的平台 |
| **OpenCode** | `.agents/skills/` | `~/.config/opencode/skills/` | 隐式 `description` 匹配 | 路径约定可能因版本更新而变化 |

---

## H2. 逐平台详解

### Codex

Codex 的路径设计有四个层级，从近到远依次是：

1. **repo scope**：从当前工作目录向上扫描，沿路找到的每一个 `.agents/skills/` 目录都会被识别，直到 repo root。
2. **user scope**：`$HOME/.agents/skills`，用户级全局 skill。
3. **admin scope**：`/etc/codex/skills`，系统管理员级别。
4. **system scope**：Codex 自带的内置 skill。

除了路径，Codex 还提供了一个配置级控制：在 `~/.codex/config.toml` 中可以用 `[[skills.config]]` 按路径启用或停用特定 skill。

Codex 的触发方式有两种：在 CLI 或 IDE 中用 `/skills` 或 `$skill-name` 显式调用；或者靠任务与 `description` 的匹配自动触发。

**Codex 特有的扩展**（不属于 portable core）：`agents/openai.yaml`（UI 元数据和调用策略）、plugin 打包体系、`.agents/skills` 的向上扫描语义。

---

### Claude Code（Claude CLI）

Claude Code 的 skill 发现路径比较直接：

1. **项目级**：`.claude/skills/` 目录下的 skill。支持嵌套发现——子目录里的 skill 也会被自动找到。
2. **个人级**：`~/.claude/skills/`。
3. **兼容路径**：也认 `.agents/skills/`。

Claude Code 还支持 plugin manifest 声明（`.claude-plugin/plugin.json`）和 session-start hooks（`hooks/hooks.json`）——superpowers 就是用这条路做自动注入的。

触发方式：显式 `/skill-name`；隐式靠 `description` 匹配（除非在 frontmatter 里设了 `disable-model-invocation: true`）。

**Claude 特有的扩展**（不属于 portable core）：丰富的 frontmatter 字段（`allowed-tools`、`hooks`、`shell`、`agent`、`model`、`effort`、`context` 等）。这些在其他平台上不会自动生效。

---

### Cursor

Cursor 的 skill 发现机制体现了 IDE 生态的兼容取向——它同时扫描多个路径约定：

1. **项目级**：`.cursor/skills/`、`.agents/skills/`。
2. **个人级**：`~/.cursor/skills/`、`~/.agents/skills/`。
3. **兼容扫描**：也会扫 `.claude/skills/` 和 `.codex/skills/`。

这个"广撒网"的策略有利有弊。好处是你从 Claude Code 或 Codex 迁移来的 skill 大概率能被找到。坏处是如果你在多个路径里放了同一个 skill 的不同版本，可能会出现重复加载或版本混乱。社区里已经有用户反馈过这个问题——建议在 Cursor 里选定一个主路径（推荐 `.cursor/skills/`），不要在多个兼容路径里放重复内容。

**Cursor 的独特边界**：Cursor 有自己的 `.cursor/rules/` 规则系统（类似 `AGENTS.md` 的角色，但路径和语法不同）。skill 和 rules 的分工是：rules 管常驻规则，skill 管按需流程——和主文 §2 讲的"规章制度 vs 急救箱"类比一致。

---

### GitHub Copilot

GitHub Copilot 是目前对多路径约定支持最广的平台——它同时接受三套路径：

1. **项目级**：`.github/skills/`、`.claude/skills/`、`.agents/skills/`。
2. **个人级**：`~/.copilot/skills/`、`~/.claude/skills/`、`~/.agents/skills/`。

这意味着不管你的 skill 是按 GitHub 约定、Claude 约定还是通用 `.agents` 约定放的，Copilot 都能找到。官方还推荐通过 `anthropics/skills` 和 `github/awesome-copilot` 发现社区 skill。

Copilot 的触发逻辑主要靠任务相关性自动加载，当前官方文档更强调 automatic relevance 而非 slash-style 显式调用。

**GitHub Copilot 特有的扩展**：`license`、`allowed-tools` 字段。`.github/skills/` 和 `.copilot/skills/` 路径语义不应外推为全平台标准。

---

### OpenCode

OpenCode 作为一个开源的终端 agent，也支持 Agent Skills 格式：

1. **项目级**：`.agents/skills/`。
2. **个人级**：`~/.config/opencode/skills/`（注意：社区早期有 `~/.config/opencode/skill` 单数形式的用法，具体以当前版本为准）。

OpenCode 的触发方式以隐式 `description` 匹配为主。

---

## H3. `.agents/skills/` 是公约数吗？

从表上看，`.agents/skills/` 是唯一一个在所有五个平台上都被支持的路径。它正在成为事实上的跨平台公约数——agentskills.io 的快速入门教程就用它作为默认位置。

但公约数不等于全能路径。每个平台对 `.agents/skills/` 的发现行为并不完全一样——Codex 会从当前目录向上扫到 repo root，Claude Code 也兼容但主路径是 `.claude/skills/`，Cursor 会扫但也会扫其他路径。所以：

- **如果你只在一个平台上用**：用那个平台的主路径（如 Codex 用 `.agents/skills/`，Claude 用 `.claude/skills/`，Cursor 用 `.cursor/skills/`）。
- **如果你想跨平台**：用 `.agents/skills/` 作为主路径，但为每个平台写一份安装说明，标注"如果用 X 平台也可以放到 Y 路径"。

---

## H4. 项目级 vs 全局级：该怎么选

**项目级安装**（skill 放在项目目录里）：

- 适合团队共享——skill 和代码一起进版本控制。
- 不同项目可以有不同的 skill 集合。
- 别人 clone 你的项目就自动拿到了 skill。

**全局级安装**（skill 放在用户 home 目录里）：

- 适合跨项目复用——你写了一个通用的代码审查 skill，想在所有项目里都能用。
- 不会被 git 跟踪，不会意外泄露给项目的其他成员。
- 缺点是团队其他人看不到，也无法做版本控制。

推荐做法：**默认用项目级。** 等你确实有一个 skill 频繁在多个项目中复用时，再考虑全局级。两种同时存在时要注意有没有同名冲突——不同平台处理冲突的方式不同。

---

## H5. `skills` CLI 的跨平台安装

如果你不想手动把 skill 复制到各个目录，Vercel 的 `skills` CLI（通过 `skills.sh` 或 `npx agent-skills-cli`）提供了自动化安装：

```bash
# 安装到当前项目（默认）
npx agent-skills-cli add <repo-path>

# 安装到全局
npx agent-skills-cli add <repo-path> --global

# 指定目标平台（CLI 会自动选择正确的目录）
npx agent-skills-cli add <repo-path> --agent cursor
npx agent-skills-cli add <repo-path> --agent claude
npx agent-skills-cli add <repo-path> --agent codex
```

`--agent` 参数会让 CLI 把 skill 放到对应平台的主目录里——比如 `--agent cursor` 会放到 `.cursor/skills/`，`--agent claude` 会放到 `.claude/skills/`。

---

## H6. 跨平台同步的现实

一个容易被忽略的事实：**自定义 skill 不会在不同平台之间自动同步。** 你在 Claude Code 里创建的 skill 不会自动出现在 Cursor 或 Codex 里。

社区里已经有人为此写了专门的同步 skill（如 skills.sh 上的 `sync-skills`），自动把一份 skill 复制到多个平台的目录里。但这类社区工具维护的路径映射可能跟不上各平台的更新——路径漂移（path drift）是一个真实存在的问题。

更稳的做法是：把 skill 放在项目 repo 里的 `.agents/skills/`（作为 single source of truth），然后为需要特殊路径的平台写安装脚本或文档。superpowers 仓库在这方面做了很好的示范——它为每个宿主单独维护安装说明（见 [附录G](./附录G-进阶话题与深度参考.md) G1）。

---

## H7. 读完这份附录，下一步做什么

选你最常用的那个平台，确认你的 skill 放对了目录。如果你在多个平台之间切换，把 `.agents/skills/` 作为主路径，并为其他平台写一份安装说明。别花太多时间在路径上——路径只是起点，真正重要的是 skill 的内容和 trust gate。
