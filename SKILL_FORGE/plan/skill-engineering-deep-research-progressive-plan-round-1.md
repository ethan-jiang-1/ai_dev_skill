# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）

> 对应状态文件：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
> 对应执行队列：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.queue.md`
> 本文件只记录设计态蓝图；实时状态与连续动作分别写入状态文件与执行队列。

## Instance Config

> 这是本轮实例参数的唯一设计态注册点。除 `topic registry` 本体外，后文不再重复定义这些参数。

| field | value |
| --- | --- |
| `plan_name` | `面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）` |
| `template_version` | `v8` |
| `round_label` | `一轮` |
| `plan_path` | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md` |
| `status_path` | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md` |
| `queue_path` | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.queue.md` |
| `seed_dir` | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics` |
| `reference_dir` | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference` |
| `artifact_dir` | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts` |
| `final_deliverable` | `一套面向 coding agent 的 skill engineering 研究基座，足以支撑候选筛选、横向比较、推荐结论与 workflow baseline 建议` |
| `audience` | `项目主研究者、后续协作 agent、技术背景读者` |
| `round_focus` | `扩事实 / 补机制 / 补限制 / 拓扑迁移后收束 / 持续优化闭环整合` |
| `derived_topic_count` | `= count(topic registry entries)` |
| `wave0_shared_doc_floor` | `8` |
| `wave1_doc_floor_per_topic` | `8` |
| `primary_source_floor` | `4` |
| `secondary_source_floor` | `2` |
| `recent_source_floor` | `1` |
| `limitation_source_floor` | `1` |
| `hard_gates_enabled` | `no` |

## 调研目的与服务对象

这轮 Deep Research 不是为了产出调研笔记本身。

真正的目的是：为一套面向 coding agent 的 skill engineering 研究基座提供可靠的原材料地基，并最终支撑下面四项交付物：

- 一份候选对象池
- 一份横向对比表
- 一份前 `3` 名推荐结论或前 `3` 组合
- 一份“如何落到自己的 skill workflow”的 baseline 建议

最终产出的读者是：项目主研究者、后续协作 agent、技术背景读者。

这份最终产出至少要满足下面要求：

- 系统性：覆盖方法论、工程链路、生态验证、持续优化闭环四个层面
- 逻辑性：每个关键判断都能回指到本地 reference 文档
- 一致性：跨 topic 的术语、对象分类、评估维度保持统一
- 专业可读：默认读者熟悉 agent、repo、workflow，不接受泛泛而谈

权威信源优先规则（最高优先级，不可违反）：

> 当权威一手来源已经足以支撑某个判断时，不为满足配额额外引入低质量二手来源。配额是防止搜太浅的下限，不是必须凑满的目标。宁缺毋滥。

## 本轮核心缺口

- Skill 定义、portable core 与 surface-specific extension 的 field-level 支持矩阵仍可继续实测，但不阻塞本轮推荐结论。
- 发布后持续优化闭环已经形成 04 topic 与 mock runner 原型；后续仍可增强 JSON comparison output、可配置 matcher 与真实 Codex adapter。
- 现有最终推荐已经吸收持续优化维度，但真实 baseline / candidate 对比仍停留在 mock fixtures，不应被误写成真实 agent adapter 结果。

## Control Map

本轮实例 plan 只保留最小控制绑定，避免在实例正文里重写模板级 authority tables。

### Minimal Runtime Bindings

- `PLAN_PATH` 只记录设计态蓝图、实例参数、拓扑基线、Wave 设计与验收；不写实时进度、阻塞、worklog 或 active queue。
- `STATUS_PATH` 只记录当前状态、gate、阻塞、拓扑 delta、分支处置与恢复上下文；不重写完整设计态蓝图。
- `QUEUE_PATH` 是唯一连续派工入口；只记录 active queue、blocked state、refill pool 与 promotion rules。
- `setup_ready` 是 gate，不是独立 wave；本轮已经越过该 gate 并通过 Readiness Check。
- 默认 gate 路径为 `instantiation_complete -> setup_ready -> wave0_complete -> wave1_complete -> wave2_complete -> readiness_passed`。
- `topic_stop_decision` 是研究线级决策；`primary_source_coverage` 只描述 primary source 覆盖 / 饱和度维度。
- `Readiness Check` 是 round closeout gate；`成功标准` 只描述 pass 后的完成态；`Hard Gates` 本轮不启用。

## 输入建模

本轮研究直接以 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics` 为起点。

