# DEEP_RESEARCH_TEMPLATE_V8 单文件微调 Round 5

> target_template: `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V8.md`
> predecessor_control_doc: `DEEP_RESEARCH_TEMPLATE_V8_SINGLE_FILE_MICRO_TUNING_ROUND_4.md`
> document_role: `Round 5 实施控制稿`
> round_goal: `improve structural clarity, consistency, concision, and SSOT hardness inside single-file V8 without renaming the template or changing the methodology`
> round_scope: `先把 V8 单文件内的信息架构收口、枚举统一、复制边界硬化、实例继承白名单、execution-only wording cleanup，以及显性连续派工机制压实；并把 plan/status/queue 三件套改造完整登记到本控制稿中，随后再按本稿回改 V8 正文；不做 multi-file split，不升级到 V9，不重写方法论`
> execution_state: `本文件是 Round 5 控制稿，同时对应本轮对 V8 正文的实际落地改动`

## 这轮控制稿的定位

Round 5 不再继续只做评估，也不转向 `V9` 设计。

它的角色是：

- 锁定 single-file `V8` 本轮允许落地的改动包
- 约束“只收口，不重写”的实施方向
- 为本轮已完成修改提供一份可审查的控制说明

如果本文件与更早轮次的控制稿冲突，以本文件为准。

## Round 5 的目标收口

本轮只围绕 6 个对象做 in-place surgery：

- `结构性`
  - 让读者和 LLM 能明显区分 routing / instantiation / execution / appendix 四层
- `一致性`
  - 让 mode、gate、wave、branch state、字段类型只有一套 canonical 写法
- `简洁性`
  - 把重复定义改成单点定义 + 引用，不继续堆解释
- `SSOT`
  - 把“哪类信息写到哪里、谁能改、哪里不能镜像”压成显式表
- `连续派工`
  - 把“模型任何时刻都知道接下来干什么”写成协议和 status schema，而不是只靠口头理解
- `三件套执行面`
  - 把 `plan / status / queue` 三件套角色压清，尤其把显性执行队列从 status 内 section 升格为独立权威文件

## Round 5 允许做的动作

### 1. Single-file hard blocks

在不拆文件的前提下，把主模板显式切成 4 个 block：

- `A. Routing + Core Contract`
- `B. Instantiation Output Boundary`
- `C. Execution Protocol`
- `D. Appendix / Maintenance`

每个 block 都必须写清：

- 谁应阅读
- 何时阅读
- 是否允许进入实例产物
- 该 block 是否承担权威定义职责

### 2. Canonical tables

在 `Core Contract` 附近新增 3 张 short but hard tables：

- `Source of Record Matrix`
- `Canonical Enum Registry`
- `Instantiation Copy Boundary`

这些表的目标不是增加新规则，而是把已有规则压成单点。

### 3. Instantiated-plan inheritance whitelist

新增 `Inherited Minimum Rules for Instantiated Plan`，只允许最小必要控制规则进入实例 `PLAN_PATH`。

白名单范围固定为：

- plan/status 的 design-time / run-time 边界
- `topic registry` 的唯一注册职责
- `derived_topic_count` 的派生关系
- `topology baseline` 与 `topology delta` 的分工
- `gate model` 与 `gate state` 的分工
- `controlled mutation` 的允许范围

### 4. Skeleton copy boundary hardening

不再依赖“从某标题到某标题之间复制”的 prose。

统一改成 marker-based boundary：

- `BEGIN PLAN SKELETON / END PLAN SKELETON`
- `BEGIN STATUS SKELETON / END STATUS SKELETON`

section 级复制许可统一由 `Instantiation Copy Boundary` 表声明。

### 5. Enum and schema normalization

本轮强制统一：

- `current_mode`
- `current_wave`
- `current_gate`
- `next_scoring_action`
- `primary_source_status`
- `Wave 0 / Wave 1 / Wave 2` 的状态值
- `Readiness Check` 的状态值
- `branch disposition state`

并固定高风险字段类型：

