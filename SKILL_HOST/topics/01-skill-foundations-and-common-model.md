# Topic 01: Skill Foundations and Common Model

## 历史摘要（保留，不修改）

## 为什么这个 topic 要单独存在

当前这 4 份 Deep Research 原始材料分别从 Claude Code、Codex CLI、Cursor、OpenCode 四个宿主出发讨论 skill，但它们都默认读者已经知道 skill 是什么、为什么存在、它和 prompt/rules/plugin/MCP/subagent 的边界在哪里。对于已经做过一段时间 AI Coding、但仍然对“怎么找 skill、怎么编 skill、怎么 leverage skill”感到混乱的人来说，这一步反而是最容易糊涂的地方。

而且截至 `2026-04-12`，这件事已经不只是“社区里慢慢形成了一些约定”，而是确实出现了一套公开的 `Agent Skills` 规范。这个规范已经值得单独研究，因为它会直接影响后面所有问题：什么叫标准 skill、什么能跨宿主复用、什么只是某个宿主的私有扩展、为什么同样叫 skill，落到不同 agent 身上还是会有差异。

所以这一篇不能只是四家材料的公共部分摘抄，而应该成为后续所有 topic 的总入口。读完这一篇，读者至少要建立一个清晰心智模型：skill 不是“更长一点的 prompt”，而是把可复用的方法论、流程、参考材料和必要脚本组织成一个按需加载的工作单元。

## 这一篇要解决的核心问题

1. skill 到底是什么，它和普通 prompt 有什么根本区别。
2. skill 为什么会出现，它解决了什么真实痛点。
3. skill 能分装什么，不能分装什么。
4. skill 和 rules、MCP、plugins、subagents、项目说明文档之间的边界是什么。
5. 为什么“按需加载”和“渐进式披露”会成为 skill 的核心设计原则。
6. 截至 `2026-04-12`，skill 是否已经有公开规范；如果有，这个规范到底规定了什么、没规定什么。

## 这一篇应该覆盖的内容

- skill 的通用结构：`SKILL.md`、可选的 `references/`、可选的 `scripts/`，以及围绕描述、触发条件和执行步骤形成的最小单元。
- skill 的本质作用：把反复解释的工作流、判断标准、输出风格和工具使用方法固定下来，让代理不必每次从零理解。
- `Agent Skills` 规范本身需要成为这一篇的重要组成部分，而不是背景注脚：
  - 截至 `2026-04-12`，`agentskills.io` 已经提供公开的 `Specification` 页面，把 `SKILL.md`、目录结构、frontmatter 字段、可选目录、渐进式披露和校验方式写成了明确规范。
  - 最小目录结构是一个 skill 目录里至少有一个 `SKILL.md`；`scripts/`、`references/`、`assets/` 都是可选的。
  - `SKILL.md` 必须包含 YAML frontmatter 和 Markdown 主体。
  - 规范层面要求的核心字段是 `name` 和 `description`；`license`、`compatibility`、`metadata`、`allowed-tools` 属于可选字段，其中 `allowed-tools` 还是实验性的。
  - 规范还对 `name` 的字符集、长度、与父目录同名等细节做了约束，对 `description` 的长度和用途也有明确要求。
  - 规范已经把“progressive disclosure”写成明确原则，而不是经验建议：启动时只加载 `name` 和 `description`，skill 激活后再加载完整 `SKILL.md`，需要时才加载脚本、参考资料和资源文件。
  - 规范还提供了 `skills-ref` 参考库，用于校验 skill 是否符合前言格式与命名规则。
- skill 解决的现实问题：
  - 重复提示词成本高。
  - 团队协作时方法论不稳定。
  - 长规则常驻上下文会浪费 token。
  - 复杂任务需要稳定流程而不是一次性灵感。