输入对象包括：

- 目录中的 topic seed 文件
- 目录中的已有摘要 / 初步判断 / 问题清单
- 上一轮留下的 `_artifacts` 与相关本地 `_reference`

在正式执行前，必须先把输入目录建模成“研究线注册表（topic registry）”。

每条研究线至少要写清楚：

- 编号
- slug
- 主题标题
- 对应 seed 文件
- 当前假设或当前缺口
- 为什么它值得继续深挖
- 本轮必须回答的问题

### 研究线注册表（topic registry）

topic 数量、编号顺序与 slug 统一以这一节为准；其他 section 只引用，不再维护第二份列表。

| id | slug | title | seed_files | current_hypothesis | why_it_matters | must_answer |
| --- | --- | --- | --- | --- | --- | --- |
| `01` | `skill-methodology-and-spec` | Skill 方法论与规范接口 | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/01-skill-methodology-and-spec.md` | Skill engineering 正在从“写 prompt 内容”转向“设计可复用、可发现、可治理的技能资产”，但统一方法论仍然分散。 | 固定后续所有 topic 的术语、定义、结构共识与质量判断口径。 | skill 的最小定义是什么；哪些结构元素和接口约定跨项目重复出现；哪些质量维度应被视为 skill engineering 的核心维度 |
| `02` | `skill-toolchain-and-lifecycle` | Skill 工程化工具链与生命周期 | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/02-skill-toolchain-and-lifecycle.md` | 当前生态大多数对象只覆盖 skill 生命周期的一段，真正的工程基座能力可能来自组合式工具链，而不是单一仓库。 | 回答“谁在 skill engineering 链路里真正做了工程工作”。 | 生命周期如何稳定拆分；各对象覆盖哪一段；哪些对象降低了真实交付成本 |
| `03` | `ecosystem-signals-and-adoption` | 生态信号、可信度与采用判断 | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/03-ecosystem-signals-and-adoption.md` | 生态仍然早期，值得跟踪的对象需要靠多种弱信号叠加验证，不能只看自述和 star 数。 | 把“看起来不错”与“值得继续投入时间”区分开。 | 外部采用和可信度如何判断；哪些对象只适合参考，哪些值得直接试用；最终推荐应是单项目还是组合方案 |
| `04` | `skill-optimization-and-feedback-loops` | Skill 持续优化、评测闭环与反馈回流 | `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/04-skill-optimization-and-feedback-loops.md` | Skill optimization 的真实对象是完整 artifact，而不是单段 prompt；可迁移的 skill workflow baseline 必须包含失败样本、eval / replay / regression 与反馈回流闭环。 | 补齐 skill engineering 从“可写、可装、可发”走向“可持续变好”的后半程能力。 | skill 持续优化的对象边界是什么，为什么不能等同于 prompt tuning；发布后的失败信号如何分类、沉淀、回流；最小 eval / replay / regression loop 应如何定义；哪些优化环节适合自动化，哪些必须 human-in-the-loop；如何判断一次 skill 修订是真的提升，而不是换一种失败方式 |

### 当前拓扑基线（Current Topology Baseline）

这里写的是本轮实例化时正式采用的 `topology baseline`；它属于 `PLAN_PATH` 的设计态结构，不是执行中的实时工作日志。

- carry_forward_topics: `01 / skill-methodology-and-spec`, `02 / skill-toolchain-and-lifecycle`, `03 / ecosystem-signals-and-adoption`
- new_topics: `04 / skill-optimization-and-feedback-loops`
- recent_change: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/_raw_idea/skill-continuous-optimization.md` 已 formalized 为 `04`，并已同步 topic seed、topic registry、plan、status、Wave 1 与 Wave 2 artifacts。
- pending_topic_candidates: `none`

当前有效 topic 数量始终由 `topic registry` 派生，不在其他 section 单独维护第二个计数器。

执行中的 topic 增减、推进中的结构变化与最近一次正式化说明写入状态文件的 `Topology Delta / Formalization State`；plan/status 哪一侧尚待同步则写入状态文件的 `Plan / Status Sync.topology_sync_state`。

## 输出契约

### 1. Ground Truth 参考材料

- 所有进入最终推理链条的重要来源，都应以独立 `md` 的 `Authoritative Copy` 形式落在 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference`。
- `REFERENCE_DIR` 的完成单位不是“看过这个链接”，而是“这个链接已经被整理成可复用、可定位、可引用、可自给自足的独立 `md` 文档”。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/_INDEX.md` 负责 `30-Second Local Evidence Retrieval`，语义上属于 `navigation layer`。

