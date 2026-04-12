# AI Coding Skills 工程实战 Playbook

> 面向 AI Coding Engineer 的 2026 年 Skills 生态实战指南
>
> 从"看到 skills 到处都是但不知道怎么选"，到"能根据工作流选 host、评估可移植性、跨 host 高效工作"。

---

## 1. 为什么 2026 年需要这份 Playbook

2026 年，AI Coding Skills 已经不是新鲜事了。Claude Code、Codex、Cursor、OpenCode 都支持 skills，GitHub 上的 skill 仓库越来越多，`agentskills.io` 甚至发布了公开规范。

但大多数 AI Coding Engineer 仍然卡在同一个地方：

- **选 host 困惑**：四个主流 host 都说自己支持 skills，到底选哪个？
- **可移植性误解**：以为 `SKILL.md` 格式通用就能直接复用，结果换个 host 就跑不起来
- **复用风险盲区**：GitHub 上找到一个 skill，装上了，但不知道它有没有 stale assumptions（过时假设）
- **跨 host 无方法**：团队里有人用 Claude Code，有人用 Cursor，不知道怎么让 skills 协同工作

这份 Playbook 不是一份技术规范文档，也不是一份学术研究报告。它是一份**实战工程指南**，目标是帮你建立一个清晰的心智模型：

- Skills 到底是什么（不是"更长的 prompt"）
- 四大 Host 各自的 runtime contract（运行时契约）有什么本质差异
- 可移植性为什么不是 yes/no 问题，而是分层的
- 跨 host 工作时，什么时候该 sync、translate、delegate
- 什么能直接复用，什么需要改造，什么不能碰

**2026 年最重要的一个认知转变**：问题不再是"哪个 host 有 skills"，而是"哪个 host 的 runtime contract 足够明确，能支撑我的工作流"。

---

## 2. Skills 的 3-Layer 生态模型

要理解 2026 年的 skills 生态，需要先建立一个分层心智模型。Skills 不是一个单一的东西，而是一个 **3-layer ecosystem（三层生态系统）**：

### Layer 1: Spec Layer（规范层）

这是所有 host 共享的基础。`agentskills.io` 发布的公开规范定义了：

- **SKILL.md**：每个 skill 的核心文件，包含 YAML frontmatter（前言元数据）和 Markdown 主体
- **目录结构**：一个 skill 目录至少包含一个 `SKILL.md`，可选 `references/`、`scripts/`、`assets/`
- **Frontmatter 字段**：`name` 和 `description` 是必填，`license`、`compatibility`、`metadata`、`allowed-tools` 是可选
- **Progressive Disclosure（渐进式披露）**：启动时只加载 `name` 和 `description`，激活后加载完整 `SKILL.md`，需要时才加载脚本和参考材料

渐进式披露不是可选的优化，而是 skill 能同时做到"强约束"和"低 token 常驻成本"的关键设计原则。

### Layer 2: Shared Convention Layer（共享约定层）

这是跨 host 的实践约定，不是规范强制的，但已经被广泛采用：

- **目录约定**：`.agents/skills/` 已成为跨 host 共享 skill 的常见路径
- **Registry / CLI Lifecycle**：`skills` CLI 提供 `find/add/check/update` 等生命周期管理
- **Telemetry Signals（遥测信号）**：registry 和 CLI 已经开始提供安装量、更新频率等信号

### Layer 3: Host Runtime Layer（宿主运行时层）

这是差异最大的一层，也是决定 skill 能否真正"跑起来"的关键：

- **Persistent Guidance（持久化指令）**：Claude Code 用 `CLAUDE.md`，Codex 用 `AGENTS.md`，Cursor 用 Project Rules，OpenCode 同时支持 `AGENTS.md` 和 `CLAUDE.md`
- **Runtime Composition（运行时组合）**：subagents（子代理）、hooks（钩子）、plugins（插件）、MCP wiring（MCP 接线）
- **Permissions / Sandbox（权限/沙箱）**：approval modes（审批模式）、protected paths（受保护路径）、tool availability（工具可用性）
- **Execution Topology（执行拓扑）**：local、worktree、cloud、SSH、self-hosted

**关键洞察**：format portability（格式可移植性）在 Layer 1 已经基本解决，但 runtime portability（运行时可移植性）仍然是一个 host-by-host 的问题。一个 skill 能 install 不代表它能 run。

---

## 3. 四大 Host 的 Runtime Contract

这是整份 Playbook 的核心章节。选 host 不是选"谁支持 skills"，而是选"谁的 runtime contract 最适合你的工作流"。

