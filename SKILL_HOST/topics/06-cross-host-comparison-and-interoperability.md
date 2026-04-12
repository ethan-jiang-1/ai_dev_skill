# Topic 06: Cross-Host Comparison and Interoperability

## 历史摘要（保留，不修改）

## 为什么比较专题必须单独存在

如果把比较内容散落到各个宿主专题里，最后只会得到四篇各说各话的介绍，读者很难形成真正可操作的判断。你最关心的问题其实不只是“Claude/Codex/Cursor/OpenCode 各自怎么做”，而是：

- 四家支持 skill 的优点缺点到底分别是什么。
- 对不同类型的 AI Coding 用户，应该优先用哪家。
- 现有 skill 能不能迁移、复用、借鉴，或者至少部分兼容。

这些问题天然就应该聚合成一篇横向比较。

## 这一篇要解决的核心问题

1. 四家在 skill 支持上的核心设计取向分别是什么。
2. 哪些宿主更偏规则驱动，哪些更偏工作流驱动，哪些更偏兼容和桥接。
3. 它们在发现机制、安装方式、原生生态、子代理能力、规则系统、权限治理方面分别有什么取舍。
4. skill 是否能够跨宿主复用，如果能，复用到什么程度。
5. 真正可互通的是目录布局、概念模型、还是完整能力。

## 这一篇应该覆盖的内容

- 比较维度至少应包括：
  - skill 发现与作用域模型
  - 安装与分发方式
  - 官方生态与社区生态
  - rules、settings、plugins、agents 与 skill 的关系
  - 写作类场景的适配性
  - 深度研究类场景的适配性
  - 团队治理与企业化能力
  - 学习成本与上手路径
- 关于“能不能互相支持”的判断，下一轮要明确区分几个层次：
  - 目录或文件格式层面的兼容
  - 安装工具层面的迁移
  - 概念和方法论层面的借鉴
  - 真正执行能力层面的等价复用
- 目前材料已经暗示出的一个重要结论：
  - 互通通常是部分互通，不是完全对称互通。
  - 一个 skill 的“外壳”可能可移植，但一旦它依赖宿主专属的 hooks、rules、plugins、subagents、权限系统，完全复用就会开始失真。
- 这一篇还应当回答“怎么选”：
  - 哪家更适合新手快速上手。
  - 哪家更适合团队治理。
  - 哪家更适合跨生态实验。
  - 哪家更适合高阶研究与复杂编排。

## 这一篇明确不应该覆盖的内容

- 不重新讲一遍每家的细节，那些内容已经在各宿主专题里单独展开。
- 不把“如何写高质量 skill”放进比较专题。
- 不把“如何实现深度研究 skill”放进比较专题，只比较四家的承载能力。

## 这一篇和现有 DR 材料的连接点

这篇会横向使用全部 4 份材料：

- Claude 提供成熟方法论和高阶案例。
- Codex 提供清晰的层级治理和内置安装器视角。
- Cursor 提供 rules 与 skill 的鲜明边界，以及 IDE 场景。
- OpenCode 提供最强的兼容性与桥接视角。

## 本轮新增证据

