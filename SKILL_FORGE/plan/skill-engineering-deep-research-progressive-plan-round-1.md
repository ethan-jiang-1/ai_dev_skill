# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）

> 执行状态（动态更新）：见 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`

- `template_version`：`v4`
- `round_label`：`一轮`
- `main_task`：`扩事实 + 补机制 + 补限制`

## 调研的根本目的

这轮 Deep Research 不是为了产出调研笔记本身。

真正的目的是：为一套面向 coding agent 的 skill engineering 研究基座提供可靠的原材料地基，并最终支撑下面四项交付物：

- 一份候选对象池
- 一份横向对比表
- 一份前 `3` 名推荐结论或前 `3` 组合
- 一份“如何落到自己的 skill workflow”的 baseline 建议

最终产出的读者是：

- 当前项目的主研究者
- 后续接手的 agent / 协作者
- 默认具备技术背景、关心 coding agent 与 skill workflow 的专业读者

这份最终产出至少要满足下面要求：

- 系统性：覆盖方法论、工程链路、生态验证三个层面
- 逻辑性：每个关键判断都能回指到本地 reference 文档
- 一致性：跨 topic 的术语、对象分类、评估维度保持统一
- 专业可读：默认读者熟悉 agent、repo、workflow，不接受泛泛而谈

因此，每一个进入 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference` 的文档、每一条写回 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/*.md` 的判断，都必须回答：

> 这条内容是否直接支撑最终的对象比较、推荐判断或 workflow 建议？如果不能，它就不该存在。

权威信源优先规则：

> 当官方仓库、官方文档、官方规范说明、源码或高可信一手材料已足以支撑某个判断时，不为了凑配额额外引入低质量二手来源。

## 本轮定位

这一轮不是最终定胜负的一轮。

这一轮的主任务是：

- 固定 skill 的定义边界、结构共识和质量维度
- 拆清候选对象在 skill 生命周期中的职责边界
- 建立生态信号与采用判断的证据口径
- 为后续排序和 workflow 建议打下可回指的本地 ground truth 地基

这一轮不追求：

- 直接输出最终对外报告
- 在证据基础还不稳时提前宣告单一赢家
- 只凭 README 或主观印象完成前 `3` 排序

## 先反省：当前版本为什么还不够

### 1. Skill 定义与边界仍然悬空

当前已有 topic seed 已明确研究诉求，但仍未固定 skill 与 prompt、rule、agent instruction、recipe 之间的边界，也未固定哪些结构约定已接近事实标准。这会直接影响后续对象分类和比较口径。

### 2. 候选对象的工程职责还没有被系统拆开

当前已知对象横跨内容仓库、结构样板、runtime loader、audit tool、registry / marketplace，但尚未形成统一的生命周期拆解框架。因此目前还不能准确回答“谁真正降低了工程成本”。

### 3. 生态信号与采用可信度缺少独立证据层

目前对多数对象的认知仍主要来自其自述材料。外部采用、被收录、被引用、被集成、跨平台兼容等信号还没有落成本地证据，因此“值得持续跟踪或采用”的判断还不稳。

### 4. 本地 ground truth 资产还没有建立

当前知识主要存在于 seed 文件和初步判断里，还没有系统化沉淀到 `_reference` 与 `_artifacts`。如果现在让新的 agent 接手，仍然需要从零重新搜索，无法做到 `30` 秒回指。

## 参数与目录约定

- `PLAN_NAME`：`面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）`
- `SEED_DIR`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics`
- `REFERENCE_DIR`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference`
- `ARTIFACT_DIR`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts`
- `PLAN_PATH`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md`
- `STATUS_PATH`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- `FINAL_DELIVERABLE`：`一套面向 coding agent 的 skill engineering 研究基座，足以支撑候选筛选、横向比较、推荐结论与 workflow baseline 建议`
- `AUDIENCE`：`项目主研究者、后续协作 agent、技术背景读者`
- `TOPIC_COUNT`：`3`
- `WAVE0_SHARED_DOC_FLOOR`：`8`
- `WAVE1_DOC_FLOOR_PER_TOPIC`：`8`
- `PRIMARY_SOURCE_FLOOR`：`4`
- `SECONDARY_SOURCE_FLOOR`：`2`
- `RECENT_SOURCE_FLOOR`：`1`
- `LIMITATION_SOURCE_FLOOR`：`1`

目录初始化强约束：

- 在正式开始 Wave 0 之前，必须先创建 `REFERENCE_DIR` 与 `ARTIFACT_DIR`
- `REFERENCE_DIR` 与 `ARTIFACT_DIR` 均放在 `SEED_DIR` 之下，确保接手者能在 `30` 秒内定位
- `SEED_DIR` 本身是 living docs，后续研究执行时需要持续回填 topic 文件

## 输入对象建模（Topic Registry）

### 01 / skill-methodology-and-spec / Skill 方法论与规范接口

- `seed_files:`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/01-skill-methodology-and-spec.md`
- `current_hypothesis:`
  - Skill engineering 正在从“写 prompt 内容”转向“设计可复用、可发现、可治理的技能资产”，但统一方法论仍然分散。
- `why_it_matters:`
  - 这一线负责固定后续所有 topic 的术语、定义、结构共识与质量判断口径。
- `must_answer:`
  - skill 的最小定义是什么
  - 哪些结构元素和接口约定跨项目重复出现
  - 哪些质量维度应被视为 skill engineering 的核心维度

### 02 / skill-toolchain-and-lifecycle / Skill 工程化工具链与生命周期

- `seed_files:`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/02-skill-toolchain-and-lifecycle.md`
- `current_hypothesis:`
  - 当前生态大多数对象只覆盖 skill 生命周期的一段，真正的工程基座能力可能来自组合式工具链，而不是单一仓库。
- `why_it_matters:`
  - 这一线负责回答“谁在 skill engineering 链路里真正做了工程工作”。
- `must_answer:`
  - 生命周期如何稳定拆分
  - 各对象覆盖哪一段
  - 哪些对象降低了真实交付成本

### 03 / ecosystem-signals-and-adoption / 生态信号、可信度与采用判断

- `seed_files:`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/03-ecosystem-signals-and-adoption.md`
- `current_hypothesis:`
  - 生态仍然早期，值得跟踪的对象需要靠多种弱信号叠加验证，不能只看自述和 star 数。
- `why_it_matters:`
  - 这一线负责把“看起来不错”与“值得继续投入时间”区分开。
- `must_answer:`
  - 外部采用和可信度如何判断
  - 哪些对象只适合参考，哪些值得直接试用
  - 最终推荐应是单项目还是组合方案

## 输出

本轮执行后应至少形成下面 5 类资产：

### 1. Ground truth 参考材料

存放位置：

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference`

要求：

- 每个高价值来源单独存成一个 `md`
- 每个重要来源必须可独立回指
- 完成单位不是“看过链接”，而是“已被整理成可复用的本地 reference 文档”

### 2. 输入目录的持续生长

`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics` 不是只读输入，而是 living output。

每条研究线对应的 seed 文件都应被更新，新增：

- 本轮新增证据
- 本轮新增机制理解
- 本轮新增趋势与难点
- 当前判断

### 3. 过程性 artifacts

存放位置：

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts`

至少包括：

- 每条研究线一份 `evidence-summary`
- 每条研究线一份 `question-list`
- 一份横向综合 `W2-cross-topic-synthesis`
- 一份 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/_INDEX.md`

### 4. 跨主题综合结论

必须能够横向回答：

- 哪些是基础层事实
- 哪些是局部 topic 内成立的判断
- 哪些结论跨 topic 成立
- 哪些对象最值得继续追踪

### 5. 更新协议

每份被更新的 seed 文件都应遵循同样结构：

```md
## 历史摘要（保留，不修改）

## 本轮新增证据

## 本轮新增机制理解

## 本轮新增趋势与难点

## 当前判断（本轮综合后）
```

规则：

- 历史摘要不删改，只保留
- 所有本轮新增内容进入固定章节
- 每条新增关键判断都必须带本地回指
- 如果某个判断被修正，在“当前判断”中注明，不删除旧内容

## 总体策略

这轮研究采用“先共享地基，再分题深挖，再横向综合”的结构。

### Wave 0：建立共同 ground truth 地基

- `purpose`：固定共享术语、共享对象分类、共享高可信入口，避免 3 条研究线各自从零开始。
- `focus`：不急着排序，先把后续会反复用到的硬事实落进 `_reference`。

Wave 0 完成最低标准：

- 至少沉淀 `8` 份共享型 ground truth 文档
- 至少覆盖下面 `8` 类共享材料中的每一类至少 `1` 份：
  - skill 定义或结构约定
  - `SKILL.md` / `AGENTS.md` / 类似接口说明
  - 官方或半官方 skill 样板
  - runtime / loader 兼容说明
  - 工程治理或 audit / validation 工具说明
  - registry / marketplace / curated list 入口说明
  - 限制 / 风险 / 安全 / 失败模式材料
  - 对比、采用或生态分析材料
- `REFERENCE_DIR`、`ARTIFACT_DIR`、`_INDEX.md` 已初始化
- 已形成一版共享术语表和对象分类草案

只有 Wave 0 达标，才进入 Wave 1。

### Wave 1：按研究线分别深挖

- `purpose`：把每条研究线从“知道名字和观点”推进到“有证据、有机制、有难点、有趋势”。
- `focus`：围绕证据、根本机制、趋势、难度、争议五个视角打深每条 topic。

每条研究线在 Wave 1 的最低交付标准：

- 至少 `8` 份该研究线专属 ground truth 文档
- 至少 `4` 份一手来源
- 至少 `2` 份高质量二手分析
- 至少 `1` 份近期趋势来源
- 至少 `1` 份限制、失败或争议来源
- 每条研究线都必须形成一份 `evidence-summary` 与一份 `question-list`

### Wave 2：横向比对与综合判断

- `purpose`：把分题结果重新收束成整体结构与跨主题判断。
- `focus`：回答哪些结论是共享底层事实，哪些只是 topic 局部差异，哪些对象值得长期追踪。

Wave 2 完成最低标准：

- 每个横向判断都能回指到具体 `_reference/*.md`
- 每条研究线至少有 `2` 个与其他研究线交叉验证的结论
- 明确区分“硬事实”“分析判断”“趋势推测”
- 至少形成一份 `W2-cross-topic-synthesis.md`

### Readiness Check：最终验收闸门

通过信号：

- 任意一个重要判断都能在 `30` 秒内找到本地支撑文档
- 对每条研究线都能讲清“机制 + 趋势 + 难点”
- 横向综合已经形成整体结构判断
- 新接手者只看 `SEED_DIR + REFERENCE_DIR + ARTIFACT_DIR` 就能继续推进

## 证据采集协议

`REFERENCE_DIR` 里的每个 `md` 统一采用下面结构：

```md
# 标题

- source_url:
- source_type:
- accessed_at:
- related_topic:
- trust_level:
- why_it_matters:
- claims_supported:

## 关键事实

## 与本研究的关系

## 可直接引用的术语 / 概念

## 风险与局限
```

命名规范：

- 共享地基：`00-shared-<source-slug>.md`
- `01` 研究线：`01-skill-methodology-and-spec-<source-slug>.md`
- `02` 研究线：`02-skill-toolchain-and-lifecycle-<source-slug>.md`
- `03` 研究线：`03-ecosystem-signals-and-adoption-<source-slug>.md`

硬约束：

- 每个进入最终推理链条的重要来源都必须有自己独立的一份 `md`
- 不允许把多个关键来源混写成一页
- 不允许只在 `_artifacts` 或 topic 文件里留下摘要，而不把原始证据落库到 `_reference`

## 探索分支处置协议

默认只保留会推进 `must_answer / 当前 gap / FINAL_DELIVERABLE` 的探索分支。

- `discard`：相关性弱、可信度不足、或只重复已知结论
- `compress`：信息不足或边际收益低，但值得在 `question-list` 里留一句
- `suspend`：问题重要，但当前明显卡在访问边界、公开域边界、搜索重复或边际收益过低
- `archive`：继续下钻大概率不会改变核心判断，暂时封存
- `redirect`：当其他问题更可能改变判断时，立即转向

`suspend` 最低记录格式：

```md
- branch:
- state: suspended
- why_suspended:
- confirmed_so_far:
- still_missing:
- reopen_trigger:
```

## 搜够了没有：停止条件

每条研究线只有同时满足下面条件，才能算这一轮搜集完成：

- 核心对象清单已经稳定，不再持续新增关键名字
- 新搜材料大多在重复已知事实，而不是贡献新信息
- 该研究线的固定问题都已有证据支撑
- 已完成至少 `1` 轮对反例、限制、争议的专门补搜
- 已完成至少 `1` 次“官方说法 vs 第三方验证 / 实践证据 / 失败复盘”的交叉核验
- 所有重要但未解的问题，都已被归类为 `继续追`、`suspend`、`archive` 或 `redirect`

## 研究线的具体目标

### 研究线 01：Skill 方法论与规范接口

研究目标：

- 固定 skill 的定义边界、结构共识和质量维度
- 为后续两条研究线提供共享术语和判断口径

必须回答：

- 在 coding agent 语境下，什么才算可复用的 skill
- 当前主流 skill 由哪些固定组成部分构成
- 哪些结构约定已接近事实标准，哪些仍是局部仓库习惯

证据重点：

- 官方或半官方 skill 样板
- 明确讨论结构、触发、执行、装载的接口说明
- 能体现 `SKILL.md` / `AGENTS.md` / 元数据约定的材料

难点重点：

- 术语漂移
- 结构约定分化
- “内容质量”与“工程质量”之间的口径混淆

趋势必须回答：

- skill 的结构标准是在收敛还是继续分化
- 运行时接口与内容格式之间是在合流还是各自演进

难度必须回答：

- 个人作者理解 skill 边界的难度
- 团队统一 skill 结构与质量标准的难度
- 长周期维护时保持结构稳定的难度

### 研究线 02：Skill 工程化工具链与生命周期

研究目标：

- 建立 skill 生命周期分解框架
- 把候选对象映射到生命周期不同阶段，明确强弱项与职责边界

必须回答：

- skill 生命周期该如何稳定拆分
- 各类候选对象分别覆盖了哪些阶段
- 哪些对象是真正的工程基座能力，哪些只是样板、目录或入口

证据重点：

- tool / runtime / loader / registry 的官方仓库与文档
- 能体现 post-authoring、audit、validation、distribution、loading 的说明
- 能体现跨 agent 兼容与安装分发约束的材料

难点重点：

- 生命周期切分口径不统一
- 单一对象职责重叠或宣传边界模糊
- 多平台兼容与单一事实源维护的治理难题

趋势必须回答：

- 工具链是在向一体化基座收敛，还是向组合式生态分化
- 编写、治理、分发、装载哪些环节最先标准化

难度必须回答：

- 个人采用复杂工具链的门槛
- 团队治理多平台 skill 资产的难度
- 长期维护组合式链路的漂移成本

### 研究线 03：生态信号、可信度与采用判断

研究目标：

- 建立独立于项目自述的采用与可信度判断框架
- 为前 `3` 排序或组合推荐提供证据层
- 回答“借鉴现成 skill 是否能显著缩短成长路径，以及哪些外部资源最有学习杠杆”

必须回答：

- 哪些外部信号足以支撑“值得持续跟踪”
- 如何区分官方项目、社区 curated list、个人实验仓库与生态聚合站
- 最终推荐应偏向单一项目还是组合方案
- 哪些现成 skill、样板、目录和社区入口最适合作为成长加速器，而不是只提供表面热度

证据重点：

- 被采用、被引用、被教程化、被收录、被集成的外部信号
- release、维护、跨平台兼容、社区讨论等持续性信号
- 能体现“强自述、弱回声”或“低调但真实采用”的反例材料
- 能体现“借鉴他人 skill 能帮助更快上手，而完全闭门从零摸索成本更高”的实践材料、教程路径或经验总结

难点重点：

- 早期生态中弱信号很多、强信号稀缺
- 目录影响力与工具成熟度容易混淆
- 短期热点、个人项目和长期基座之间不易区分
- “学习价值高”与“工程成熟度高”不一定是同一类对象，需要分开判断

趋势必须回答：

- skill 生态是在形成稳定的基座层，还是保持高分散状态
- 官方样板、第三方工具和社区目录之间是否出现清晰分工

难度必须回答：

- 个人基于弱信号做工具选型的风险
- 团队把实验项目纳入正式 workflow 的风险
- 长期跟踪对象池时的维护成本与误判成本

## 并行执行建议

建议采用“主线程 + 研究线线程”的并行方式，但前提是 Wave 0 已完成。

主线程职责：

- 维护共享术语、对象分类与证据格式
- 维护 `_reference/_INDEX.md`
- 去重共享来源，避免不同研究线重复抓同一来源
- 在 Wave 2 做跨 topic 综合

研究线线程职责：

- 深挖自己主题
- 以 `_reference/*.md` 为单位落库高价值来源
- 回填对应 topic 文件
- 维护本研究线的 `evidence-summary` 与 `question-list`

命名分工：

- 主线程写共享地基：`00-shared-*`
- 研究线 `01` 只写：`01-skill-methodology-and-spec-*`
- 研究线 `02` 只写：`02-skill-toolchain-and-lifecycle-*`
- 研究线 `03` 只写：`03-ecosystem-signals-and-adoption-*`

## 执行节奏

推荐顺序：

1. 初始化 `REFERENCE_DIR / REFERENCE_DIR/_INDEX.md / ARTIFACT_DIR`
2. 完成 Wave 0 共享地基与对象分类草案
3. 进入 Wave 1，优先扩大每条研究线的核心对象清单，再下钻机制
4. 对每条研究线补趋势、难点、失败模式与争议
5. 做至少一轮跨 topic 交叉核验
6. 完成 Wave 2 横向综合与 Readiness Check

如果某一步还未达到对应检查点，不要机械进入下一步。

## 成功标准

达到下面状态，才算真正满足目标：

- `_reference` 中有一批高可信、可追溯的 ground truth 文档
- 每条研究线至少形成一组可复用证据包，而不是临时搜索结果
- 对每条研究线都能解释机制、趋势和难点
- 每个重要判断都能回指到本地 reference 文档
- 对趋势、难度、争议都有专门证据，而不是顺手一提
- 可以回答“什么值得长期追踪，什么只是噪音”
- 可以明确说清楚哪些问题被主动 `suspend`，以及为什么
- 新的 agent 接手时，只看 `SEED_DIR + REFERENCE_DIR + ARTIFACT_DIR` 就能继续推进
