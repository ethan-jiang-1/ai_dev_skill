# Topic 02: Claude Code Skills Deep Dive

## 历史摘要（保留，不修改）

## 为什么 Claude Code 值得单独成篇

在目前这 4 份材料里，Claude Code 的那一份最完整，也最像“skill 生态已经长出方法论”的样子。它不只是讲目录和安装，而是已经自然延伸到了 marketplace、hooks、内容流水线、递归研究、授权闸门等更成熟的能力层。也就是说，Claude 这一篇不是一个普通的宿主介绍，而更像“skill 走到高成熟度以后会变成什么样”。

因此，这一篇的任务不是重复 skill 基础概念，而是把 Claude Code 中真正有代表性的独特能力、独特工作方式和独特边界讲清楚。

## 这一篇要解决的核心问题

1. Claude Code 里的 skill 运行模型是什么样。
2. 全局级与项目级 skill 分别适合装什么。
3. Claude 的 marketplace、hooks、settings、project docs 如何和 skill 协同。
4. Claude 为什么特别适合承载复杂研究 skill 和复杂内容流水线 skill。
5. Claude skill 体系的强项和局限分别是什么。

## 这一篇应该覆盖的内容

- Claude 的双层作用域模型：
  - 全局级适合个人方法论、安全状态、跨仓库协调状态。
  - 项目级适合团队共享规范、仓库绑定流程、项目专属生成规则。
- 为什么 Claude 对“状态隔离”特别敏感：
  - 敏感凭证不应进入项目级。
  - 个人学习状态不应污染团队级行为。
  - skill 的部署位置本身就是治理策略的一部分。
- Claude 的生态化特征：
  - 原生 marketplace 和 plugin 式分发。
  - 与 `CLAUDE.md`、settings、hooks 的协作关系。
  - skill 不是单独工作，而是嵌在整套代理行为塑形系统里。
- Claude 上最值得深挖的两类代表性 skill：
  - 深度研究与递归子代理编排。
  - 写作风格提取、技术写作强制、内容营销流水线。
- Claude skill 的独特优势：
  - 在复杂流程塑形上材料最丰富。
  - 在“技能 + hooks + 规则 + 流水线”联动方面最成熟。
  - 有大量现成的优质案例可供拆解。
- Claude skill 的局限或代价：
  - 复杂能力往往已经逼近“skill 不再是纯 skill，而是 skill + hooks + settings + 外部服务”的组合体。
  - 如果不注意 token 经济和触发边界，技能很容易变胖。
  - 递归研究类 skill 如果没有授权和轮数约束，容易失控。

## 这一篇明确不应该覆盖的内容

- 不做四家并列比较，只在必要时顺带提一句“这和其他家不同”。
- 不把写 skill 的普适方法写进来，那是后面的 authoring 专题。
- 不把 deep research skill 的通用设计空间展开成独立方法论，那是后面的研究专题。

## 这一篇和现有 DR 材料的连接点

这篇几乎完全建立在 `Claude Code Skills 探索与集成.md` 之上，因为那份材料已经提供了：

- 全局与项目作用域的完整解释。
- 渠道与评估套路。
- 多种部署范式。
- 深度研究、Valyu、递归子代理、授权闸门。
- 风格提取、技术写作、内容流水线。

## 本轮新增证据

- Claude 对 skills 的运行模型已经在官方文档里拆得很清楚：
  - skill 默认只把 `name + description` 暴露给模型
  - 完整内容在使用时才加载
  - `disable-model-invocation: true` 可以把一个 skill 变成只允许用户显式调用，从而把常驻上下文成本降到零 [ref](./_reference/02-claude-code-skills-loading-and-invocation.md)
- Claude 不是把 skill 当单一扩展点，而是把它放进一个更大的执行栈：
  - `CLAUDE.md`
  - `Skills`
  - `MCP`
  - `Subagents`
  - `Hooks`
  - `Plugins` [ref](./_reference/02-claude-code-skills-loading-and-invocation.md) [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md)
- Claude 的作用域和持久化模型已经非常具体：
  - `skills/` 可以在 project 和 global 两层存在
  - `~/.claude/plugins/` 会保存 marketplace clone、已安装版本和插件数据
  - orphaned plugin versions 会在更新或卸载后 `7` 天清理 [ref](./_reference/02-claude-code-directory-scope-and-persistence.md)
- Claude 的 plugin / marketplace 路线已经形成成熟分发机制：
  - 官方明确建议先在 `.claude/` 里快速迭代，再升级成 plugin 分享
  - plugin manifest 使用 semver
  - skills 在 plugin 里是 namespaced 的
  - 本地 `--plugin-dir` 可在测试时覆盖 marketplace 版本
  - `/reload-plugins` 支持热重载 [ref](./_reference/02-claude-code-plugin-marketplaces-and-versioning.md)