- 现在已经可以把“互通”明确拆成多个层次，而不是笼统说兼容或不兼容：
  - `spec` 层：`Agent Skills` 规范明确了 `SKILL.md`、frontmatter、description、progressive disclosure [ref](./_reference/00-shared-agent-skills-specification.md)
  - `integration` 层：官方实现指南建议 `.agents/skills/`、三层加载、显式激活、去重与 compaction 保护 [ref](./_reference/00-shared-agent-skills-integration-guide.md)
  - `ecosystem` 层：`skills.sh` 和 `skills` CLI 已经提供跨宿主的发现、安装、check、update 和 install telemetry [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
  - `runtime` 层：每个 host 仍然把 skills 放进自己的规则、插件、权限、subagent 和 marketplace 体系里 [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md) [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md) [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
- 四家宿主的官方支持取向现在已经有清晰轮廓：
  - Claude：skills 嵌入 plugin / agent / hook / MCP 的组合式架构 [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md)
  - Codex：skills 与 AGENTS / MCP / Plugins / Subagents 并列为一等配置面，而且有官方 catalog 与 `$skill-installer` [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md)
  - Cursor：技能在 `2026-01-22` 正式升到 editor + CLI 的一等能力，并很快往 plugin bundle 方向发展 [ref](./_reference/00-shared-cursor-skills-introduction-2026.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
  - OpenCode：最明确地兼容 `.opencode`、`.claude`、`.agents` 路径，并把 rules、instructions、agents、permissions 和 skills 组合起来 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
- 互通并不是纸面概念，已经出现可观测生态信号：
  - quickstart 直接把 Claude Code 和 OpenAI Codex放在同一个 open format 叙事里 [ref](./_reference/00-shared-agent-skills-quickstart-cross-host-paths.md)
  - skills.sh 已经按 host 记录部分技能的安装分布，例如 `codex / opencode / claude-code` 等 [ref](./_reference/00-shared-skills-sh-ecosystem-usage-signals.md)
- 这种生态信号还可以按 skill 类型细分：
  - `technical-writer` 这类轻 orchestration、重规则与范式的 skill，已经能在 `opencode / gemini-cli / codex / cursor / github-copilot / claude-code` 上出现安装分布
  - 这说明“写作 / 文档类 skill 更容易跨宿主铺开”不是空想，而是已经有真实分布支持 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md)
- 还有一种更朴素但很说明问题的 portability 需求：
  - 社区已经出现专门把同一个 skill 同步到多家工具目录的 `sync-skills`
  - 它把 `.agents/skills` 当作通用锚点，但自身目录映射又暴露出 path drift 风险 [ref](./_reference/06-cross-host-sync-skills-normalization-and-path-drift.md)
- 同时也已经出现更“治理化”的同步实践，而不只是单个脚本映射：
  - `skills_sync` 用 central `skills.yaml` 把“安装什么 / 排除什么 / 每个项目需要什么”显式化
  - `sync` 默认 clean state（先删再装）用于压制漂移，`update` 则复用 `npx skills update` 做快速更新
  - example config 里已经出现 `*` / `!pattern` 的 wildcard + exclusion 组合来做大规模去重与降噪 [ref](./_reference/06-skills-sync-cli-tool-and-central-skills-yaml.md) [ref](./_reference/06-skills-sync-example-skills-yaml-wildcards-and-exclusions.md)
- 互通的具体形态还不只是一份 skill 在多家安装：
  - 已经出现把 Claude Code 和 Codex 明确编排进一个循环里的 workflow skill
  - 这种 portability 更接近“跨宿主协作编排”，而不是“单宿主能力完全等价” [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 现在还出现了更直接的迁移适配证据：
  - 一份专门的 Claude -> Codex 映射文档，明确把 Claude 风格的工具引用、`Task*` 计划语义和 subagent label 翻译成 Codex 的做法
  - 它同时明确承认，有些概念并没有公开的一一对应物，例如直接切换 plan mode [ref](./_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)
- 还有更偏维护层的 portability 实践：
  - 一份 `pre-commit` 脚本专门让 `.agents/skills` 和 `.claude/skills` 保持镜像同步
  - 它不只是同步文件，还定义了 canonical source、冲突中止规则和 staged-change 驱动的自动修复逻辑 [ref](./_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md)
- 另外还有一种更“工程化”的互通形态：
  - `skill-codex` 不是把 Claude skill 直接变成 Codex skill，而是在 Claude 里把 `codex exec` 包成插件 / skill
  - 这样跨宿主复用就变成了 host-to-host delegation，并且把 model、reasoning、sandbox 和 context hygiene 直接做成 workflow contract [ref](./_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
- 现在还可以看到一个非常具体的失败模式：
  - Cursor 在 `2026-01-28` 的官方 forum 讨论里，被报告会从多个工具目录重复加载同名 skill
  - 这会造成 context waste、版本歧义和错误副本被选中；官方给出的 workaround 也是“保留一个 authoritative 目录，删掉其他副本” [ref](./_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)
- 研究型 skill 的 registry 分布也进一步说明了分层 portability：
  - `repo-research-analyst` 已经跨多个 host 被安装
  - 但 skill 内部仍可能携带 `Task(...)`、`subagent_type="general-purpose"`、甚至错误年份这样的宿主假设漂移 [ref](./_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
- 而且 research skill 的“可迁移部分”也开始被写成可复用的治理套路：
  - `mcp-research` 这种 skill 把 tool routing（Context7/Exa/Jina）和 quality rules（优先一手 docs、版本校验、事实/推断分离、冲突处理）编进 workflow
  - 这强化了一个 cross-host 结论：迁移时应该保留 research method 与证据纪律，但工具名与权限 envelope 很可能需要翻译/重写 [ref](./_reference/06-mcp-research-skill-definition-tool-selection-and-quality-rules.md)
- 最新 host 演进也说明，横向比较不能只盯格式兼容，还得盯 execution topology：
  - Codex 把 approval policy、sandbox、network access、`web_search` 模式、subagent inheritance 都明确暴露为配置面 [ref](./_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
  - Cursor 已经从 IDE / CLI 扩到 worktrees、cloud、remote SSH、self-hosted cloud agents [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - OpenCode 则把 provider-gated `websearch` 与 subagent tool defaults 直接暴露出来 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- Claude 这边则提供了另一类对照：
  - 研究型 workflow 的关键工具面和 delegation contract 明确写在官方 docs 里，例如 permission-gated `WebSearch / WebFetch`、background subagent approval envelope、`Task -> Agent` 演化 [ref](./_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md)
- 而且 hidden runtime constraints 已经不是抽象担忧：
  - Cursor 官方 forum 明确出现了 `Task` tool provisioning 的 server-side 问题
  - subagent availability 还会受 Composer routing 和 team model restrictions 影响 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 但限制同样很实在：
  - Claude 在大规模 skill 目录上已经出现过 deadlock 修复、description 长度压缩、skill state 释放等运维信号 [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md)
  - Cursor 在早期 2.4 rollout 就暴露过 subagent task-tool 的稳定性问题 [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)

## 本轮新增机制理解

- 目前最合理的横向比较框架，不该是“谁支持 skill”，而该是“谁在哪一层支持得更深”：
  - `format compliance`
  - `discovery and install`
  - `runtime orchestration`
  - `ecosystem packaging`
  - `maintenance and operational maturity`
  - `execution topology`
  - `tool-surface assumptions`
- 按这个框架看，四家不是简单的强弱排序，而是设计取向不同：
  - Claude 更像高成熟度工作流塑形平台
  - Codex 更像工程化、命令式、官方 catalog 明确的 agent host
  - Cursor 更像 IDE-native 的动态 skill / subagent / plugin bundle 平台
  - OpenCode 更像兼容和桥接优先的实验平台
- 这也解释了为什么“完全对称互通”很难成立：
  - spec 统一的是文件与元数据
  - registry / CLI 统一的是一部分发现和更新动作
  - 真正差异最大的部分，是 host 各自如何把 skill 嵌进 rules / plugins / subagents / permissions / MCP
  - 连最表层的“同步到正确目录”这件事，也会被 community path drift 影响
  - 结果就是：轻流程 skill 往往更容易多宿主复用，重 orchestration skill 往往更容易演化成 handoff 或 host-specialized workflow
  - 甚至在实践里，跨宿主“可移植”有时意味着把不同宿主放到同一条 loop 里分工，而不是强行追求一个 runtime 等价壳 [ref](./_reference/00-shared-agent-skills-integration-guide.md) [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md) [ref](./_reference/06-cross-host-codex-claude-loop-example.md) [ref](./_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
- 到现在还可以再往前走一步，把 interoperability 的现实工程路径分成四种：
  - `direct reuse`：文件格式和方法论直接沿用
  - `mirror sync`：多个 native 目录共存，但用 hook 和 canonical source 维持一致
  - `translation`：重写工具名、计划语义、subagent label 等 host-shaped call shape
  - `delegation`：不追求 runtime 等价，而是在一个 host 里直接调用另一个 host 的 CLI / agent [ref](./_reference/06-cross-host-sync-skills-normalization-and-path-drift.md) [ref](./_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](./_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](./_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
- 同时也能看到一条“跨宿主仍然成立”的 authoring 规律：
  - `optimize-skills` 把“触发正确 + 上下文经济 + progressive disclosure”写成了可执行的 checklist 和目标阈值（如 metadata ~100 tokens、`SKILL.md` \<500 lines）
  - 这类 meta-skill 更接近跨宿主可复用的“技能工程学”，而不是某一家 host 的私有能力 [ref](./_reference/06-optimize-skills-skill-definition-and-quality-heuristics.md)
- 这也让“可移植性”不再只是技术兼容问题，而是一个要回答三件事的工程问题：
  - canonical source 在哪里
  - translation table 由谁维护
  - 什么时候该停止追求 native equivalence，改用 host-to-host delegation

## 本轮新增趋势与难点

- 一个清晰趋势是：四家都不再把 skill 当成孤立功能，而是在往“extension stack”方向演进：
  - Claude 用 plugin bundle 组织 skills、agents、hooks、MCP [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md)
  - Codex 把 skills 与 AGENTS / MCP / Plugins / Subagents 并排 [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md)
  - Cursor 直接把 skills、subagents、MCP、hooks、rules 打包进 marketplace plugins [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
  - OpenCode 让 skill 与 rules / instructions / agents / permissions 互相咬合 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
- 另一个越来越重要的趋势是：host 的差异开始更多体现在“agent 运行在哪里、默认能拿到什么工具、哪些工具受 provider 约束”：
  - Cursor 把 agent execution 扩到本地、worktree、cloud、SSH、自托管环境 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - OpenCode 明确暴露 `websearch` gating 与 subagent tool defaults [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 更进一步，host 的差异还开始体现在“哪些运行层约束是显式的，哪些是隐式的”：
  - Claude 倾向把 research tool permissions 和 subagent inheritance 明确写进 docs
  - Codex 倾向把 approvals、sandbox、search mode 和 admin policy 明确写进 config / security docs
  - OpenCode 倾向把 permissions 和 tool gating 写在文档里
  - Cursor 则至少有一部分 subagent 行为要通过 forum 与 support 交互才能看见 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 另一个趋势是：分发和更新正在脱离“手动复制目录”阶段，开始出现 registry + CLI + telemetry 的平台化层 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
- 还出现了一个更有意思的趋势：一些 skill 不再把“兼容”理解成单工具复刻，而是理解成跨工具 handoff 与循环验证 [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 而且这种趋势已经开始长出更明确的运维形态：
  - 有人用 mirror hook 解决多目录同步
  - 有人用 tool-mapping 文档解决 call-shape translation
  - 有人直接把另一家 host 包成 skill / plugin worker [ref](./_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](./_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](./_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
- 这也让 portability 呈现出两条并行路线：
  - 一条是 `technical-writer` 这种轻技能在多宿主直接铺开
  - 一条是 `codex-claude-loop` 这种把不同宿主串起来分工 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 但现在还应补第三条更现实的路线：
  - 先用 `sync-skills` 这类工具做目录层同步
  - 再面对 path drift、tool surface、runtime semantics 逐层修正 [ref](./_reference/06-cross-host-sync-skills-normalization-and-path-drift.md)
- 以及第四条路线：
  - 直接把“跨宿主”做成显式 delegation stack
  - 在 skill / plugin 里公开 model、reasoning、sandbox、output hygiene 等运行约束，而不是假装两边原生等价 [ref](./_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
- 主要难点则集中在三处：
  - runtime semantics 不一致，导致同一个 skill 外壳可移植，但执行质量不等价
  - host-native 运维成熟度差异明显
  - 生态入口变多后，用户更容易高估安装量而低估 skill 质量与安全审查需求 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md)
- 现在还得再加两处：
  - duplicated native directories 会把 portability 变成 repo-governance 问题
  - translation layer 本身也要跟着宿主工具面演化，否则会再次变成新的 assumption drift [ref](./_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](./_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)
- 而且 discovery layer 自己也会出事：
  - 如果 host 扫描多个跨工具目录却没有 dedup / precedence 规则，互通不但不能省事，反而会制造 token 浪费和版本混淆 [ref](./_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)

## 本轮新增维护 / 版本管理 / 模型要求

- 现在已经能看到两个平行的版本管理面：
  - `ecosystem layer`：通过 `skills` CLI 做 `check / update` [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
  - `host layer`：由每个宿主自己处理大型 skill 目录、state cleanup、plugin bundle、permissions 等 runtime maintenance [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
- 还应该补一层“运行拓扑与工具面维护”：
  - Codex 需要考虑 approval policy、network access、web-search mode 与 cloud internet defaults 的一致性 [ref](./_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
  - Cursor 需要考虑 local / worktree / cloud / SSH / self-hosted 等多环境一致性 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - OpenCode 需要考虑 provider-gated tools 与 subagent default differences [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 现在还可以确认一层“跨宿主维护面”：
  - 如果要同时满足多个 native skill 目录，就需要声明 canonical source，并决定 drift detection / auto-fix / conflict abort 的规则 [ref](./_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md)
  - 如果一个 skill 带着 Claude 风格工具名或 subagent label 迁到 Codex，就需要维护 translation table，而不是把旧 call shape 当作理所当然 [ref](./_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)
  - 如果跨宿主互通是通过直接调用另一家 CLI 完成的，那么版本管理还要额外覆盖目标 CLI 的安装、登录、模型选择、sandbox 默认值和输出抑制策略 [ref](./_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
  - 如果 host 会扫描其他工具目录，还需要明确 dedup、precedence 和 authoritative-source 规则，否则 discovery portability 会反过来伤害 runtime 质量 [ref](./_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)
- 对一些 host，还得补一层“后台路由与管理策略维护”：
  - Cursor 的 subagent 行为可能受 server-side provisioning、Composer routing、model restrictions 影响 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 模型要求也是横向比较里不能省的一层：
  - Codex 的高端模型已经公开到 `400k` 级上下文和多档 reasoning effort，这对复杂技能尤其重要 [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md)
  - OpenCode 明确把 model choice、tool access、permissions 和 subagent 定义绑在一起 [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
  - 因此不能只比较“有没有 skill”，还要比较“host 把什么模型与工具治理暴露给了 skill 工作流”

## 当前判断（本轮综合后）

- 截至 `2026-04-12`，四家在 `skills` 上已经形成“同格式、不同运行栈”的局面，这个判断是成立的 [ref](./_reference/00-shared-agent-skills-specification.md) [ref](./_reference/00-shared-agent-skills-integration-guide.md)
- 真正可互通的部分，首先是文件格式、frontmatter、部分目录 convention，以及越来越明显的 registry / CLI 发现层；最难互通的是 host-native runtime 行为，包括 rules、plugins、subagents、permissions、hooks 与 MCP 编排 [ref](./_reference/00-shared-agent-skills-quickstart-cross-host-paths.md) [ref](./_reference/00-shared-skills-sh-ecosystem-usage-signals.md) [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md)
- 目录层 portability 也不能想得太乐观：社区已经在主动做 multi-host sync，但这类映射会随着 host path 约定演化而漂移，所以“安装层 portability”本身也有维护成本 [ref](./_reference/06-cross-host-sync-skills-normalization-and-path-drift.md)
- 但“互通”还应该补上一层实践定义：在 2026，跨宿主 skill 也可以表现为 handoff workflow，本质是让不同 agent 各做自己擅长的段落，而不是要求它们共享完全相同的 runtime 语义 [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 同时，轻技能和重技能的 portability 路径并不一样：像 technical writing 这种以规则、范式、示例为主的技能，更接近直接复用；像复杂 orchestration 技能，则更接近按宿主能力重新编排 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 研究型 skill 还进一步证明了一点：install portability 可以很强，但 runtime-semantic portability 仍可能因为旧调用形态、宿主假设、年份和参数漂移而失真 [ref](./_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
- 现在还可以把“真正有用的 interoperability”说得更实：
  - 它未必表现为原样运行
  - 也可以表现为同步、翻译、委派这三类工程策略的组合 [ref](./_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md) [ref](./_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](./_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)
- 同时，真正决定复杂 skill 能不能跑稳的，越来越是 execution topology 和 tool-surface assumptions，而不是单纯的格式兼容 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- Codex 的加入让这点更明确：有些 host 把这些约束直接暴露成 config 和安全策略，有些 host 则更多藏在后台运行层；这会直接改变可建模性和排错成本 [ref](./_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 再往深一点说，复杂 skill 的稳定性还取决于这些约束是公开可建模的，还是藏在后台路由和团队策略里；这会直接影响排错成本与可移植性判断 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 这也解释了为什么“native compatibility”与“useful interoperability”要分开说：
  - 前者追求同一个 skill 在不同 host 原样生效
  - 后者接受差异存在，但用 sync / translate / delegate 把 workflow 真正跑起来
- 同时还要补一句现实提醒：
  - 如果 discovery 没有 boundary 和 dedup，跨宿主共存甚至可能比单宿主更乱 [ref](./_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)
- 如果只看取向：
  - Claude 更强在成熟工作流与高阶组合能力
  - Codex 更强在官方 catalog、命令式工程感和模型能力公开度
  - Cursor 更强在 IDE-native 体验和 bundle 化扩展
  - OpenCode 更强在兼容、桥接和显式权限模型
- 如果只看风险：
  - Cursor 和 Claude 都已经出现了足以说明运维复杂度的 2026 信号
  - 因此“功能表看起来一样”绝不等于“在真实复杂任务里等价” [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
