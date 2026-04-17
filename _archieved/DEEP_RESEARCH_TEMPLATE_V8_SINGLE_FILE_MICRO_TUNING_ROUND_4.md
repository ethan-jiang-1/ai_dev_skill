# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 4

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> predecessor_control_doc: `DEEP_RESEARCH_TEMPLATE_V8_SINGLE_FILE_MICRO_TUNING_ROUND_3.md`
> document_role: `Round 4 评估 + 改动控制稿`
> round_goal: `strengthen Single Source of Truth (SSOT) and improve LLM generation stability without redesigning the methodology`
> round_scope: `只处理 single-file V8 中与 Source of Record、Canonical Location、Write Authority、Mirrored Field、Drift Risk，以及 plan/status 生成稳定性直接相关的问题；不重写方法论，不做多文件化`
> execution_state: `本文件是 Round 4 控制文档，不是 V8 正文已完成修改后的结果摘要`

## 这份文件现在扮演什么角色

这不是 `V9` 设计稿，也不是直接贴给执行者的逐行补丁。

它现在的角色是：

- 记录 Round 4 已确认的问题画像
- 锁定本轮允许做的最小动作
- 锁定本轮明确不做的事情
- 给后续真正修改 `V8` 正文时提供唯一控制依据

如果这份文件与更早轮次的控制稿有冲突，以本文件当前版本为准。

## Round 3 交接结论

Round 3 已经把一个关键边界压实到可继续前进的状态：

- `Plan Skeleton` 应承担静态蓝图职责
- `Status File Skeleton` 应承担动态执行面职责

但 Round 3 之后仍然存在两个没有被彻底压硬的问题：

- `SSOT` 还不够硬
  - 很多对象已经有“偏主责”的位置，但还没有被声明成真正的 `Source of Record`
- `LLM generation stability` 还不够稳
  - 强模型通常能读懂；普通模型、低注意力场景或上下文偏紧时，仍容易混写、漏填、串层

Round 4 因此不再继续做单纯的瘦身，也不继续只做 `Plan / Status` 的局部边界提醒，而是转向：

- `把 Source of Record 压硬`
- `把普通 LLM 最容易误读的碰撞点拆开`

## 当前评估快照

对 `V8` 当前状态的判断如下：

- 系统性：仍强
  - `template + protocol + state machine + handoff contract` 仍然成立，本轮不碰方法论主骨架。
- 结构性：已较前几轮更稳
  - `Plan` 与 `Status` 的大方向已区分，但还没有完全压成严格的 `write boundary`。
- SSOT 完整度：当前首修对象
  - 存在 `Canonical Location` 已隐含、但未被明确声明的问题。
  - 存在 `mirrored field`、`derived view` 与 `source of record` 边界不够硬的问题。
- LLM generation stability：当前首修对象
  - 多层控制对象太近，术语层也有少量漂移空间。

Round 4 的首修焦点因此固定为：

- `压实 Source of Record`
- `降低普通 LLM 的混层率、双写率、漏填率`

## Round 4 控制快照

- current_score_focus: `SSOT completeness + LLM generation stability`
- smallest_next_move: `把各对象的 Source of Record / Derived View / Write Authority 写死`
- do_not_change_yet: `multi-file split / methodology redesign / Wave rewrite / status schema major reduction / V8 -> V9 blueprint`

## 本轮为什么转向 SSOT 与稳定性

Round 1 到 Round 3 主要处理的是：

- 重复权威块
- skeleton 解释层
- `Plan / Status` 的静态 / 动态边界

做到这里之后，最影响继续演化质量的，不再是“哪里还可以再短一点”，而是下面这两类上游问题：

- `Single Source of Truth (SSOT)` 还不够强
  - 一个对象即使大体知道该写在哪，也可能仍在多个地方同时承载相似内容
- `LLM generation stability` 还不够稳
  - 同一概念会跨越 `control layer / completion criteria / dynamic state / navigation layer`

如果这两件事不先处理，后续不管继续做精简、微调还是扩展，都会不断把同类漂移重新引回来。

## 本轮只解决什么

Round 4 只解决下面四类问题：

- `Source of Record` 不清
  - 哪类信息到底以哪一个对象为唯一真源，还没有写死
- `Mirrored Field` 过多
  - 同一信息虽然不完全重复，但已出现双写倾向或近似复写
- `Write Authority` 不清
  - 同名对象在多个地方都能写，导致 drift 风险变高
- `LLM generation stability` 的高频碰撞点
  - 普通模型在生成 `plan / status` 时最容易混层、漏填、串语义的地方

Round 4 的目标不是把 `V8` 改成极简表单，而是把“哪里才是 authoritative copy”写死。

## 本轮明确不解决什么

下面这些问题已经确认存在，但不属于 Round 4 的授权范围：

