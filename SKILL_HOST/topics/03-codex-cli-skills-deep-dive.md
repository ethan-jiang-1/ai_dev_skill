# Topic 03: Codex CLI Skills Deep Dive

## 历史摘要（保留，不修改）

## 为什么 Codex CLI 值得单独成篇

Codex CLI 的材料虽然比 Claude 短，但它提供了一个很有代表性的视角：一个偏终端、偏工程、偏“体系化层级管理”的宿主，如何把 skill 放进自己的工作流里。它最有价值的地方不是花哨生态，而是作用域清晰、内置安装器明确、与子代理工作流结合自然。

所以这一篇应该把 Codex 当成“工程化 skill 宿主”的代表来写。

## 这一篇要解决的核心问题

1. Codex 的多层作用域模型为什么比其他家更适合讲清楚治理边界。
2. 内置 `skill-installer` 和 bundled skills 对 skill 生态意味着什么。
3. Codex 中的 skill、subagents、仓库工作流是如何接起来的。
4. Codex 适合哪类 skill，不适合哪类 skill。
5. 如果读者是 CLI 重度用户，Codex 的价值到底在哪里。

## 这一篇应该覆盖的内容

- Codex 的四层作用域：
  - repo/project
  - user/global
  - admin/system administration
  - bundled/system
- 为什么这四层结构重要：
  - 它把个人习惯、项目规范、组织治理、官方能力四层区分得更清楚。
  - 它适合讨论企业环境下 skill 的治理与部署。
- Codex 的原生安装体验：
  - 官方或第三方 skill 可以通过内置安装器接入。
  - 这降低了“发现一个 skill 之后还得手动拼目录”的门槛。
- Codex 中 skill 的典型高价值用途：
  - 写作风格与输出控制。
  - 深度研究、Smart Search、并发子代理。
  - 仓库内可共享的工程流程与规范执行。
- Codex 的宿主风格：
  - 更像工具链的一部分，而不是图形化平台市场。
  - 更强调命令化、可管理、可组合。
- 这一篇需要注意的判断：
  - 材料里不少“强能力”其实依赖 Codex 原生的并发代理工作流，而不是 skill 单独完成。
  - 因此要区分“Codex 支持的高阶工作流”和“纯 skill 自己能做到什么”。

## 这一篇明确不应该覆盖的内容

- 不展开比较 Claude、Cursor、OpenCode 哪家更强，那是横向比较专题。
- 不把如何写出高质量 `SKILL.md` 的方法论写进来，那是第 7 个专题。
- 不把深度研究 skill 的通用架构写成一篇教程，那是第 8 个专题。

## 这一篇和现有 DR 材料的连接点

这篇主要建立在 `Codex CLI Skills 探索与集成 .md` 之上，尤其是以下几个点：

- 四层作用域扫描。
- 官方仓库与内置安装器。
- 写作风格技能的渐进式加载思路。
- 原生 subagents 驱动的深度研究工作流。

## 本轮新增证据

- Codex 的官方 skills 文档已经把很多关键事实写得很实：
  - skills 可用于 CLI、IDE extension 和 Codex app
  - 默认采用 progressive disclosure
  - 支持 repo / user / admin / system 四层作用域
  - 支持 symlink
  - 可通过 `[[skills.config]]` 禁用单个 skill
  - `agents/openai.yaml` 可定义 invocation policy 和工具依赖 [ref](./_reference/03-codex-skills-locations-lifecycle-and-policy.md)
- Codex 已明确把 skills 放进更大的配置与执行系统里：
  - `AGENTS.md`
  - `Skills`
  - `Hooks`
  - `Plugins`
  - `Subagents`
  - `MCP` [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md) [ref](./_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)
- Codex 的 `AGENTS.md` 链条很强，而且层级明确：
  - global profile
  - project root 到当前目录的链式发现
  - nested override
  - size cap
  - fallback filenames [ref](./_reference/03-codex-agents-md-layering-and-instruction-chain.md)
- Codex 的 subagents 不是边角功能，而是当前 release 默认启用的一等执行层：
  - activity 出现在 app 和 CLI
  - cost 明确更高
  - 继承 sandbox policy
  - custom agent 可配置 model / reasoning effort / MCP / sandbox / skills.config
  - 有 `agents.max_threads`、`agents.max_depth`、runtime 上限等运行时控制 [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md)
- Codex 对 hooks、plugins 和成熟度标签也很直接：
  - hooks 仍是 `Experimental`
  - 需 feature flag
  - plugins 可打包 skills、app integrations 和 MCP servers
  - feature maturity 明确区分 `Under development / Experimental / Beta / Stable` [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)
- Codex 的 2026 年产品演化线已经能从官方 changelog 里直接看到，而不是只能靠静态文档推断：
  - `2026-01-14` 明确废弃 custom prompts，改为把可复用 instructions / workflows 收敛到 skills
  - `2026-02-02` 的 Codex app 直接带着 parallel agent threads、worktree support、skills、automations 上线
  - `2026-03-24` plugins 开始正式打包 skills、app integrations 和 MCP server configuration [ref](./_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)
- OpenAI 的 use cases 页面已经把“Save workflows as skills”写成正式用例，而不是藏在文档角落 [ref](./_reference/03-codex-use-cases-and-skill-adoption.md)
- 模型能力也已经公开到足够深的程度，可以直接纳入宿主分析：
  - `GPT-5.3-Codex`
  - `codex-mini-latest`
  - reasoning effort 多档
  - `400k` / `200k` 级 context windows [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md)
