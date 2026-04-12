# Skill Host Skills Deep Research Progressive Plan Round 1

> 执行状态（动态更新）：见 `/Users/bowhead/ai_dev_skill/SKILL_HOST/plan/skill-host-skills-deep-research-progressive-plan-round-1.status.md`

- `template_version`：`v5`
- `round_label`：`一轮`
- `seed_dir`：`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics`
- `reference_dir`：`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference`
- `artifact_dir`：`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_artifacts`
- `plan_path`：`/Users/bowhead/ai_dev_skill/SKILL_HOST/plan/skill-host-skills-deep-research-progressive-plan-round-1.md`
- `status_path`：`/Users/bowhead/ai_dev_skill/SKILL_HOST/plan/skill-host-skills-deep-research-progressive-plan-round-1.status.md`
- `topic_count`：`8`
- `main_task_kind`：`补现态事实 + 补趋势 + 补机制 + 补维护/版本管理 + 补限制`
- `date_scope_default`：`只接受 2026-01-01 及之后的来源作为本轮主证据`
- `migration_note`：`2026-04-12 从 v4 plan skeleton 升级到 v5 协议；不重置已完成 wave 与现有落库，status 文件继续作为执行真相来源`

## 调研的根本目的

这轮 Deep Research 不是为了产出调研笔记本身。

真正的目的是：为后续围绕 `skills` 的最终内容产出建立一套可持续复用的本地 ground truth 地基。这套地基必须能支撑后续写出面向 AI Coding 实践者的、既能解释技能是什么，也能解释怎么找、怎么装、怎么借力、怎么判断宿主差异、怎么理解趋势与限制的高质量内容。

最终产出的读者是：

- 已经做过一段时间 AI Coding，但仍然对 `skills` 的发现、选择、安装、复用、迁移、改造和宿主差异感到混乱的人
- 后续可能继续接手、扩写或重组这批研究材料的 AI 代理或人工研究者

这份最终产出至少要满足下面要求：

- 系统性：覆盖规范、生态、宿主、维护、版本管理、模型要求、限制与趋势
- 逻辑性：每个判断都有证据支撑，且能回到本地 reference
- 一致性：跨 topic 口径统一，不把 `skill`、`rules`、`plugin`、`MCP`、`subagent` 混为一谈
- 现态性：主证据必须反映 `2026` 年当下，而不是停留在早期试验期印象
- 可复用：研究结果要能继续喂给后续 topic-level deep research、比较分析和最终 playbook 生成

因此，每一个进入 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference` 的文档、每一条写入 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics` 的判断，都必须问自己：

> 这条内容能直接支撑“skills 在 2026 年的现态、趋势、限制、维护与宿主适配”中的哪个论点？如果不能，它就不该存在。

权威信源优先规则（最高优先级，不可违反）：

> 当官方文档、官方仓库、官方 marketplace / registry、官方 release notes、规范文档、权威实现说明已经足以支撑某个判断时，不为满足配额额外引入低质量二手来源。配额是防止搜太浅的下限，不是凑数目标。

## 先反省：当前版本为什么还不够

### 1. 现有 topic 只是研究线定义，不是现态证据包

`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics` 里的 8 份文档已经把研究边界大体切开了，但它们现在主要还是“研究任务说明”。它们还没有被 2026 年的最新材料填实，也还没有形成足够密的本地证据回指。

### 2. “skills 正在蓬勃发展”这个判断还没有被现态趋势证据系统支撑

目前我们只有方向判断，还缺少足够新的官方更新、仓库活动、生态平台、市场入口、宿主支持演化、案例增殖等材料来把“增长”“成熟”“分化”这些趋势讲清楚。

### 3. 生命周期维度明显偏弱

关于 `skills` 的开发、安装、改造、维护、更新、版本管理、兼容性漂移、宿主迁移、失效模式，这些真正决定实践成本的维度，目前还没有被系统抽出来。

### 4. 宿主与模型要求的关系还没有被单独拉直

不同 coding agent 到底如何支持 `skills`，它们对模型能力、上下文长度、工具调用、联网检索、子代理、权限模型有什么要求，这些问题还没有形成统一评估框架。

