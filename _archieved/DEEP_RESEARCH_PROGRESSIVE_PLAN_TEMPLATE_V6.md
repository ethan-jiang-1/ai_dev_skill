# Deep Research Progressive Plan Template

> template_version: `v6`
> 用途：把“给定一个 seed 目录，围绕其中若干初步 topic / opinion 做逐轮 Deep Research，并让本地知识库持续生长”的方法，实例化为某一轮可执行 plan。
>
> 强约束：本模板默认必须配套生成一个状态文件：`<PLAN_BASENAME>.status.md`

## 适用场景

这个模板不是普通研究提纲模板，也不打算覆盖所有研究类型。

默认服务于科学研究、工程技术、技术选型、technical best practice，以及技术机制 / 趋势 / 约束 / 失败模式研究。

如果主题明显偏向文学研究、泛人文评论、纯创作分析或高主观性文本解读，建议另做实例化或变体，而不是继续泛化主模板。

它适用于下面这种工作流：

- 输入是一个指定目录
- 目录里有 1 到 N 份初步 topic seed、已有摘要、候选判断、问题清单或路线假设
- 本轮任务不是重写这些 seed，而是围绕它们继续深挖
- 深挖的目标不是“多搜链接”，而是把一套可靠的本地 ground truth、机制理解、趋势判断、难点与反例逐步沉淀下来
- 本轮结束后，输入目录本身会长出新内容，同时新增一批本地 reference 文档与 artifacts，供下一轮继续往下走

这个模板要保留的核心，不是某个具体主题，而是下面这套方法论：

- 先证据，后综合
- 先共享地基，再分题深挖，再横向收束
- 以“本地可复用落库”作为完成单位，而不是以“看过网页”作为完成单位
- 以“停止条件”和“Readiness Check”替代“感觉搜够了”
- 以 `Suspended Branch Protocol` 处理高难但暂不可得的问题，默认 `human on the loop`，不让同步人工反馈阻塞主线
- 让输入目录持续生长，而不是每轮都另起一堆无法承接的报告

## 先填这些参数

复制本模板前，先明确下面这些参数：

- `PLAN_NAME`：这轮计划的名称
- `TEMPLATE_VERSION`：本轮实例化所继承的模板版本，默认直接抄写模板顶部的 `template_version`
- `ROUND_LABEL`：例如 `一轮`、`二轮`、`第三轮`
- `SEED_DIR`：本轮的输入目录
- `REFERENCE_DIR`：本轮落 ground truth 的目录，默认建议直接设为 `<SEED_DIR>/_reference`
- `ARTIFACT_DIR`：本轮 artifacts 目录，通常是 `<SEED_DIR>/_artifacts`
- `PLAN_PATH`：具体计划文件路径
- `STATUS_PATH`：状态文件路径
- `FINAL_DELIVERABLE`：这轮调研最终服务于什么产出
- `AUDIENCE`：谁会读最终产出
- `TOPIC_COUNT`：这轮最终拆成几条研究线
- `TOPIC_REGISTRY`：每条研究线的编号、slug、标题、seed 来源、初步假设、必须回答的问题
- `WAVE0_SHARED_DOC_FLOOR`：Wave 0 共享资料最低配额
- `WAVE1_DOC_FLOOR_PER_TOPIC`：每条研究线的最低文档配额
- `PRIMARY_SOURCE_FLOOR`：每条研究线一手来源最低配额
- `SECONDARY_SOURCE_FLOOR`：每条研究线高质量二手来源最低配额
- `RECENT_SOURCE_FLOOR`：每条研究线近期趋势来源最低配额
- `LIMITATION_SOURCE_FLOOR`：每条研究线限制 / 争议 / 失败模式来源最低配额

默认建议值：

- `WAVE0_SHARED_DOC_FLOOR = max(8, TOPIC_COUNT * 2)`
- `WAVE1_DOC_FLOOR_PER_TOPIC = 8`
- `PRIMARY_SOURCE_FLOOR = 4`
- `SECONDARY_SOURCE_FLOOR = 2`
- `RECENT_SOURCE_FLOOR = 1`
- `LIMITATION_SOURCE_FLOOR = 1`

如果研究范围明显更窄或更宽，可以改，但必须在具体 plan 中显式写清楚为什么改。

目录初始化强约束：

- 在正式开始 Wave 0 之前，必须先创建 `REFERENCE_DIR`、`ARTIFACT_DIR` 与 `STATUS_PATH`
- 如果没有特殊原因，`REFERENCE_DIR` 就直接使用 `<SEED_DIR>/_reference`
- 如果没有特殊原因，`ARTIFACT_DIR` 就直接使用 `<SEED_DIR>/_artifacts`
- 只有在确有必要时，才把 `REFERENCE_DIR` 或 `ARTIFACT_DIR` 放到 `SEED_DIR` 之外；一旦这样做，必须在 plan 中解释原因
- 无论目录放在哪里，都必须保证接手者能在 30 秒内定位到本轮 reference、artifacts 与 status

