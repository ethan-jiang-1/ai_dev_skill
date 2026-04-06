# superpowers 仓库目录盘点

## 基本信息

- 仓库：`obra/superpowers`
- snapshot commit：`b7a8f76985f1e93e75dd2f2a3b424dc731bd9d37`
- 项目类型初判：面向 Claude Code / Cursor / Codex / OpenCode / Gemini 的 agent skills 工作流插件

## 顶层目录与关键文件

### 目录

- `.claude-plugin/`：Claude 插件元数据
- `.codex/`：Codex 安装入口
- `.cursor-plugin/`：Cursor 插件元数据
- `.opencode/`：OpenCode 插件与安装入口
- `agents/`：可被调度的 agent 定义
- `commands/`：旧版命令兼容层
- `docs/`：安装、测试、设计与实现文档
- `hooks/`：会话启动注入逻辑
- `scripts/`：版本脚本
- `skills/`：核心 skill 库
- `tests/`：行为、触发、集成与平台测试

### 根级文件

- `README.md`：总览与安装说明
- `CLAUDE.md`：贡献与 PR 纪律
- `GEMINI.md`：Gemini 上下文入口
- `package.json`：包元信息
- `gemini-extension.json`：Gemini 扩展声明
- `CHANGELOG.md` / `RELEASE-NOTES.md`：版本演进

## skill-like 单元盘点

### 1. 显式 skill

`skills/` 下共有 **14 个 `SKILL.md`**：

- `brainstorming`
- `dispatching-parallel-agents`
- `executing-plans`
- `finishing-a-development-branch`
- `receiving-code-review`
- `requesting-code-review`
- `subagent-driven-development`
- `systematic-debugging`
- `test-driven-development`
- `using-git-worktrees`
- `using-superpowers`
- `verification-before-completion`
- `writing-plans`
- `writing-skills`

### 2. 复合型 skill 支撑文件

代表文件：

- `skills/brainstorming/visual-companion.md`
- `skills/brainstorming/spec-document-reviewer-prompt.md`
- `skills/requesting-code-review/code-reviewer.md`
- `skills/subagent-driven-development/implementer-prompt.md`
- `skills/subagent-driven-development/spec-reviewer-prompt.md`
- `skills/subagent-driven-development/code-quality-reviewer-prompt.md`
- `skills/test-driven-development/testing-anti-patterns.md`
- `skills/systematic-debugging/root-cause-tracing.md`

这些文件不是入口 skill，但承担：

- 子角色 prompt
- reference
- workflow 辅助说明
- 测试方法补充

### 3. 兼容命令层

`commands/` 下有 **3 个 Markdown 命令入口**：

- `brainstorm.md`
- `write-plan.md`
- `execute-plan.md`

从内容看，这一层主要是 deprecated 兼容桥接，  
指向新的 skill 体系。

### 4. agent 定义

`agents/` 当前看到至少 1 个显式 agent 文件：

- `agents/code-reviewer.md`

这说明仓库除了 skill，还在尝试把 reviewer 角色显式封装成 agent。

## 自动注入与宿主适配

### 插件与宿主目录

- `.claude-plugin/`
- `.cursor-plugin/`
- `.opencode/`
- `.codex/`
- `gemini-extension.json`

### 关键注入文件

- `hooks/hooks.json`
- `hooks/session-start`
- `skills/using-superpowers/SKILL.md`
- `docs/README.codex.md`

当前看到的机制是：

- Claude / Cursor 通过 SessionStart hook 注入 `using-superpowers`
- Codex 通过原生 skills 目录发现机制加载
- Gemini 通过扩展与 `GEMINI.md` 适配
- OpenCode 通过插件层做工具映射和 skill 发现

## 测试盘点

`tests/` 下共有 **6 个测试子系统**：

- `brainstorm-server/`
- `claude-code/`
- `explicit-skill-requests/`
- `opencode/`
- `skill-triggering/`
- `subagent-driven-dev/`

从命名看，测试重点不只是单个脚本是否存在，而是：

- 技能是否会被触发
- 技能是否遵守流程
- 子 agent 工作流是否成立
- 不同宿主是否能加载

## 第一轮盘点结论

superpowers 的核心不是“很多 prompt”，  
而是：

- 一组显式 skill
- 一层自动注入与宿主适配机制
- 一组用于行为验证的测试套件

这说明它更像一个 **agent workflow plugin**，  
不是单纯的 Markdown 技巧仓库。