### 5. “规范层 vs 实现层 vs 宿主私有扩展层”的关系还没有被当前 topics 彻底打透

尤其是 `Agent Skills` 规范、共享目录 convention、宿主自有 rules / plugins / marketplace / permissions / subagents 之间的边界，如果不在这轮打实，后续所有比较和判断都会漂。

## 目标

针对 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics` 中的 `8` 条研究线，各做一轮更深入的 Deep Research。

这一轮不是重复已有摘要，而是要系统扩大：

- 内容广度
- 证据密度
- 根本机制理解
- 2026 年现态趋势判断
- 开发 / 安装 / 适配 / 维护 / 更新 / 版本管理理解
- 宿主配合模式
- 对模型能力的要求
- 局限、失败模式与争议

同时，把搜到的高价值材料沉淀到：

- `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference`

这些材料要作为后续分析的 ground truth，而不是临时浏览痕迹。

## 本轮的硬性时间范围

默认只接受 `2026-01-01` 及之后发布、更新、提交、上线或有明确现态信号的来源，作为本轮主证据。

允许的极少数例外只有两类：

1. `规范 / 协议 / 官方定义` 类基础文档
2. `仍被 2026 年官方材料直接引用、且当前仍然有效` 的历史起点文档

例外规则：

- 这类材料必须在 reference 中显式标记为 `canonical_exception`
- 它们只能用于解释地基和定义，不能用来证明 `2026` 趋势
- 任何趋势判断、生态判断、宿主现态判断，仍然必须回到 `2026+` 证据

## 手段策略

本轮研究采用“先建地基，再分题深挖，再横向综合，最后检验最终产出可用性”的递进策略。

具体分为三个波次（Wave 0 → Wave 1 → Wave 2），加一个最终验收检查点（Readiness Check）。

每个波次都有明确的最低标准，不满足则不进入下一波次。

## 本轮参数

- `WAVE0_SHARED_DOC_FLOOR = 20`
- `WAVE1_DOC_FLOOR_PER_TOPIC = 10`
- `PRIMARY_SOURCE_FLOOR = 5`
- `SECONDARY_SOURCE_FLOOR = 2`
- `RECENT_SOURCE_FLOOR = 3`
- `LIMITATION_SOURCE_FLOOR = 2`

参数说明：

- 默认模板建议的 `WAVE0_SHARED_DOC_FLOOR` 是 `16`，这轮提高到 `20`，因为本轮共有 `8` 条研究线，而且规范、官方宿主文档、registry / marketplace、模型要求、版本管理、限制与安全这些共享地基明显比普通主题更厚。
- `WAVE1_DOC_FLOOR_PER_TOPIC` 从默认 `8` 提到 `10`，因为每条线都必须覆盖现态、趋势、维护与限制，不可能只靠少量材料支撑。
- `RECENT_SOURCE_FLOOR` 提到 `3`，因为你明确要求“老内容没用”，本轮必须让每条线都至少有三份 `2026+` 的近期材料来支撑趋势判断。
- `LIMITATION_SOURCE_FLOOR` 提到 `2`，因为这轮不能只研究“怎么用”，还要系统补限制、失败模式、维护代价和版本漂移。

## 验收标准：如何判断调研结果质量合理

调研完成的判断不依赖“感觉搜够了”，而是对照下面 5 个维度逐项检查：

### 1. 证据可追溯性

- 每个关键判断都能回指到 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference` 中的具体文档
- 没有悬空结论
- 没有只存在于聊天上下文中的重要来源

### 2. 覆盖完整性

- 每条研究线的固定问题都已有证据支撑
- 趋势、版本管理、维护、模型要求、限制五类内容各有专门证据
- 已完成至少一轮“官方说法 vs 第三方验证 / 实践证据 / 失败案例”交叉核验

### 3. 现态有效性

- 主证据默认来自 `2026-01-01` 及之后
- 少数历史规范材料都已被明确标注为 `canonical_exception`
- 不存在用旧材料直接替代 2026 趋势判断的情况

### 4. 跨主题一致性

- 同一概念在不同研究线下定义口径一致
- 相同对象的优缺点、限制、适配条件没有自相矛盾
- 已明确区分“硬事实”“分析判断”“趋势推测”