## 实例化规则

在把模板变成某一轮具体 plan 时，先做 4 件事：

1. 从 `SEED_DIR` 中抽出 topic registry，而不是直接拿目录名代替研究结构。
2. 为每条研究线分配稳定编号和 slug，确保后续 `reference` 与 `artifacts` 命名可以长期延续。
3. 明确这轮是“扩事实”“补机制”“补趋势”“补限制”中的哪一种主任务，避免每轮都写成泛泛而谈。
4. 明确这轮的输入即输出：本轮结束后，`SEED_DIR` 不是保持原样，而是要作为 living docs 被更新。

建议把 topic registry 先整理成下面这种形式：

```md
- 01 / <topic-slug-1> / <topic-title-1>
  - seed_files:
  - current_hypothesis:
  - why_it_matters:
  - must_answer:

- 02 / <topic-slug-2> / <topic-title-2>
  - seed_files:
  - current_hypothesis:
  - why_it_matters:
  - must_answer:
```

只有 topic registry 稳定后，再开始写具体 progressive plan。

## Topology Formalization Gate

这是 `v6` 相比旧模板新增的保守补件，用于处理中途 scope 变化。

当新的研究对象进入 scope 时，必须显式判断它属于下面哪一类：

- `shared_extension`
- `local_extension`
- `new_topic`

判定原则：

- 如果它横穿多条研究线，但当前主要价值仍是重写现有 topic 边界，优先判成 `shared_extension`
- 如果它只补某条研究线的局部问题，判成 `local_extension`
- 如果它已经形成独立问题簇、独立对象清单、独立工件需求，判成 `new_topic`

一旦判成 `new_topic`，必须在进入下一波次前同步下面对象：

- `PLAN_PATH`
- `STATUS_PATH`
- `TOPIC_REGISTRY`
- 输入目录中的 topic 索引文件（如 `topics/README.md`）
- 新 topic seed 文件

不允许继续一边按旧拓扑推进，一边口头承认“这其实已经是新 topic”。

## Path Is Not Status

这是 `v6` 相比旧模板新增的保守补件，用于避免把存储路径误当研究优先级。

文件被放在下面这些路径里，不代表它在研究语义上就是低优先级附录：

- `_archive/`
- `additional/`
- `draft/`
- `misc/`
- `notes/`

目录路径只是存储位置，不是研究状态。

是否是正式研究对象、共享地基或低优先级补件，必须由研究判断和用户意图共同决定，而不是由路径名偷换。

---

## 可直接复制的 Plan Skeleton

把下面整段复制出来，再替换占位符：
从下一行 `# <PLAN_NAME>` 开始，到 `## 配套 Status File Skeleton` 之前，都是 plan skeleton 正文。

# <PLAN_NAME>

> 执行状态（动态更新）：见 `<STATUS_PATH>`

- `template_version`：`<TEMPLATE_VERSION>`

## 调研的根本目的

这轮 Deep Research 不是为了产出调研笔记本身。

真正的目的是：为 `<FINAL_DELIVERABLE>` 提供可靠的原材料地基。

最终产出的读者是：`<AUDIENCE>`

这份最终产出至少要满足下面要求：

- 系统性：覆盖关键维度，不遗漏，不失衡
- 逻辑性：每个判断都有证据支撑，推理链条可追溯
- 一致性：跨主题术语统一、口径统一、评估框架统一
- 专业可读：默认读者是专业人士，不需要手把手解释，但需要准确、严谨、无歧义

因此，每一个进入 `<REFERENCE_DIR>` 的文档、每一条写入 `<SEED_DIR>` 的判断，都必须问自己：

> 这条内容能直接支撑最终产出的哪个论点？如果不能，它就不该存在。

权威信源优先规则（最高优先级，不可违反）：

> 当权威一手来源已经足以支撑某个判断时，不为满足配额额外引入低质量二手来源。配额是防止搜太浅的下限，不是必须凑满的目标。宁缺毋滥。

## 先反省：当前版本为什么还不够

[这里必须写 3 到 5 条具体缺口。不要写“还不够全面”这种空话，要写“哪类判断还悬空、缺什么证据、为什么影响最终产出”。]

### 1. <Gap 1>

### 2. <Gap 2>

### 3. <Gap 3>

### 4. <Gap 4，可选>

### 5. <Gap 5，可选>

## 目标

针对 `<SEED_DIR>` 中的 `<TOPIC_COUNT>` 条研究线，各做一轮更深入的 Deep Research。

这一轮不是重复已有摘要，而是要系统扩大：

- 内容广度
- 证据密度
- 根本机制理解
- 趋势判断
- 难度分层
- 现实约束与失败模式

同时，把搜到的高价值材料沉淀到：

- `<REFERENCE_DIR>`

这些材料要作为后续分析的 ground truth，而不是临时浏览痕迹。

