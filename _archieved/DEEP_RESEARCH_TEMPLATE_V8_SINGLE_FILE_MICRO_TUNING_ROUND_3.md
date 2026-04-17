# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 3

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> predecessor_control_doc: `DEEP_RESEARCH_TEMPLATE_V8_SINGLE_FILE_MICRO_TUNING_ROUND_2.md`
> document_role: `Round 3 调整计划 + 改动控制稿`
> round_goal: `压实 Plan / Status 边界，降低静态蓝图与动态状态面互相污染`
> round_scope: `只处理 Plan Skeleton 与 Status File Skeleton 之间最容易混写的边界区；不动 canonical sections，不做 status 字段精简`
> execution_state: `本文件是调整计划，不是 V8 正文已修改完成后的结果摘要`

## 这份文件现在扮演什么角色

这不是直接执行修改的补丁，也不是 `V9` 设计稿。

它现在的角色是：

- 承接 Round 1 与 Round 2 已确认的单文件微调方向
- 锁定 Round 3 唯一授权范围：`Plan / Status` 边界压实
- 给后续真正修改 `V8` 正文时提供最小动作清单
- 防止“边界治理”滑进 `status schema` 精简、章节重排或多文件化

如果本文件与更早轮次的泛化想法有冲突，以“继续留在 `V8` 单文件内做微调”这一前提解释。

## 先声明：这是调整计划，不是正文修改结果

这份文件必须始终被当成：

- `V8` 后续修改动作的控制依据
- 本轮允许做什么 / 不允许做什么的边界定义
- 后续执行者真正动 `V8` 正文前的对照清单

这份文件不能被当成：

- `V8` 已经改完后的结果说明
- 已执行改动的 closeout 摘要
- 可直接替代 `V8` 正文的实例化模板

如果后续真正修改 `V8`，应把这份文件当作调整计划逐项对照，而不是把它误读成“`V8` 已经自然演化到了这里”。

## Round 2 交接结论

Round 1 与 Round 2 已经把单文件微调方向收敛到两件事上：

- Round 1：优先处理最重的重复权威块，避免 `Plan Skeleton` 像第二份正文
- Round 2：继续把 `Plan Skeleton` 压向“填写面”，不再让它承担过多解释层

无论这些控制意图在 `V8` 正文中已落地到什么程度，Round 3 都不回头重开下面这些议题：

- 不回到“要不要拆文件”
- 不回到“要不要做 V8 -> V9 蓝图”
- 不回到 canonical sections 的再压缩
- 不回到 `Plan Skeleton` 的继续深瘦身

Round 3 只接手前两轮之后最自然、也最稳的一层问题：

- `Plan` 与 `Status` 的职责边界

## 当前评估快照

对 `V8` 当前状态的判断如下：

- 系统性：仍然很强
  - `template + protocol + state machine + handoff contract` 这一套骨架仍然成立，本轮不碰方法论。
- 结构性：当前最值得修
  - 单文件内的大块结构已经基本稳定，但 `Plan` 与 `Status` 的静态 / 动态职责边界仍然容易互相渗透。
- 游戏性：暂不动
  - `Wave Gate Scoreboard` 的存在本身不是 Round 3 要讨论的对象；本轮只处理它在 `Plan / Status` 两边各自应承担什么职责。
- 简洁性：不是本轮首修维度
  - Round 1 / Round 2 之后，当前最不稳的问题不再是“哪里太长”，而是“哪类信息该写进哪一个产物”。

Round 3 的首修焦点因此固定为：

- `压实静态蓝图与动态状态面的唯一职责边界`

## Round 3 控制快照

- current_score_focus: `结构性 + 一致性`
- smallest_next_move: `把 Plan 固定为静态蓝图，把 Status 固定为动态执行面`
- do_not_change_yet: `status schema 精简 / canonical section 压缩 / V8 -> V9 蓝图 / 多文件化 / Wave 主框架改写`

## 本轮为什么转向边界压实

前两轮的工作重点分别是：

- 先减掉最重的重复权威块
- 再把 `Plan Skeleton` 推近“填写面”

做到这一步之后，最容易继续制造 LLM 困惑的，已经不是“哪段解释太厚”，而是下面这类混写：

- `Plan` 里出现偏动态的状态面表达
- `Status` 里出现偏静态的结构规范复述
- 同一个对象在两边都出现，但没有清楚说明“这里记录的到底是设计态，还是当前态”