### 5. 最终产出可用性（最终验收）

执行完成后，必须能通过以下检查：

- 任意一个重要判断都能在 `30` 秒内找到本地支撑文档
- 对每条研究线都能写出一段“机制 + 趋势 + 维护 / 版本管理 + 模型要求 + 难点”的连贯叙述
- 跨研究线能写出一段“skills 在 2026 年究竟发展到哪一步”的整体判断，而不只是平行描述
- 一位没有参与调研的专业人士，只看 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics + /Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference + /Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_artifacts`，能理解研究结论并继续往下走

如果以上任一条不满足，调研不算完成。

## 输入

本轮研究直接以 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics` 为起点。

输入对象包括：

- 目录中的 `8` 份 topic seed 文件
- topic 中已经写出的边界、问题清单、must-cover 方向
- 相关官方规范、官方仓库、host docs、marketplace / registry、release notes、repo activity、issue / discussion / changelog、实践复盘与失败分析

## 输入对象建模

在正式执行前，必须先把输入目录建模成“研究线注册表”。

每条研究线至少要写清楚：

- 编号
- slug
- 主题标题
- 对应 seed 文件
- 当前假设或当前缺口
- 为什么它值得继续深挖
- 本轮必须回答的问题

### Topic Registry

- `01` / `skill-foundations-and-common-model` / `Skill Foundations, Spec, and Common Model`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/01-skill-foundations-and-common-model.md`
  - `current_hypothesis:` `skill` 已经有公开规范，但“规范层、共享约定层、宿主扩展层”仍被大量材料混写；2026 年的研究必须先把这三层拉开。
  - `why_it_matters:` 如果这一层不稳，后面关于迁移、比较、生态增长、维护与模型要求的判断都会失真。
  - `must_answer:`
    - `Agent Skills` 规范在 2026 年到底规定了什么、没规定什么
    - `SKILL.md`、frontmatter、目录结构、渐进式披露的当前规范状态是什么
    - 共享 convention 与 host-specific implementation 的边界在哪里
    - skill 与 rules / plugins / MCP / subagents 在 2026 年语义上如何区分

- `02` / `claude-code-skills-deep-dive` / `Claude Code Skills Deep Dive`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/02-claude-code-skills-deep-dive.md`
  - `current_hypothesis:` Claude Code 是目前最成熟、案例最密集、最容易长出高阶 skills 方法论的宿主之一，但其很多高阶能力已经不再只是“纯 skill”。
  - `why_it_matters:` Claude 可能代表了高成熟度 `skills` 生态的样子，也最容易提供研究型和写作型的强案例。
  - `must_answer:`
    - 2026 年 Claude Code 对 skills 的官方支持边界是什么
    - marketplace / plugin / hooks / settings / project docs 如何和 skills 协作
    - 安装、更新、维护、版本漂移、失效模式是什么
    - Claude 上 skills 对模型能力、工具权限、上下文与子代理的要求是什么

- `03` / `codex-cli-skills-deep-dive` / `Codex CLI Skills Deep Dive`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/03-codex-cli-skills-deep-dive.md`
  - `current_hypothesis:` Codex CLI 更偏工程化、层级治理和命令式安装，适合研究 skill 作为工作流组件如何进入 CLI 工程环境。
  - `why_it_matters:` Codex 可能代表“skills 与 CLI / repo / admin scope / bundled skills”如何结合的典型路径。
  - `must_answer:`
    - 2026 年 Codex 对 skills 的作用域、发现机制、官方内置能力、安装器支持是什么
    - skills 在 Codex 中的开发、维护、更新、共享与版本管理如何进行
    - Codex 的 subagents 与 skill 之间的真实边界是什么
    - Codex 对模型能力、权限模型、上下文与工具链的要求是什么

- `04` / `cursor-skills-deep-dive` / `Cursor Skills Deep Dive`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/04-cursor-skills-deep-dive.md`
  - `current_hypothesis:` Cursor 的关键不只是支持 skills，而是它必须和 `.cursorrules`、IDE 工作流、异步子代理一起理解。
  - `why_it_matters:` Cursor 很可能是新手最容易混淆 rules 与 skills 的地方，也是 IDE-native skill 体验的重要样本。
  - `must_answer:`
    - 2026 年 Cursor 如何界定 `.cursorrules`、skills、plugins、subagents
    - skills 在 Cursor 里的发现、安装、更新、维护和共享路径是什么
    - IDE 内工作流对 writing / research 类 skills 带来了什么特殊优势或限制
    - Cursor 对模型选择、长上下文、异步代理和联网能力有什么要求