- 不做多文件化
- 不重做 `Wave 0 / Wave 1 / Wave 2 / Readiness Check`
- 不重写 deep research 方法论
- 不大幅删减 `Status File Skeleton`
- 不做 `V8 -> V9` 级别的重设计
- 不继续以“篇幅更短”为主目标压缩正文
- 不重做 `evidence capture` 协议
- 不讨论实例化时各研究主题的具体内容质量

## 本轮硬约束

- 保持单文件
- 不改变方法论主语义
- 不新增新的主协议、新波次或新执行范式
- 不把 `Status` 重新做成极简 dashboard
- 不把 `Plan` 压成只有占位符的空表
- 不允许因为 SSOT 治理而削弱 handoff 能力
- 不允许产生执行语义漂移
- `English canonical terms` 是主定义
- 中文只做边界解释，不替代英文主术语

## SSOT 基础术语（英文主定义，中文辅助）

Round 4 后续所有判断都以这组词为准：

- `Single Source of Truth (SSOT)`
  - 某类信息在系统内只应有一个 authoritative source
- `Source of Record`
  - 某类信息在当前模板体系里的唯一正式记录位置
- `Canonical Location`
  - 默认检索、定位、更新该类信息时，应该首先去看的位置
- `Authoritative Copy`
  - 被视为正式版本、其他位置只能引用或派生的那一份
- `Derived View`
  - 从 `Source of Record` 派生出来的阅读面、导航面或摘要面
- `Mirrored Field`
  - 在多个位置都承载相近信息、容易双写的字段
- `Duplication Risk`
  - 因为双写、近义重复或并列承载而产生的重复风险
- `Drift Risk`
  - 多个位置更新节奏不同，导致内容口径慢慢分叉的风险
- `Write Authority`
  - 哪个对象有权更新该类信息
- `Update Responsibility`
  - 当信息变化时，首先应该更新哪个对象
- `Read Path`
  - 接手者或 LLM 正常读取该类信息时的推荐路径
- `Mutation Boundary`
  - 某类信息允许在哪些对象中被改写，哪些对象只能引用

## Round 4 SSOT Matrix

| object | canonical role | source of record | derived views | forbidden duplication | current drift risk | Round 4 action |
| --- | --- | --- | --- | --- | --- | --- |
| `PLAN_PATH` | `design-time canonical blueprint` | 目标、拓扑基线、Wave 设计、验收层级、输出契约 | `STATUS_PATH` 中对 plan 的引用；README 中的导航入口 | 不得承载执行中的当前状态、当前阻塞、当前 next step | medium | 把 `Plan` 明确声明为 `design-time Source of Record`，只写基线、不写实时面 |
| `STATUS_PATH` | `run-time source of truth` | 当前 gate、当前缺口、当前拓扑变化、恢复入口、挂起分支 | 对话中的简短进度回答；closeout 摘要 | 不得重复定义 `Plan` 中的结构蓝图、控制层级和正式拓扑基线 | high | 把 `Status` 明确声明为 `run-time Source of Record`，强化“只记当前态” |
| `SEED_DIR` | `living output surface` | 按 topic 回填后的长期知识主文本 | README 导航、artifact 引用 | 不得替代 `Reference` 承载原始证据本体；不得替代 `Status` 承载执行状态 | medium | 明确它是 `living docs`，不是 evidence registry，也不是 progress tracker |
| `REFERENCE_DIR` | `evidence source of record` | 可追溯 ground truth、本地证据本体 | `_INDEX.md`、artifact、seed 文件中的本地引用 | 不得只在 seed/artifact 中留下摘要而不落 reference 本体 | low | 明确它是 `evidence Source of Record`，其他位置只能引用或综合 |
| `ARTIFACT_DIR` | `derived synthesis layer` | evidence summary、question list、cross-topic synthesis | README 导航、plan 输出说明 | 不得替代 reference 承载证据本体；不得替代 status 承载当前执行状态 | medium | 明确它是 `Derived View` / synthesis layer，不是原始事实真源 |
| `README / _INDEX` | `navigation layer` | 默认阅读路径、目录意义、索引入口 | 接手阅读路径、本地导航 | 不得重复定义协议；不得承载长篇状态与长篇证据 | medium | 明确它只承担 `navigation layer` 职责，不争夺规则层或状态层 |

## 当前最值得先修的 SSOT 病灶

### 1. `Current Topology` 存在双层承载，但 Source of Record 还不够硬

当前状态是：

- `Plan` 中有 `Current Topology`
- `Status` 中也有 `Current Topology and Formalization State`

这本身不是错误。

真正的问题是：

- 两边虽然口头上区分了“基线”和“变化”，但没有被压成非常机械的 `write authority`

Round 4 的处理原则：

- `Plan / Current Topology` 只记录 `topology baseline`
- `Status / Current Topology and Formalization State` 只记录 `topology delta`

