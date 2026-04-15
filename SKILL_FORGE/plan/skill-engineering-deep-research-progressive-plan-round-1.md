# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）

> 执行状态（动态更新）：见 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`

- `template_version`：`v6`
- `round_label`：`一轮`
- `main_task`：`扩事实 + 补机制 + 补限制 + 拓扑迁移后重开`

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

- 系统性：覆盖方法论、工程链路、生态验证、持续优化闭环四个层面
- 逻辑性：每个关键判断都能回指到本地 reference 文档
- 一致性：跨 topic 的术语、对象分类、评估维度保持统一
- 专业可读：默认读者熟悉 agent、repo、workflow，不接受泛泛而谈

因此，每一个进入 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference` 的文档、每一条写回 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/*.md` 的判断，都必须回答：

> 这条内容是否直接支撑最终的对象比较、推荐判断或 workflow 建议？如果不能，它就不该存在。

权威信源优先规则（最高优先级，不可违反）：

> 当权威一手来源已经足以支撑某个判断时，不为满足配额额外引入低质量二手来源。配额是防止搜太浅的下限，不是必须凑满的目标。宁缺毋滥。

## 先反省：当前版本为什么还不够

### 1. Skill 定义与边界虽然已有较强共同层，但 portable core 与 surface-specific extension 的界线还未彻底稳定

当前已有证据已足以说明 `SKILL.md`、metadata、progressive disclosure、repo-level guidance 等共同层存在，但跨 GitHub / Claude / Codex 的字段与运行边界仍未彻底收束。这会直接影响后续对“什么可迁移、什么是平台特性”的判断。

### 2. 候选对象的工程职责虽然已基本拆开，但 lifecycle baseline 还缺发布后持续优化这一段

当前对 loader、sample library、audit / governance、distribution、registry 的职责边界已经更清楚，但“发布后如何持续评测、回放、修订和验证”仍未形成独立研究线，因此 workflow baseline 仍缺后半段。

### 3. 生态信号已有较强积累，但最终推荐仍未吸收“持续优化能力”这一维度

当前外部采用、学习杠杆、安全边界、社区回声已有较多材料，但如果不把 skill continuous optimization 纳入独立维度，最终推荐会偏向“谁好写、好装、好看”，而不是“谁更能支撑长期迭代”。

### 4. 旧版 round-1 拓扑只有 3 条研究线，已经无法覆盖新进入 scope 的独立问题簇

`skill-continuous-optimization.md` 已经形成独立对象清单、独立问题簇和独立工件需求。继续把它口头当作补充段落，会让 plan、status 与实际研究对象失真。

### 5. 旧状态文件把 round-1 视为 `deliverable_ready`，与新增 `new_topic` 后的真实研究状态冲突

既有 `01-03` 的成果仍然有效，但整轮已不应继续宣称“完成”，因为 `04` topic 尚未正式启动，其缺口会直接影响最终 baseline 和推荐结论。

## 目标

针对 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics` 中的 `4` 条研究线，各做一轮更深入的 Deep Research。

这一轮不是重复已有摘要，而是要系统扩大：

- 内容广度
- 证据密度
- 根本机制理解
- 趋势判断
- 难度分层
- 现实约束与失败模式

同时，把搜到的高价值材料沉淀到：

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference`

这些材料要作为后续分析的 ground truth，而不是临时浏览痕迹。

## 手段策略

本轮研究采用“先建地基，再分题深挖，再横向综合，最后检验最终产出可用性”的递进策略。

具体分为三个波次（Wave 0 → Wave 1 → Wave 2），加一个最终验收检查点（Readiness Check）。

每个波次都有明确的最低标准，不满足则不进入下一波次。

## 验收标准：如何判断调研结果质量合理

调研完成的判断不依赖“感觉搜够了”，而是对照下面 4 个维度逐项检查：

### 1. 证据可追溯性

- 每个关键判断都能回指到 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference` 中的具体文档
- 没有悬空结论
- 没有孤立来源

### 2. 覆盖完整性

- 每条研究线的固定问题都已有证据支撑
- 趋势、难度、争议三类内容各有专门证据
- 已完成至少一轮“官方说法 vs 第三方验证 / 实践证据 / 失败模式”交叉核验

### 3. 跨主题一致性

- 同一概念在不同研究线下定义口径一致
- 不同研究线之间的交叉结论已经对齐或已明确标注分歧
- 已区分“硬事实”“分析判断”“趋势推测”

### 4. 最终产出可用性（最终验收）

执行完成后，必须能通过以下检查：

- 任意一个重要判断都能在 `30` 秒内找到本地支撑文档
- 对每条研究线都能写出一段“机制 + 趋势 + 难点”的连贯叙述，不需要临时补搜
- 跨研究线能写出一段“整体结构是什么”的综合判断，而不只是平行描述
- 一位没有参与调研的专业人士，只看 `SEED_DIR + REFERENCE_DIR + STATUS_PATH`，能理解研究结论并继续往下走

如果以上任一条不满足，调研不算完成。

## 输入

本轮研究直接以 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics` 为起点。

输入对象包括：

- 目录中的 topic seed 文件
- 目录中的已有摘要 / 初步判断 / 问题清单
- 上一轮留下的 `_artifacts` 与相关本地 `_reference`

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

只有研究线注册表稳定后，才允许进入 Wave 0。

## 当前拓扑与 Formalization Ledger

### Current Topology

- `topic_count`：`4`
- `carry_forward_topics`：
  - `01 / skill-methodology-and-spec`
  - `02 / skill-toolchain-and-lifecycle`
  - `03 / ecosystem-signals-and-adoption`
- `new_topics`：
  - `04 / skill-optimization-and-feedback-loops`
- `topology_status`：`recently_changed`

### Formalization Ledger

- `candidate`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/_raw_idea/skill-continuous-optimization.md`
  - `current_classification`：`new_topic`
  - `why`：它已形成独立问题簇、独立对象边界和独立工件需求，无法继续安全归并为 `01/02/03` 的局部补件
  - `next_action`：已同步 topic seed、topic registry、plan 与 status；后续进入 `04` 的 Wave 1 深挖

## 参数与目录约定

- `PLAN_NAME`：`面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）`
- `TEMPLATE_VERSION`：`v6`
- `ROUND_LABEL`：`一轮`
- `SEED_DIR`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics`
- `REFERENCE_DIR`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference`
- `ARTIFACT_DIR`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts`
- `PLAN_PATH`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md`
- `STATUS_PATH`：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- `FINAL_DELIVERABLE`：`一套面向 coding agent 的 skill engineering 研究基座，足以支撑候选筛选、横向比较、推荐结论与 workflow baseline 建议`
- `AUDIENCE`：`项目主研究者、后续协作 agent、技术背景读者`
- `TOPIC_COUNT`：`4`
- `WAVE0_SHARED_DOC_FLOOR`：`8`
- `WAVE1_DOC_FLOOR_PER_TOPIC`：`8`
- `PRIMARY_SOURCE_FLOOR`：`4`
- `SECONDARY_SOURCE_FLOOR`：`2`
- `RECENT_SOURCE_FLOOR`：`1`
- `LIMITATION_SOURCE_FLOOR`：`1`

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

### 04 / skill-optimization-and-feedback-loops / Skill 持续优化、评测闭环与反馈回流

- `seed_files:`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/04-skill-optimization-and-feedback-loops.md`
- `current_hypothesis:`
  - Skill optimization 的真实对象是完整 artifact，而不是单段 prompt；可迁移的 skill workflow baseline 必须包含失败样本、eval / replay / regression 与反馈回流闭环。
- `why_it_matters:`
  - 这一线负责补齐 skill engineering 从“可写、可装、可发”走向“可持续变好”的后半程能力。
- `must_answer:`
  - skill 持续优化的对象边界是什么，为什么不能等同于 prompt tuning
  - 发布后的失败信号如何分类、沉淀、回流
  - 最小 eval / replay / regression loop 应如何定义
  - 哪些优化环节适合自动化，哪些必须 human-in-the-loop
  - 如何判断一次 skill 修订是真的提升，而不是换一种失败方式

## 输出

本轮执行后应至少形成下面 5 类资产：

### 1. Ground truth 参考材料

存放位置：

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference`

形式：

- 每个高价值来源单独存成一个 `md`
- 关键事实与核心摘录合起来应足以支撑后续推理，不要求回原文才能使用
- 完成单位不是“看过链接”，而是“已被整理成可复用、可回指的本地 reference 文档”

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
- 一份横向综合 `W2-cross-topic-synthesis.md`
- 一份 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/_INDEX.md`

### 4. 跨主题综合结论

最终需要能够横向回答：

- 哪些是基础层事实
- 哪些是局部主题内成立的判断
- 哪些结论跨主题成立
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

这轮 Deep Research 采用“先共享地基，再分题深挖，再横向综合”的结构。

### Wave 0：建立共同 ground truth 地基

- `purpose`：固定共享术语、共享对象分类、共享高可信入口，避免 `4` 条研究线各自从零开始。
- `focus`：不急着排序，先把后续会反复用到的硬事实落进 `_reference`。

Wave 0 完成最低标准：

- 至少沉淀 `8` 份共享型 ground truth 文档
- 至少包含一份安全 / 限制 / 失败模式材料
- 至少包含一份高质量对比、实践复盘或失败分析
- `REFERENCE_DIR`、`ARTIFACT_DIR`、`STATUS_PATH` 已初始化

只有 Wave 0 达标，才进入 Wave 1。

### Wave 1：按研究线分别深挖

- `purpose`：把每条研究线从“名称和观点”推进到“机制和证据”。
- `focus`：围绕证据、机制、趋势、难度、争议，把每条线打深到可复用证据包。

每条研究线在 Wave 1 的最低交付标准：

- 至少 `8` 份该研究线专属的 ground truth 文档
- 至少 `4` 份一手来源
- 至少 `2` 份高质量二手分析
- 至少 `1` 份近期趋势来源
- 至少 `1` 份限制、失败或争议来源
- 每条研究线都必须形成一份 `evidence-summary` 与一份 `question-list`

对新增 `04` topic，额外要求：

- 至少形成一版 failure taxonomy 草案
- 至少形成一版最小 eval / replay / regression loop baseline

### Wave 2：横向比对与综合判断

- `purpose`：把分题结果重新收束成整体结构与跨主题判断。
- `focus`：回答哪些结论是共享底层事实，哪些只是 topic 局部差异，哪些对象值得长期追踪。

Wave 2 的最低标准：

- 每个横向判断都能回指到具体 `_reference/*.md`
- 每条研究线至少有 `2` 个与其他研究线交叉验证的结论
- 明确区分“硬事实”“分析判断”“趋势推测”
- `04` 的结论已被吸收进最终 workflow baseline 与推荐语法

### Readiness Check：最终验收闸门

通过信号：

- 任意一个重要判断都能在 `30` 秒内找到本地支撑文档
- 对每条研究线都能讲清“机制 + 趋势 + 难点”
- 横向综合已经形成整体结构判断
- 新接手者只看 `SEED_DIR + REFERENCE_DIR + ARTIFACT_DIR + STATUS_PATH` 就能继续推进

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
- captured_excerpt:
- claims_supported:

## 关键事实

## 核心内容摘录

## 与本研究的关系

## 可直接引用的术语 / 概念

## 风险与局限
```

命名规范：

- 共享地基：`00-shared-<source-slug>.md`
- `01` 研究线：`01-skill-methodology-and-spec-<source-slug>.md`
- `02` 研究线：`02-skill-toolchain-and-lifecycle-<source-slug>.md`
- `03` 研究线：`03-ecosystem-signals-and-adoption-<source-slug>.md`
- `04` 研究线：`04-skill-optimization-and-feedback-loops-<source-slug>.md`

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

对 `suspend` 分支，必须至少记录：

- 已推进到哪里
- 为什么挂起
- 已确认了什么 / 仍未确认什么
- 什么新材料会触发重开

## 研究线的具体目标

### 研究线 01：Skill 方法论与规范接口

研究目标：

- 固定 skill 的定义边界、结构共同层和跨 surface 的最小工作标准
- 区分 portable core 与 surface-specific extension

### 研究线 02：Skill 工程化工具链与生命周期

研究目标：

- 固定 lifecycle segmentation 与对象职责边界
- 判断单一基座与组合式 baseline 的合理性

### 研究线 03：生态信号、可信度与采用判断

研究目标：

- 固定可信度判断口径与推荐表达方式
- 区分学习价值、采用价值与工程成熟度

### 研究线 04：Skill 持续优化、评测闭环与反馈回流

研究目标：

- 固定 skill continuous optimization 的对象边界
- 建立 failure taxonomy、最小 eval loop 与 human-in-the-loop 修订边界

## 停止条件

每条研究线只有同时满足下面条件，才能算第一轮搜集完成：

- 核心对象清单已经稳定，不再持续新增关键名字
- 新搜到的材料大多在重复已知事实，而不是贡献新信息
- 该研究线的固定问题都已经有证据支撑
- 至少有 `1` 轮对“反例、限制、争议”的专门补搜
- 已完成一次“官方说法 vs 第三方验证 / 实践证据 / 失败模式”交叉核验
- 所有重要但未解的问题，都已经被明确归类为 `继续追`、`suspend`、`archive` 或 `redirect`

如果还没有达到这些条件，就不能草率进入总结。