### 2. 输入目录的持续生长

`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics` 不是只读输入，而是这轮研究的 `living output surface`。

每条研究线对应的 seed 文件都应被更新，并新增下面固定章节：

- `历史摘要（保留，不修改）`
- `本轮新增证据`：每条新增事实都带本地 reference 引用
- `本轮新增机制理解`：从描述上升到为什么这样设计
- `本轮新增趋势与难点`：有时间证据支撑的趋势、实践难点与失败模式
- `当前判断（本轮综合后）`：综合历史内容与本轮新增后的判断，每条判断带本地 reference 引用

规则：

- 历史摘要不删改，只保留。
- 所有本轮新增内容进入固定章节。
- 每条新增关键判断都必须带本地引用。
- 如果某个判断被本轮推翻或修正，在“当前判断”中注明，不删除旧内容。

### 3. 过程性 Artifacts

`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts` 是 `derived synthesis layer`；它承接 evidence summary、question list、cross-topic synthesis、runner prototype、case pack、mock runner report 与 W2 综合产物，但不替代 `_reference` 存放证据本体，也不替代状态文件存放当前执行状态。

至少包括：

- 每条研究线一份 `evidence-summary`
- 每条研究线一份 `question-list`
- 一份横向综合 `W2-cross-topic-synthesis`
- 一份 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/README.md`

## 证据采集协议（Evidence Capture Protocol）

本轮继续研究时，默认以“证据落库”作为完成单位，而不是以“看过链接”作为完成单位。

`REFERENCE_DIR` 里的每个 `md` 建议遵循下面结构：

```md
# 标题

- source_url:
- source_type:
- accessed_at:
- related_topic:
- trust_level:
- why_it_matters:
- captured_excerpt:
- claims_supported:

## 关键事实

## 核心内容摘录

## 与本研究的关系

## 可直接引用的术语 / 概念

## 风险与局限
```

本轮命名规范：

- 共享地基：`00-shared-<source-slug>.md`
- `01`：`01-skill-methodology-and-spec-<source-slug>.md`
- `02`：`02-skill-toolchain-and-lifecycle-<source-slug>.md`
- `03`：`03-ecosystem-signals-and-adoption-<source-slug>.md`
- `04`：`04-skill-optimization-and-feedback-loops-<source-slug>.md`

优先入库：

- 会进入最终推理链条、且会被反复复用的高价值内容
- 能补充新事实、澄清机制差异、或解释趋势 / 难点 / 争议的一手或高可信二手来源
- 能提供真实约束、真实失败模式、评测闭环、runner 实现模式或 workflow baseline 关键判断的材料

不建议入库：

- 只重复已知结论、没有新增信息的内容
- 相关性弱、可信度低、或只做表面排名的材料
- 纯 SEO 聚合页、内容农场、无机制和证据的短帖

执行要求：

- 不允许只在 `_artifacts` 或 topic seed 文件里留下摘要，而不把原始证据整理进 `_reference`
- 新增证据落库后，默认应回填对应 topic seed 与 relevant artifact，避免集成债
- `captured_excerpt` 的目标不是全文镜像，而是让接手者不回原文也能理解这份来源为什么重要

## 探索 / 利用与分支处置规则

本轮继续研究时，默认在“探索新方向”和“深挖已知线索”之间做显式判断，避免机械凑配额，也避免遗漏真正改变拓扑或推荐结构的新问题。

优先探索新方向的信号：

- 连续多份 reference 指向同一个现有 topic 难以容纳的新概念或新对象清单
- `must_answer` 仍有实质性空洞，且继续补旧来源类型已不能明显提高判断质量
- 新方向会影响多个 topic 的结论、baseline、推荐语法或 workflow 边界
- 出现足以形成独立 artifact 需求、独立失败模式或独立 evaluation loop 的问题簇

优先继续深挖 / 收束已知线索的信号：

- 新增材料大多重复已知事实，而不是贡献新信息
- 研究线的问题清单收敛，新问题产生速度显著下降
- 核心机制已经可以简洁解释，并且有多个高可信来源支撑
- 反例、限制、失败模式已经做过一轮专门补搜，继续搜索边际收益明显降低

分支处置规则：

- `discard`：相关性弱、可信度不足、或只重复已知结论；不落库、不回填 seed、不写 artifact
- `compress`：公开信息不足或边际收益低，但结论本身值得记住；只在 `question-list`、状态文件或综合 artifact 里留一句压缩结论
- `suspend`：问题重要，但当前继续追会明显卡在访问边界、公开域边界、搜索重复或边际收益过低；不阻塞主线，登记后继续推进其他高价值分支
- `archive`：继续下钻边际收益低，且短期内不太可能改变核心判断；封存时只写推进到哪里、为什么暂不继续、什么条件下重开
- `redirect`：其他问题更可能提升证据强度、缩小不确定性或改变核心判断时，立即转向

本轮特别提醒：

- 对 `04`，不要把“自动改 prompt”误当成 skill optimization 的全部；优先维持 artifact、trigger、workflow、tool contract、feedback loop 与 regression gate 视角
- 对 `01`，field-level surface matrix 是增强项；除非会改变 portable core / extension 判断，否则不应抢占主线
- 对 `03`，快速扫描式榜单只能做附录，不应压过“分角色推荐 + baseline 组合 + optimization layer”的主推荐结构

## Wave 设计与验收

### Wave 0：建立共同 Ground Truth 地基

- purpose: 固定共享地基、共同术语和高可信入口，避免各研究线各自从零开始
- minimum:
  - 至少 `8` 份共享型 ground truth
  - 其中大多数来自官方文档、官方仓库、官方规范或高可信研究
  - 至少 1 份来自安全 / 限制 / 约束相关材料
  - 至少 1 份来自高质量对比、实践复盘或失败分析
  - `REFERENCE_DIR`、`ARTIFACT_DIR` 与状态文件已经先被初始化

### Foundation Sufficiency Check（Wave 0 → Wave 1）

进入 Wave 1 前至少确认：

- 核心术语已有工作定义，对象分类已有共享地基。
- 每条研究线已有明确深挖起点。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/_INDEX.md` 已经可用。