### 2. `Wave Gate Scoreboard` 在设计态与执行态之间还存在镜像风险

当前状态是：

- `Plan` 中有 gate 模型表格
- `Status` 中有 `wave_gate_scoreboard`

问题不是两边同名，而是：

- 普通 LLM 很容易把 `Plan` 里的表格误当成当前执行态面板

Round 4 的处理原则：

- `Plan` 只保留 `gate model`
- `Status` 才是 `current gate state`

### 3. `Readiness Check / 成功标准 / Hard Gates / 停止条件` 的 control-layer 太近

这四个对象不完全重复，但对 LLM 来说都像“完成判定”。

结果容易出现：

- 把 `success state` 当成 `pass criteria`
- 把 `stop condition` 当成 `closeout gate`
- 把 `Hard Gates` 当成默认 mandatory requirement

Round 4 的处理原则：

- `stop condition` 只管单线何时停搜
- `Readiness Check` 只管本轮是否可 closeout
- `成功标准` 只描述通过后的完成态
- `Hard Gates` 只作为可选加严层，不默认生效

### 4. `README / _INDEX` 的层级定义仍然偏软

虽然已经说明是导航入口，但还没有非常明确地写成：

- `navigation layer only`

Round 4 的处理原则：

- 它不是协议真源
- 它不是状态真源
- 它不是证据真源
- 它只承担 `Read Path` 和入口指引

## Round 4 LLM Stability Risk Matrix

| risk | trigger | typical failure mode | affected section | severity | Round 4 action |
| --- | --- | --- | --- | --- | --- |
| `control-layer collision` | `Readiness / 成功标准 / 停止条件 / Hard Gates` 相邻出现 | 模型把多个完成判定层混成一个 checklist | plan middle-to-late sections | high | 强化层级声明，减少相近对象的边界含混 |
| `plan/status cross-contamination` | 同名对象两边都出现 | `Plan` 被写成半动态；`Status` 被写成半规范 | topology, gate, resume, progress sections | high | 压硬 `design-time vs run-time` |
| `mirrored field drift` | 同一信息在多个位置都能写 | 一处更新，另一处不更新，内容分叉 | topology, scoreboard, readiness-related areas | high | 明确 `Source of Record` 与 `Derived View` |
| `placeholder ambiguity` | 开放占位符与自由 prose 混排 | 输出粒度忽高忽低，出现泛话 | gaps, registry, current topology, goals | medium | 保留占位符，但补足“字段职责”说明 |
| `instruction overload` | reminder、protocol、例外条件过密 | 模型只记住显眼规则，漏掉真正主控规则 | full document | medium | 优先保留主控轴，弱化重复提醒 |
| `mixed-language terminology drift` | 中文解释、英文 canonical、动词口语化并存 | 同一概念出现多种写法，降低稳定性 | full document | medium | 固定英文主术语，中文只做辅助说明 |
| `status field pseudo-precision` | 状态字段较多但边界不硬 | 模型机械填字段，忽略真正进展 | status skeleton | medium | 不大删字段，但强化字段职责边界 |
| `gate/state confusion` | gate model 和 current gate 同时存在 | 模型把“模型定义”写成“当前状态” | Plan scoreboard vs Status scoreboard | high | 强调 plan only defines model, status records current state |

## 本轮最值得先修的稳定性病灶

### 1. `design-time` 与 `run-time` 的显式词还不够强

目前虽然已经有静态 / 动态表述，但普通 LLM 不一定把它当成严格边界。

Round 4 要求：

- `Plan` 直接被命名为 `design-time canonical blueprint`
- `Status` 直接被命名为 `run-time source of truth`

### 2. 同一概念的多种近义表达仍可能造成术语漂移

例如：

- “正式拓扑基线”
- “当前拓扑”
- “执行中的拓扑变化”
- “formalization state”

这些概念本身都合理，但若不锁定 `baseline / delta / current state` 的英文主词，模型生成时就容易混。

Round 4 要求：

- 优先固定 `baseline`
- 固定 `delta`
- 固定 `current state`
- 避免只靠中文近义表达区分

### 3. `Readiness` 相关对象容易被模型压平

模型常见偷懒方式是把所有完成判断写成一个总表。

Round 4 要求：

- 强化每一层只回答一个问题
- 避免多个 section 都像“最终验收”

### 4. 导航层与真源层还需要更硬分离

`README / _INDEX` 现在常被理解为“重要入口”，但“重要入口”不等于“真源”。

Round 4 要求：

- 入口层只负责找东西
- 真源层负责存东西

## 本轮改动策略

### 1. 先压 `Source of Record`

真正修改 `V8` 时，优先做下面这些动作：

