# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 2

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> predecessor_control_doc: `DEEP_RESEARCH_TEMPLATE_V8_SINGLE_FILE_MICRO_TUNING_ROUND_1.md`
> document_role: `Round 2 评估 + 改动控制稿`
> round_goal: `压缩 Plan Skeleton 的解释层，只保留实例化必须内容`
> round_scope: `只处理 Plan Skeleton 内仍然像“第二层说明书”的块；不动 canonical sections，不动 Status File Skeleton`

## 这份文件现在扮演什么角色

这不是直接执行修改的补丁，也不是 `V9` 设计稿。

它现在的角色是：

- 承接 Round 1 的结案结果
- 锁定 Round 2 的唯一授权范围
- 把下一轮要收的 skeleton 重复块写成最小动作清单
- 防止“继续优化”滑进结构重排、status 精简或方法论改写

如果本文件与 Round 1 控制稿有冲突，以“Round 1 已完成、Round 2 只压 skeleton”这一前提解释。

## Round 1 交接结论

Round 1 已完成，当前已确认：

- 主要 canonical rules 已回到“前部完整版本 + 后文短提醒”的形态。
- `Plan Skeleton` 内最重的协议级重复块已经被压短。
- `Status File Skeleton` 未动。
- 当前最值得继续收的对象，不再是协议正文，而是 skeleton 内仍偏厚的解释层。

Round 2 因此不再处理 authority consolidation，而是处理：

- `Plan Skeleton` 的局部瘦身

## 当前评估快照

对 `V8` 当前状态的判断如下：

- 系统性：仍强，不是当前首修对象。
- 结构性：较 Round 1 前略有改善，但 skeleton 仍夹带一层“解释型中间层”。
- 游戏性：概念方向不动；Round 2 不处理游戏性设计本身。
- 简洁性：较 Round 1 前已有改善，但 `Plan Skeleton` 仍有少量非实例化必须内容。

Round 2 的首修焦点固定为：

- `压 skeleton 的解释层，不碰研究方法层`

## Round 2 控制快照

- current_score_focus: `简洁性`
- smallest_next_move: `把 skeleton 从“可复制说明书”再推近一步，变成“可复制填写面”`
- do_not_change_yet: `status schema / canonical protocol / Wave 主框架 / 结构重排 / 游戏性增强`

## 本轮为什么先收 skeleton

Round 1 之后，最大的剩余冗余不再是协议重复，而是 skeleton 中仍然保留了一层解释性重复。

这一步之所以适合现在做，是因为：

- 它已经处在 Round 1 清理后的自然下一步
- 它仍然可以在单文件内完成，不要求大手术
- 它主要影响阅读与实例化成本，对执行语义风险较低
- 它能进一步验证“template 主体”和“实例化填写面”是否可以更清楚地分层

## 本轮只解决什么

Round 2 只解决下面两件事：

- `Plan Skeleton` 内仍存在少量“解释性块”，它们更像再次说明前文，而不是实例化填写面。
- `Structural Spine / Wave Gate Scoreboard` 在 skeleton 中仍保留了部分可继续压缩的重复解释。

Round 2 不追求把整个 skeleton 压成极简表单，只处理最明确、最低风险的非必须解释层。

## 本轮明确不解决什么

下面这些问题已经确认存在，但不属于 Round 2 的授权范围：

- 不改 `Status File Skeleton`
- 不改 `Wave 0 / Wave 1 / Wave 2 / Readiness Check`
- 不重写 `研究线的具体目标`
- 不重做 `总体策略`、`执行节奏`、`Hard Gates`
- 不处理前部 canonical sections 的厚度
- 不处理“主阅读路径 / 解释层”整体拆分
- 不改游戏性机制本身，只允许压缩其 skeleton 内表达
- 不讨论多文件化

## 本轮硬约束

- 保持单文件
- 只修改 `## 可直接复制的 Plan Skeleton` 区域
- 不修改 `## 配套 Status File Skeleton`
- 不改 canonical section 的标题、位置和规则语义
- 不新增新协议、新字段、新状态语义
- 不因为压缩而损失 skeleton 的可复制可填写性
- 不允许产生执行语义漂移

## Round 2 目标块地图

| 目标块 | 当前问题 | Round 2 动作 |
| --- | --- | --- |
| skeleton 开头说明区 | Round 1 已收过一轮，但仍要避免顺手补回说明层 | 本轮只复核，不再扩写 |
| `## 结构主线与波次闸门得分板` | 这是实例化区，但标题下仍承接一层解释型内容 | 保留区块，不扩写，只收其中非必须解释 |
| `### Structural Spine` | 主要价值是表格本身，不是重复讲 canonical rationale | 保留表格；不再新增任何解释层 |
| `### Wave Gate Scoreboard` | 字段区和解释区混在一起，存在继续压缩空间 | 保留填写必须字段，优先删除对 canonical mapping 与规则的再次讲述 |