- `05` / `opencode-skills-deep-dive` / `OpenCode Skills Deep Dive`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/05-opencode-skills-deep-dive.md`
  - `current_hypothesis:` OpenCode 是最值得研究“兼容与桥接”的宿主，因为它显式承接多种路径、规则系统和插件扩展。
  - `why_it_matters:` 如果要判断跨宿主复用与迁移到底有没有现实空间，OpenCode 是关键样本。
  - `must_answer:`
    - 2026 年 OpenCode 对 skills 的目录发现、权限、插件、rules、subagents 支持到什么程度
    - OpenCode 如何处理兼容路径、迁移、安装、更新与维护
    - 哪些能力是真兼容，哪些只是格式兼容但运行语义不同
    - OpenCode 对模型、检索、代理并发和宿主配置的要求是什么

- `06` / `cross-host-comparison-and-interoperability` / `Cross-Host Comparison and Interoperability`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/06-cross-host-comparison-and-interoperability.md`
  - `current_hypothesis:` 四个宿主之间存在部分互通，但不是完全对称互通；真正共享的是部分格式与方法论，而不是完整执行能力。
  - `why_it_matters:` 这是最终回答“该选哪家”“能不能互相支持”“怎么借鉴别人的 skill”的关键。
  - `must_answer:`
    - 四家在规范对齐、扫描路径、安装方式、维护方式、版本管理、权限与模型要求上如何横向比较
    - 互通到底发生在哪一层：格式、目录、分发、方法论还是运行能力
    - 哪些宿主更适合个人、团队、企业治理、实验平台或内容流水线
    - 互操作的主要风险、失真点和迁移成本是什么

- `07` / `writing-skills-discovery-adaptation-and-host-support` / `Writing Skills Discovery, Adaptation, and Host Support`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/07-writing-skills-discovery-adaptation-and-host-support.md`
  - `current_hypothesis:` 对大多数实践者来说，更现实的路径不是从零造 writing skill，而是先找到现成 skill，装起来、读懂、替换 references，再逐步形成自己的写作方法论。
  - `why_it_matters:` 这条线直接服务于“怎么借力成长”，也最容易给读者实用入口。
  - `must_answer:`
    - 2026 年常见 writing skills 的主要类型、代表样例和最新生态入口是什么
    - 不同宿主为 writing skills 提供了哪些安装、挂载、校验、维护和改造支持
    - 拿到一个现成 writing skill 后，通常哪些部分可直接复用，哪些部分需要宿主适配
    - 这类 skill 对模型能力、上下文、风格保持、文档校验和工作流控制有什么要求

- `08` / `deep-research-skills-discovery-adaptation-and-host-support` / `Deep Research Skills Discovery, Adaptation, and Host Support`
  - `seed_files:` `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/08-deep-research-skills-discovery-adaptation-and-host-support.md`
  - `current_hypothesis:` 真正高价值的 deep research skill 不只是“会搜”，而是会拆题、调度、验证、去重、控制风险；而这类 skill 往往最依赖宿主特性。
  - `why_it_matters:` 这条线会直接揭示 skills 的上限，也会暴露不同宿主的真实承载差异。
  - `must_answer:`
    - 2026 年 deep research skills 的主流类型、代表实现与分化趋势是什么
    - 哪些只是 smart search，哪些已经进入研究编排、并发子代理、验证与引用控制
    - 不同宿主为这类 skill 提供了哪些特别支持，哪些地方会卡住
    - 这类 skill 对模型能力、工具权限、上下文、检索源、subagents 和停止条件有什么要求

只有研究线注册表稳定后，才允许进入 Wave 0。

## 输出

本轮执行后应至少形成下面 5 类资产：

### 1. Ground truth 参考材料

存放位置：

- `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference`

形式：

- 每个高价值来源单独存成一个 `md`
- 不追求全文镜像，但要求 `关键事实 + 核心内容摘录` 两节加起来足够自给自足，让接手者多数情况下不回原文也能继续推理
- 所有辛苦收集到、后续推理会反复用到的重要内容，都必须真正落进 `_reference`
- 所有进入最终推理链条的重要来源，都必须有自己独立的一份 `md`，不能只停留在 `_artifacts`、seed 文件或聊天上下文

### 2. 输入目录的持续生长

`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics` 不是只读输入，而是这轮研究的 living output。

每条研究线对应的 seed 文件都应被更新，新增：

- 本轮新增证据
- 本轮新增机制理解
- 本轮新增趋势与难点
- 本轮新增维护 / 版本管理 / 模型要求
- 当前判断

### 3. 过程性 artifacts

存放位置：

- `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_artifacts`

至少包括：

- 每条研究线一份 `evidence-summary`
- 每条研究线一份 `question-list`
- 一份横向综合 `W2-cross-topic-synthesis`
- 一份 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference/_INDEX.md`

