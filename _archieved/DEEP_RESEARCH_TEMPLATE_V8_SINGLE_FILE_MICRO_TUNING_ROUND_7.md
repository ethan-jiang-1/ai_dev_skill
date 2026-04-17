# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 7

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> predecessor_control_doc: `DEEP_RESEARCH_TEMPLATE_V8_SINGLE_FILE_MICRO_TUNING_ROUND_6.md`
> document_role: `Round 7 规划控制稿`
> round_goal: `focus on consistency and concision inside single-file V8 by collapsing repeated rule surfaces, shortening consumption path, and reducing template-level noise without changing core contract`
> round_scope: `本轮先输出控制计划，不直接大改主模板；先把一致性与简洁性问题压成分阶段可执行改造包，再按阶段逐步回改 V8 正文；不做 multi-file split，不升级到 V9，不主动改 template_version，不重做方法论主干`
> execution_state: `本文件是 Round 7 计划控制稿；本轮先锁定改造边界、阶段、停止点与验收，不把大改直接落进 V8 正文`

## 这轮控制稿的定位

Round 7 不是继续“边想边改”的实施稿。

它先承担一层更上游的作用：

- 把本轮为什么还需要继续调整 `一致性 / 简洁性` 说清楚
- 把大改拆成多个小阶段，而不是直接改主模板
- 给后续每一步实施提供唯一控制依据
- 明确哪些属于“表达收束”，哪些会碰到“契约变化”

Round 7 的前提判断是：

- V8 的方法论主干已经够强
- 当前最主要的问题不是规则不够，而是规则表面过多
- 如果继续直接对主模板做大面积原位编辑，容易把“收束表达”误做成“改变契约”
- 因此，这一轮必须先有一个计划层，再进入实施层

如果本文件与更早轮次的控制稿冲突，以本文件为准。

## Round 7 的问题定义

Round 6 之后，V8 在对象边界、三件套和 canonical layer 上已经明显变硬，但从“给 LLM 单次读入并稳定消费”的角度看，仍有两类主问题未完全收口：

### 1. 一致性仍有“多点重复维持”的残余结构

V8 现在已经有：

- `Source of Record Matrix`
- `Canonical Enum Registry`
- `Canonical Field Role Notes`
- `Canonical Runtime Authority`

这些对象都在往规则级 SSOT 靠拢。

但在实际消费路径里，仍存在同一语义在多个位置重复出现的问题，尤其集中在：

- 对象职责说明
- enum / field 语义提醒
- `Instantiation -> Execution` 边界
- `setup_ready / Wave 0` 的相邻解释
- topic-level decision 和 source-dimension status 的区分
- branch action 与 branch state 的映射

结果不是“规则冲突明显”，而是“规则通过多处相近表达保持一致”。

这对人类读者勉强可接受，但对 LLM 而言，会造成：

- 抓不准唯一权威面
- 把 reminder 当成第二份规则
- 生成时从多个段落拼接同一语义
- 后续维护时更容易发生局部漂移

### 2. 简洁性仍被“低增益解释层”拖累

V8 现在已经比早期版本有更强的 block 边界和 marker 边界，但整体阅读负担仍偏重。

主要噪音不是 skeleton 本体，而是三类低增益内容：

- block meta 的重复声明
- field notes / preset / reminder 这类二级说明层
- execution 层中对“本层是不是生成时指令”的元说明

这些内容对维护者有解释价值，但对 LLM 的主要作用更接近：

- 消耗注意力
- 拉长实例化消费路径
- 增加“读懂模板说明”和“生成实例文件”之间的切换成本

Round 7 的判断是：

- 当前最该删的不是功能，而是重复解释层
- 当前最该强化的不是新规则，而是单点权威定义

## Round 7 的目标收口

本轮只围绕 4 个目标动刀：

- `consistency hardening`
  - 让同一规则尽量只剩一个 canonical 定义点
- `consumption path shortening`
  - 让实例化和阅读路径更短，更机械
- `noise stripping`
  - 删除对执行者和 LLM 低增益的解释层
- `safe refactor sequencing`
  - 先计划后实施，确保收束表达不误伤核心契约

Round 7 不追求新增能力，不追求结构翻新，也不追求版本跃迁。

## Round 7 允许做的动作

### 1. 收缩重复规则面

允许把下列语义收成唯一权威点，其他位置改成短引用或直接删除：

- object authority
- enum value definitions
- field role semantics
- mode transition semantics
- branch action / branch state mapping

处理原则：

- 如果 canonical layer 已经足够表达，则不再在后文保留第二份完整 prose
- 如果某个 reminder 只是在重复 canonical layer，就删
- 如果某个 skeleton 周边说明只是再讲一遍 object boundary，就删

### 2. 删除低增益消费噪音

允许删除或大幅收缩以下内容，只要不改变契约：