这一步之所以适合现在做，是因为：

- 它延续前两轮的节奏，不要求重开大结构
- 它仍然可以在单文件内完成，不需要拆文件
- 它能直接提升 `plan/status` 被 LLM 读取时的稳定性
- 它是后续是否值得讨论 `status schema` 精简的前提

## 本轮只解决什么

Round 3 只解决下面三类问题：

- `Plan Skeleton` 内偏动态的状态面表达
  - 尤其是那些更像“此刻推进到哪里了”的字段或语气
- `Status File Skeleton` 内偏静态的结构规范复述
  - 尤其是那些更像“这轮设计应该怎样组织”的句子
- `topology / gate / checkpoint / recovery` 在两边的双重承担
  - 允许两边都出现同名对象，但必须压实各自职责

补充边界：

- Round 3 调整的是 `Plan / Status` 的职责表达与边界表达
- Round 3 不直接重写实例化内容本身的填写要求
  - 例如 `TOPIC_REGISTRY`、`must_answer`、`gaps`、`FINAL_DELIVERABLE`、当前 blockers 的具体内容粒度，不属于本轮主修对象

## 本轮明确不解决什么

下面这些问题已经识别，但不属于 Round 3 的授权范围：

- 不精简 `Status File Skeleton` 的字段数量
- 不新增任何字段或新状态语义
- 不重做 `Wave 0 / Wave 1 / Wave 2 / Readiness Check`
- 不继续瘦身研究内容区块
- 不改 canonical sections 的厚度和展开方式
- 不做章节重排
- 不讨论多文件化
- 不把边界治理升级成模板总设计重构

## 本轮硬约束

- 保持单文件
- 不改 canonical sections
- 不改变方法论语义
- 不把 `Plan / Status` 写成完全固定模板；主心骨稳定，但实例内容仍需按 `seed` 动态适配
- 不减少 `Status File Skeleton` 的字段集合
- 不新增新协议、新 gate 名称或新状态词汇
- 不把动态日志职责写回 `Plan`
- 不把结构性设计职责堆进 `Status`
- 不因为“边界更清晰”而顺手重排多个大章节
- 不允许产生执行语义漂移
- `Plan Skeleton` 与 `Status File Skeleton` 仍然必须可直接复制实例化

## Round 3 目标块地图

| 目标块 | 当前问题 | Round 3 动作 |
| --- | --- | --- |
| `Plan Skeleton / 执行状态（动态更新）：见 <STATUS_PATH>` | 这是 plan 指向 status 的关键边界信号，但如果表达不够清楚，后续执行者仍可能把动态状态补写回 `Plan` | 保留这一链接式边界信号，并确保其只承担“指向 status”的职责，不扩成第二份动态摘要 |
| `Plan Skeleton / 结构主线与波次闸门得分板` | 同时承接结构主线与看起来像当前状态面的一部分表达，容易被读成“半设计、半实时面板” | 保留 `Structural Spine` 作为静态蓝图；审查 `Wave Gate Scoreboard` 的呈现方式，只允许它表达“本轮设计所使用的关卡模型”，不让它变成 `Status` 的替身 |
| `Plan Skeleton / Control Hierarchy` | 这是计划侧的控制边界说明，但与 `Status` 中的当前 gate / readiness 状态容易被误读成一回事 | 保留其作为 `Plan` 侧静态控制层说明，不让相同层级关系在 `Status` 中被重新定义 |
| `Plan Skeleton / 当前拓扑（Current Topology）` | 标题使用“当前”，但它在 plan 中承担的应是“本轮正式采用的拓扑基线”，不是实时工作日志 | 保留该块，但把它压实为本轮设计态拓扑说明，不承接过程性变化记录 |
| `Status / 当前结论 / 进度语义` | 这是动态状态面，但容易吸入过多静态规范词汇，尤其是把规则解释和当前状态写在一起 | 保留字段集合，只允许它记录当前状态、当前缺口、当前下一步，不再让它承担结构性规范说明 |
| `Status / 当前拓扑（Current Topology）与 Formalization State` | 与 plan 中的 topology 容易混成“重复写一遍”，看不出一个是基线、一个是执行中的结构变化 | 保留该块，但压实为执行态拓扑变化、formalization 进度与同步状态 |
| `Status / Resume Checkpoint` | 容易被写成第二份总进度摘要，或者把静态规则也塞进去 | 保留恢复入口职责，只记录“从哪里恢复、下一步做什么、什么不能忘”，不再承担方法论说明 |
| `Status / quality_calibration_loop` | 这个字段更接近模板维护视角，天然带一点边界灰区；本轮若顺手处理，容易滑进 `status schema` 精简或附录重构 | 在 Round 3 中只登记为已识别灰区，不删除、不改字段定义、不把它升级为本轮主修对象 |

