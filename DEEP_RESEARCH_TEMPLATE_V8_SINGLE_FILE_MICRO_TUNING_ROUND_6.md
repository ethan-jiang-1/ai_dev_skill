# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 6

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> predecessor_control_doc: `DEEP_RESEARCH_TEMPLATE_V8_SINGLE_FILE_MICRO_TUNING_ROUND_5.md`
> document_role: `Round 6 实施控制稿`
> round_goal: `raise concision and rule-level SSOT hardness inside single-file V8 by collapsing repeated rule surfaces, tightening instantiation consumption, and clarifying canonical authority`
> round_scope: `在不拆成 multi-file、不升级到 V9、不改方法论主干的前提下，把 V8 从“single-file mixed manual”继续收敛成“single-entry layered spec”；重点处理 canonical rule surface、instantiation path、skeleton payload purity、status/queue field authority，以及 stop/readiness/success/hard-gate 的层次关系`
> execution_state: `本文件是 Round 6 控制稿，同时对应本轮对 V8 正文的实际落地改动`

## 这轮控制稿的定位

Round 6 接续 Round 5，但目标已经从“把三件套架起来”切换成“把 V8 真正收成可稳定消费的单入口规范”。

这轮不再讨论是否拆文件，也不再继续泛化方法论。

它只做两件事：

- 提升 `简洁性`
  - 删除重复规则面
  - 缩短实例化消费路径
  - 去掉会污染实例产物的模板说明
- 提升 `规则级 SSOT`
  - 让一条规则只剩一个 canonical 定义点
  - 把其他位置改成引用，而不是另一版 prose

如果本文件与更早轮次的控制稿冲突，以本文件为准。

## Round 6 的问题定义

Round 5 之后，V8 已经比早期版本清楚得多，但还存在 4 个残余问题：

### 1. 对象级 SSOT 强，规则级 SSOT 仍不够纯

`Source of Record Matrix`、`Enum Registry`、`Copy Boundary` 已经出现，但很多规则仍分散在：

- `Routing Gate`
- `Cold Start Usage`
- `Instantiation Output Quality Rules`
- skeleton 顶部说明
- execution protocol prose

结果是对象边界已经单点化，规则消费路径还没有完全单点化。

### 2. 实例化路径仍偏长

想稳定生成 `plan/status/queue` 时，仍要穿过过多解释层，尤其是：

- 第二份 mode 解释
- 第二份实例化质量说明
- 第二份 queue 字段语义

这会让 LLM 在“该复制什么”和“该理解什么”之间额外消耗上下文。

### 3. skeleton payload 仍不够纯

Round 5 已经把 marker 边界硬化了，但 V8 仍残留两类高风险内容：

- `Plan Skeleton` 里混入模板自我说明
- `Status / Queue Skeleton` 的 marker 内仍包 fenced code block

这会继续诱发“把模板说明抄进实例文件”或“把整个状态文件包进代码围栏”的错误。

### 4. `status` / `queue` 的下一步语义仍偏冗余

虽然 `QUEUE_PATH` 已经升格，但 V8 里仍存在多套相近字段：

- `required_next_step`
- `current_task_summary`
- `recommended_resume_entry`
- `queue_resume_entry`
- `QUEUE_PATH.Active Queue`

如果不继续压缩，LLM 仍然可能生成多个“下一步副本”。

## Round 6 的目标收口

本轮只围绕 5 个收口目标动刀：

- `canonical surface`
  - 新增缺失的 canonical binding，减少运行层重复定义
- `instantiation path`
  - 把实例化规则收成最短路径 + checklist + preset
- `payload purity`
  - skeleton 内只保留可落盘内容，不保留模板自我说明
- `field authority`
  - 明确 `authoritative / mirrored / derived / pointer-only / summary-only`
- `decision layering`
  - 把 `stop / readiness / success / hard-gate / early saturation` 的层次讲清

## Round 6 允许做的动作

### 1. 补齐 canonical layer，而不是再加新 prose

允许在 `A. Routing + Core Contract` 中新增 hard tables 或 binding notes，只要目标是：

- 减少后文重复定义
- 让 runtime 引用前文，而不是重讲前文

本轮允许新增：

- `Canonical Field Role Notes`
- `Canonical Runtime Authority`

### 2. 删除重复 mode / quality / authority prose

允许直接删除以下类型内容，只要 canonical layer 已能覆盖其语义：