- skill 常见能分装的对象：
  - 代码工作流：重构步骤、测试顺序、代码审查清单、发布检查。
  - 知识与规范：架构约束、品牌语气、技术写作标准、行业合规要求。
  - 检索与研究：确定性搜索、资料筛选、引文验证、研究编排。
  - 输出与转化：README、ADR、技术文章、营销内容、跨平台改写。
  - 工具使用方法：如何调用本地脚本、外部 API、检索源、格式化工具。
- skill 的边界：
  - skill 不等于外部工具本身；它更像“如何用工具”的方法论。
  - MCP 更接近能力接口，skill 更接近操作协议。
  - rules 更像永远在线的静态约束，skill 更像按需触发的动态流程。
  - subagent 是执行形态，skill 是驱动这类执行形态的知识封装之一。
- 规范与实现之间的边界也要讲清楚：
  - 规范定义的是 skill 里面长什么样，不严格规定所有宿主必须去哪里扫描 skill。
  - 官方实现指南明确提到，`.agents/skills/` 已经成为跨客户端共享 skill 的常见约定，但这更像广泛采用的 convention，而不是规范本身的硬性要求。
  - 客户端可以在规范之上增加自己的扫描路径、信任机制、权限系统、规则系统、子代理体系和安装器。
  - 所以“有规范”不等于“完全互通”；真正互通的通常先是目录结构和元数据层，其次才是部分工作流层，最难互通的是宿主专属能力层。
- “渐进式披露”为什么重要：
  - 启动时只暴露名称和描述。
  - 被触发时再加载主体说明。
  - 需要时再读取大型参考材料。
  - 这是 skill 能同时做到“强约束”和“低 token 常驻成本”的关键。

## 这一篇明确不应该覆盖的内容

- 不深入展开任何一个具体宿主的安装命令、目录路径和市场生态，那些属于后面的宿主专题。
- 不在这一篇里做四家优缺点横向比较，那是比较专题的任务。
- 不把“如何写 skill”展开成操作教程，那是单独的方法论专题。
- 不把“如何做深度研究 skill”直接写成实现方案，那是后面的高级专题。
- 但这一篇必须把“规范”研究到足够实，不应该只停留在“有一个开放标准”这种笼统说法。

## 这一篇和现有 4 份 DR 材料的连接点

- Claude 材料提供了 skill vs MCP、渐进式披露、作用域隔离、内容与研究两类高价值用法的最好总述。
- Codex 材料提供了更明确的多层作用域视角，有助于解释为什么 skill 不是一次性的 prompt。
- Cursor 材料最适合拿来说明 rules 与 skill 的差异。
- OpenCode 材料最适合拿来说明 skill 与宿主规则系统、插件系统之间并不是简单替代关系。
- 除了这 4 份 raw DR，这一篇还应明确吸收 `agentskills.io` 的官方规范与实现指南，特别是：
  - `Specification`
  - `What are skills?`
  - `How to add skills support to your agent`

## 本轮新增证据

- `Agent Skills` 在 `2026` 年已经不是纯社区约定，而是明确公开的规范体系：
  - overview 层把 skill 定义为用于扩展 agent 的开放格式，最小单位是包含 `SKILL.md` 的目录，且可以附带 scripts / references / templates [ref](./_reference/00-shared-agent-skills-overview.md)
  - specification 层明确了 `SKILL.md` 的 YAML frontmatter、必填字段、命名约束、description 约束、主文件长度建议与 `progressive disclosure` [ref](./_reference/00-shared-agent-skills-specification.md)
  - integration guide 又把“skills-compatible client”应该怎么接入分成 `catalog / instructions / resources` 三层加载模型 [ref](./_reference/00-shared-agent-skills-integration-guide.md)
- `spec` 和 `convention` 已经能清楚分开：
  - 规范本身定义 skill 目录和元数据长什么样 [ref](./_reference/00-shared-agent-skills-specification.md)
  - `.agents/skills/` 是官方实现指南和 quickstart 都在使用的跨客户端 convention，但不是 spec 的强制扫描路径 [ref](./_reference/00-shared-agent-skills-integration-guide.md) [ref](./_reference/00-shared-agent-skills-quickstart-cross-host-paths.md)
