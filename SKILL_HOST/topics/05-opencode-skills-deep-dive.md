# Topic 05: OpenCode Skills Deep Dive

## 为什么 OpenCode 值得单独成篇

OpenCode 的独特性不在于“它也支持 skill”，而在于它明显更像一个跨生态承接层。它同时支持自己的目录、通用 agent skills 路径、Claude 风格路径，还把 `AGENTS.md`、`opencode.json`、plugin system、subagents 一起卷进来。这意味着它非常适合拿来研究一个关键问题：skill 真正可移植的到底是什么，宿主自己又会在哪些地方重新定义它。

因此，这一篇的任务是解释 OpenCode 作为“兼容型宿主”的结构，而不只是介绍功能。

## 这一篇要解决的核心问题

1. OpenCode 为什么会成为 skill 互通问题里最关键的一个样本。
2. OpenCode 的目录发现机制到底兼容到什么程度。
3. `AGENTS.md`、`opencode.json`、plugins、skills 之间如何分工。
4. OpenCode 的原生子代理和混合检索为什么值得单独研究。
5. OpenCode 的灵活性带来了哪些优势，也带来了哪些复杂度。

## 这一篇应该覆盖的内容

- OpenCode 的多路径发现机制：
  - `.opencode/skills/`
  - `~/.config/opencode/skills/`
  - `.claude/skills/` 与 `~/.claude/skills/`
  - `.agents/skills/` 与 `~/.agents/skills/`
- 这意味着什么：
  - OpenCode 并不试图把 skill 锁死在自己的格式里。
  - 它天然适合研究“已有 skill 如何被其他宿主吸纳”。
- OpenCode 的规则与权限层：
  - `AGENTS.md` 负责更强的行为约束。
  - `opencode.json` 负责权限与外部指令挂载。
  - skills 负责具体流程和方法论封装。
  - plugins 则可能把 skill 进一步“原生化”为可调用能力。
- OpenCode 的研究和搜索能力：
  - 原生子代理。
  - 混合检索。
  - 结合外部高级检索源后的深度研究潜力。
- OpenCode 的优势：
  - 跨生态承接能力强。
  - 架构开放，适合做实验。
  - 容易把 skill、rules、plugins、agents 组合起来。
- OpenCode 的代价：
  - 组件多，边界更复杂。
  - “能兼容”不等于“完全等价”。
  - 对新手而言，体系理解门槛可能比单一宿主更高。

## 这一篇明确不应该覆盖的内容

- 不把四家兼容性对比放在这里完全展开，那是比较专题。
- 不把 AGENTS.md 写成通用规则系统教程，只解释它和 skill 的关系。
- 不把深度研究 skill 的通用实现方法在这里写透，那是第 8 个专题。

## 这一篇和现有 DR 材料的连接点

这篇主要基于 `Opencode Skills 探索与集成.md`，尤其是：

- 对 Claude 路径和通用路径的兼容扫描。
- `opencode.json` 的权限与说明文件挂载能力。
- plugin system 对 skill 的再封装。
- `AGENTS.md` 与 skill 的关系。
- 原生 subagents 与混合检索。

## 下一轮 Deep Research 的预期产出

下一轮应该把这篇写成“兼容型宿主研究”而不是单纯产品介绍。读者看完以后，应该能判断：OpenCode 是不是最适合承担 skill 迁移、借鉴、桥接和实验平台这个角色。