### 4. 跨主题综合结论

最终需要能够横向回答：

- `skills` 的规范层、实现层和宿主扩展层如何分化
- `skills` 在 2026 年的主趋势是什么
- 哪些宿主更强，强在什么地方，代价是什么
- 版本管理、维护、兼容与模型要求如何影响实际采用
- 哪些对象值得继续追踪

### 5. 更新协议

每份被更新的 seed 文件都应遵循同样结构：

```md
## 历史摘要（保留，不修改）

## 本轮新增证据
<!-- 每条新增事实都带 _reference/*.md 回指 -->

## 本轮新增机制理解
<!-- 从描述上升到为什么这样设计 -->

## 本轮新增趋势与难点
<!-- 2026 证据支撑的趋势 + 真实难点与失败模式 -->

## 本轮新增维护 / 版本管理 / 模型要求
<!-- 生命周期、更新、兼容、宿主依赖、模型能力门槛 -->

## 当前判断（本轮综合后）
<!-- 综合历史内容与本轮新增后的判断，每条判断带本地回指 -->
```

规则：

- 历史摘要不删改，只保留
- 所有本轮新增内容进入固定章节
- 每条新增关键判断都必须带本地回指
- 如果某个判断被本轮推翻或修正，在“当前判断”中注明，不删除旧内容

## 本轮的统一分析视角

每条研究线在 Wave 1 都必须至少从下面 `8` 个视角展开，不允许只写功能罗列：

1. `定义与边界`：它研究的对象到底是什么，不是什么
2. `2026 现态`：现在官方和生态已经发展到哪一步
3. `趋势`：过去几个月的变化方向是什么
4. `开发 / 适配`：如果要使用、改造、借鉴或接入，需要做什么
5. `维护 / 更新 / 版本管理`：如何升级、漂移、兼容、失效
6. `宿主配合`：和 rules / plugins / marketplace / subagents / permissions / repo workflow 如何协作
7. `模型要求`：它需要什么模型能力、上下文能力、工具调用能力、联网能力
8. `限制 / 争议 / 失败模式`：哪里最容易出问题，社区有哪些分歧

## 总体策略

这轮 Deep Research 不建议在共享地基未稳定前，就把所有研究线完全割裂后并行暴力搜索。

更稳的做法是：

- 先共享地基
- 再分题深挖
- 再横向综合

### Wave 0：建立共同 ground truth 地基

- `purpose:` 固定共享地基、共同术语和高可信入口，避免各研究线各自从零开始。
- `focus:` 这一波不急着下结论，先把后续多条研究线都会反复用到的硬事实、官方入口、规范、宿主 docs、模型要求和生态入口固化到 `_reference`。

Wave 0 必须优先覆盖的共享对象：

- `Agent Skills` 规范与实现指南
- Claude / Codex / Cursor / OpenCode 的官方 skills docs
- 2026 年相关官方 release notes / changelog / repo activity / marketplace 或 registry 文档
- skills 的安装分发工具、registry、marketplace、包管理路径
- 版本管理与兼容性相关的官方说明、issue、讨论或实现文档
- 模型能力 / 工具权限 / subagent / sandbox / browsing 相关官方说明
- 至少一组关于限制、风险、安全边界、失败模式的共享材料