- `skill` 的核心不是“更长 prompt”，而是一个按需加载的工作流包：
  - 主文件只该保留流程和判断
  - bulky context 应外置到 `references/`
  - 环境前提和脚本前提需要显式说明，而不是让模型猜 [ref](./_reference/00-shared-agent-skills-best-practices.md) [ref](./_reference/00-shared-agent-skills-scripts-and-env-requirements.md)
- `description` 在运行时是关键契约的一部分，而不是装饰字段：
  - 它决定 skill 是否会被正确发现、激活或误触发
  - 不同 client 对 discoverability 的接法不同，因此 description 质量直接影响跨宿主可用性 [ref](./_reference/00-shared-agent-skills-description-optimization.md)
- 到 `2026` 年，skills 已经开始长出独立的分发和生命周期层，而不再只是 GitHub 目录：
  - `skills.sh` 提供 registry、CLI、leaderboard、telemetry、audit posture [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md)
  - `skills` CLI 已经有 `find / add / check / update` 这样的 package-manager-like 管理动作 [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
- 到 `2026` 年，外部可观察 skill 的“封装对象”也已经相当具体，而不是抽象概念：
  - 可以封装技术写作与文档标准化 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md)
  - 可以封装 UX writing / microcopy / content audit [ref](./_reference/07-ux-writing-cross-host-compatibility-signal.md)
  - 可以封装多语言文档写作约束 [ref](./_reference/07-document-writing-multilingual-skill-scope.md)
  - 也可以封装带 evidence mapping、parallel subagents、citation verification 的深度研究工作流 [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md)
  - 甚至可以封装 deterministic retrieval routing 与特定搜索后端要求 [ref](./_reference/08-research-lookup-deterministic-routing-skill.md) [ref](./_reference/08-valyu-powered-search-skill-requirements.md)

## 本轮新增机制理解

- 现在最应该用的抽象，不是“skill 是个文件夹”，而是“skill 是一个三层工作流对象”：
  - 第 1 层是 `catalog metadata`，负责轻量发现
  - 第 2 层是 `instructions`，负责主流程
  - 第 3 层是 `resources`，负责按需下钻 [ref](./_reference/00-shared-agent-skills-integration-guide.md)
- 这解释了为什么 `progressive disclosure` 会成为整个体系的中心原则：
  - 没有这一层，skill 很容易退化成总是在线的巨型提示词
  - 有了这一层，skill 才能同时兼顾可复用性与上下文经济性 [ref](./_reference/00-shared-agent-skills-specification.md) [ref](./_reference/00-shared-agent-skills-best-practices.md)
- 这也解释了 skill 与周边对象的边界：
  - skill 主要封装“怎么做”
  - MCP 主要提供“能做什么”
  - rules / AGENTS / CLAUDE.md 主要提供“始终遵守什么”
  - subagents 主要提供“由谁在隔离上下文中执行” [ref](./_reference/00-shared-openai-docs-mcp-cross-host-support.md) [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md) [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
- 换句话说，skill 今天能分装的东西，已经清楚覆盖三类：
  - 规则化工作流和检查清单
  - 大量参考材料与例子
  - 工具 / 检索 / 子代理的调用协议
  这也是它和“长 prompt”最本质的区别。
- 所谓“跨宿主兼容”，更合理的理解是分层兼容：
  - `format` 兼容最强
  - `discovery / install` 次之
  - `runtime behavior` 最弱 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-cursor-skills-introduction-2026.md) [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md)

## 本轮新增趋势与难点