## 手段策略

本轮研究采用“先建地基，再分题深挖，再横向综合，最后检验最终产出可用性”的递进策略。

具体分为三个波次（Wave 0 → Wave 1 → Wave 2），加一个最终验收检查点（Readiness Check）。

每个波次都有明确的最低标准，不满足则不进入下一波次。

## 验收标准：如何判断调研结果质量合理

调研完成的判断不依赖“感觉搜够了”，而是对照下面 4 个维度逐项检查：

### 1. 证据可追溯性

- 每个关键判断都能回指到 `<REFERENCE_DIR>` 中的具体文档
- 没有悬空结论
- 没有孤立来源

### 2. 覆盖完整性

- 每条研究线的固定问题都已有证据支撑
- 趋势、难度、争议三类内容各有专门证据
- 已完成至少一轮“官方说法 vs 第三方验证 / 实践证据 / 事故复盘”交叉核验

### 3. 跨主题一致性

- 同一概念在不同研究线下定义口径一致
- 不同研究线之间的交叉结论已经对齐或已明确标注分歧
- 已区分“硬事实”“分析判断”“趋势推测”

### 4. 最终产出可用性（最终验收）

执行完成后，必须能通过以下检查：

- 任意一个重要判断都能在 30 秒内找到本地支撑文档
- 对每条研究线都能写出一段“机制 + 趋势 + 难点”的连贯叙述，不需要临时补搜
- 跨研究线能写出一段“整体结构是什么”的综合判断，而不只是平行描述
- 一位没有参与调研的专业人士，只看 `<SEED_DIR> + <REFERENCE_DIR>`，能理解研究结论并继续往下走

如果以上任一条不满足，调研不算完成。

## 输入

本轮研究直接以 `<SEED_DIR>` 为起点。

输入对象包括：

- 目录中的 topic seed 文件
- 目录中的已有摘要 / 初步判断 / 问题清单
- 上一轮留下的 `_artifacts` 与相关本地 `_reference`（如果存在）

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

推荐结构：

- `<NN>` / `<topic-slug>` / `<topic-title>`
  - `seed_files:`
  - `current_hypothesis:`
  - `why_it_matters:`
  - `must_answer:`

只有研究线注册表稳定后，才允许进入 Wave 0。

## 当前拓扑与 Formalization Ledger

这是 `v6` 在 plan 正文中新增的一节，目的是把拓扑状态显式化，而不是只存在执行者脑中。

至少写清楚：

- 当前 topic 总数
- 哪些是稳定 carry-forward topics
- 哪些是本轮新增 topics
- 最近一次 topology change 是什么
- 当前是否还有待升级为正式研究对象的内容

推荐结构：

```md
## Current Topology

- topic_count:
- carry_forward_topics:
- new_topics:
- topology_status: `stable / formalizing / recently_changed`

## Formalization Ledger

- candidate:
  - current_classification: `shared_extension / local_extension / new_topic`
  - why:
  - next_action:
```

## 输出

本轮执行后应至少形成下面 5 类资产：

### 1. Ground truth 参考材料

存放位置：

- `<REFERENCE_DIR>`

形式：

- 每个高价值来源单独存成一个 `md`
- 不追求全文镜像，但要求硬核内容自给自足：关键事实 + 核心内容摘录两节加起来，应足以让读者不回原文就能用这份 reference 支撑推理
- 所有辛苦收集到、后续推理会反复用到的重要内容，都必须真正落进 `<REFERENCE_DIR>`，不能只停留在浏览记录、聊天上下文或零散笔记里
- `REFERENCE_DIR` 的完成单位不是”看过这个链接”，而是”这个链接已经被整理成可复用、可回指、可自给自足的独立 `md` 文档”

### 2. 输入目录的持续生长

`<SEED_DIR>` 不是只读输入，而是这轮研究的 living output。

每条研究线对应的 seed 文件都应被更新，新增：

- 本轮新增证据
- 本轮新增机制理解
- 本轮新增趋势与难点
- 当前判断

### 3. 过程性 artifacts

存放位置：

- `<ARTIFACT_DIR>`

至少包括：