- block 开头重复的 meta prose
- `Status Field Type Notes`
- `Queue Field Notes`
- `推荐初始化快照`
- execution 层对“本层不是生成指令”的重复提醒
- 其他只起“模板自我解释”作用的说明句

### 3. 收紧状态边界说明

允许把这几类边界改成更硬的单点定义：

- `Instantiation Mode` 与 `Execution Mode`
- `instantiation_complete -> setup_ready -> wave0_complete` 的状态关系
- `required_next_step` 与 `QUEUE_PATH.Active Queue` 的关系
- `topic_stop_decision` 与 `primary_source_status` 的关系

前提是：

- 不改 canonical enum 值
- 不改 skeleton section 结构
- 不改实例化 copy boundary

### 4. 新增少量“迁移保护说明”

Round 7 允许在控制稿中先写清楚哪些变更虽然是简化，但会影响阅读习惯。

例如：

- 删除 `推荐初始化快照` 后，初始化默认值回读哪里
- 删除 field notes 后，字段语义回读哪里
- 删除 block meta 后，如何仍然保持 block boundary 可检索

但这些说明优先写在控制稿里，不优先堆回主模板正文。

## Round 7 明确不做

- 不拆主模板为多文件
- 不升级到 `V9`
- 不主动修改 `template_version: v8`
- 不改变 `PLAN_PATH / STATUS_PATH / QUEUE_PATH` 的对象边界
- 不改变 `Canonical Enum Registry` 的 allowed values
- 不改变 `Instantiation Copy Boundary`
- 不改三份 skeleton 的核心 section 骨架
- 不新增新的 wave、gate、mode 或 queue 对象
- 不把 `Execution Protocol` 改写成另一套方法论
- 不为了压行数而删掉真正承担契约语义的 canonical tables

## Round 7 的阶段化实施策略

Round 7 先计划，后实施。真正回改 `V8` 时，必须按阶段推进，而不是一次性扫全文件。

### 阶段 0：Freeze Contract Surface

目标：

- 先冻结不能随意动的契约面

冻结对象：

- `Instantiation-Execution Routing Gate`
- `Source of Record Matrix`
- `Canonical Enum Registry`
- `Instantiation Copy Boundary`
- 三份 skeleton 的主 section 结构

停止点：

- 在没有额外理由前，不允许直接改这些冻结对象

### 阶段 1：重复规则面盘点

目标：

- 列出真正要收掉的重复簇，而不是凭感觉删 prose

重点盘点对象：

- object authority 的重复面
- field semantics 的重复面
- mode / gate transition 的重复面
- branch action / state 的重复面
- `topic_stop_decision` 与 `primary_source_status` 的双层语义点

产出要求：

- 每个重复簇要明确：
  - canonical 保留点
  - 冗余出现点
  - 收缩方式：删除 / 缩成一句引用 / 合并到 canonical point

停止点：

- 没完成重复簇盘点前，不进入正文编辑

### 阶段 2：删除低增益说明层

目标：

- 先删不会改变契约、但会稀释注意力的说明层

优先级从高到低：

- `Status Field Type Notes`
- `Queue Field Notes`
- `推荐初始化快照`
- block 开头重复 meta prose
- execution 层元说明

要求：

- 删除后必须能明确指出回读位置
- 不允许删完后把读者逼回聊天上下文

停止点：

- 低增益说明层删完后，先做一次通读，不继续顺手扩 scope

### 阶段 3：收紧边界语义

目标：

- 把当前仍容易让 LLM 摇摆的边界变成更硬的单点定义

重点对象：

- `setup_ready`
- `current_wave`
- `required_next_step`
- `queue_resume_entry`
- `topic_stop_decision`
- `primary_source_status`
- `Suspended Branches.state`

要求：

- 不改 enum 值
- 只改定义落点和解释方式
- 优先通过小表、短 binding note 或删重复 prose 来完成

停止点：

- 如果某一步已经开始接近“改 schema”而不是“改定义落点”，立即停止并回到控制稿

### 阶段 4：压缩 execution prose

目标：

- 让 execution 层更像 protocol cluster，而不是解释型长文

保留优先级：

- `Execution Entry Protocol`
- `Autonomous Execution Protocol`
- `Topology Formalization Gate`
- `Early Saturation Protocol`
- `证据采集协议`
- `Suspended Branch Protocol`

压缩对象：

- execution layer 的元说明
- 重复 authority mapping
- 对 canonical layer 的再次展开

停止点：

- 不把 execution 层压到失去执行可读性

### 阶段 5：全文件一致性复核

目标：

- 确认经过压缩后，V8 没有出现新的单点缺失

重点检查：

- 所有被删除的说明层是否都有回读位置
- 所有 enum 是否仍只有一套权威值
- `plan/status/queue` 的对象边界是否更清楚而不是更模糊
- `Instantiation -> Execution` 是否更机械而不是更依赖推断