### Claude Code：最强 Workflow Composition

**核心优势**：Claude Code 拥有当前最成熟的 workflow composition（工作流组合）能力。

- **Composition Stack**：`skill + hook + subagent + MCP + plugin` 五层组合，是目前最完整的
- **Plugin Marketplace**：有 semver 版本管理、local override、orphan cleanup
- **Permission Model**：permission-gated `WebSearch / WebFetch`，background subagent approval envelope
- **Persistence**：`CLAUDE.md` 支持 directory scope，import patterns，auto-memory

**适合场景**：
- 需要高复杂度 workflow composition 的团队
- Skills 会演化成 `skill + hook + subagent + MCP + plugin` 组合栈的场景
- 对 workflow maturity（工作流成熟度）要求高于对 simplicity 要求的场景

**主要风险**：operationally heavier at scale（规模化时运维更重）。一旦 composition 开始，valuable workflows 往往不再是"pure skill only"，而是变成了需要维护的 stack。

### Codex：最强 Engineered Clarity

**核心优势**：Codex 在 runtime governance（运行时治理）方面的工程化程度最高。

- **Constraint Visibility**：approvals、sandbox、web_search、subagent inheritance 都有明确的配置和文档
- **Scope Governance**：repo/user/admin/system 四层 scope，explicit disable controls
- **Model Transparency**：reasoning effort、context windows、snapshots、custom agent model config 都可见可配
- **AGENTS.md Chain**：layered instruction chain with overrides and size caps

**适合场景**：
- 需要 explicit runtime governance 的工程团队
- Model、reasoning、approval、sandbox、search controls 必须可见可配的场景
- 偏好 CLI-oriented 工作方式的工程师

**主要风险**：advanced workflows quickly become costlier and more runtime-dependent（高级工作流成本上升快）。

### Cursor：最强 IDE-Native Layering

**核心优势**：Cursor 在 IDE-native 体验和 multi-environment expansion 方面走得最远。

- **Dynamic Layering**：Project Rules + User Rules + `AGENTS.md` + Skills + Subagents，IDE 内分层最丰富
- **Execution Topology**：local、CLI、worktree、cloud、SSH、self-hosted，扩展最广
- **Plugin Bundles**：正在向 marketplace plugin bundles（skills/subagents/MCP/hooks/rules 打包）方向发展
- **Async Agents**：agents window、await tool、cloud runtime

**适合场景**：
- 重度 IDE 用户，workflow 受益于 in-editor context
- 需要 asynchronous agent execution 的场景
- 团队正在快速扩展 multi-environment agents 的场景

**主要风险**：runtime maturity uneven（运行时成熟度不均匀）。部分关键 subagent 行为隐藏在 server-side provisioning 和 Composer routing 中，至少有一个 2026 年的 duplicate-loading discovery bug 被记录。

### OpenCode：最强 Compatibility Bridge

**核心优势**：OpenCode 在 compatibility（兼容性）和 bridging（桥接）方面最强。

- **Path Compatibility**：同时支持 `.opencode`、`.claude`、`.agents` 路径，permissive frontmatter parsing
- **Explicit Bridge**：skills + rules + agents + permissions + providers 之间有明确的桥接机制
- **Provider Flexibility**：widest provider / local-model flexibility，支持多种 model provider
- **Constraint Model**：provider-gated `websearch`、documented tool defaults、plugin load order、compaction hooks

**适合场景**：
- 需要跨 host 兼容性和桥接的团队
- 正在测试 skill 能否跨 host 适配的实验场景
- 偏好 explicit tool/provider control 的工程师

**主要风险**：high configuration freedom increases drift and debugging complexity（高配置自由度增加漂移和调试复杂度）。

### Host 选择决策框架

不要试图找"最好的 host"。根据你的实际需求选择：

| 你的目标 | 推荐倾向 |
|---------|---------|
| 最高 workflow composition ceiling | Claude Code |
| Explicit runtime governance + model transparency | Codex |
| IDE-native layering + multi-environment expansion | Cursor |
| Compatibility / bridging / provider flexibility | OpenCode |
| Predictable explicit constraints | 选 runtime assumptions 有文档的 host，避免 hidden backend routing |

**一个实用的判断方法**：如果你的 skill 主要是 guidance + examples + references（指导 + 示例 + 参考材料），四个 host 都能跑。如果你的 skill 依赖 subagents + hooks + plugins，先确认目标 host 的 runtime contract 再动手。

---

## 4. 可移植性的真相：Layered Portability

"这个 skill 能不能跨 host 用？"——这是一个错误的问题。正确的问题是："这个 skill 的哪些层能跨 host，哪些层不能？"

