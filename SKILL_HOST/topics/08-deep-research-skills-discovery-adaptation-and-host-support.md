# Topic 08: Deep Research Skills Discovery, Adaptation, and Host Support

## 历史摘要（保留，不修改）

## 为什么这个 topic 要改成现在这样

前一个版本更像“怎么自己设计一个 Deep Research skill”。这和你当前真正想做的事也有一点偏。你现在更需要的是：先把外面已经存在的 deep research skill 生态摸清楚，看看哪些是真的有料，哪些只是换皮搜索；再看不同 coding agent 是否提供了特别好的承载和支持，让人可以更快借用、实验、改造，而不是一上来就从零自建整套研究系统。

所以这一篇应该从“发现和借力”出发，而不是从“从零搭建”出发。

## 这一篇要解决的核心问题

1. 现在所谓 deep research skill，常见到底分成哪几类。
2. 哪些只是搜索封装，哪些已经进入真正的研究编排。
3. Claude、Codex、Cursor、OpenCode 各自对这类 skill 提供了什么特别支持。
4. 现成的 deep research skill 去哪里找，怎么判断真假深度。
5. 拿到以后哪些部分可以直接用，哪些需要按宿主能力去适配。

## 这一篇应该覆盖的内容

- 研究型 skill 的主要类型：
  - 确定性数据源检索型。
  - 网页与知识库聚合型。
  - 代码库探索与资料交叉型。
  - 子代理并发研究型。
  - 带验证、去重、证伪、引用控制的深度研究编排型。
- 这一篇要特别厘清的一个判断：
  - “能搜索”不等于“能做 deep research”。
  - 真正更有价值的 skill，通常不仅负责搜，还负责拆题、并发、验证、汇总和约束风险。
- 四个宿主对 deep research skill 的支持重点：
  - Claude Code：
    - 现成案例最丰富。
    - 有递归研究、Valyu、授权闸门等成熟线索。
    - 特别适合研究“高复杂度研究 skill 是如何长出来的”。
  - Codex CLI：
    - 内置安装器和原生 subagents 很适合承接现成研究型 skill。
    - 对工程型用户来说，研究工作流更容易和 CLI 任务融合。
  - Cursor：
    - 原生异步子代理让“研究线程并行化”更自然。
    - 适合研究 IDE 内部如何把代码库探索和外部资料检索结合起来。
  - OpenCode：
    - 原生 subagents、混合检索、兼容外部技能路径，使它非常适合做研究 skill 的桥接与实验。
    - 尤其适合研究“现成 deep research skill 能否部分迁移过来”。
- 这一篇要重点研究“怎么辨别一个现成 deep research skill 值不值得用”：
  - 数据源是否可靠。
  - 是否只是普通网页搜索包装。
  - 是否有任务分解和多路径探索。
  - 是否有交叉验证、去重和引用约束。
  - 是否有停止条件、轮数控制、权限边界。
- 这一篇还应研究“适配和改造”的现实路径：
  - 哪些 skill 只换检索源就能继续用。
  - 哪些 skill 明显依赖宿主专属 subagent 机制。
  - 哪些 skill 的思路能迁，但执行壳子必须重写。

## 这一篇明确不应该覆盖的内容

- 不把重点放在“如何自己从零发明 deep research architecture”。
- 不把一般性的 skill 编写方法论放进来。
- 不把四家所有能力全景介绍一遍，这篇只聚焦研究类 skill 的发现、判断、承载与改造。

## 这一篇和现有 DR 材料的连接点

- Claude 材料提供了最丰富的研究型 skill 线索，包括 Valyu、递归子代理、授权控制等。
- Codex 材料提供了 Smart Search 和原生 subagent workflow 的工程化视角。
- Cursor 材料提供了异步子代理与 IDE 场景下并行研究的视角。
- OpenCode 材料提供了原生 subagents、混合检索和跨路径兼容的桥接视角。

## 本轮新增证据

- 2026 年所谓 deep research skill，已经至少能分出几种不同类型：
  - 基础流程型：围绕问题澄清、分解、搜集、评估、综合 [ref](./_reference/08-deep-research-skill-basic-systematic-pattern.md)
  - orchestration 型：带 evidence table、parallel subagents、citation verification、multi-pass drafting [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md)
  - staged autonomous agent 型：显式拆出 planner、source evaluator、report generator [ref](./_reference/08-deep-research-agent-source-evaluation-pipeline.md)
  - deterministic routing / backend selection 型：按 use case 在通用研究和学术检索后端之间切换 [ref](./_reference/08-research-lookup-deterministic-routing-skill.md)
  - tool-heavy domain search 型：例如依赖 Valyu API 和显式运行前提的 domain retrieval [ref](./_reference/08-valyu-powered-search-skill-requirements.md)
- “能搜”与“能做 deep research”之间的区别，现在已经能通过 skill 内容本身观察到：
  - 真正高级的 skill 会写 report contract、source triage、citation verification、parallel drafting 和 merge [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md)
  - 只是 search wrapper 的 skill，更多强调 backend、API、统一检索入口和依赖前提 [ref](./_reference/08-research-lookup-deterministic-routing-skill.md) [ref](./_reference/08-valyu-powered-search-skill-requirements.md)
- 这些 skill 的发现方式也已经越来越平台化：
  - registry listing
  - install command
  - first seen date
  - host install breakdown [ref](./_reference/00-shared-skills-sh-ecosystem-usage-signals.md)