- `evidence_summary` = artifact path
- `question_list` = artifact path
- `synthesis_file` = artifact path
- `seed_backfill_status` = short status field
- `artifact_status` = short status field
- `new_topics` = topic slug list or `none`
- `pending_topic_candidates` = topic slug list or `none`

### 6. Active Todo Queue hardening

Round 5 新增一个核心执行约束：连续派工必须显性化。

固定要求：

- `STATUS_PATH` 中必须新增 `Active Todo Queue`
- 默认至少保持：
  - `current_task`
  - `next_task`
  - `next_after_next`
- 允许追加：
  - `queue_health`
  - `queue_maintenance_rule`

这不是可选导航项，而是防止模型在局部完成后停机的强约束。

### 6.1 Queue file elevation（从 section 升格为独立文件）

Round 5 进一步确认：如果目标是“长程静默自主执行”，只把 `Active Todo Queue` 放在 `STATUS_PATH` 里还不够硬。

必须在控制稿中登记下一步改造方向：

- 从 `status 内一个 section`
- 升格为 `独立 queue.md`

推荐命名：

- `<PLAN_BASENAME>.queue.md`

推荐术语：

- `QUEUE_PATH`

推荐角色：

- `authoritative execution queue`

推荐定位：

- `QUEUE_PATH` 专门回答“现在立刻做什么、做完后接什么、再之后接什么”
- 它不是设计态蓝图，不替代 `PLAN_PATH`
- 它也不是状态总表，不替代 `STATUS_PATH`

换句话说，Round 5 现在已经确认下一步目标架构应为三件套：

- `PLAN_PATH`：design-time blueprint
- `STATUS_PATH`：run-time state
- `QUEUE_PATH`：authoritative execution queue

### 6.2 Why queue.md is needed（为什么要单独的 queue.md）

控制稿里要明确写下这个判断，避免后面忘掉：

- `STATUS_PATH` 很容易随着执行变厚
- 一旦状态信息、阻塞、波次、挂起分支、failed exploration 都堆进去，“下一步动作”就会被埋掉
- 模型恢复时最需要的是“一眼就能继续干活”的入口，而不是完整状态叙述
- 如果希望减少中途停机，就必须把“连续派工”从隐含义务变成显性文件对象

因此：

- `Active Todo Queue` 作为概念是对的
- 但它最终更适合成为单独的 `QUEUE_PATH`
- `STATUS_PATH` 中只保留 queue 的摘要与指针，而不承担完整 live queue 本体

### 6.3 Queue SSOT split（queue 与 status 的 SSOT 拆分）

控制稿中先锁定目标分工，后续回改 V8 正文时按这个分工实施：

- `QUEUE_PATH`
  - `Source of Record`：连续执行队列
  - 负责：`current_task / next_task / next_after_next / refill / promotion`
  - 不负责：完整状态叙述、完整 gate state、完整波次进度
- `STATUS_PATH`
  - 保留：`queue_path`
  - 保留：`queue_health`
  - 保留：`current_task_summary`
  - 保留：`last_queue_refill`
  - 不再维护完整 live queue 副本
- `PLAN_PATH`
  - 不记录 live queue
  - 只记录执行结构、规则、输出契约与验收要求

### 6.4 Queue schema direction（queue.md 建议结构）

Round 5 控制稿中先登记建议结构，后续回改 V8 时再决定最终写法：

```md
# <PLAN_NAME> Execution Queue

> queue_role: `authoritative execution queue`
> linked_plan: `<PLAN_PATH>`
> linked_status: `<STATUS_PATH>`

## Active Queue

- current_task:
- next_task:
- next_after_next:
- queue_health: `ready / thin / blocked`

## Refill Pool

- candidate:
- why_next:
- prerequisite:
- promotion_trigger:

## Promotion Rules

- when_current_finishes:
- when_queue_becomes_thin:
- when_blocked:
- when_to_suspend_branch:

## No-Empty-Queue Rule

- before_closing_current_task:
- must_refill_to:
- only_allowed_empty_condition:
```

这不是最终版 schema 承诺，但必须先在控制稿里登记下来，防止后续回改 V8 时又退回“只在 status 里顺手写几条下一步”。

