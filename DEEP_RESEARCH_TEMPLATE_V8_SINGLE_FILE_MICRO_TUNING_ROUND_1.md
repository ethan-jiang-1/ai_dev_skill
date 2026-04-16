# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 1

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> document_role: `Round 1 评估 + 改动控制稿`
> round_goal: `先去重，再稳住唯一权威源；不做结构重排`
> round_scope: `只处理单文件内最重的重复权威块，并把暂不处理的问题登记清楚`

## 这份文件现在扮演什么角色

这不是 `V9` 设计稿，也不是直接贴给执行者的逐行删改脚本。

它现在的角色是：

- 记录 Round 1 已确认的问题画像
- 锁定本轮允许做的最小动作
- 锁定本轮明确不做的事情
- 给后续真正修改 `V8` 正文时提供唯一控制依据

如果这份文件与更早的 Round 1 想法有冲突，以本文件当前版本为准。

## 当前评估快照

对 `V8` 的当前判断如下：

- 系统性：`8.8 / 10`
  - `template + protocol + state machine + handoff contract` 已经成型，长程研究能力强。这不是当前首修对象。
- 结构性：`7.6 / 10`
  - 主骨架存在，但“主阅读路径”和“解释层”耦合偏深。这个问题已经确认，但 Round 1 只登记，不大动。
- 游戏性：`7.9 / 10`
  - `Wave Gate Scoreboard`、关卡、得分动作方向是对的，但表达仍偏显性。本轮不进入该议题。
- 简洁性：`6.6 / 10`
  - 当前最弱，也是最适合第一轮小步修复的维度。主要问题是同一规则跨章节重复展开，提醒层与正文层互相回响。

Round 1 的首修焦点因此固定为：

- `先减冗余，不扩结构`

## Round 1 控制快照

- current_score_focus: `简洁性`
- smallest_next_move: `删除第二份正文，建立唯一权威源`
- do_not_change_yet: `skeleton 深瘦身 / status schema 精简 / 游戏性增强 / 多文件化`

## 本轮为什么先打去重

这一步是上游问题，先于下面这些议题：

- skeleton 过重
- 前置协议过厚
- status 伪精确
- 写入同步摩擦过高
- 游戏性表达偏重

原因很直接：

- 它同时伤害结构性与简洁性
- 它会放大后续所有新增规则的复杂度
- 它不要求推翻方法论，适合小步改、低风险验证
- 它对执行语义影响最小，但对阅读成本改善最大

## 本轮只解决什么

Round 1 只解决下面两件事：

- `唯一权威源不清晰`
  - 同一规则族同时存在“完整版本 + skeleton 内重复版本 + reminder 再重复”的情况。
- `skeleton 像第二份正文`
  - `Plan Skeleton` 里部分协议重复前文完整定义，导致实例化路径被额外加重。

Round 1 不追求把所有冗余一次清干净，只收最重、最像“第二份正文”的那些重复块。

## 本轮明确不解决什么

下面这些问题已经识别，但不属于 Round 1 的授权范围：

- 不重做主模板的大章节顺序
- 不处理“主骨架与解释层耦合偏深”的深层结构问题
- 不把 `Plan Skeleton` 进一步压到只剩极简实例化字段
- 不改 `Status File Skeleton` 的字段集合
- 不处理写入同步摩擦、回填摩擦或 status 伪精确
- 不重做 `Wave Gate Scoreboard` 或整体游戏性表达
- 不讨论多文件化
- 不把“去重”升级成“结构重写”

## 本轮硬约束

- 保持单文件
- 不拆章节为多个文件
- 不修改 `Wave 0 / Wave 1 / Wave 2 / Readiness Check` 的总体方法论
- 不修改 `Status File Skeleton` 的字段集合
- 不修改 `证据采集协议` 的主体结构
- 不新增新的协议或新的波次
- 不移动多个大章节来换取压缩效果
- 不做“顺手优化”式扩张
- 不允许产生执行语义漂移

## 当前重复权威块地图

下表定义了 Round 1 要收敛的规则族，以及它们在 `V8` 中的唯一完整版本。