- 把 `Plan` 明确写成 `design-time Source of Record`
- 把 `Status` 明确写成 `run-time Source of Record`
- 把 `Reference` 明确写成 `evidence Source of Record`
- 把 `Artifact` 明确写成 `Derived Synthesis Layer`
- 把 `README / _INDEX` 明确写成 `navigation layer`

### 2. 再压 `Mirrored Field`

对下面对象优先治理：

- `Current Topology`
- `Wave Gate Scoreboard`
- `Readiness` 相关层级
- `Resume / Recovery` 相关表述

原则：

- 同名可以保留
- 但职责不能再模糊

### 3. 再处理 control-layer collision

Round 4 不删除这些对象，但要压清各自只回答什么问题：

- `stop condition`
- `Readiness Check`
- `success state`
- `Hard Gates`

### 4. 最后统一术语

统一方向：

- 英文 canonical term 作为主定义
- 中文只做解释
- 尽量减少一个概念多种近义写法

## Round 4 授权修改地图

| 目标块 | 当前问题 | Round 4 动作 |
| --- | --- | --- |
| `Plan Skeleton / 结构主线与波次闸门得分板` | 已有边界意识，但 `Source of Record` 词还不够硬 | 明确 `Plan` 是 `design-time blueprint`；`Wave Gate Scoreboard` 只定义 gate model |
| `Plan Skeleton / Current Topology` | baseline 与 current 容易被弱模型混读 | 压实为 `topology baseline`，不承接 run-time delta |
| `Plan Skeleton / 输出` | `Reference / Artifact / README` 边界已大致存在，但还没有 SSOT 词汇钉死 | 明确 `Reference = evidence source of record`；`Artifact = derived synthesis layer`；`README/_INDEX = navigation layer` |
| `Status / 当前结论 / 进度语义` | 还需要更强的 `run-time` 定位 | 强化其为当前执行态唯一真源，不再像第二份概要规范 |
| `Status / Current Topology and Formalization State` | 与 plan topology 存在 mirrored-field 风险 | 压实为 `delta / sync / current state` |
| `Status / wave_gate_scoreboard` | 容易被写成重复 plan 表格 | 压实为 `current gate state` |
| `Readiness / 成功标准 / Hard Gates / 停止条件` | 层级过近 | 加强 each-section-only-one-question 的说明 |
| 关键术语区 | 中英混用但未完全锁死 | 统一 canonical wording |

## 本轮写法规则

Round 4 编辑时必须遵守下面这些规则：

- 能明确声明 `Source of Record` 的对象，就不要只写模糊职责
- 能明确声明 `Derived View` 的对象，就不要让它看起来像 authoritative copy
- 同名对象允许存在，但必须一眼看出 `design-time` 和 `run-time` 的区别
- 能用英文 canonical term 稳定概念，就不用多个中文近义词分摊定义
- 先压职责，再谈压篇幅
- 不因为追求 SSOT 而删除 handoff 所需的恢复信息

## 编辑顺序

真正修改 `V8` 时，严格按下面顺序执行：

1. 先在 `Plan / Status / Reference / Artifact / README` 相关区块压实 `Source of Record`
2. 再处理 `Current Topology` 与 `Wave Gate Scoreboard` 的 mirrored-field 风险
3. 再处理 `Readiness / 成功标准 / Hard Gates / 停止条件` 的层级碰撞
4. 再统一关键术语
5. 最后通读全文件，确认没有出现新的 drift risk

## 验收标准

Round 4 完成后，必须同时满足下面条件：

- 每一类信息都能明确指出自己的 `Source of Record`
- `Plan` 不再像半动态状态面
- `Status` 不再像第二份结构性蓝图
- `Reference` 被明确为证据真源，而不是被 seed/artifact 侧写替代
- `Artifact` 被明确为综合层，而不是原始证据层
- `README / _INDEX` 被明确为导航层，而不是规则层或状态层
- 普通 LLM 更不容易把 `stop condition / readiness / success state / hard gates` 混成一层
- 全文关键概念的英文 canonical wording 更稳定
- 执行语义不变

建议的量化目标：

- 不以删行数为主目标
- 以 `SSOT` 和 `LLM stability` 的边界更硬为主目标

## 暂不处理的问题

- `Status File Skeleton` 是否仍偏重
- `Quality Calibration Loop` 是否应独立出模板维护附录
- `single-file` 架构未来是否会遇到上限
- `Plan Skeleton` 的研究内容区是否还可进一步压缩

这些问题都真实存在，但不是 Round 4 当前的授权范围。

## Round 4 结束后的正确动作

Round 4 控制文档完成后，下一步不是继续讨论抽象方向，而是：

- 以本文件为唯一控制依据
- 修改 `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
- 优先落实 `SSOT` 与 `LLM generation stability` 的边界压实

如果后续真正修改 `V8` 时发现某个动作超出了这里的授权范围，应停止扩张，并把它登记到下一轮。