### 6.5 No-Empty-Queue Rule（最关键的硬规则）

Round 5 控制稿必须把这条规则写死：

- 任何时刻都至少有 `current_task / next_task / next_after_next`
- 关闭 `current_task` 之前，先补齐后续队列
- 只有满足真正阻塞条件时，`queue_health` 才允许变成 `blocked`
- 不允许出现“当前任务做完了，再临时想下一步”的状态空窗

这条规则的目标不是让待办无限增长，而是让活跃执行队列永远不断供。

### 7. Execution-only conflict cleanup

本轮必须修掉这个冲突：

- 前文说 `Execution Protocol` 默认不复制进实例产物
- 后文又说“高杠杆执行行为写入计划，必须遵守”

Round 5 的固定处理是：

- `Execution Protocol` 仍然是 execution-only
- 高杠杆执行行为保留，但改为 execution-only wording
- 实例 plan 只继承 `Inherited Minimum Rules` 白名单，不继承整块执行协议

### 8. Branch disposition normalization

协议层继续允许使用动作原型：

- `discard / compress / suspend / archive / redirect`

但 `STATUS_PATH` 中的枚举统一为过去分词态：

- `discarded / compressed / suspended / archived / redirected`

这条映射关系必须显式写进正文，避免 LLM 在协议动作名和 status enum 之间来回漂移。

## Round 5 明确不做

- 不拆主模板为多文件
- 不改 `template_version: v8`
- 不做 `V8 -> V9` 迁移
- 不重写 `Wave 0 / Wave 1 / Wave 2 / Readiness Check`
- 不重做 deep research 方法论
- 不把 `Status File Skeleton` 缩成极简 dashboard
- 不把 `Plan Skeleton` 改成空表单
- 不改 reference capture 的核心方法
- 不在本次这一步直接回改 `V8` 正文里的三件套；先把三件套改造完整写入本控制稿，再按控制稿实施

## Round 5 验收标准

改动完成后，至少应满足：

- 模板正文中能一眼区分 4 个 single-file blocks
- `plan/status` 复制边界不再依赖松散 prose，而是依赖 markers
- 实例 plan 是否允许继承某条规则，可以通过 `Instantiation Copy Boundary` 直接判定
- 任何一个状态字段都能从 `Canonical Enum Registry` 找到唯一合法值
- `topic registry`、`gate state`、`topology baseline`、`topology delta` 都能回答“唯一写入口在哪里”
- `Execution Protocol` 不再与实例 plan 继承策略打架
- `Active Todo Queue` 成为默认“接下来干什么”的显性入口
- `QUEUE_PATH` 作为下一步改造方向已经在控制稿中被完整登记，不再只是口头想法
- 普通 LLM 读取后，不容易再把执行协议、附录和 skeleton 一起误抄进实例产物
- 普通 LLM 执行时，不容易在局部完成后进入无显性下一步的停顿

## 本轮实施顺序

1. 先加 single-file block map 和 4 个 block 入口说明。
2. 再加 canonical tables，把 SSOT、枚举、复制许可压成单点。
3. 在 instantiation 区补 `Inherited Minimum Rules`。
4. 给 plan/status skeleton 加 marker 边界，并补 status field type notes。
5. 给 `STATUS_PATH` 增加 `Active Todo Queue` schema。
6. 把 `QUEUE_PATH` 三件套改造完整登记到本控制稿。
7. 最后再按控制稿回改 `V8` 正文，并统一 branch disposition enum。

## 本轮预期结果

Round 5 之后，`V8` 仍然是同一个 single-file template，但它会更像：

- 一个带硬分区的主模板
- 一个有白名单继承规则的实例化模板
- 一个不会轻易把 execution-only 规则混入 skeleton 的模板
- 一个真正把 `Source of Record` 从理念压成写入口的模板
- 一个让 agent 明确知道“下一步、下下步、下一串动作”都写在哪里的模板
- 一个已经把 `queue.md` 升格方案记录清楚、不会在后续回改中遗漏三件套执行面的模板