### 7 层可移植性框架

| 层级 | 名称 | 可移植性 | 说明 |
|-----|------|---------|------|
| 1 | File Format | 最强 | SKILL.md + frontmatter + references/scripts，公开规范支持 |
| 2 | Discovery / Install | 中等 | `.agents/skills/` 约定 + registry/CLI，但 host 路径有差异 |
| 3 | Workflow-Method | 中等 | 流程步骤、checklist、style guide、references，大部分 writing skills 在这层 |
| 4 | Execution-Topology | 弱 | worktrees、cloud execution、SSH、background waits，host 差异大 |
| 5 | Runtime-Orchestration | 弱 | subagents、hooks、plugin bundles、AGENTS/rules semantics、permissions |
| 6 | Tool-Surface / Backend-Policy | 弱 | websearch 可用性、task/subagent provisioning、backend routing |
| 6.5 | Runtime-Assumption | 弱 | skill 文本中的 stale call shapes、host-specific subagent names、过时的 year/model markers |
| 7 | External Dependency | 最弱 | API keys、env vars、local runtimes、provider-specific model behavior |

### 实战 Breakpoint Rules（断点规则）

这些规则帮你快速判断一个 skill 的可移植性：

1. **如果 skill 主要是 rules + examples + references**：先试直接复用
2. **如果需要满足多个 native skill directories**：先声明 canonical source（权威源），自动化 mirror sync，不要等 drift 积累
3. **如果 host 扫描多个 tool directories**：先验证 deduplication（去重）和 precedence（优先级）行为
4. **如果 skill 依赖 subagents + hooks + plugins**：只假设 partial portability（部分可移植）
5. **如果 skill 依赖特定 execution topology**（worktrees、cloud agents、background waits）：先测试这一层
6. **如果 skill 依赖 search / task / subagent tools**：先验证 tool availability 和 backend policy
7. **如果 skill 携带另一个 host 的 tool names 或 subagent labels**：这是 translation work（翻译工作），不是 copy work
8. **如果 skill 文本硬编码了 host call shapes、stale years、model/provider names**：installable but not yet trustworthy（能装但不能信）
9. **如果 skill 依赖 external APIs + env vars + shell permissions**：这是 integration project（集成项目），不是 copy operation

### 三大跨 Host 工作模式

当直接复用不够时，2026 年有三种 evidence-backed（有证据支持的）跨 host 工作模式：

**模式 1: Sync（同步）**

适用场景：多个 host 需要使用同一个 skill，但各自有不同的 native directory。

做法：
- 选择一个 canonical source（权威源）
- 用 `skills-sync` CLI 或 hook 自动化 mirror sync
- 用 `skills.yaml` 配置 wildcards 和 exclusions 控制同步范围
- 关键：在 drift 积累之前就开始 sync，不要事后补救

**模式 2: Translate（翻译）**

适用场景：skill 的方法论可以复用，但 call shape（调用形式）需要适配目标 host。

做法：
- 翻译 tool names（例如 Claude Code 的 `WebFetch` → Codex 的对应工具）
- 翻译 subagent labels 和 plan semantics
- 保留方法论，重写 host-specific shell
- 关键：翻译 call shape，不是翻译 method

**模式 3: Delegate（委托）**

适用场景：skill 的核心价值明确属于某个 host，强行在另一个 host 模拟不如直接调用。

做法：
- 将另一个 host 的 CLI 作为 worker 调用
- 用 plugin delegation 包装跨 host 调用
- 关键：这是 delegated portability（委托式可移植性），不是 native portability

### 一个关键警告

**Install spread ≠ semantic portability（安装扩散 ≠ 语义可移植性）**。

一个 skill 能在 4 个 host 上 install，不代表它能在 4 个 host 上正确运行。最常见的陷阱是 runtime-assumption drift（运行时假设漂移）：skill 文本中硬编码了某个 host 的 call shapes、tool names、year markers，换个 host 后这些假设就失效了。

---

## 5. 两大应用线：Writing Skills vs Deep Research Skills

理解了 3-layer 模型和可移植性框架之后，来看两个最有代表性的应用线。它们分别代表了可移植性光谱的两端。

### Writing Skills：高可移植性的典范

Writing skills 是 2026 年最适合"先找现成的，装起来，读懂，边用边改"的 skill 类型。

**为什么可移植性高**：
- 大部分 writing skills 停留在 Layer 3（Workflow-Method），主要封装 rules、checklists、examples、style contracts、doc-type templates
- 不依赖 host-specific subagents 或 execution topology
- 核心价值在方法论，不在 runtime