### Wave 1：按研究线分别深挖

- purpose: 把每条研究线从“名称和观点”推进到“机制和证据”
- 每条研究线都要从 5 个视角扩展：
  - 证据
  - 根本机制
  - 趋势
  - 难度
  - 争议 / 失败模式
- minimum per topic:
  - 至少 `8` 份该研究线专属 ground truth
  - 至少 `4` 份一手来源
  - 至少 `2` 份高质量二手分析
  - 至少 `1` 份近期趋势来源
  - 至少 `1` 份限制 / 失败 / 争议来源
- 每条研究线都必须形成一份 `evidence-summary` 和一份 `question-list`。
- 对 `04` topic，额外要求形成 failure taxonomy、最小 eval / replay / regression loop baseline、runner prototype 或明确挂起原因。

只有当该研究线已完成一轮 stop assessment、`must_answer` 已有本地证据支撑、且限制 / 失败模式补搜已明确记录时，才允许使用 `early_saturation`，并且必须写入状态文件的 `Wave 1`。

### Wave 2：横向比对与综合判断

- purpose: 把分题结果重新收束成整体结构和跨主题判断
- minimum:
  - 每个横向判断都能追溯到具体 `_reference/*.md`
  - 每条研究线至少有 2 个与其他研究线发生交叉验证的结论
  - 明确区分“硬事实”“分析判断”“趋势推测”
  - `04` 的持续优化、failure taxonomy、eval loop 与 regression harness 结论已吸收进 workflow baseline 和最终推荐语法

### Readiness Check：最终验收闸门

至少覆盖下面 5 项：

- `30-Second Local Evidence Retrieval`
- 每线“机制 + 趋势 + 难点”检查
- 横向综合检查
- 拓扑稳定性检查
- 接手可继续性检查

### 搜够了没有：停止条件（topic-level stop condition）

每条研究线在 stop assessment 完成前，`topic_stop_decision` 保持 `not_assessed`。

完成一轮搜集并进入 stop assessment 后，必须把当前状态明确归类为 `continue / early_saturation / suspend / archive / redirect` 之一。

其中，只有同时满足下面条件，才允许把该研究线视为“已搜够一轮”并进入 `early_saturation / archive / redirect` 这类停止型决策：

- 核心对象清单已经稳定，不再持续新增关键名字
- 新搜到的材料大多在重复已知事实，而不是贡献新信息
- 该研究线的固定问题都已经有证据支撑
- 至少有 1 轮对“反例、限制、争议”的专门补搜
- 已完成一次“官方说法 vs 第三方验证 / 实践证据 / 失败模式”交叉核验
- 所有重要但未解的问题，都已经被明确归类为 `continue / early_saturation / suspend / archive / redirect`