- Claude 对扩展生态已经有治理层，不是完全无门槛自由放飞：
  - `enabledPlugins`
  - `extraKnownMarketplaces`
  - `strictKnownMarketplaces`
  - managed settings 可以隐藏插件或阻止安装 [ref](./_reference/02-claude-code-settings-marketplace-governance.md)
- Claude 的高阶工作流强度，来自 skill 与 hooks / subagents 的组合：
  - hooks 可执行 command / HTTP / prompt / agent hooks
  - hooks 带明确安全警告，因为它们运行在用户权限下
  - subagents 可预加载 skills、限制工具、选模型、持久化 memory [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- 2026 年的 changelog 已经暴露出 skills 进入规模化使用后的真实问题：
  - large `.claude/skills` 目录在 `git pull` 时曾触发 deadlock 修复
  - `/skills` description 被压到 `250` 字符以降低 context cost
  - Claude 专门改善了长会话里的 skill state 释放 [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md)

## 本轮新增机制理解

- Claude 的关键不在于“支持 skills”，而在于它把 skill 明确放在“按需加载的方法论层”，而把 `CLAUDE.md` 放在“始终在线的背景规则层”，把 subagents 放在“隔离执行层”，把 hooks 放在“确定性后处理或控制层” [ref](./_reference/02-claude-code-skills-loading-and-invocation.md) [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- 这意味着 Claude 上真正强的 workflow 很少是纯 skill 独立完成的，更多是：
  - `skill + CLAUDE.md`
  - `skill + plugin`
  - `skill + hooks`
  - `skill + subagents`
  - `skill + MCP`
- 这也是 Claude 看起来“skill 能力很强”的真正原因：它不是单靠 `SKILL.md`，而是 skill 被嵌在一个高度可编排的 host 里 [ref](./_reference/02-claude-code-plugin-marketplaces-and-versioning.md) [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- Claude 的 project/global 二元作用域并不只是文件位置差异，而是治理策略：
  - 哪些东西应该团队共享
  - 哪些东西属于个人偏好
  - 哪些东西涉及敏感状态或插件安装 [ref](./_reference/02-claude-code-directory-scope-and-persistence.md)

## 本轮新增趋势与难点

- 2026 年 Claude 的趋势非常清楚：
  - skills 继续增长，但同时越来越 plugin 化、marketplace 化、组合化 [ref](./_reference/02-claude-code-plugin-marketplaces-and-versioning.md)
  - 运行时越来越重视上下文成本、state cleanup 和大型技能目录的稳定性 [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md)
  - skill 不再只是写点说明文，而是成为 agent system 的一块拼图 [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- Claude 的主要难点也因此非常具体：
  - 能力强，但系统耦合也强
  - 一旦 workflow 依赖 hooks / subagents / marketplace policies / MCP，迁移成本就会迅速上升
  - skill 作者必须更认真地管理 description、触发方式和 context footprint，否则在 Claude 里反而更容易造成混乱或膨胀 [ref](./_reference/02-claude-code-skills-loading-and-invocation.md) [ref](./_reference/00-shared-agent-skills-best-practices.md)

## 本轮新增维护 / 版本管理 / 模型要求

- Claude 在版本管理层面已经明显成熟：
  - plugin 使用 semver
  - 本地 override 可覆盖 marketplace 版本用于测试
  - orphan cleanup 是官方显式支持的机制 [ref](./_reference/02-claude-code-plugin-marketplaces-and-versioning.md) [ref](./_reference/02-claude-code-directory-scope-and-persistence.md)
- Claude 在运维层面也已经暴露出真实维护面：
  - large skills directories
  - memory usage
  - skill-state release
  - alphabetical sorting and description truncation for `/skills` usability [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md)
- Claude 上的模型要求和工具要求不是由 skill spec 决定，而是由 subagent/hook/plugin 组合决定：
  - subagents 可以选模型
  - 可以限制工具
  - hooks 则直接触发系统能力 [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- 这意味着 Claude 的高阶 skills 对“模型能力 + 工具权限 + 编排能力”的要求很强，对只想写一个孤立 `SKILL.md` 的用户则不一定友好。

## 当前判断（本轮综合后）

- Claude Code 在 2026 年已经不是“有 skills 的 coding agent”这么简单，而是已经形成了 `skills + plugins + hooks + subagents + marketplace governance` 的组合式平台 [ref](./_reference/02-claude-code-plugin-marketplaces-and-versioning.md) [ref](./_reference/02-claude-code-settings-marketplace-governance.md) [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- Claude 的最大优势，不只是有很多 skill，而是它对高阶方法论工作流的承载最成熟，尤其适合研究型、写作型、流水线型 skill [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- Claude 的最大代价，是很多真正有价值的 skill 工作流已经不是“纯 skill”了，而是 deeply host-specific；这会直接提高迁移成本和维护复杂度 [ref](./_reference/02-claude-code-skills-loading-and-invocation.md) [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md)
- 如果想研究“skill 生态成熟以后长什么样”，Claude 目前仍然是最值得深挖的主样本之一。

