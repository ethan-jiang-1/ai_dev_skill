# Topic 05: OpenCode Skills Deep Dive

## 历史摘要（保留，不修改）

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

## 本轮新增证据

- OpenCode 的官方 docs 已经非常明确地把“桥接能力”写在产品结构里：
  - skills 可兼容 `.opencode`、`.claude`、`.agents` 多路径 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md)
  - `AGENTS.md` 和 `CLAUDE.md` 都能读，但 `AGENTS.md` 优先 [ref](./_reference/05-opencode-skills-rules-and-instructions-bridge.md)
  - `opencode.json` 的 `instructions` 还能直接挂本地 markdown、`.cursor/rules/*.md` 甚至 remote URLs [ref](./_reference/05-opencode-skills-rules-and-instructions-bridge.md)
- OpenCode 对 agents / subagents / memory / tool access 的暴露程度很高：
  - primary agent
  - subagent
  - markdown-defined agents
  - per-agent memory
  - custom model and tool access [ref](./_reference/05-opencode-agents-permissions-and-subagent-design.md)
- OpenCode 的 permissions 不是笼统开关，而是细粒度策略层：
  - `allow / ask / deny`
  - command pattern matching
  - per-agent overrides
  - markdown frontmatter 里直接写权限 [ref](./_reference/05-opencode-permissions-granularity-and-command-policy.md)
- OpenCode 的模型面非常宽：
  - `75+` providers
  - local models
  - `/models` 入口
  - agent-level model override
  - docs 里显式推荐 coding/tool-calling 表现好的模型 [ref](./_reference/05-opencode-model-flexibility-and-provider-surface.md)
- 2026 changelog 已经能看出 OpenCode 在处理真实运行面：
  - pin explicit plugin versions
  - block package install scripts
  - 调整 skill presentation 以降低 token usage
  - 处理 `CLAUDE.md` compatibility toggles
  - 处理 provider-specific input limits 和 tool-call 卡死问题 [ref](./_reference/05-opencode-2026-changelog-operational-signals.md)
- OpenCode 的 plugins 文档也把 extension runtime 的很多细节摆得很开：
  - 本地目录与 npm plugin 可混装
  - load order 明确
  - npm plugin 通过 Bun 自动安装并集中缓存
  - `experimental.session.compacting` hooks 可注入或重写压缩后的延续上下文 [ref](./_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
- permissions 文档进一步暴露了它的默认安全哲学：
  - 大部分工具默认较宽松
  - `external_directory` 和 `doom_loop` 默认 `ask`
  - `.env` 和 `.env.*` 默认拒绝
  - `task`、`skill`、`webfetch`、`websearch`、`codesearch` 都是明确的 permission surface [ref](./_reference/05-opencode-permission-defaults-and-safety-guards.md)
- tools 文档又把“研究型工作流到底能不能跑起来”的前提说得更细：
  - `skill` 本身是 built-in tool
  - `websearch` 只有在 OpenCode provider 或设置 `OPENCODE_ENABLE_EXA` 时才可用
  - `webfetch` 与 `websearch` 被刻意区分
  - `todowrite` 默认不给 subagents 用 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)

## 本轮新增机制理解

- OpenCode 的真正独特性不是“也支持 skill”，而是它把多个层面全都桥接起来了：
  - skill format 兼容
  - instructions bridge
  - rules precedence
  - agent / subagent execution
  - permissions
  - model/provider flexibility
  - plugin runtime 与 compaction hooks [ref](./_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
- 换句话说，OpenCode 更像一个“兼容型 agent runtime”，而不是单一生态里的技能宿主 [ref](./_reference/05-opencode-skills-rules-and-instructions-bridge.md) [ref](./_reference/05-opencode-model-flexibility-and-provider-surface.md)
- 这也解释了为什么它非常适合做迁移与实验：
  - 可以直接吃别家的 skill 路径
  - 也可以吸收别家的 rules / instructions
  - 再用自己的 permissions、agents、models、plugins 重新定义执行壳 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/05-opencode-skills-rules-and-instructions-bridge.md) [ref](./_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
- 但这套“重定义执行壳”的能力，也意味着迁移结果会明显受 tool surface 影响：
  - 同一个 research skill，遇到 provider-gated `websearch` 或 subagent tool default，就可能行为变化 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)