补充判定：

- `continue`：当前线仍有高价值缺口，且继续深挖预期能改变判断质量
- `early_saturation`：该维度已明显饱和，继续搜索主要只会引入低质量重复材料
- `suspend`：重要，但当前受限于材料、访问或时机，暂不继续
- `archive`：继续下钻边际收益低，短期内不太可能改变核心判断
- `redirect`：问题重心应转移到其他研究线或新 formalized topic

## 研究线的具体目标

### 研究线 01：skill-methodology-and-spec

- registry_ref: `PLAN_PATH -> 研究线注册表（topic registry） -> 01/skill-methodology-and-spec`
- wave1_deepen_focus: 固定 skill 定义边界、结构共同层、portable core 与 surface-specific extension。
- evidence_priority: 官方 skill 文档、surface interface facts、方法论收敛样本。
- difficulty_focus: 跨 GitHub / Claude / Codex 的字段语义、路径、metadata 与 repo guidance 边界。
- trend_question: skill 是否正在从 prompt 文本走向可发现、可治理、可迁移的工程资产。
- stop_assessment_focus: field-level matrix 实测是增强项，不阻塞当前 round。

### 研究线 02：skill-toolchain-and-lifecycle

- registry_ref: `PLAN_PATH -> 研究线注册表（topic registry） -> 02/skill-toolchain-and-lifecycle`
- wave1_deepen_focus: 固定 lifecycle segmentation、loader、sample library、governance、distribution、runtime bridge 与 baseline 组合。
- evidence_priority: loader / manager / governance / runtime / orchestration 相关 reference。
- difficulty_focus: 单一基座与组合式 workflow baseline 的职责边界。
- trend_question: skill engineering 是否需要从单点工具转向组合式生命周期链路。
- stop_assessment_focus: 具体工具配置和真实 adapter 运行是后续增强项。

### 研究线 03：ecosystem-signals-and-adoption

- registry_ref: `PLAN_PATH -> 研究线注册表（topic registry） -> 03/ecosystem-signals-and-adoption`
- wave1_deepen_focus: 固定可信度判断口径、外部采用信号、学习价值、直接采用价值与工程成熟度。
- evidence_priority: 官方 changelog、目录站、npm signal、repo signal、independent benchmark、security / clone risk。
- difficulty_focus: 弱信号叠加、负效果、clone inflation、trust boundary 与推荐表达。
- trend_question: skill 生态是否已经形成公开发现、学习、安装、审计与采用链路。
- stop_assessment_focus: 快速扫描附录不替代主推荐结构。

### 研究线 04：skill-optimization-and-feedback-loops

- registry_ref: `PLAN_PATH -> 研究线注册表（topic registry） -> 04/skill-optimization-and-feedback-loops`
- wave1_deepen_focus: 固定 skill artifact 级持续优化、failure taxonomy、eval / replay / regression loop、feedback loop 与 runner prototype。
- evidence_priority: skill-forge artifact optimization、trigger/description tuning、Promptfoo trajectory regression、LangSmith feedback loop、DSPy optimizer、OpenAI eval flywheel、本地 gstack eval harness。
- difficulty_focus: 不把 skill optimization 退化成 prompt tuning；区分 artifact、trigger、workflow、tool contract、feedback loop 与 human-in-the-loop 边界。
- trend_question: skill 发布后是否需要 deterministic regression gate 与真实 adapter 运行，而不是只靠作者感觉。
- stop_assessment_focus: mock runner 已证明 promotion blocking 语义；JSON output、configurable matcher 与 real Codex adapter 是后续可选深化。

## 成功标准（post-pass success state）

达到下面状态，才算真正满足目标：

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference` 中有一批高可信、可追溯的 ground truth 文档。
- 每条研究线至少形成一组可复用证据包，而不是临时搜索结果。
- 对每条研究线都能解释机制、趋势和难点。
- 每个重要判断都能追溯到本地 reference 文档。
- 对趋势、难度、争议都有专门证据，而不是顺手一提。
- 可以明确说清楚哪些问题不是没做，而是被主动 `suspend` 或 `archive`，以及为什么。
- 后续新的 agent 接手时，只看 `SEED_DIR + REFERENCE_DIR + ARTIFACT_DIR + STATUS_PATH + QUEUE_PATH` 就能继续往下研究。

## Hard Gates（可选）

本轮 `hard_gates_enabled = no`，不叠加额外 Hard Gates。
