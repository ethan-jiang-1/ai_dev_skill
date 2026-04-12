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
- 互通的具体形态还不只是一份 skill 在多家安装：
  - 已经出现把 Claude Code 和 Codex 明确编排进一个循环里的 workflow skill
  - 这种 portability 更接近“跨宿主协作编排”，而不是“单宿主能力完全等价” [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 最新 host 演进也说明，横向比较不能只盯格式兼容，还得盯 execution topology：
  - Cursor 已经从 IDE / CLI 扩到 worktrees、cloud、remote SSH、self-hosted cloud agents [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - OpenCode 则把 provider-gated `websearch` 与 subagent tool defaults 直接暴露出来 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
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
  - 结果就是：轻流程 skill 往往更容易多宿主复用，重 orchestration skill 往往更容易演化成 handoff 或 host-specialized workflow
  - 甚至在实践里，跨宿主“可移植”有时意味着把不同宿主放到同一条 loop 里分工，而不是强行追求一个 runtime 等价壳 [ref](./_reference/00-shared-agent-skills-integration-guide.md) [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md) [ref](./_reference/06-cross-host-codex-claude-loop-example.md)

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
  - OpenCode 倾向把 permissions 和 tool gating 写在文档里
  - Cursor 则至少有一部分 subagent 行为要通过 forum 与 support 交互才能看见 [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md) [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 另一个趋势是：分发和更新正在脱离“手动复制目录”阶段，开始出现 registry + CLI + telemetry 的平台化层 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
- 还出现了一个更有意思的趋势：一些 skill 不再把“兼容”理解成单工具复刻，而是理解成跨工具 handoff 与循环验证 [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 这也让 portability 呈现出两条并行路线：
  - 一条是 `technical-writer` 这种轻技能在多宿主直接铺开
  - 一条是 `codex-claude-loop` 这种把不同宿主串起来分工 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 主要难点则集中在三处：
  - runtime semantics 不一致，导致同一个 skill 外壳可移植，但执行质量不等价
  - host-native 运维成熟度差异明显
  - 生态入口变多后，用户更容易高估安装量而低估 skill 质量与安全审查需求 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md)

## 本轮新增维护 / 版本管理 / 模型要求

- 现在已经能看到两个平行的版本管理面：
  - `ecosystem layer`：通过 `skills` CLI 做 `check / update` [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
  - `host layer`：由每个宿主自己处理大型 skill 目录、state cleanup、plugin bundle、permissions 等 runtime maintenance [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
- 还应该补一层“运行拓扑与工具面维护”：
  - Cursor 需要考虑 local / worktree / cloud / SSH / self-hosted 等多环境一致性 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - OpenCode 需要考虑 provider-gated tools 与 subagent default differences [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 对一些 host，还得补一层“后台路由与管理策略维护”：
  - Cursor 的 subagent 行为可能受 server-side provisioning、Composer routing、model restrictions 影响 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 模型要求也是横向比较里不能省的一层：
  - Codex 的高端模型已经公开到 `400k` 级上下文和多档 reasoning effort，这对复杂技能尤其重要 [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md)
  - OpenCode 明确把 model choice、tool access、permissions 和 subagent 定义绑在一起 [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
  - 因此不能只比较“有没有 skill”，还要比较“host 把什么模型与工具治理暴露给了 skill 工作流”

## 当前判断（本轮综合后）

- 截至 `2026-04-12`，四家在 `skills` 上已经形成“同格式、不同运行栈”的局面，这个判断是成立的 [ref](./_reference/00-shared-agent-skills-specification.md) [ref](./_reference/00-shared-agent-skills-integration-guide.md)
- 真正可互通的部分，首先是文件格式、frontmatter、部分目录 convention，以及越来越明显的 registry / CLI 发现层；最难互通的是 host-native runtime 行为，包括 rules、plugins、subagents、permissions、hooks 与 MCP 编排 [ref](./_reference/00-shared-agent-skills-quickstart-cross-host-paths.md) [ref](./_reference/00-shared-skills-sh-ecosystem-usage-signals.md) [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md)
- 但“互通”还应该补上一层实践定义：在 2026，跨宿主 skill 也可以表现为 handoff workflow，本质是让不同 agent 各做自己擅长的段落，而不是要求它们共享完全相同的 runtime 语义 [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 同时，轻技能和重技能的 portability 路径并不一样：像 technical writing 这种以规则、范式、示例为主的技能，更接近直接复用；像复杂 orchestration 技能，则更接近按宿主能力重新编排 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/06-cross-host-codex-claude-loop-example.md)
- 同时，真正决定复杂 skill 能不能跑稳的，越来越是 execution topology 和 tool-surface assumptions，而不是单纯的格式兼容 [ref](./_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](./_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- 再往深一点说，复杂 skill 的稳定性还取决于这些约束是公开可建模的，还是藏在后台路由和团队策略里；这会直接影响排错成本与可移植性判断 [ref](./_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- 如果只看取向：
  - Claude 更强在成熟工作流与高阶组合能力
  - Codex 更强在官方 catalog、命令式工程感和模型能力公开度
  - Cursor 更强在 IDE-native 体验和 bundle 化扩展
  - OpenCode 更强在兼容、桥接和显式权限模型
- 如果只看风险：
  - Cursor 和 Claude 都已经出现了足以说明运维复杂度的 2026 信号
  - 因此“功能表看起来一样”绝不等于“在真实复杂任务里等价” [ref](./_reference/00-shared-claude-code-skills-2026-operational-signals.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