- 第二份 mode split
- 第二份实例化质量规则
- 第二份 execution-time authority mapping

删除标准不是“能否读懂”，而是“是否已存在单点权威定义”。

### 3. 重写 instantiation 侧的消费形态

允许把 `Instantiation Output Quality Rules` 收成更短的 `Instantiation Checklist`，前提是：

- checklist 可直接执行
- 值域和字段类型已经回收到 canonical layer
- 不再维护第二份解释性 prose

### 4. 净化 skeleton payload

允许对 `plan/status/queue` skeleton 做以下改动：

- 删除模板自我说明句
- 去掉 marker 内的 fenced code block
- 删除会与 `QUEUE_PATH` 形成重复动作面的字段

本轮特别允许：

- 删除 `Status` 中的 `current_task_summary`

### 5. 压缩 decision hierarchy

允许对 `Control Hierarchy`、`Early Saturation Protocol`、相关说明句做层次重述，只要做到：

- `Wave Gate Scoreboard` 只负责 round progress gates
- `停止条件` 只负责 topic-level decision
- `Readiness Check` 只负责 closeout gate
- `Hard Gates` 只负责可选 overlay
- `成功标准` 只负责 post-pass state

## Round 6 明确不做

- 不拆主模板为多文件
- 不改 `template_version: v8`
- 不做 `V8 -> V9` 迁移
- 不改 `Wave 0 / Wave 1 / Wave 2 / Readiness Check` 的总体方法
- 不删除 `QUEUE_PATH`
- 不重做 evidence capture 方法
- 不把 `Status` 缩成超轻 dashboard
- 不把 `Plan Skeleton` 改成纯空表单

## Round 6 实际落地变更

### 1. Block map 和 block boundary 继续压实

在 block map 和 block 开头补上更明确的层职责：

- `A` 定义 route gate、canonical contract、authority binding
- `B` 定义最短实例化路径与可复制 payload
- `C` 定义 runtime behavior，不再负责对象级 SSOT

目的：

- 让 reader 和 LLM 明确知道“哪层在定义规则，哪层在消费规则”

### 2. 新增 `Canonical Field Role Notes`

把之前隐含在 prose 里的字段角色压成显式表，覆盖：

- `current_task / next_task / next_after_next`
- `queue_health`
- `required_next_step`
- `recommended_resume_entry`
- `queue_resume_entry`
- `derived_topic_count`

这样做的目标是：

- 把 `authoritative / mirrored / derived / pointer-only / summary-only` 写死
- 避免在 `status`、`queue`、runtime prose 中重复解释字段身份

### 3. 新增 `Canonical Runtime Authority`

把原来 execution layer 里的 `Instance Plan Authority Binding` 收回到 canonical layer，统一定义：

- `输出契约`
- `Wave 设计与验收`
- `停止条件`
- `成功标准`
- `Hard Gates`

对应的 design-time authority 和 run-time record location。

这样做后，runtime 层不再维护第二份 authority mapping。

### 4. 删除 `Mode Split`

Round 6 直接删除 `Mode Split`，原因是：

- route gate 已经是唯一 mode 入口
- `Mode Split` 只是在用另一套 prose 重说已有规则
- 它对实例化和执行都不是唯一权威来源

### 5. `Instantiation Output Quality Rules` 收为 `Instantiation Checklist`

Round 6 不再保留一大段解释性质量规则，而是把它改成 checklist。

保留的 only-once 信息包括：

- placeholder 清理
- `PLAN_PATH` 不得写成模板复述
- `STATUS_PATH` 不得提前汇报 wave 进度
- `QUEUE_PATH.current_task` 必须指向首个未完成 execution 动作
- `queue_path` 三处一致
- `derived_topic_count` 与 registry 一致
- enum 与 field value 统一
- `reference_dir / artifact_dir` override 必须解释

### 6. `Plan Skeleton` 去除模板自我说明

删除这类污染实例产物的语句：

- “实例化时只复制这个 skeleton”
- “不要把模板前文说明区、后文 Execution Protocol、Appendix 一起复制进实例 plan”

Round 6 的原则是：

- skeleton 内只留下实例 plan 自己该承载的信息

### 7. `Status / Queue Skeleton` 去掉 fenced code block

这是本轮最重要的 payload purity 改动之一。

marker 内不再包：

- ```md
- ```

改完后：