说明：

- Round 2 的重点是“保留填写面，删除解释层”。
- 一旦发现某个块的表格本身就是必需填写面，就不继续压它。

## 本轮改动策略

### 1. 把 skeleton 当成“填写面”而不是“第二份教程”

判断标准：

- 能直接填写，就保留
- 只是再次解释前文，就压缩或删除
- 既有填写价值也有少量提醒价值，就保留最短提醒

### 2. 优先收 `Wave Gate Scoreboard` 的重复解释

Round 2 默认优先检查下面两类内容：

- 对 canonical mapping 的再次解释
- 对 redirect / suspend 规则的再次解释

如果这些内容前文已有完整定义，而 skeleton 中不是实例化必须字段，就优先删除。

### 3. `Structural Spine` 只做“保表不保讲”

`Structural Spine` 的表格本身仍然有实例化价值，因此默认保留。

Round 2 不去掉这个填写面，但要守住一条规则：

- 不再为它补写任何新的解释性导语或 rationale

### 4. 不把 Round 2 偷换成“大规模 skeleton 瘦身”

本轮不做下面这些动作：

- 不一次性压多个研究内容区块
- 不把 `目标`、`验收标准` 整体移除
- 不把 skeleton 变成只剩占位符清单
- 不为了追求行数下降而删除仍然有填写价值的块

补充边界：

- `本轮质量校准` 属于模板维护语言，而不是研究实例化填写面；如果它留在 skeleton 中，会优先被移出。
- `先反省` 如果继续保留，必须改写成研究导向命名，而不是版本导向命名。

## 本轮写法规则

Round 2 编辑时必须遵守下面这些规则：

- 保字段，先删解释
- 保填写面，先删导语
- 回指前文可以保留，但不再展开前文已有定义
- 如果一个块删完解释后仍然清楚，就不补新说明
- 一旦某个改动开始影响实例化时的判断力，就停止收缩

## 编辑顺序

本轮真正修改 `V8` 时，严格按下面顺序执行：

1. 先进入 `## 可直接复制的 Plan Skeleton`，不碰 skeleton 外区域。
2. 先检查 `### Wave Gate Scoreboard`，只删除非填写必须的解释和重复规则。
3. 再检查 `### Structural Spine`，只做“保表不保讲”的轻压缩。
4. 通读 skeleton 开头到 `## 配套 Status File Skeleton` 前，确认没有把 Round 2 扩散成大面积重写。
5. 最后核对 `Status File Skeleton` 完全未动。

## 验收标准

Round 2 完成后，必须同时满足下面条件：

- `Plan Skeleton` 仍可直接复制实例化
- `Structural Spine / Wave Gate Scoreboard` 不再像第二份 canonical 说明
- 被删除的内容都属于解释层，而不是填写面
- `Status File Skeleton` 完全未动
- 执行语义不变

建议的量化目标：

- 净减少约 `8-25` 行即可
- 不为了达到量化目标而硬删仍有填写价值的字段

## 风险与防误伤

### 风险 1：把 skeleton 压到失去填写引导

防法：

- 先删解释，不删字段
- 如果删完后需要重新补一句才能看懂，说明删得过头

### 风险 2：误删 `Wave Gate Scoreboard` 的状态面

防法：

- 默认保留 `current_gate / next_gate / next_scoring_action / score_since_last_gap_reduction`
- 只优先删除对这些字段的规则解释，不优先删字段本身

### 风险 3：Round 2 顺手滑进 broader skeleton refactor

防法：

- 只处理本文件表格中列出的目标块
- 一旦出现“要不要顺手改目标/验收/总体策略”的念头，直接停手，登记到后续轮次

## 完成后的检查清单

- skeleton 开头说明区是否没有被重新膨胀
- `Structural Spine` 是否保留填写价值但不再补讲
- `Wave Gate Scoreboard` 是否保留状态面但删掉重复解释
- `Status File Skeleton` 是否完全未动
- 是否没有偷渡到 status 精简、结构重排或 canonical section 改写

## 暂不处理的问题

- `Status File Skeleton` 的伪精确和字段负担
- 前部协议过厚与“主阅读路径 / 解释层”分离问题
- skeleton 研究内容区块的更深层瘦身
- 游戏性表达进一步压轻
- 多文件化

## 这轮真正的目标

这轮不是让 skeleton 变成“最短”，而是让 skeleton 更像“填写面”。

如果 Round 2 做对了，后续再判断哪些块值得继续压，就会更容易；如果 Round 2 做过头，实例化体验会先坏掉。