## 本轮新增趋势与难点

- OpenCode 在 2026 的趋势很明确：
  - 持续增强兼容与桥接
  - 持续把 provider diversity、plugin safety、token usage、provider-specific runtime handling 显式产品化 [ref](./_reference/05-opencode-2026-changelog-operational-signals.md)
- 同时它也在把“运行时可控性”继续往外开放：
  - plugin load order
  - custom tools
  - compaction hooks
  - explicit safety guards [ref](./_reference/05-opencode-plugins-load-order-and-compaction-hooks.md) [ref](./_reference/05-opencode-permission-defaults-and-safety-guards.md)
- 与此同时，它的复杂度也是真实存在的：
  - 能兼容的层太多
  - permissions 太细
  - provider/model 组合太多
  - tool availability 还有 provider gating 和 subagent defaults
  - 这会让“为什么同一个 skill 在这里行为不一样”变成常见问题 [ref](./_reference/05-opencode-permissions-granularity-and-command-policy.md) [ref](./_reference/05-opencode-model-flexibility-and-provider-surface.md)
- 另一个值得注意的趋势，是 OpenCode 在主动降低一些风险：
  - pin plugin versions
  - block install scripts
  - 减少 token usage
  - 处理重复上下文和 provider 输入上限 [ref](./_reference/05-opencode-2026-changelog-operational-signals.md)

## 本轮新增维护 / 版本管理 / 模型要求

- OpenCode 的维护面是所有宿主里最“显式”的之一：
  - provider 切换
  - model 切换
  - permission policy
  - agent-level override
  - instructions bridge
  - plugin version pinning
  - plugin load order
  - compaction hooks [ref](./_reference/05-opencode-model-flexibility-and-provider-surface.md) [ref](./_reference/05-opencode-permissions-granularity-and-command-policy.md) [ref](./_reference/05-opencode-2026-changelog-operational-signals.md) [ref](./_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
- 它的版本管理不只是“update plugin”这么简单，而是包含：
  - plugin version pinning
  - compatibility toggles
  - runtime fixes for provider-specific constraints [ref](./_reference/05-opencode-2026-changelog-operational-signals.md)
- 它的默认安全模型也要算进维护成本：
  - permissive defaults 提高可用性
  - `.env` 默认拒绝、`doom_loop` / `external_directory` 默认 `ask` 则是补上的硬护栏 [ref](./_reference/05-opencode-permission-defaults-and-safety-guards.md)
- 对 research-heavy skill 来说，还要再检查一层：
  - 当前 provider 是否让 `websearch` 真可用
  - subagents 是否有需要的工具
  - `webfetch` / `websearch` 的分工是否匹配 skill 假设 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 模型要求方面，OpenCode 反而最开放：
  - 你可以用很多 provider 和本地模型
  - 这意味着 portability 更强
  - 也意味着 behavior consistency 更难保证 [ref](./_reference/05-opencode-model-flexibility-and-provider-surface.md)

## 当前判断（本轮综合后）

- OpenCode 在 2026 年已经非常明确地成为“兼容 / 桥接 / 实验平台型宿主”，这个判断是成立的 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/05-opencode-skills-rules-and-instructions-bridge.md)
- 它的最大优势，是把 skills、rules、instructions、agents、permissions、providers、plugins、compaction hooks 这些通常分散在别家不同层面的东西，放到一个显式可配置的 runtime 里 [ref](./_reference/05-opencode-agents-permissions-and-subagent-design.md) [ref](./_reference/05-opencode-permissions-granularity-and-command-policy.md) [ref](./_reference/05-opencode-plugins-load-order-and-compaction-hooks.md)
- 它的主要代价，是配置自由度越高，行为差异和调试复杂度也越高；“能兼容”绝不等于“开箱就完全等价”，而 permissive defaults、provider-gated tools、subagent tool defaults 都要求使用者真正理解运行壳 [ref](./_reference/05-opencode-model-flexibility-and-provider-surface.md) [ref](./_reference/05-opencode-permission-defaults-and-safety-guards.md) [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 如果要研究“跨宿主复用到底在什么层成立”，OpenCode 目前仍然是最关键的桥接样本之一。
