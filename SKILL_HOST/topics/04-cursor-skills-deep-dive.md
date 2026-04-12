# Topic 04: Cursor Skills Deep Dive

## 历史摘要（保留，不修改）

## 为什么 Cursor 值得单独成篇

Cursor 不是简单地“也支持 skill”。它真正独特的地方在于：它长期有自己的规则系统和 IDE 工作流，因此 skill 在 Cursor 里最重要的问题不是“能不能装”，而是“和 `.cursorrules` 到底怎么分工”。这个边界一旦讲不清，读者很容易把静态规则、动态 skill、编辑器内代理能力混成一团。

所以这一篇的核心是边界厘清，而不是功能罗列。

## 这一篇要解决的核心问题

1. `.cursorrules` 和 `SKILL.md` 分别管什么。
2. 在 IDE 里，为什么 skill 尤其适合承载复杂但非高频常驻的流程。
3. Cursor 的项目级、全局级和跨生态兼容扫描意味着什么。
4. Cursor 的异步子代理能力和 skill 结合后适合做什么。
5. Cursor 适合什么样的 skill 组织方式。

## 这一篇应该覆盖的内容

- Cursor 中静态规则和动态技能的根本区别：
  - `.cursorrules` 更像永远在线的强约束。
  - `SKILL.md` 更像按任务触发的复杂流程。
- 为什么这一点重要：
  - 把写作指南、研究方法、长流程规范全部塞进 rules，会造成长期 token 浪费。
  - skill 允许这些材料在真正需要时才被拉起。
- Cursor 的多层发现机制：
  - `.cursor/skills/`
  - `.agents/skills/`
  - `~/.cursor/skills/`
  - `~/.agents/skills/`
  - 以及对 `.claude/skills/`、`.codex/skills/` 的兼容扫描
- Cursor 的宿主优势：
  - 在 IDE 内使用门槛低。
  - 图形界面与命令行两条路径都存在。
  - 异步子代理很适合做多线程的信息发掘和代码库探索。
- Cursor 中的典型高价值 skill：
  - 写作风格、README、ADR、技术说明。
  - 外部文档检索、企业知识搜索、代码库与外部资料并行发掘。
- 这一篇要重点辨认的边界：
  - 哪些事情应该继续留在 rules。
  - 哪些事情更适合迁移到 skill。
  - 哪些复杂能力其实已经需要利用 Cursor 自带的子代理体系，而不是单个 skill 文件。

## 这一篇明确不应该覆盖的内容

- 不展开四家横向比较，只在必要时点出 Cursor 的独特点。
- 不把“互相兼容”问题在这里讲透，那是比较专题要系统处理的事。
- 不把写 skill 的最佳实践展开，那是方法论专题。

## 这一篇和现有 DR 材料的连接点

这篇主要来自 `Cursor Skills 探索与集成 .md`，重点包括：

- `.cursorrules` 与 skill 的边界。
- 多层目录发现和跨生态兼容。
- IDE 原生安装生态。
- 写作风格定制的上下文经济学。
- 原生异步子代理与并行研究。

## 本轮新增证据

- Cursor 的 rules 文档已经把“持久层”和“动态层”的边界讲得很清楚：
  - Project Rules 存在于 `.cursor/rules`
  - User Rules 始终在线
  - `AGENTS.md` 是简单的 root-level markdown 替代方案
  - `.cursorrules` 已被标记为 legacy / deprecated [ref](./_reference/04-cursor-rules-agents-and-skill-boundary.md)
- Cursor 在 `2026-01-22` 的 `2.4` 发布中，把 skills 和 subagents 一起推成了一等功能：
  - Agent Skills 进入 editor + CLI
  - slash-command 可显式调用 skill
  - skills 被公开叙述成 open standard [ref](./_reference/04-cursor-skills-subagents-rollout-2026.md)
- Cursor 很快又往 bundle 化扩展走了一步：
  - marketplace plugins 可同时打包 skills、subagents、MCP、hooks、rules [ref](./_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)
- Cursor 的模型与上下文选择直接影响 skill 的实际可用性：
  - 多 provider 多模型
  - `Agent` / `Thinking` 标签
  - 常规上下文到 `60k-200k`
  - `Max Mode` 下部分模型可到 `1M`
  - 但 Max Mode 更慢更贵 [ref](./_reference/04-cursor-model-context-and-max-mode.md)