**2026 年 writing skills 的主要子类**：
- Technical writing / documentation standardization（技术写作/文档标准化）
- API documentation（API 文档）
- Structured engineering docs: ADR/RFC/design-doc/KB（结构化工程文档）
- Documentation as a product / documentation systems（文档即产品）
- Content marketing / brand voice（内容营销/品牌语气）
- Proofreading / style enforcement（校对/风格强制）
- UX writing / cross-host compatibility（UX 写作/跨 host 兼容）
- Multilingual document writing（多语言文档写作）

**如何评估一个现成 writing skill**：
1. 它解决的是风格问题、文档标准问题，还是内容流水线问题？
2. 它是不是只是一个长 prompt？（如果是，价值有限）
3. 它有没有把大块样例、品牌指南、术语表外置到 `references/`？
4. 它是不是依赖 host 专属能力（hooks、rules、plugins）？

**最小改造路径**：
- 可以直接复用：style rules、checklists、output templates
- 只需替换 reference 文件：品牌指南、术语表、样例库
- 必须跟着 host 改：hooks、settings、rules 联动部分

### Deep Research Skills：可移植性的压力测试

Deep research skills 是可移植性框架的最佳压力测试。它们暴露了 Layer 4-7 的所有 breakpoints。

**为什么可移植性低**：
- 依赖 tool availability（websearch、task、subagent tools）
- 依赖 permissions（approval modes、sandbox policy）
- 依赖 parallel execution（subagent 并发）
- 依赖 evidence discipline（验证、去重、引用控制）
- 这些全部是 host-specific 的

**2026 年 deep research skills 的分类**：
- 基础流程型：问题澄清 → 分解 → 搜集 → 评估 → 综合
- Orchestration 型：evidence table + parallel subagents + citation verification + multi-pass drafting
- Staged autonomous agent 型：显式拆出 planner、source evaluator、report generator
- Deterministic routing 型：按 use case 在通用研究和学术检索后端之间切换
- Tool-heavy domain search 型：依赖特定 API（如 Valyu）和显式运行前提
- Academic literature synthesis 型：围绕论文阅读、对话与综合
- Market intelligence 型：竞品、广告库、定位与信息抽取
- Knowledge-base research ops 型：在 Notion/知识库中检索、综合并生成结构化文档

**一个关键判断**："能搜"不等于"能做 deep research"。真正有价值的 deep research skill 不仅负责搜，还负责拆题、并发、验证、汇总和约束风险。

**跨 host 适配的现实**：
- 方法论（research discipline）可以作为 method 移植
- 但 tool routing 往往需要 translation
- 如果 skill 硬编码了某个 host 的 subagent type names 或 call shapes，需要重写
- Writing skills 是默认的"learn-by-reuse"入口；deep research skills 是比较 host 能力的最佳压力测试

---

## 6. Baseline 工作流

### Host 选择决策树

```
你的 skill 主要是什么？
│
├─ guidance + examples + references（指导型）
│  └─ 四个 host 都能跑，选你最熟悉的
│
├─ 需要 subagents + hooks + plugins（组合型）
│  ├─ 需要最高 composition ceiling → Claude Code
│  ├─ 需要 explicit runtime governance → Codex
│  ├─ 需要 IDE-native + async agents → Cursor
│  └─ 需要 compatibility bridge → OpenCode
│
└─ 需要跨 host 工作
   ├─ 多 host 用同一个 skill → Sync 模式
   ├─ 方法论可复用但 call shape 不同 → Translate 模式
   └─ 核心价值属于某个 host → Delegate 模式
```

### Skill 发现与评估 Checklist

拿到一个现成 skill 时，按这个顺序评估：

1. **Format check**：有没有标准的 `SKILL.md` + frontmatter？
2. **Method check**：核心方法论是什么？是不是只是一个长 prompt？
3. **Dependency check**：依赖哪些 host-specific 能力？（subagents、hooks、plugins、specific tools）
4. **Assumption check**：有没有 stale assumptions？（过时的 call shapes、year markers、model names）
5. **Portability check**：按 7 层框架评估，哪些层能移植，哪些层不能？

### Authoring Hygiene（编写卫生）

如果你在写 skill，遵循这些原则可以最大化跨 host 可复用性：

- **保持 format portability 容易**：minimal metadata、clear description、标准 frontmatter
- **将 fragile/deterministic steps 推入 scripts/resources**：不要把容易变化的逻辑写在 SKILL.md 主体里
- **将 runtime assumptions 视为 host-specific shells**：明确标注哪些部分是 host-specific 的
- **不要硬编码 tool names**：用通用描述，让 host 自己映射
- **不要假设 tool 可用性**：websearch、task、subagent 在不同 host 有不同的 availability 和 permission gates