- 每条研究线一份 `evidence-summary`
- 每条研究线一份 `question-list`
- 一份横向综合 `W2-cross-topic-synthesis`
- 一份 `<REFERENCE_DIR>/_INDEX.md` 作为快速回指入口

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
<!-- 每条新增事实都带 <REFERENCE_DIR>/*.md 回指 -->

## 本轮新增机制理解
<!-- 从描述上升到为什么这样设计 -->

## 本轮新增趋势与难点
<!-- 有时间证据支撑的趋势 + 实践难点与失败模式 -->

## 当前判断（本轮综合后）
<!-- 综合历史内容与本轮新增后的判断，每条判断带本地回指 -->
```

规则：

- 历史摘要不删改，只保留
- 所有本轮新增内容进入固定章节
- 每条新增关键判断都必须带本地回指
- 如果某个判断被本轮推翻或修正，在“当前判断”中注明，不删除旧内容

## 总体策略

这轮 Deep Research 不建议在共享地基未稳定前，就把所有研究线完全割裂后并行暴力搜索。

更稳的做法是：

- 先共享地基
- 再分题深挖
- 再横向综合

### Wave 0：建立共同 ground truth 地基

- purpose: 固定共享地基、共同术语和高可信入口，避免各研究线各自从零开始。
- focus: 这一波不急着下结论，先把后续多条研究线都会反复用到的硬事实固化到 `<REFERENCE_DIR>`。

Wave 0 完成的最低标准：

- 至少沉淀 `<WAVE0_SHARED_DOC_FLOOR>` 份共享型 ground truth
- 其中大多数来自官方文档、官方仓库、官方规范或高可信研究
- 至少 1 份来自安全 / 限制 / 约束相关材料
- 至少 1 份来自高质量对比、实践复盘或失败分析
- `<REFERENCE_DIR>`、`<ARTIFACT_DIR>` 与 `STATUS_PATH` 已经先被初始化，而不是边搜边临时决定放哪

只有 Wave 0 达标，才进入 Wave 1。

### Wave 1：按研究线分别深挖

- purpose: 把每条研究线从“名称和观点”推进到“机制和证据”。
- focus: 围绕证据、机制、趋势、难度、争议，把每条线打深到可复用证据包。

每条研究线都要从同样 5 个视角继续扩展：

- 证据：关键事实有没有一手来源支撑
- 根本：背后的真正抽象或机制是什么
- 趋势：最近在往哪个方向演化
- 难度：采用、维护、迁移、学习的难点在哪
- 争议：社区意见分歧、局限、失败模式是什么

每条研究线在 Wave 1 的最低交付标准：

- 至少 `<WAVE1_DOC_FLOOR_PER_TOPIC>` 份该研究线专属的 ground truth 文档
- 至少 `<PRIMARY_SOURCE_FLOOR>` 份一手来源
- 至少 `<SECONDARY_SOURCE_FLOOR>` 份高质量二手分析
- 至少 `<RECENT_SOURCE_FLOOR>` 份能体现趋势变化的近期来源
- 至少 `<LIMITATION_SOURCE_FLOOR>` 份能体现限制、失败或争议的来源

每条研究线都必须形成一份“证据摘要”和一份“问题清单更新”。

对新增 `new_topic`，建议额外至少满足下面两条：

- 至少 1 份首批专属 reference
- 至少 1 份首批专属 artifact

### Wave 2：横向比对与综合判断

- purpose: 把分题结果重新收束成整体结构和跨主题判断。
- focus: 回答哪些是共享底层事实、哪些只是局部差异、哪些抽象值得长期追踪。

把多条研究线重新收回来，做交叉问题判断：

- 哪些是共享基础层事实
- 哪些只是入口层或表现层差异
- 哪些对象值得长期追踪
- 哪些抽象是真正可迁移的

Wave 2 的最低标准：

- 每个横向判断都能回指到具体 `<REFERENCE_DIR>/*.md`
- 每条研究线至少有 2 个与其他研究线发生交叉验证的结论
- 明确区分“硬事实”“分析判断”“趋势推测”

### Readiness Check：最终验收闸门

- purpose: 判断这轮研究是否已经可交付、可接手、可停止。
- pass signal:
  - `30` 秒可回指
  - 每条研究线都能讲清“机制 + 趋势 + 难点”
  - 横向综合已能形成整体结构判断
  - 新接手者只看 `<SEED_DIR> + <REFERENCE_DIR> + <ARTIFACT_DIR> + <STATUS_PATH>` 就能继续推进

## 证据采集协议

`<REFERENCE_DIR>` 里的每个 `md` 建议遵循统一结构：

```md
# 标题

- source_url:
- source_type:
- accessed_at:
- related_topic:
- trust_level: (official / academic / practitioner / community)
- why_it_matters:
- captured_excerpt: (yes / no / partial)

## 关键事实

## 核心内容摘录

## 与本研究的关系

## 可直接引用的术语 / 概念

## 风险与局限
```

### `## 核心内容摘录` 写法规则

定位：这一节是源头内容的"硬核精华提取"，目标是让读者不回 URL 就能把这份 reference 当作该来源的权威本地替代。

写什么：

- 关键论证链条和推理逻辑（不只是结论，要保留"为什么"）
- 重要数字、参数、阈值、性能指标（带原文上下文）
- 关键表格、对比矩阵、分层结构的忠实摘录（尽量保留原始格式）
- 方法论要点、实验设计、测试条件
- 重要的原文段落直接引用（用 blockquote `>` 标注，注明原文位置）
- 事故 / 案例的关键时间线和因果链
- 标准 / 规范的条款级摘要（保留条款编号）

不写什么：

- 不做二次解读或评论（那是 seed 文件和 artifacts 的事）
- 不重复 `## 关键事实` 已经覆盖的要点摘要
- 不抄录与本研究无关的背景铺垫
- 不整段复制纯文学性描述或营销话术

篇幅指引（按来源价值弹性控制）：

- 高价值一手来源（official / academic）：500–1500 字，保留论证链、关键数字、表格、原文引用
- 中等价值来源（practitioner）：200–500 字，聚焦最硬核的段落
- 低价值来源：可留空，注明"关键事实已充分覆盖，无需额外摘录"

忠实度要求：

- 摘录必须忠实于原文，不改写不美化
- 如果是翻译，标注原文语言（如 `原文语言: English`）
- 数字和术语必须与原文一致，不做单位换算或近似处理
- 如果原文有歧义或矛盾，如实记录，不擅自取舍

`captured_excerpt` 字段说明：

- `yes`：核心内容已充分摘录，后续使用时不需要回看原文
- `partial`：部分关键内容已摘录，但仍有值得补充的段落（通常因为来源内容量大或访问受限）
- `no`：未做摘录（仅适用于低价值来源，且 `## 关键事实` 已充分覆盖）

补充建议字段：

- `claims_supported:`
- `date_scope:`
- `related_entities:`

命名建议：

- `00-shared-<source-slug>.md`
- `<NN>-<topic-slug>-<source-slug>.md`

其中 `<NN>` 与 `<topic-slug>` 来自研究线注册表。

额外硬约束：

- 每个进入最终推理链条的重要来源，都必须在 `<REFERENCE_DIR>` 中有自己独立的一份 `md`
- 不允许把多个关键来源随手混写成一页，导致后续无法精确回指
- 不允许只在 `_artifacts` 或 seed 文件里留下摘要，而不把原始证据整理进 `<REFERENCE_DIR>`
- 如果某条内容“辛苦搜到了、后面还会反复用”，默认就应该落库到 `<REFERENCE_DIR>`

## 已验证的高杠杆执行行为（写入计划，必须遵守）

- 以“证据落库”为单位推进：每一次有效探索都必须落为 `<REFERENCE_DIR>/*.md`，否则视为未完成
- 以“对象清单稳定”为停止前提：围绕同一研究线持续扩对象与对照面，直到核心对象清单稳定
- 以“下钻到机制”为深挖目标：关键对象不只看 README，还要沿 docs → schema / code / issue / 反例逐级下钻
- 以“边取证边回填”避免集成债：新增证据落库后立刻回填到对应 seed 文件和 `<ARTIFACT_DIR>` 中
- 以“持续自校验”保证 30 秒可回指：每个波次结束后都做一次回指完整性检查，并维护 `<REFERENCE_DIR>/_INDEX.md`
- 无外部阻塞时按 Wave / Step 检查点持续自主推进，不停下来汇报、不等临时反馈、不请求确认（详见下方 `自主执行协议`）

## 自主执行协议（Autonomous Execution Protocol）

这一节是本模板的核心协议，目的是让长程研究任务真正做到自主推进、最少干扰用户。

### 1. 默认模式：静默自主推进

- 长程任务的默认执行模式是：按 Wave / Step 检查点持续推进，状态写入 status 文件，不主动停下来向用户汇报或等待确认
- status 文件就是汇报机制——用户想看进度时自己去读 status 文件，agent 不需要停下来念给用户听
- 每完成一个有意义的步骤（一份 reference 落库、一条研究线完成、一个波次达标），更新 status 文件后立刻继续下一步
- 默认推进粒度是“连续把整段主链往前跑”，不是“做一小步就回话”

### 2. 允许中断用户的条件（穷举，仅此四种）

只有在下面四种情况之一成立时，才允许主动中断用户：

- **主线阻塞且无法绕开**：整条主线（不是单个分支）被阻塞，且无法通过 `suspend` 绕开。单个研究线或单个分支卡住不算主线阻塞。
- **研究方向需要根本性调整**：发现核心假设错误、研究线注册表需要重大改动、或最终产出定义需要变更。"补证据""扩对象""换搜索策略"不算根本性调整。
- **涉及高风险、不可逆或难回滚操作**：如果下一步会带来高风险真实动作、难以回滚的写入、或其他不可逆成本，允许在执行前中断用户确认。
- **用户明确要求实时协同**：用户在本轮计划中显式写明需要实时反馈的场景。

### 3. 不允许中断用户的情况（显式列出）

以下情况必须自行处理，不得停下来请示或汇报：

- Wave 之间的过渡——直接推进，不需要确认
- 单个研究线的配额达标或完成——写 status，继续下一条
- 发现某个分支需要 suspend——按 Suspended Branch Protocol 登记后继续推进
- 证据配额全部达标——继续推进到停止条件，不需要汇报
- 遇到搜索困难但可以绕开——绕开后继续
- 发现新的高价值方向——自行判断是否值得追，追完落库即可
- 某条研究线的停止条件已满足——更新 status，推进下一条或进入 Wave 2
- 某个新 topic 已经被判成 `new_topic`，需要同步 registry / seed / status——这是结构同步，不是需要请示的理由
- Readiness Check 某项未通过——自行判断是继续补还是 suspend，然后继续

### 4. 进度可见性靠文件，不靠对话

- status 文件是唯一的进度沟通机制，必须实时更新
- worklog 持续追加，每个有意义的步骤都留记录
- 用户随时可以读 status 文件了解当前进度、阻塞、缺口和挂起分支
- agent 不需要在对话中重复 status 文件已经记录的内容
- 如果用户主动询问进度，可以简要回答，但默认不主动发起进度汇报

### 5. 与 Human-on-the-loop 原则的关系

- 旧模板的 human-on-the-loop 原则保留不变
- 进一步明确：on-the-loop 的"loop"粒度是 wave 级别或 closeout 级别，不是 step 级别
- 挂起分支统一在 Readiness Check 或 closeout 时交给用户判断，不在过程中逐个请示
- 如果用户在执行过程中主动介入，agent 应当配合，但介入结束后应立刻恢复自主推进模式

## 什么值得存进 `<REFERENCE_DIR>`

优先入库：

- 会进入后续推理链条、且会被反复复用的高价值内容
- 能补充新事实、澄清机制差异、或解释趋势 / 难点 / 争议的一手或高可信二手来源
- 能提供真实约束、真实失败模式、实践门槛或事故复盘的材料

不建议入库：

- 只重复已知结论、没有新增信息的内容
- 相关性弱、可信度低、或只做表面排名的材料
- 纯 SEO 聚合页、内容农场、无机制和证据的短帖

入库判断的硬标准：

- 能补充新事实
- 能澄清机制差异
- 能提供一手或高可信二手证据
- 能帮助解释趋势、难点或争议

如果不能满足上面任一条，就不入库。

## 探索分支处置协议（含 Suspended Branch Protocol）

目的：

- 控制探索树扩张，只保留会推进 `must_answer / 当前 gap / FINAL_DELIVERABLE` 的分支。

处理等级：

- `discard`：相关性弱、可信度不足、或只重复已知结论。
  处理：不落库、不回填 seed、不写 artifact。
- `compress`：公开信息不足或边际收益低，但结论本身值得记住。
  处理：只在 `question-list`、`status` 或综合 artifact 里留一句压缩结论。
- `suspend`：问题本身重要，但当前继续追会明显卡在 `access boundary / disclosure boundary / 搜索重复 / 边际收益过低`。
  处理：不阻塞主线，先继续推进其他高价值分支；同时必须把这个分支登记为 `suspended`，至少记录 4 件事：
  - 已推进到哪里
  - 为什么挂起
  - 已确认了什么 / 仍未确认什么
  - 什么新材料会触发重开
- `archive`：满足任意两条即可封存。
  触发示例：连续多次只得到重复信息；新来源明显弱于已落库来源；继续下钻主要指向非公开或项目专属材料；即使继续也难以改变核心判断；同时存在更高价值的未解问题。
  封存时只写：推进到哪里、为什么暂不继续、什么条件下重开。
- `redirect`：其他问题更可能提升证据强度、缩小不确定性或改变核心判断时，立即转向。

### `suspend` 与 `archive` 的区别

- `suspend`：问题仍然重要，只是当前不值得继续死磕；默认期待未来可能被新线索、新资料或新访问入口重启。
- `archive`：问题当前已经不值得继续投入；即使未来重开，优先级通常也低于其他未解问题。

### Human-on-the-loop 原则

> 完整的自主执行规则见上方 `## 自主执行协议（Autonomous Execution Protocol）`。本节保留核心原则，两节共同生效。

- 长程任务默认不依赖 `human in the loop`。
- 更推荐的做法是 `human on the loop`：研究线程自主推进；高难分支先 `suspend`；等到阶段性收拢、closeout 或最终汇报时，再把这些挂起分支统一交给人判断是否提供资料、改方向或重启。
- 只有在下面几种情况之一成立时，才值得主动请求同步人工介入：
  - 用户明确要求实时协同
  - 整条主线被阻塞，且无法通过 `suspend` 绕开（单个分支卡住不算）
  - 已知存在用户手里的专有材料、内部文档或访问入口，且不拿到就无法继续
  - 研究方向需要根本性调整（核心假设错误或最终产出定义变更）

### Suspended Branch 最低记录格式

建议在 `status`、综合 artifact 或 closeout 文档里至少保留下面结构：

```md
- branch: `<topic-slug / question>`
- state: `suspended`
- why_suspended: `<access boundary / disclosure gap / repeated search / low marginal return>`
- confirmed_so_far:
- still_missing:
- reopen_trigger:
```

每轮真正值得保留的是：

- 高价值方向
- 边际收益低方向
- 公开域边界
- 已挂起但未来可重开的方向
- 下一轮最该投入的方向

## 搜够了没有：停止条件

每条研究线只有同时满足下面条件，才能算第一轮搜集完成：

- 核心对象清单已经稳定，不再持续新增关键名字
- 新搜到的材料大多在重复已知事实，而不是贡献新信息
- 该研究线的固定问题都已经有证据支撑
- 至少有 1 轮对“反例、限制、争议”的专门补搜
- 已经完成一次“官方说法 vs 第三方验证 / 实践证据 / 事故复盘”交叉核验
- 所有重要但未解的问题，都已经被明确归类为 `继续追`、`suspend`、`archive` 或 `redirect`

如果还没有达到这些条件，就不能草率进入总结。

### 口径澄清

- “探索宽度持续增长”指：围绕同一研究线，刻意扩张多个证据面与对照面，直到“核心对象清单稳定”
- “核心对象清单稳定”指：用于最终推理链条的关键对象集合不再发生结构性变化；稳定后仍允许继续补证据强度
- “不建议并行暴力搜索”与“并行推进”不矛盾：
  - 禁止的是：Wave 0 未完成就把研究线割裂开并行扫荡
  - 允许的是：Wave 0 共享地基已落盘、命名分工明确后，按前缀并行补证据与回填

## 研究线的具体目标

[这里按 topic registry 展开。每条研究线都要写到同样粒度。]

### 研究线 <NN>：<topic-title>

研究目标：

- <这一线要补什么>
- <这一线为什么值得深挖>

必须回答：

- <固定问题 1>
- <固定问题 2>
- <固定问题 3>

证据重点：

- <应优先抓的对象 / 平台 / 框架 / 组织 / 规范>

难点重点：

- <采用难点 / 迁移难点 / 理解难点 / 治理难点>

趋势必须回答：

- <最近在往哪里演化>
- <标准是在收敛还是分化>

难度必须回答：

- <个人采用难度>
- <团队治理难度>
- <长周期维护难度>

## 并行执行建议

这件事适合并行推进，但要有明确分工。

建议分成：

- 主线程：维护总问题、统一标准、去重、综合判断、拓扑同步
- 研究线线程：每条研究线一个线程

主线程职责：

- 统一证据采集格式
- 维护 `<REFERENCE_DIR>` 命名规范
- 避免不同线程重复抓同一来源
- 在 Wave 2 做跨主题综合
- 当 scope 变化时执行 `Topology Formalization Gate`

各研究线线程职责：

- 深挖自己主题
- 把高价值来源落为 `<REFERENCE_DIR>/*.md`
- 回填到对应 seed 文件
- 维护本研究线的 evidence summary 与 question list

为了避免写冲突，建议按前缀分工：

- 主线程写共享地基：`00-shared-*`
- 研究线 `<NN>` 只写：`<NN>-<topic-slug>-*`

## 执行节奏

推荐顺序：

1. 列权威来源优先级清单，只抓高可信来源。
2. 初始化 `<REFERENCE_DIR> / <REFERENCE_DIR>/_INDEX.md / <ARTIFACT_DIR> / <STATUS_PATH>`，先建可回指入口再写结论。
   检查点：每个关键来源都能独立落库，并说明为什么值得保存。
3. 扩对象、案例和机制差异。
   检查点：是否已经覆盖该研究线最关键对象，而不是只停留在输入目录原有名单。
4. 上升到机制抽象。
   检查点：结论是否已经从“名字罗列”变成“机制理解”。
5. 补趋势、难点和失败模式。
   检查点：趋势有时间证据支撑，难点有分层视角支撑。
6. 做跨主题综合。
   检查点：是否已经分清共享底层事实与局部主题内成立的结论。

如果某一步还没有达到对应检查点，不要机械进入下一步。

## 成功标准

达到下面状态，才算真正满足目标：

- `<REFERENCE_DIR>` 中有一批高可信、可追溯的 ground truth 文档
- 每条研究线至少形成一组可复用证据包，而不是临时搜索结果
- 对每条研究线都能解释机制、趋势和难点
- 每个重要判断都能回指到本地 reference 文档
- 对趋势、难度、争议都有专门证据，而不是顺手一提
- 可以回答“什么值得长期追踪，什么只是噪音”
- 可以明确说清楚“哪些问题不是没做，而是被主动 `suspend`，以及为什么”
- 后续新的 agent 接手时，只看 `<SEED_DIR> + <REFERENCE_DIR> + <STATUS_PATH>` 就能继续往下研究

## Hard Gates（可选但强烈建议）

如果这轮研究将直接支撑正式对外报告、方法论评估或高价值决策，建议再加一层硬门槛：

- 没有 P0 级结论处于“只有单一弱来源支撑”的状态
- 所有关键术语都在跨主题范围内完成口径对齐
- 所有高价值结论都已明确标注“硬事实 / 分析判断 / 趋势推测”
- 至少完成一轮针对反例和失败模式的专门检索

## Progressive Plan 元规则

每一轮 progressive plan，不论是第几轮，都必须在开头写清楚以下 6 件事：

1. 调研目的：这一轮调研最终服务于什么产出？谁是读者？读者期待什么质量？
2. 手段策略：用什么结构推进？分几个阶段？各阶段的最低标准是什么？
3. 验收标准：如何客观判断调研结果质量合格？验收不依赖主观感觉，必须可检查。
4. 最终结果质量要求：调研完后能直接支撑的产出是什么？这个产出对专业读者意味着什么？
5. 当前拓扑状态：topic registry 当前是否稳定？是否存在待升级为正式研究对象的内容？
6. 进度可见性：`STATUS_PATH` 在哪，谁来维护，接手者应先读哪里？

不满足这 6 条的 plan，不算一份合格的 progressive plan。

补充要求：

- 长程任务必须支持 `suspend and continue`，而不是一遇到高难问题就把主线卡住
- 最终 closeout 必须能交代：哪些分支被主动挂起、为什么挂起、什么条件下值得重开

## 备注

重点不是把链接堆多，而是形成一套能支撑专业读者继续推进的本地研究地基。

---

## 配套 Status File Skeleton

```md
# <PLAN_NAME> 执行状态（Progress / State）

> 对应计划：`<PLAN_PATH>`

## 当前结论 / 进度语义

- 状态：`not_started / in_progress / blocked / completed`
- 当前所处波次：`Wave 0 / Wave 1 / Wave 2 / Readiness Check`
- 当前工作模式：`opening / widening / deepening / synthesizing / closing`
- 当前拓扑：`<N>-topic`
- 拓扑状态：`stable / formalizing / recently_changed`
- 当前最大阻塞：
- 收口距离：`far / mid / near / ready`
- 核心对象稳定度：`unstable / forming / stable`
- 新增信息产出：`high / medium / low`
- 失败 / 反例覆盖度：`thin / partial / adequate`
- 当前还缺的必做项：
- 当前只剩的可选打磨项：
- 当前已挂起的高难分支：
- 如果现在停止，最大缺口：

## Topology Formalization

- current_topic_count:
- recently_changed:
- pending_candidates:
- registry_sync_done:

## Wave 0：共享 Ground Truth 地基

- purpose: 固定共享地基与共同语言
- 目标配额：
- 已落库：
- 是否达标：
- 备注：

## Wave 1：按研究线深挖

- purpose: 把各研究线打深到机制 / 趋势 / 难点 / 失败模式

### <NN>-<topic-slug>

- doc_count:
- primary_count:
- secondary_count:
- recent_count:
- limitation_count:
- evidence_summary:
- question_list:
- status:
- gap:

## Wave 2：跨主题综合

- purpose: 把分题结果收束成整体结构和跨主题判断
- synthesis_file:
- cross_checks_done:
- unresolved_conflicts:
- status:

## Readiness Check

- purpose: 判断是否已经可交付 / 可停止 / 可接手
- 30 秒回指检查：
- 每线“机制 + 趋势 + 难点”检查：
- 横向综合检查：
- 拓扑稳定性检查：
- 接手可继续性检查：
- 是否通过：

## Suspended Branches

- branch:
- why_suspended:
- confirmed_so_far:
- still_missing:
- reopen_trigger:

## Worklog

- <YYYY-MM-DD>: <本次推进内容>
```

## 这个模板真正要守住的东西

以后无论你研究的主题是什么，只要还是“给定一个目录，从若干 topic seed 出发，做逐轮 Deep Research，并让本地知识库继续生长”，真正不能丢的是下面这些东西：

- 输入目录必须先被建模成研究线注册表
- 每轮都必须先写清楚最终服务于什么产出
- 每轮都必须有 Wave 0 / 1 / 2 和 Readiness Check
- 每轮都必须以本地 evidence 落库作为完成单位
- 每轮都必须要求输入目录本身生长，而不是只生成旁路报告
- 每轮都必须有停止条件，不允许“感觉差不多了”
- 每轮都必须能说明哪些高难问题被主动 `suspend`，而不是让它们在过程里无声消失
- 每轮都必须能做到 30 秒本地回指
- 每轮都必须默认自主推进，只在主线阻塞、方向根本性调整、高风险不可逆操作、或用户明确要求实时协同时才中断用户；进度靠 status 文件传递，不靠对话汇报
- 每轮都必须维护状态文件，而不是把状态只留在对话里
- 每轮都必须支持中途拓扑同步，而不是死守旧 registry
- 每轮都必须坚持 `path is not status`
- 每轮的 reference 文档都必须做到硬核内容自给自足，读者不回 URL 就能用本地 md 支撑推理

如果这些约束还在，这个框架就还是同一个框架。具体主题、目录名、研究线数量、配额数字，都只是实例化参数。