- `BEGIN ... SKELETON` 与 `END ... SKELETON` 之间直接就是可落盘正文
- 复制动作不需要二次去围栏
- 更不容易诱发“整个状态文件被包成代码块”的输出错误

### 8. 删除 `Status.current_task_summary`

Round 6 继续压缩“下一步语义”的重复面。

删除理由：

- 真正可执行动作已经由 `QUEUE_PATH.Active Queue` 承担
- `required_next_step` 足够承载单步摘要
- `queue_resume_entry / recommended_resume_entry` 已经承担读取入口
- `current_task_summary` 会制造第二个看似权威的当前动作字段

因此本轮明确：

- `QUEUE_PATH` 才是行动级下一步
- `STATUS_PATH.required_next_step` 只是摘要

### 9. `Status Field Type Notes` 改成角色型说明

Round 6 同步更新字段说明：

- `queue_health` 明确成 mirrored field
- `required_next_step` 明确成 summary-only
- `recommended_resume_entry` 明确成 pointer-only

这样 skeleton 自己就能体现 canonical roles，而不用依赖 execution prose 解释。

### 10. `Control Hierarchy` 压缩为单一层次说明

Round 6 把这部分压成 5 行的硬关系：

- `Wave Gate Scoreboard`
- `停止条件`
- `Readiness Check`
- `Hard Gates`
- `成功标准`

每个对象只负责一层，不再模糊重叠。

### 11. `Early Saturation Protocol` 降级为 topic-level decision 特判

Round 6 保留 `Early Saturation`，但明确它不是独立 gate 系统。

它只是：

- `停止条件` 语境下的一个 topic-level decision 特判
- 仍需写入 `<STATUS_PATH>`
- 不能绕过 `must_answer`、失败模式覆盖、Readiness Check、关键结论证据要求

### 12. 删除 runtime 层的 `Instance Plan Authority Binding`

原因不是它错，而是：

- 相同语义现在已经进入 `Canonical Runtime Authority`
- 再保留一份只会继续削弱规则级 SSOT

Round 6 选择直接删除，而不是继续保持两个版本。

## Round 6 验收标准

### 结构验收

- `A / B / C / D` 四层的职责更明确
- `A` 成为更完整的 canonical surface
- `C` 不再承担第二份 authority mapping

### 简洁性验收

- 不再存在 `Mode Split`
- 不再存在解释型 `Instantiation Output Quality Rules`
- skeleton 内不再出现模板自我说明
- `Status / Queue` marker 内不再包 fenced code block
- `current_task_summary` 已删除

### 规则级 SSOT 验收

- field authority 在 canonical 层有显式记录
- runtime authority 在 canonical 层有显式记录
- runtime 层不再重复维护同一 authority mapping
- stop/readiness/success/hard-gate 的层次关系更单点

### 生成稳定性验收

普通 LLM 读取后，应更不容易出现以下错误：

- 把模板说明抄进实例 plan
- 把 `status.md` / `queue.md` 包进 code fence
- 把 `current_task_summary` 当成第二份当前任务
- 把 `Early Saturation` 当成另一套独立 gate
- 在实例化时跨多段 prose 拼“质量规则”

## 本轮实施顺序

1. 先补 canonical layer，新增缺失的 authority / field-role 表。
2. 删除重复 rule surfaces：`Mode Split`、`Instantiation Output Quality Rules`、`Instance Plan Authority Binding`。
3. 重写 instantiation 侧为最短路径 + checklist。
4. 净化 `plan/status/queue` skeleton payload。
5. 压缩 `Control Hierarchy` 和 `Early Saturation` 的层次表达。
6. 最后检查 `status/queue` 是否还残留重复动作面。

## 本轮预期结果

- 一个更像 `single-entry layered spec` 的 V8
- 一个规则级 SSOT 更硬的 V8
- 一个实例化消费路径更短的 V8
- 一个不容易把模板说明误抄进实例文件的 V8
- 一个把 `QUEUE_PATH` 的 authority 继续压实，同时减少 `STATUS_PATH` 动作副本的 V8

## 后续观察点

Round 6 完成后，仍值得继续观察但不在本轮继续深挖的点：

- `Structural Spine / Wave Gate Scoreboard` 在 skeleton 中是否还能再压缩一轮
- execution layer 是否还能进一步拆成更短的 protocol cluster
- 如果 future round 仍觉得单入口过载，是否进入 multi-file split

这些问题如果要做，已经更像下一轮主题，而不是本轮继续扩 scope。