说明：

- Round 3 不是删除这些块，而是压清它们的职责。
- 一旦某个块虽然同名，但两边职责已经足够不同，就不强行继续压。

## 本轮改动策略

### 1. `Plan` 只保留设计态、目标态、结构态

Round 3 中，`Plan` 默认只回答下面这些问题：

- 这轮为什么做
- 这轮按什么拓扑做
- 这轮按什么波次推进
- 这轮的验收门和交付物是什么

`Plan` 不负责记录：

- 此刻推进到了哪一关
- 当前最大阻塞是什么
- 如果现在中断，下一步接着做什么

### 2. `Status` 只保留执行态、当前态、恢复态

Round 3 中，`Status` 默认只回答下面这些问题：

- 现在推进到哪里了
- 当前卡在哪里
- 哪些分支已经挂起
- 如果现在中断，接手者怎么恢复

`Status` 不负责再次定义：

- 为什么模板这样设计
- 为什么要有这套 Wave
- 为什么采用这些结构对象

### 3. 允许同名对象在两边出现，但职责必须不同

Round 3 不追求“同名对象绝不重复”，而追求：

- 在 `Plan` 中，它是“设计基线”
- 在 `Status` 中，它是“执行中的当前状态”

例如：

- `Current Topology`
  - 在 `Plan` 中：本轮正式采用的 topic 拓扑
  - 在 `Status` 中：当前是否新增 topic、是否已同步 formalization
- `Wave Gate Scoreboard`
  - 在 `Plan` 中：本轮采用什么 gate 模型
  - 在 `Status` 中：当前正处于哪个 gate、下一得分动作是什么
- `执行状态（动态更新）：见 <STATUS_PATH>`
  - 在 `Plan` 中：这是动态状态的唯一外链入口
  - 在 `Status` 中：这是被实际更新的执行状态面

## 本轮写法规则

Round 3 编辑时必须遵守下面这些规则：

- `Plan` 不记录“此刻怎样了”，只记录“应该怎样推进”
- `Status` 不重复大段“为什么这样设计”，只记录“当前到哪、缺什么、下一步是什么”
- 如果某段既像规范又像状态，优先归回 `Plan`
- 如果某段既像状态又像恢复入口，优先归入 `Status`
- 如果一个对象必须两边都出现，必须让两边的字段语义不同，而不是换句话重复
- `Plan / Status` 的实例内容仍要按 `seed` 动态适配；Round 3 只压实稳定职责边界，不冻结实例内容
- 不为了追求边界清晰而删掉真正有 handoff 价值的恢复信息
- 一旦某个改动开始触发字段精简冲动，立即停止并登记到下一轮

## 编辑顺序

本轮真正修改 `V8` 时，严格按下面顺序执行：

1. 先审 `Plan Skeleton` 中带有状态感的块，只处理 `执行状态（动态更新）：见 <STATUS_PATH>`、`Wave Gate Scoreboard`、`Control Hierarchy`、`Current Topology` 与相关短导语。
2. 再审 `Status File Skeleton` 中带有结构规范感的块，只处理 `当前结论 / 进度语义`、`当前拓扑与 Formalization State`、`Resume Checkpoint`，并把 `quality_calibration_loop` 记为已识别但暂不处理的灰区。
3. 做一次交叉核对，确认：
   - `Plan` 里不再承担动态工作台职责
   - `Status` 里不再承担结构蓝图职责
4. 最后通读一次，确认没有把 Round 3 偷换成字段删减或章节重排。

## 验收标准

Round 3 完成后，必须同时满足下面条件：