- Cursor 的运行成熟度在 2026 早期并非完全平滑：
  - 官方 forum 已有 `Task tool` 对 custom subagents 的 `2.4.x` 回归报告
  - staff 在帖内承认问题存在
  - rollback 成为现实 workaround [ref](./_reference/04-cursor-subagent-and-skill-rollout-friction.md)
- Cursor CLI 也不是一个与 IDE 割裂的附属面：
  - 会读取 `AGENTS.md`、`CLAUDE.md`、`.cursor/rules`
  - 暴露 `/compress`、`--resume`、non-interactive mode、explicit command approval
  - 这说明 Cursor 正在把同一套 rules / context / agent 工作流往 CLI 拉通 [ref](./_reference/04-cursor-cli-rules-and-context-operations.md)
- skills 发布后，Cursor 在 `2026-03` 很快往平台层继续扩展：
  - `2.6` 推 team marketplaces for plugins
  - 推出 Automations、always-on agents、cloud sandbox、memory tool
  - 加速 marketplace plugin 增长 [ref](./_reference/04-cursor-2026-marketplaces-automations-and-agent-growth.md)
- 到 `2026-04-02` 的 `3.0`，Cursor 又把运行面继续拉宽：
  - `Agents Window` 支持在 repos、本地、worktrees、cloud、remote SSH 上并行运行 agents
  - 新增 `Await`、`/worktree`、`/best-of-n`
  - 改进 Explorer subagent startup caching
  - `2026-03-25` 还推出 self-hosted cloud agents [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
- 但早期 subagent / task tool 的问题也没有在首轮 rollout 后立刻消失：
  - 官方 forum 记录显示问题延续到了 `2.5.17`
  - 还带有平台差异信号，例如 Windows [ref](./_reference/04-cursor-task-tool-issues-persisted-into-2-5.md)
- 到 `2026-04`，官方 forum 还进一步暴露了更深一层的问题：
  - `2.6.22` 到 `3.0.4` 都可能遇到 `Task` tool 未被 provision 的情况
  - staff 明确承认这是 server-side issue
  - request-based enterprise users 的 subagents 还会受 Composer routing 与 team model restrictions 影响 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## 本轮新增机制理解

- Cursor 的真正结构，不该简单理解成“rules vs skills”，而应该理解成三个层：
  - `persistent context layer`：Project Rules / User Rules / AGENTS.md
  - `dynamic workflow layer`：skills
  - `delegated execution layer`：subagents
- 这样一分，很多事情就清楚了：
  - 全局风格、团队规则、路径约束，适合 rules
  - 按需触发的复杂流程，适合 skills
  - 多线程发掘、并行上下文隔离，适合 subagents
- Cursor 的特别之处，在于它把这三层都放在 IDE-native 体验里，而且很快又接到了 marketplace plugin bundle 上 [ref](./_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](./_reference/04-cursor-skills-subagents-rollout-2026.md) [ref](./_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)
- 现在还可以再往前推一步：Cursor 不只是 IDE-native，而是在尝试把 IDE、CLI、plugin marketplace、automation cloud 这些面拼成一套连续工作流 [ref](./_reference/04-cursor-cli-rules-and-context-operations.md) [ref](./_reference/04-cursor-2026-marketplaces-automations-and-agent-growth.md)
- `3.0` 之后，这条线已经更像“多环境 agent runtime”：
  - 本地编辑器只是其中一个入口
  - worktrees、cloud、remote SSH、self-hosted infra 都开始进入同一套 agent 叙事 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
- 但同样重要的是，Cursor 的 runtime 也不是完全“本地决定”的：
  - server-side provisioning
  - Composer routing
  - team-level model restrictions
  这些隐藏层都会影响 subagent / skill 是否真能跑起来 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## 本轮新增趋势与难点

- Cursor 的趋势非常鲜明：
  - 从 `.cursorrules` 时代的持久提示词，往 `rules + skills + subagents + plugin bundles` 的组合式栈迁移 [ref](./_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](./_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)
  - 把 skills 和 subagents 一起推出来，说明它并不把 skill 当孤立功能，而是当 agent workflow 的一层 [ref](./_reference/04-cursor-skills-subagents-rollout-2026.md)
  - 模型和上下文控制也越来越显性化，尤其是 Max Mode [ref](./_reference/04-cursor-model-context-and-max-mode.md)
  - `2.6` 之后又迅速补上 team marketplaces、automations、cloud sandboxes、memory，这说明 Cursor 正在从“IDE 功能”向“agent platform”外扩 [ref](./_reference/04-cursor-2026-marketplaces-automations-and-agent-growth.md)
  - `3.0` 再往前，把并行 agent、多环境执行、background waits 和 self-hosted cloud 一起拉进来，说明平台化速度非常快 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
- Cursor 的主要难点也很明显：
  - 新栈增长快，边界更容易让新手混淆
  - runtime maturity 在 2026 年还留有毛刺，尤其是 subagent 相关 [ref](./_reference/04-cursor-subagent-and-skill-rollout-friction.md)
  - 且这些毛刺并非仅限于 `2.4` 首发周，而是至少延续到了 `2.5.17` [ref](./_reference/04-cursor-task-tool-issues-persisted-into-2-5.md)
  - 到 `2.6.22` 和 `3.0.4`，还出现了 server-side routing 与 model-policy 交互层的问题 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
  - 一旦 workflows 被 bundle 进 plugin，安装是更简单了，但排错和迁移可能更复杂 [ref](./_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)

## 本轮新增维护 / 版本管理 / 模型要求

- Cursor 的维护面并不只在 skill 文件本身，而在整个 bundle 栈：
  - rules 要维护
  - skill 要维护
  - subagent 行为要维护
  - plugin bundles 也要跟着维护
  - 如果接入 automations，还会带出 cloud-run 环境与 memory 行为 [ref](./_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md) [ref](./_reference/04-cursor-2026-marketplaces-automations-and-agent-growth.md)
- `3.0` 之后维护面还继续扩张：
  - background command waits
  - worktree orchestration
  - remote / cloud / self-hosted execution 拓扑
  - multi-root hook loading [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
- Cursor 早期 rollout 的 bug 说明，版本演进对 workflow 影响很直接：
  - `2.4.x` 某些 build 会影响 subagent 可用性
  - `2.5.17` 仍有 task-tool 相关问题
  - `2.6.22` 到 `3.0.4` 还暴露出 server-side provisioning 与 Composer routing 问题
  - 这会直接影响依赖 skills + subagents 的复杂工作流 [ref](./_reference/04-cursor-subagent-and-skill-rollout-friction.md) [ref](./_reference/04-cursor-task-tool-issues-persisted-into-2-5.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- Cursor 上的模型要求也不能忽略：
  - skill 是否值得触发，与上下文预算直接相关
  - research 型或复杂写作型 workflows 更可能受益于更大 context 或 Max Mode
  - 但成本和延迟也会跟着上升 [ref](./_reference/04-cursor-model-context-and-max-mode.md)

## 当前判断（本轮综合后）

- Cursor 在 2026 年已经不适合再被理解为“只有 rules 的 IDE agent”，而是正在快速长成 `rules + skills + subagents + plugin bundle` 的动态工作流宿主 [ref](./_reference/04-cursor-skills-subagents-rollout-2026.md) [ref](./_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)
- Cursor 的最大优势，是它已经把持久规则层、动态 skill 层、委派执行层、CLI 上下文操作、团队插件分发、以及多环境 agent 运行面逐渐接成一个连续栈 [ref](./_reference/04-cursor-rules-agents-and-skill-boundary.md) [ref](./_reference/04-cursor-cli-rules-and-context-operations.md) [ref](./_reference/04-cursor-2026-marketplaces-automations-and-agent-growth.md) [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
- Cursor 的主要代价，是这一栈还在快速演化，早期 2026 的稳定性信号说明它还不像成熟 CLI 那样稳，而且 subagent / task-tool 风险不仅跨版本持续存在，还可能受 server-side routing 与管理员模型策略影响 [ref](./_reference/04-cursor-subagent-and-skill-rollout-friction.md) [ref](./_reference/04-cursor-task-tool-issues-persisted-into-2-5.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 如果要研究“IDE 用户应该把什么留给 rules、什么交给 skills、什么交给 subagents”，Cursor 现在是最关键的样本之一。