停止点：

- 如果复核中发现 canonical point 本身还不够表达，再补 canonical point，不恢复旧的重复 prose

## Round 7 的具体改造包

### 改造包 A：Object Authority De-dup

目的：

- 让 object authority 只保留一个完整定义面

优先保留：

- `Structural Spine`

候选删除或缩写位置：

- `Inherited Minimum Rules for Instantiated Plan` 中重复的对象职责说明
- `Plan Skeleton` 顶部重复的 design-time / run-time / queue role prose
- `Control Map -> Minimal Runtime Bindings` 中重复的对象边界提醒

预期结果：

- object boundary 不再需要读三遍

### 改造包 B：Enum / Field Note De-dup

目的：

- 让 enum 和 field semantics 回收到更少的权威面

优先保留：

- `Canonical Enum Registry`
- `Canonical Field Role Notes`

候选删除或缩写位置：

- `Status Field Type Notes`
- `Queue Field Notes`
- skeleton 中重复展开的 enum 解释句

预期结果：

- 字段语义仍清楚，但消费路径变短

### 改造包 C：Mode Transition Hardening

目的：

- 降低 `Instantiation`、`setup_ready`、`Wave 0` 之间的歧义

优先保留：

- `Instantiation-Execution Routing Gate`

候选收缩位置：

- `Cold Start Usage`
- `推荐初始化快照`
- `Execution Entry Protocol` 中重复解释 `setup_ready` 的 prose

预期结果：

- LLM 更不容易在实例化阶段偷跑到执行阶段

### 改造包 D：Decision Layer Clarification

目的：

- 让 topic-level decision、source-dimension status、branch state 三者更不易混淆

优先保留：

- `Canonical Enum Registry`
- `Canonical Field Role Notes`

候选补强方式：

- 新增一个极短 mapping note，明确：
  - `topic_stop_decision` 是研究线级决策
  - `primary_source_status` 是来源维度状态
  - `Suspended Branches.state` 是分支处置结果记录

预期结果：

- 降低 `early_saturation`、`suspend/suspended` 等语义漂移

### 改造包 E：Execution Layer Compression

目的：

- 继续压缩 execution layer 的解释噪音

优先保留：

- 真正操作性 protocol

候选删除对象：

- “本层不是 generation-time 指令”这类重复元说明
- 与 canonical layer 重合的 authority reiteration

预期结果：

- execution 层更短，但不丢操作性

## Round 7 的验收标准

### 一致性验收

- 同一规则的完整定义点更少，而不是更多
- enum 的完整定义仍集中在 canonical layer
- object authority 不再跨多个 section 反复完整展开
- `topic_stop_decision / primary_source_status / branch state` 的层次更明确
- `setup_ready` 的语义更接近单点定义，而不是多段 prose 拼合

### 简洁性验收

- 低增益说明层明显减少
- 实例化消费路径更短
- skeleton 周边模板自我解释更少
- execution 层元说明更少
- 总行数有可见下降，但不是靠删契约表实现

### 稳定性验收

LLM 读取后，应更不容易出现以下错误：

- 把 reminder 当成第二份权威规则
- 在 `status` 中复制第二份 active queue
- 把 `setup_ready` 理解成独立 wave
- 把 `early_saturation` 当成另一套 gate
- 从多段 prose 拼接出相互轻微不一致的实例文件

### 版本策略验收

- 如果只完成表达收束，不改 `template_version`
- 如果实施中不可避免触碰 enum、copy boundary、skeleton 核心结构，再单独评估是否进入 `v8.1`

## 本轮实施顺序

1. 先完成 Round 7 控制稿，不直接动 V8。
2. 确认冻结面和重复簇盘点范围。
3. 先做低风险删除：notes / preset / meta prose。
4. 再做边界收紧：mode、queue、decision layering。
5. 最后压 execution layer，并做一次全文件复核。
6. 只有在上述步骤完成后，才决定是否需要追加 Round 7 实施稿或进入下一轮。

## 本轮预期结果

- 一个更适合“步步为营”推进的改单路线，而不是直接重改 V8
- 一个把 `一致性` 与 `简洁性` 明确拆成实施阶段的控制计划
- 一个能把“表达收束”和“契约变更”分开的修改框架
- 一个为后续回改 V8 正文提供单点依据的 Round 7 计划文档

## 后续观察点

Round 7 计划完成后，后续实施中仍值得观察的点：

- `Structural Spine` 是否还可以进一步收成更短的 object authority hub
- `Instantiation Contract` 是否还存在过多消费路径残余
- `Execution Protocol` 是否还能继续压到更短的 protocol cluster
- 如果单文件继续压缩后仍显过载，是否在未来轮次再进入 multi-file split

这些问题属于后续实施和下一轮判断，不在本计划稿中提前扩 scope。