---

## 7. 护栏与陷阱

### 五大警告信号

**警告 1："它到处都能装"**

现实：install spread 不是 semantic portability 的证明。一个 skill 能在 4 个 host 上 install，可能只是因为 Layer 1（format）兼容，Layer 5-7 完全不兼容。

**警告 2："格式是共享的，所以 runtime 应该差不多"**

现实：execution topology、permissions、search tools、backend policy 在不同 host 之间差异巨大。格式共享只解决了最表层的问题。

**警告 3："跨 host 扫描会让复用更容易"**

现实：没有 dedup / precedence rules 的跨 host 扫描会导致 context waste（上下文浪费）和 version confusion（版本混乱）。Cursor 在 2026 年就有一个 duplicate-loading discovery bug。

**警告 4："Research skills 就是更好的 search skills"**

现实：真正有价值的 research skills 编码了 decomposition（分解）、validation（验证）、evidence discipline（证据纪律）和 output control（输出控制），不只是搜索。

**警告 5："Host 升级不会影响我的 skill"**

现实：host 升级可能改变 tool availability、subagent behavior、backend routing，从而改写 skill 的可靠性。Cursor 的 task tool issues 就持续到了 2.5 版本。Maintenance 现在是 stack maintenance，不是 file maintenance。

### 不要做的事

- 不要假设所有 host 都有 `websearch`——它在不同 host 有不同的 permission gates
- 不要假设 subagents 在所有 host 上行为一致——inheritance behavior 差异大
- 不要盲目复制 GitHub 上的 skill——先检查 stale assumptions
- 不要在没有 dedup rules 的情况下启用跨 host scanning
- 不要把"能 install"当成"能 run"的证据

---

## 8. 下一步与 Open Issues

### 练习路径：从单 Host 到跨 Host

**第一步：单 Host 熟练**
- 选一个 host，装几个 writing skills，跑起来
- 读懂 skill 的结构：frontmatter、progressive disclosure、references
- 理解你选的 host 的 runtime contract：permissions、tools、subagents

**第二步：评估可移植性**
- 拿一个你熟悉的 skill，用 7 层框架评估它的可移植性
- 找到它的 breakpoints：哪一层开始不能直接复用？
- 尝试在另一个 host 上运行，观察实际差异

**第三步：跨 Host 工作**
- 根据实际需求选择 Sync / Translate / Delegate 模式
- 建立 canonical source + mirror sync 机制
- 记录你遇到的 runtime-assumption drift，形成团队知识

**第四步：编写自己的 Skill**
- 从改造现有 skill 开始，不要从零写
- 遵循 authoring hygiene 原则
- 把 host-specific 部分隔离到 scripts/resources

### Open Issues（未解决问题）

以下问题在 2026 年 4 月仍然没有完整答案：

1. **官方迁移契约缺失**：目前没有任何 host 提供官方的 cross-host migration contract。跨 host 互操作主要依赖社区实践证据（sync/translate/delegate），而不是官方契约。当官方 docs 或 release notes 开始明确跨 host 迁移与互通契约时，这个问题才会真正解决。

2. **Repair-oriented failure cases 不足**：目前有 duplicate-loading 故障和 drift/constraint 故障的记录，但缺少更多带有 before/after remediation steps（修复前后对比步骤）的案例。

3. **Writing skills 的 maintenance/versioning**：对于结合 lint/hooks/pipelines 的 writing skills，跨 host 的 maintenance 和 versioning 案例仍然偏少。

4. **Hidden backend constraints**：部分 host（特别是 Cursor）的 server-side provisioning 和 backend routing 行为不完全透明，这会影响 skill 的实际运行结果。

### 如何持续学习

- **关注 host 的 changelog**：每次 host 升级都可能改变 runtime contract
- **关注 `agentskills.io`**：规范在持续演进
- **关注社区实践**：sync/translate/delegate 模式的最佳实践在不断积累
- **用 deep research skills 做压力测试**：它们是检验 host 能力差异的最佳工具

---

> 附录导航：
> - [附录 A：Host Capability Matrix](./附录A-Host-Capability-Matrix.md) — 四大 Host 能力对比详表
> - [附录 B：Portability Playbook](./附录B-Portability-Playbook.md) — 可移植性分层详解与实战案例
> - [附录 C：Evidence Traceability Map](./附录C-Evidence-Traceability-Map.md) — 核心判断的证据溯源