- host 对这类 skill 的承接能力，也在 2026 明显拉开：
  - Cursor `3.0` 已经支持在 repos、本地、worktrees、cloud、remote SSH 上并行跑 agents，还新增了 `Await` 和更快的 Explorer subagent startup [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - OpenCode 则把 `websearch` 的 provider gating、`webfetch` / `websearch` 分工、以及 subagent tool defaults 直接写进 tools docs [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
  - Cursor 官方 forum 还显示，research workflow 依赖的 subagent availability 可能受 server-side provisioning、Composer routing 和 model restrictions 影响 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## 本轮新增机制理解

- deep research skill 的真正分水岭，不在于“有没有联网”，而在于它把多少研究治理步骤编进了 skill：
  - 是否拆题
  - 是否分阶段
  - 是否评估来源
  - 是否并行探索
  - 是否去重和校验引用
  - 是否控制输出结构
- 按这个标准看，deep research skill 的上限非常依赖宿主：
  - 基础流程型 skill 可移植性较强
  - orchestration / parallel subagent / evidence-merge 型 skill 明显更依赖宿主 runtime
  - deterministic retrieval 型 skill 则更依赖外部 API、环境和权限 [ref](./_reference/08-deep-research-skill-basic-systematic-pattern.md) [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md) [ref](./_reference/08-valyu-powered-search-skill-requirements.md)
- 这也解释了为什么你要的重点不该是“自己从零搭研究系统”，而是先判断：
  - 这个 skill 属于哪一类
  - 哪些能直接用
  - 哪些只能借思路
  - 哪些需要宿主专属能力才能真正成立
- 现在可以把“宿主专属能力”说得更具体：
  - 有的宿主给你多环境并行执行
  - 有的宿主把 search tool 绑到特定 provider
  - 有的宿主默认不给 subagents 某些工具
  - 有的宿主还会把 subagent routing 放在后台服务与团队策略层
  所以 research skill 的真假可移植性，必须下钻到工具面和执行面。

## 本轮新增趋势与难点

- 2026 年 deep research skills 的趋势是从“搜索能力”向“研究编排能力”升级：
  - source evaluation
  - evidence tables
  - staged research agents
  - parallel drafting
  - citation verification [ref](./_reference/08-deep-research-agent-source-evaluation-pipeline.md) [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md)
- 另一个趋势是：deterministic data source 和智能 backend routing 正在变成 skill 的重要价值点 [ref](./_reference/08-research-lookup-deterministic-routing-skill.md) [ref](./_reference/08-valyu-powered-search-skill-requirements.md)
- 还有一个越来越明确的趋势是：高阶 research skill 不再只吃“单一对话 + 单次搜索”，而是越来越依赖多环境执行、background waits、parallel agents、provider-aware tool routing [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 最大难点也很清楚：
  - 越高级的 research skill，越容易强依赖 host runtime
  - 越依赖外部 API，setup 和权限成本越高
  - 越依赖 parallel agents，越容易碰到宿主稳定性、server-side routing、管理员模型策略与 token 成本问题 [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/04-cursor-subagent-and-skill-rollout-friction.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md) [ref](./_reference/05-opencode-permissions-granularity-and-command-policy.md)

## 本轮新增维护 / 版本管理 / 模型要求

- deep research skill 比 writing skill 更依赖模型和 runtime：
  - 强 reasoning
  - 更大 context
  - 更好的 tool calling
  - 更稳定的 subagent execution
  - 更明确的 permissions / sandbox / API env vars [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md) [ref](./_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](./_reference/05-opencode-permissions-granularity-and-command-policy.md)
- 这类 skill 的维护成本也更高：
  - API key
  - backend drift
  - citation quality
  - host subagent stability
  - file output and merge logic
  - provider-specific tool availability
  - subagent tool defaults
- 因此对这类 skill 来说，“装上就能跑”远远不够，必须再判断：
  - 当前 host 能否可靠承接
  - 当前模型是否够强
  - 当前权限是否允许
  - 当前依赖是否齐全
  - 当前 provider 是否给到所需 search surface
  - 当前团队 / 账户策略会不会影响 subagent routing [ref](./_reference/08-valyu-powered-search-skill-requirements.md) [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

## 当前判断（本轮综合后）

- 2026 年的 deep research skill 生态已经足够成熟到可以分型，而不应该再被统称为“搜索 skill”。
- 它们的最大价值，在于把研究过程里的治理步骤编译进去；也正因为如此，它们比写作 skill 更能暴露宿主的真实上限 [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md) [ref](./_reference/08-deep-research-agent-source-evaluation-pipeline.md)
- 2026 年之后，这个“暴露宿主上限”的方式已经很具体：要看 host 是否支持并行 agent、background waits、多环境执行、provider-aware search，以及 subagent 可拿到的实际工具面 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 而且这些约束不一定都写在静态 docs 里；有些会藏在 server-side provisioning、Composer routing、team model restrictions 这种后台运行层 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 它们的主要风险，不在于“有没有这个 skill”，而在于你是否误把一个 search wrapper 当成了真正的 deep research workflow [ref](./_reference/08-research-lookup-deterministic-routing-skill.md)
- 如果目标是判断“哪类现成 research skill 可以直接拿来试，哪类只能借思路”，这一条线现在已经开始有很清楚的研究价值。