| 规则族 | 唯一完整版本保留位置 | 当前主要重复位置 | Round 1 动作 |
| --- | --- | --- | --- |
| Autonomous Execution Protocol | `## Autonomous Execution Protocol（自主执行协议，MUST READ）` | skeleton 中的 `## Autonomous Execution Protocol（本轮实例化提醒）`，以及后文近义 reminder | 保留前部 canonical section 为唯一完整版本；其他位置改为短提醒 |
| Topology Formalization Gate | `## Topology Formalization Gate（拓扑正式化闸门）` | skeleton 中的 `## Topology Formalization Gate（本轮执行提醒）` 及相关近义提醒 | 保留 canonical section；skeleton 只保留 topology 提醒 |
| Exploration-Exploitation Decision Framework | `## Exploration-Exploitation Decision Framework（探索 / 利用决策框架）` | skeleton 中的 `## 探索 / 利用决策框架（本轮执行提醒）` | 保留 canonical section；skeleton 不再展开信号列表 |
| Foundation Sufficiency Check | `## Foundation Sufficiency Check（Wave 0 → Wave 1，地基充分性检查）` | Wave 0 内的 `### Foundation Sufficiency Check（Wave 0 → Wave 1，本轮短检查）` | 保留 canonical section；Wave 0 中只保留局部短检查 |
| Early Saturation Protocol | `## Early Saturation Protocol（提前饱和协议）` | 停止条件中的 `### Early Saturation Protocol（停止条件语境提醒）` 及相关一句式提醒 | 保留 canonical section；停止条件里只保留引用式短提醒 |
| Suspended Branch Protocol / human-on-the-loop | `## Suspended Branch Protocol（探索分支处置协议）` | 前部 `### 5. 与 human-on-the-loop 原则的关系`，以及分支处置区内的 `### Human-on-the-loop Principle（分支处理提醒）` | 保留后部详细协议为主要展开位置；其他位置只保留与当前上下文直接相关的最短提醒 |

说明：

- 本表只覆盖最重的重复权威块，不覆盖所有相似表达。
- 后续维护以章节名为准，不再使用旧行号。
- 如果某条规则只有一个完整版本、其他位置只是轻量回指，不纳入 Round 1 处理范围。

## 本轮改动策略

### 1. 先锁定 canonical sections

以下章节作为正式权威版保留，不改变其方法论语义：

- `## Autonomous Execution Protocol（自主执行协议，MUST READ）`
- `## Topology Formalization Gate（拓扑正式化闸门）`
- `## Exploration-Exploitation Decision Framework（探索 / 利用决策框架）`
- `## Foundation Sufficiency Check（Wave 0 → Wave 1，地基充分性检查）`
- `## Early Saturation Protocol（提前饱和协议）`
- `## Suspended Branch Protocol（探索分支处置协议）`

本轮只允许对这些段落做极少量措辞压缩，不允许改变规则语义。

### 2. skeleton 中的重复规则一律降级为“短提醒”

`## 可直接复制的 Plan Skeleton` 里的重复协议不再承担“再次定义规则”的职责。

处理原则：

- 如果前文已有完整规则，skeleton 里只保留与实例化直接相关的短提醒
- skeleton 中可以保留一句“完整规则见前文某节”
- skeleton 中不再完整重复信号列表、升级条件或人工介入条件

具体目标：

- `Autonomous Execution Protocol（本轮实例化提醒）` 保留为极短版执行提醒
- `Topology Formalization Gate（本轮执行提醒）` 改为 topology 提醒，不再复述 gate
- `探索 / 利用决策框架（本轮执行提醒）` 改为执行提示，不再完整展开 signals
- `Foundation Sufficiency Check（Wave 0 → Wave 1，本轮短检查）` 只保留进入 Wave 1 前的局部检查
- `Early Saturation Protocol（停止条件语境提醒）` 改为引用式短提醒

### 3. reminder 类章节只收最重的“第二份正文”

只处理最明显会与 canonical section 争夺权威性的 reminder：

- 后半段的自主执行近义 reminder 块
- 停止条件与分支处置里的 `human-on-the-loop` 重复展开
- 底部“这个模板真正要守住的东西”里对完整协议的重复复述

处理方式：

- reminder 只保留 1 到 3 句导航式提醒
- `human-on-the-loop` 只保留与 `suspend and continue` 强相关的局部说明
- 底部 invariant 列表只删最明显的完整协议复述，不顺手重写整段

### 4. 不移动大章节，只做单文件内部去重

本轮不做下面这些动作：

- 不把后面的协议整体前移
- 不改变 `Plan Skeleton` 与 `Status File Skeleton` 的边界
- 不重做目录顺序
- 不引入新的总览页或 mini index

原因：

- 这是 Round 1，不做大手术
- 先验证“唯一权威源”能否稳住，再决定后续是否需要更深调整

## 本轮写法规则

Round 1 编辑时必须遵守下面这些规则：

- 一个规则族只能有一个“完整定义”
- 同一规则在其他位置最多保留一条短提醒、一条回指或一条局部执行提示
- reminder 只负责导航，不负责再定义协议
- 不为了压行数而删掉真正关键的局部操作提醒
- 不改 heading 名称，除非改名能直接减少歧义且不影响检索
- 不发明新的协议名、闸门名或状态语义
- 一旦某个改动需要重排多个大章节，立即停止并登记到下一轮