- `2026` 的最明显趋势之一，是 skills 正从“文件格式”走向“生态对象”：
  - registry、leaderboard、install telemetry、CLI lifecycle 已经出现 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](./_reference/00-shared-skills-sh-ecosystem-usage-signals.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
- 另一个明显趋势，是 host 都在把 skill 嵌进更大的 agent stack：
  - Claude 把 skill 放进 plugin / agent / hook / MCP 体系 [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md)
  - Codex 把 skill 和 AGENTS / MCP / Plugins / Subagents 并列为一等配置面 [ref](./_reference/00-shared-codex-skills-repo-and-product-surface.md)
  - Cursor 把 skill 和 subagents 一起推出，并继续往 plugin bundle 方向走 [ref](./_reference/00-shared-cursor-skills-introduction-2026.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
  - OpenCode 则直接把 skill、rules、instructions、agents、permissions 组合在一起 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
- 难点也已经很清楚：
  - description 写得差，skill 可能根本不会被正确发现 [ref](./_reference/00-shared-agent-skills-description-optimization.md)
  - skill 体积大、references 不外置，会直接压垮上下文经济 [ref](./_reference/00-shared-agent-skills-best-practices.md)
  - registry 有审计语言，但不会替你保证每个 skill 都安全或高质量 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md)

## 本轮新增维护 / 版本管理 / 模型要求

- skill 到 `2026` 年已经明显长出生命周期管理面：
  - registry 分发
  - CLI 安装
  - `check` / `update`
  - telemetry-driven 排名 [ref](./_reference/00-shared-skills-cli-management-and-updates.md) [ref](./_reference/00-shared-skills-sh-ecosystem-usage-signals.md)
- 但版本管理目前仍然是分层的：
  - spec 管的是 skill 长什么样
  - registry / CLI 管的是怎么发现和更新
  - 真正的 runtime compatibility 仍然要看 host [ref](./_reference/00-shared-agent-skills-specification.md) [ref](./_reference/00-shared-agent-skills-integration-guide.md)
- 模型要求不是 spec 层硬编码出来的，而是运行层决定的：
  - spec 本身不规定模型
  - 但高阶 skill 的效果会明显受上下文窗口、reasoning effort、工具权限和 subagent 能力影响 [ref](./_reference/00-shared-codex-model-requirements-and-context-windows.md) [ref](./_reference/00-shared-opencode-agents-and-permissions.md)
- 因此更合理的说法是：
  - `skill format` 对模型要求弱
  - `skill usefulness` 对模型和宿主要求强

## 当前判断（本轮综合后）

- 截至 `2026-04-12`，`skills` 已经有公开规范，这个判断是成立的；但规范主要统一的是格式和加载原则，而不是整个运行时世界 [ref](./_reference/00-shared-agent-skills-specification.md) [ref](./_reference/00-shared-agent-skills-integration-guide.md)
- “skill 是更长的 prompt”这个理解已经不够用了。更准确的理解是：skill 是一个以 `SKILL.md` 为入口、以渐进式披露为核心、以 references / scripts 为延伸的可复用工作流包 [ref](./_reference/00-shared-agent-skills-overview.md) [ref](./_reference/00-shared-agent-skills-best-practices.md)
- 从当前 registry 和样例看，skill 已经能稳定承载写作、文档规范、检索、深度研究编排、工具调用协议这些不同类型的工作对象；它的上限早就超过“长一点的提示词” [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md) [ref](./_reference/08-research-lookup-deterministic-routing-skill.md)
- 到 `2026` 年，skills 正在从“能不能写”转向“怎么分发、怎么维护、怎么更新、怎么和宿主协同”这个阶段，这也是为什么 registry、CLI、telemetry、host-native extension stack 开始变得重要 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
- 真正的跨宿主复用是分层成立的：格式和元数据层最容易共享；发现、安装、生命周期层次之；真正依赖宿主 rules / plugins / MCP / subagents / permissions 的部分最难完全等价迁移 [ref](./_reference/00-shared-opencode-skills-and-rules-compatibility.md) [ref](./_reference/00-shared-claude-code-skills-roles-and-plugin-architecture.md) [ref](./_reference/00-shared-cursor-plugin-bundling-and-early-friction.md)