- `codex-mini-latest` 自身还提供了一个很关键的版本治理信号：
  - 明确是为 Codex CLI 微调的 runtime
  - 有 `Snapshots` 机制用于锁定行为一致性
  - `200,000` context window 与 `100,000` max output tokens 被单独公开 [ref](./_reference/03-codex-model-snapshots-and-cli-optimized-runtime.md)

## 本轮新增机制理解

- Codex 的独特之处，不只是支持 skill，而是把“技能生命周期”和“执行环境控制”一起暴露出来：
  - 作用域清楚
  - 禁用方式清楚
  - invocation policy 可配置
  - custom agents / subagents 与 skill 有显式连接
  - hooks / plugins 的成熟度和风险标签也相对透明 [ref](./_reference/03-codex-skills-locations-lifecycle-and-policy.md) [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)
- 更关键的是，Codex 把“从 prompt 时代过渡到 skill 时代”的产品迁移路线也写明了：
  - reusable prompts 被明确替换成 skills
  - Handoff / parallel agent threads / installable plugins 并不是孤立功能，而是在把 workflow 逐步收敛成正式产品层 [ref](./_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)
- 这使得 Codex 更像一个工程化宿主，而不是纯粹的技能消费器：
  - skill 可以只是一个 workflow 包
  - 也可以成为 custom agents / sandbox / MCP / AGENTS 链条中的一个部件
- Codex 上 skill 和 AGENTS 的边界尤其重要：
  - AGENTS 更像持续背景指令
  - skills 更像按需加载的流程对象
  - 如果这个边界不分清，容易把永远在线的规范和临时调用的工作流混在一起 [ref](./_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](./_reference/03-codex-skills-locations-lifecycle-and-policy.md)

## 本轮新增趋势与难点

- 2026 年 Codex 的趋势是明显在“产品化”而不是“隐藏 power feature”：
  - 官方 catalog 和 `openai/skills`
  - 正式文档树里 skills / AGENTS / hooks / plugins / subagents 并列
  - product use cases 直接把 skill 当作可保存 workflow 的主入口之一 [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md) [ref](./_reference/03-codex-use-cases-and-skill-adoption.md)
- 这种产品化不是静态宣传，而是按日期持续推进：
  - 一月先把 custom prompts 正式退场
  - 二月把 skills 放进 app launch
  - 三月把 plugins 打进 distribution 路径 [ref](./_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)
- 另一个趋势是：Codex 很强调 runtime controls，而不仅是格式支持：
  - reasoning effort
  - context windows
  - sandbox inheritance
  - max depth / max threads
  - model snapshots [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md) [ref](./_reference/03-codex-model-snapshots-and-cli-optimized-runtime.md)
- 难点也对应地更“工程化”：
  - subagents 增加 token 和资源消耗
  - hooks 仍然 experimental
  - skills 的真正价值经常依赖 surrounding runtime，而不是 `SKILL.md` 一张纸 [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)

## 本轮新增维护 / 版本管理 / 模型要求

- Codex 的技能生命周期管理已经具备明显的工程手感：
  - `repo / user / admin / system` 分层
  - `[[skills.config]]` 可禁用
  - `$skill-installer` 负责 curated 安装
  - plugins 被推荐为更可复用的分发路径 [ref](./_reference/03-codex-skills-locations-lifecycle-and-policy.md)
- Codex 把“版本 / 稳定性”问题正面摆上台面：
  - feature maturity labels 明确写出哪些仍在实验期 [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)
- 它对“行为一致性”也给了更工程化的抓手：
  - model snapshots 可锁定模型版本
  - changelog 能追溯从 prompts 到 skills、再到 plugins 的迁移节奏 [ref](./_reference/03-codex-model-snapshots-and-cli-optimized-runtime.md) [ref](./_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)
- Codex 对模型要求的透明度是一个明显优势：
  - 公开模型族
  - 公开 reasoning effort
  - 公开大上下文窗口
  - custom agents 可绑定模型和推理档位 [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md) [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md)
- 这意味着在 Codex 上讨论 skill，不能脱离模型和 sandbox 来谈；尤其是研究型或并发型 skill，更是如此。

## 当前判断（本轮综合后）

- Codex CLI 在 2026 年已经形成了一个非常清楚的工程化 skill 宿主形态：不是只有 `SKILL.md` 文件格式，而是 `Skills + AGENTS + Subagents + Hooks + Plugins + MCP + model/runtime controls` 的组合系统 [ref](./_reference/03-codex-skills-locations-lifecycle-and-policy.md) [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)
- 而且这套组合系统是沿着清楚的 2026 产品路线长出来的：`custom prompts -> skills -> app/handoff/parallel threads -> installable plugins`，并非文档静态拼装 [ref](./_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)
- Codex 的最大优势，是它把作用域、禁用、agent schema、sandbox、reasoning effort、feature maturity 这些关键控制面都摆得比较明白。这很适合重视治理和可操作性的 CLI 用户 [ref](./_reference/03-codex-agents-md-layering-and-instruction-chain.md) [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md)
- 如果把版本管理也算进去，Codex 目前还是少数把 `snapshot` 这种模型一致性抓手显式露出来的宿主样本之一 [ref](./_reference/03-codex-model-snapshots-and-cli-optimized-runtime.md)
- Codex 的代价，是很多高阶 workflow 同样不是纯 skill 独立完成的；一旦涉及 subagents、hooks、plugins 或 MCP，复杂度和资源消耗会明显上升 [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/03-codex-hooks-plugins-and-feature-maturity.md)
- 如果要研究“工程化 coding agent 怎么把 skill 纳入正式工作流”，Codex 现在是非常关键的样本。