Wave 0 完成的最低标准：

- 至少沉淀 `20` 份共享型 ground truth
- 其中大多数来自官方文档、官方仓库、官方 marketplace / registry、官方规范或高可信实现说明
- 至少 `3` 份是关于版本管理、维护、兼容或迁移的共享材料
- 至少 `2` 份是关于模型要求、工具权限或运行约束的共享材料
- 至少 `2` 份是关于限制、失败模式、风险或实践争议的材料
- `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference` 与 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_artifacts` 已先被初始化

只有 Wave 0 达标，才进入 Wave 1。

### Wave 1：按研究线分别深挖

- `purpose:` 把每条研究线从“名称和观点”推进到“机制、现态、趋势、维护、模型要求和证据”。
- `focus:` 围绕证据、机制、趋势、维护成本、版本管理、模型门槛、争议，把每条线打深到可复用证据包。

每条研究线在 Wave 1 的最低交付标准：

- 至少 `10` 份该研究线专属的 ground truth 文档
- 至少 `5` 份一手来源
- 至少 `2` 份高质量二手分析
- 至少 `3` 份能体现 `2026` 趋势变化的近期来源
- 至少 `2` 份能体现限制、失败或争议的来源
- 至少 `1` 份直接触及维护、更新、版本管理或兼容漂移
- 至少 `1` 份直接触及模型要求、工具要求或运行前提

每条研究线都必须形成：

- 一份 `evidence-summary`
- 一份 `question-list` 更新
- 对应 seed 文件的本轮回填

### Wave 2：横向比对与综合判断

- `purpose:` 把分题结果重新收束成整体结构和跨主题判断。
- `focus:` 回答哪些是共享基础层事实、哪些只是宿主差异、哪些趋势跨主题成立、哪些抽象值得长期追踪。

Wave 2 必须完成的交叉判断：

- `skills` 的规范层、共享 convention 层、宿主扩展层如何区分
- 2026 年 skills 的增长主要发生在哪几种对象上：规范、市场、分发、工作流、生态样例、host support
- 写作类和研究类 skill 是否构成两条最强的高杠杆应用线
- 维护、版本管理、互通性、宿主依赖、模型能力要求之间有什么共同规律
- 哪些宿主差异是入口差异，哪些是底层能力差异

Wave 2 的最低标准：

- 每个横向判断都能回指到具体 `_reference/*.md`
- 每条研究线至少有 `2` 个与其他研究线发生交叉验证的结论
- 已明确区分“硬事实”“分析判断”“趋势推测”
- 形成一份 `W2-cross-topic-synthesis`

### Readiness Check：最终验收闸门

- `purpose:` 判断这轮研究是否已经可交付、可接手、可停止。
- `pass signal:`
  - `30` 秒可回指
  - 每条研究线都能讲清“机制 + 趋势 + 维护 / 版本管理 + 模型要求 + 难点”
  - 横向综合已能形成整体结构判断
  - 新接手者只看 `topics + _reference + _artifacts + plan + status` 就能继续推进

## 证据采集协议

`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference` 里的每个 `md` 建议遵循统一结构：

```md
# 标题

- source_url:
- source_type:
- accessed_at:
- published_or_updated_at:
- date_scope:
- related_topic:
- trust_level: (official / academic / practitioner / community)
- why_it_matters:
- claims_supported:
- captured_excerpt: (yes / partial / no)
- canonical_exception: (yes / no)

## 关键事实

## 核心内容摘录

## 与本研究的关系

## 可直接引用的术语 / 概念

## 模型 / 宿主 / 版本相关信息

## 风险与局限
```

迁移兼容规则：

- 本计划升级到 `v5` 之后，新增 reference 必须遵循上述结构
- 已经存在的 legacy reference 不要求一次性全量返工
- 但只要某份 legacy reference 被再次触碰、进入 closeout 主推理链、或明显承担关键判断支撑，就应优先补齐 `captured_excerpt` 与 `## 核心内容摘录`

命名建议：

- `00-shared-<source-slug>.md`
- `<NN>-<topic-slug>-<source-slug>.md`

其中 `<NN>` 与 `<topic-slug>` 来自研究线注册表。

额外硬约束：

- 每个进入最终推理链条的重要来源，都必须在 `_reference` 中有自己独立的一份 `md`
- 不允许把多个关键来源混写成一页，导致后续无法精确回指
- 不允许只在 `_artifacts` 或 seed 文件里留下摘要，而不把原始证据整理进 `_reference`
- 如果某条来源无法确认是否为 `2026+`，默认不能作为本轮主证据；除非它属于 `canonical_exception`
- GitHub 仓库、文档页面、marketplace 页面如果缺明确发布时间，必须补抓 `last commit / latest release / changelog / page updated date` 作为时间信号

### `## 核心内容摘录` 写法规则

定位：

- 这一节不是摘要，而是来源里真正会进入后续推理链的硬核内容提取
- 目标是让接手者不回 URL，也能把这份 reference 当作该来源的本地权威替代

写什么：

- 关键论证链条与设计理由
- 重要数字、版本、时间线、参数、阈值、限制条件
- 关键表格、分层结构、兼容矩阵、流程图的文字保留
- 方法论要点、测试条件、失败因果链
- 必要时保留短原文引用，并注明出处位置

不写什么：

- 不在这一节做二次分析或评论
- 不重复 `## 关键事实` 已覆盖的短摘要
- 不堆无关背景铺垫或营销话术

篇幅指引：

- 高价值一手来源：优先做到 `500-1500` 字的自给自足摘录
- 中等价值 practitioner 来源：通常 `200-500` 字，保留最硬的段落
- 低价值来源：只有在 `## 关键事实` 已足够支撑时，才允许 `captured_excerpt: no`

忠实度要求：

- 摘录必须忠实于原文，不美化、不改写关键数字
- 如果是翻译，尽量保留原术语，避免把约束翻译没了
- 如果原文存在歧义或自相矛盾，应如实记录

## 已验证的高杠杆执行行为（写入计划，必须遵守）

- 以“证据落库”为单位推进：每一次有效探索都必须落为 `_reference/*.md`
- 以“对象清单稳定”为停止前提：围绕同一研究线持续扩对象与对照面，直到核心对象清单稳定
- 以“下钻到机制”为深挖目标：关键对象不只看 README，还要沿 docs → schema / code / issue / changelog / failure analysis 逐级下钻
- 以“边取证边回填”避免集成债：新增证据落库后立刻回填到对应 seed 文件和 `_artifacts`
- 以“持续自校验”保证 30 秒可回指：每个波次结束后都做一次回指完整性检查，并维护 `_reference/_INDEX.md`
- 无外部阻塞时按 Wave / Step 检查点持续自主推进，不等临时反馈；status 文件是默认进度机制

## 自主执行协议（Autonomous Execution Protocol）

### 1. 默认模式：静默自主推进

- 长程任务默认按 Wave / Step 检查点持续推进，不主动停下来汇报
- status 文件就是默认汇报机制；进度、阻塞、挂起分支优先写入 status，而不是停在对话里同步
- 每完成一个有意义的步骤，例如一份 reference 落库、一条研究线显著补强、一个 Wave 达标，就更新 status 后继续推进

### 2. 允许主动中断用户的条件

只有下面三种情况允许主动打断：

- 主线被真正阻塞，且无法通过 `suspend` 绕开
- 研究方向需要根本性调整，例如 topic registry、FINAL_DELIVERABLE 或核心假设必须重写
- 用户明确要求实时协同，而不是 file-first 的进度模式

### 3. 不允许主动中断用户的情况

以下情况都必须自行处理，不得停下来请示：

- Wave 之间切换
- 某一研究线配额达标或停止条件满足
- 单个探索分支需要 `suspend / archive / redirect`
- 发现新的高价值对象或对照面
- Readiness Check 某一项暂未通过但仍可继续补证据

### 4. 进度可见性靠文件，不靠对话

- `status` 文件是唯一默认进度沟通机制
- 每个有意义的步骤都应在 `Notes`、`Current Focus` 或相关计数中留下痕迹
- 如果用户主动询问进度，可以简要回答；否则默认继续推进

### 5. 与 Human-on-the-loop 的关系

- 本计划保留 `human on the loop`，而不是 step 级 `human in the loop`
- 挂起分支优先在 status 中登记，等阶段性收束或 closeout 时统一交给人判断
- 如果用户中途介入，介入结束后恢复自主推进模式

## 什么值得存进 `_reference`

优先入库：

- 会进入后续推理链条、且会被反复复用的高价值内容
- 能补充 `2026` 新事实、澄清机制差异、解释趋势 / 难点 / 维护 / 版本管理 / 模型要求的一手或高可信二手来源
- 能提供真实约束、真实失败模式、兼容性问题、迁移成本或事故复盘的材料

不建议入库：

- 只重复已知结论、没有新增信息的内容
- 相关性弱、可信度低、或只做表面排名的材料
- 没有明确时间信息、且无法确认当前性的旧材料
- 纯 SEO 聚合页、内容农场、无机制和证据的短帖

入库判断的硬标准：

- 能补充 `2026` 新事实
- 能澄清机制差异
- 能提供一手或高可信二手证据
- 能帮助解释趋势、维护、版本管理、模型要求、难点或争议

如果不能满足上面任一条，就不入库。

## 探索分支处置协议（含 Suspended Branch Protocol）

目的：

- 控制探索树扩张，只保留会推进 `must_answer / 当前 gap / FINAL_DELIVERABLE` 的分支。

处理等级：

- `discard`：相关性弱、可信度不足、时间过旧、或只重复已知结论。
  处理：不落库、不回填 seed、不写 artifact。
- `compress`：公开信息不足或边际收益低，但结论本身值得记住。
  处理：只在 `question-list`、`status` 或综合 artifact 里留一句压缩结论。
- `suspend`：问题本身重要，但当前继续追会明显卡在 `access boundary / disclosure boundary / repeated search / low marginal return / 2026+ 证据缺失`。
  处理：不阻塞主线，先继续推进其他高价值分支；同时必须登记为 `suspended`。
- `archive`：满足任意两条即可封存。
  触发示例：连续多次只得到重复信息；新来源明显弱于已落库来源；继续下钻主要指向非公开材料；即使继续也难以改变核心判断；同时存在更高价值未解问题。
- `redirect`：其他问题更可能提升证据强度、缩小不确定性或改变核心判断时，立即转向。

### Human-on-the-loop 原则

- 完整的自主执行规则以上方 `自主执行协议` 为准；本节保留其最核心约束
- 长程任务默认不依赖 `human in the loop`
- 更推荐 `human on the loop`：研究线程自主推进；高难分支先 `suspend`；阶段性收拢时统一交给人判断是否提供资料、改方向或重启
- 只有在下面几种情况之一成立时，才值得主动请求同步人工介入：
  - 用户明确要求实时协同
  - 当前分支直接阻塞主线，而无法通过 `suspend` 绕开
  - 已知存在用户手里的专有材料、内部文档或访问入口，不拿到就无法继续

### Suspended Branch 最低记录格式

建议在 status、综合 artifact 或 closeout 中至少保留下列结构：

```md
- branch: `<topic-slug / question>`
- state: `suspended`
- why_suspended:
- confirmed_so_far:
- still_missing:
- reopen_trigger:
```

## 本轮执行顺序建议

1. 初始化 `topics/_reference` 与 `topics/_artifacts`
2. 整理 `_reference/_INDEX.md` 骨架
3. Wave 0 先沉淀规范、官方宿主文档、marketplace / registry、模型要求、版本管理共享材料
4. 以 `01 → 02 → 03 → 04 → 05 → 06 → 07 → 08` 的顺序推进 Wave 1
5. 每完成一个 topic，立即更新对应 seed 与 artifact
6. 完成全部 `8` 条线后进入 Wave 2
7. 通过 Readiness Check 后，再决定是否进入下一轮

## 配套 Status File Skeleton

建议使用：

- `/Users/bowhead/ai_dev_skill/SKILL_HOST/plan/skill-host-skills-deep-research-progressive-plan-round-1.status.md`