- `Plan` 读起来更像静态蓝图，而不是实时进度面板
- `Status` 读起来更像动态执行面，而不是第二份结构设计说明
- `执行状态（动态更新）：见 <STATUS_PATH>` 仍然清楚承担“plan 指向 status”的边界信号
- `Current Topology` 在 `Plan / Status` 两边职责已经清楚区分
- `Wave Gate Scoreboard` 不再让 reader 误以为 `Plan` 就是当前状态文件
- `Control Hierarchy` 仍留在 `Plan` 侧承担静态控制边界说明，而不是漂进 `Status`
- `Resume Checkpoint` 仍然保有 handoff 与恢复价值
- 没有新增协议和字段
- `Plan Skeleton` 与 `Status File Skeleton` 仍可直接复制实例化
- 主心骨职责更稳定，但 `seed` 驱动的实例内容仍保持动态适配
- `quality_calibration_loop` 已被识别为边界灰区，但未被误纳入本轮字段精简
- 执行语义不变

建议的量化目标：

- 净减少约 `5-18` 行即可
- 如果边界清晰度明显上升，但净减行数很小，也允许通过

## 风险与防误伤

### 风险 1：把 `Plan` 压过头，失去执行导向

防法：

- `Plan` 可以保留本轮设计态的关卡模型与拓扑基线
- 不把所有状态感词汇都机械删掉，只删会让它误像实时状态面的部分

### 风险 2：把 `Status` 压过头，失去 handoff 恢复力

防法：

- `Resume Checkpoint` 必须保留
- `当前结论 / 进度语义` 仍然需要概括当前状态，不可压成只剩字段名

### 风险 3：借边界治理之名，滑进 `status schema` 精简

防法：

- 本轮只澄清职责，不删除字段集合
- 一旦讨论开始转向“这个字段要不要删”，默认停止并登记到下一轮

### 风险 4：借边界治理之名，滑进结构重排

防法：

- 不移动多个大章节
- 只在目标块内部做局部压实

### 风险 5：过度追求“稳定”，误伤 `seed` 驱动适配

防法：

- 稳定的是 `Plan / Status` 的职责分工，不是每轮实例内容
- 任何会把 `TOPIC_REGISTRY`、`gaps`、`topology baseline`、`current blockers` 写死成固定模板的动作，都不属于 Round 3

### 风险 6：把已识别灰区顺手升级成 schema 改写

防法：

- `quality_calibration_loop` 在 Round 3 中只允许被登记为灰区，不允许顺手删除、改名或移位
- `执行状态（动态更新）：见 <STATUS_PATH>` 只允许被强化为边界信号，不允许扩写成新的动态摘要区

## 完成后的检查清单

- `Plan Skeleton` 是否仍然像 plan，而不是工作台
- `Status File Skeleton` 是否仍然像 status，而不是第二份 plan
- `执行状态（动态更新）：见 <STATUS_PATH>` 是否仍然清楚承担 plan -> status 的动态链接职责
- `Wave Gate Scoreboard` 在 `Plan / Status` 两边是否职责已分清
- `Control Hierarchy` 是否仍然清楚留在 `Plan` 侧
- `Current Topology` 在 `Plan / Status` 两边是否职责已分清
- `Resume Checkpoint` 是否仍然只承担恢复职责
- `quality_calibration_loop` 是否只是被登记为灰区，而没有被偷渡成 schema 改写
- `Status File Skeleton` 的字段集合是否完全未减
- `Plan Skeleton` 与 `Status File Skeleton` 是否仍可直接复制实例化
- `seed` 驱动的实例内容是否没有被误冻成固定 boilerplate
- 单文件约束是否完全满足
- 是否没有偷渡到 canonical section 压缩、字段精简或章节重排

## 暂不处理的问题

下面这些问题继续登记，但不在 Round 3 内处理：

- `Status File Skeleton` 的字段精简与伪精确问题
- canonical sections 的进一步压缩
- `Plan Skeleton` 更深层的研究内容瘦身
- appendix / reference-writing spec 的降级问题
- 游戏性表达进一步压轻
- 多文件化

## 这轮真正的目标

这轮不是让 `Plan` 和 `Status` 看起来“更短”，而是让它们看起来“更不像彼此”。

如果 Round 3 做对了，后续即使继续留在单文件里，LLM 也会更容易判断：

- 什么时候该读 `Plan`
- 什么时候该读 `Status`
- 同一个对象在两边出现时，到底该把哪一类信息写进哪里

这一轮的成功，不看删了多少，而看：

- 静态蓝图是否更像静态蓝图
- 动态状态面是否更像动态状态面
- 单文件是否因此更稳，而不是更散