## 编辑顺序

本轮真正修改 `V8` 时，严格按下面顺序执行：

1. 先锁定前部权威段落，不改标题，只确认保留位置。
2. 再进入 skeleton，把重复块压成短提醒。
3. 再处理 reminder 区块中最重的重复正文，防止留下第二份正文。
4. 最后只删除底部 invariant 列表里最明显的协议复述。
5. 通读一遍，确认没有某条规则被删到“只剩提醒，没有正文”。

不允许反向顺序：

- 不能先删 reminder，再发现前文也被改薄了
- 不能把去重过程演变成大面积压缩或重写

## 验收标准

Round 1 完成后，必须同时满足下面条件：

- `V8` 仍然是单文件
- 每类核心规则只剩一个完整版本
- skeleton 内不再出现第二份近似全文的协议
- reader 能在 30 秒内定位到每类核心规则的正式版本
- 总篇幅有可见下降，而不是换位置重复
- `Plan Skeleton` 仍可直接复制实例化
- 执行语义不变

建议的量化目标：

- 净减少约 `20-60` 行即可，不追求多删
- 不减少任何一个核心协议的可执行性

## 风险与防误伤

### 风险 1：压缩过度，导致 skeleton 失去独立可用性

防法：

- skeleton 里保留最短可执行提醒
- 不把所有协议都变成“自行理解”

### 风险 2：删掉重复时，把唯一权威段落也一起削薄

防法：

- 先锁定 canonical section，再删其他位置
- 删除前后逐项核对“哪一段是正式版本”

### 风险 3：顺手处理太多，导致 Round 1 失控

防法：

- 只处理表中列出的重复权威块
- 发现更深层的结构问题时，只登记，不当场大改
- 任何需要移动多个大章节的改动，默认转入下一轮

## 完成后的检查清单

- `Autonomous Execution Protocol` 是否只剩一个完整版本
- `Topology Formalization Gate` 是否只剩一个完整版本
- `Exploration-Exploitation Decision Framework` 是否只剩一个完整版本
- `Foundation Sufficiency Check` 是否只剩一个完整版本
- `Early Saturation Protocol` 是否只剩一个完整版本
- `Suspended Branch Protocol / human-on-the-loop` 是否只剩一个详细协议版本
- skeleton 是否仍可复制
- `Status File Skeleton` 是否完全未动
- 单文件约束是否完全满足
- 是否没有偷渡到 Round 2 议题

## Round 1 复盘结论

判定：`完成，可结案`

本轮对 `V8` 的实际结果：

- `V8` 仍然保持单文件。
- `Autonomous Execution Protocol`、`Topology Formalization Gate`、`Exploration-Exploitation Decision Framework`、`Foundation Sufficiency Check`、`Early Saturation Protocol`、`Suspended Branch Protocol / human-on-the-loop` 都已回到“前部 canonical section + 其他位置短提醒”的形态。
- skeleton 内最重的第二份正文已被压成短提醒；`Plan Skeleton` 仍可直接复制实例化。
- `Status File Skeleton` 未动。
- 本轮没有进入 `status schema 精简`、`skeleton 深瘦身`、`游戏性增强` 或结构重排。

结案备注：

- 量化目标原建议净减少约 `20-60` 行；本轮实际从 `1286` 行降到 `1268` 行，净减 `18` 行。这个点略低于建议值，但不影响 Round 1 的定性通过，因为本轮硬目标是“唯一权威源建立 + 最重重复块去重”，而不是追求更激进删减。
- 仍存在可继续优化的解释性重复，尤其是 skeleton 内的 `Structural Spine / Wave Gate Scoreboard`。这已经更像 Round 2 起点，不再属于 Round 1 必修项。

## 已登记但推迟到下一轮的问题

下面这些问题已经确认存在，但不在 Round 1 内处理：

- `Plan Skeleton` 进一步瘦身，只保留实例化必须内容
- 前部协议过厚与“主阅读路径 / 解释层”分离问题
- `Status File Skeleton` 的伪精确和字段负担
- 写入同步与回填摩擦
- 游戏性表达进一步压轻
- skeleton 内 `Structural Spine / Wave Gate Scoreboard` 的解释性重复

## 这轮真正的目标

这轮不是让模板“更强”，而是让模板先“更稳”。

如果 Round 1 做对了，后面的每一次微调都会更便宜；如果 Round 1 跳过，后面的每一次优化都还会继续在重复块上付利息。

这一轮的成功，不看“改了多少”，而看“是不是稳稳地只做了一小层，而且做对了”。
