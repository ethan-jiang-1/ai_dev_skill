# Deep Research Progressive Plan Template

> template_version: `v8`
> 用途：把“给定一个 seed 目录，围绕其中若干初步 topic / opinion 做逐轮 Deep Research，并让本地知识库持续生长”的方法，实例化为某一轮可执行 plan。
>
> 强约束：本模板默认必须配套生成一个状态文件：`<PLAN_BASENAME>.status.md`

## 这份文件的真实定位

这份文件不是普通“研究提纲模板”，也不是只用来生成一篇 plan 文档的填空框架。

它同时承担 4 个角色：

- `template`：定义一轮 Deep Research plan 必须具备的结构、参数、波次、产物与验收方式
- `instantiation contract`：定义如何从 `SEED_DIR` 冷启动生成本轮 `plan + status`
- `execution protocol`：定义默认推进方式、允许中断用户的条件、证据落库规则、推进与 closeout 规则
- `handoff contract`：定义 plan、status、README、reference、artifact、resume checkpoint 之间如何协同，保证新 agent 不依赖对话上下文也能接着做

这套东西的设计目标，不是让 agent 更会“汇报进度”，而是让基于它生成出来的 plan 在长程任务中默认静默自主推进：

- 能持续往前跑，而不是做一小步就停下来汇报
- 能在局部卡住时通过 `suspend / archive / redirect` 维持主线不断流
- 能把进度、判断、缺口、恢复入口写进本地文件，而不是留在聊天上下文里
- 只有真正满足中断条件时，才主动打断用户

## Instantiation-Execution Routing Gate（MUST READ FIRST）

这不是“快速说明”或“使用提示”，而是本模板的首要路由闸门。

它只回答一个问题：当前任务现在是否被允许进入 `Execution Mode`。

如果只检索一段内容就准备开始行动，优先检索 `Instantiation-Execution Routing Gate`。

| detected task shape | choose mode | allowed output | must not do |
| --- | --- | --- | --- |
| 生成、修复、审查、补全本轮 `plan + status` | `Instantiation Mode` | 只产出实例化后的 `plan skeleton + status skeleton` | 不初始化目录、不创建 `README` / `_INDEX.md`、不落 `reference/artifact`、不进入 `Wave 0` |
| 明确要求继续本轮、初始化执行表面、落证据、更新 live status | `Execution Mode` | 初始化目录与导航入口，然后推进 `Wave 0 -> Wave 1 -> Wave 2 -> Readiness Check` | 不再把“实例化模板”误当成“已经开始研究” |

1. 如果任务存在歧义，默认选择 `Instantiation Mode`。
2. 在 `Instantiation Mode` 中，只复制 `## 可直接复制的 Plan Skeleton` 和 `## 配套 Status File Skeleton`。
   - 先填写 `Instance Config`
   - 不要把模板解释区、`Execution Protocol` 或 `Appendix` 原样抄进实例 plan
   - 不能确定但不阻塞执行的值，显式写成“暂按假设执行”
3. `Instantiation Mode` 的硬停点：
   - status 至少写到：
     `current_mode = instantiation_only`
     `current_wave = Instantiation`
     `current_gate = instantiation_complete`
   - 到这里就停止
   - **MUST NOT** 初始化目录、创建 README、创建 `_INDEX.md`、落 `reference/artifact`、进入 `Wave 0`
4. `Execution Mode` 只能在下面条件同时满足时开始：
   - `plan + status` 已存在
   - 实例化检查已经通过
   - 当前任务明确要求进入执行
5. 默认进度沟通机制是 `STATUS_PATH`，不是聊天上下文。
6. 如果 seed 信息不足以稳定生成 `topic registry`，先写显式假设、gap 或 pending candidate；不要发明 topic、对象、趋势结论或证据。

## Core Contract（核心契约）

### Canonical Terms（最小术语表）

本模板从这里开始统一术语；后文默认不再混用近义词。

- `Source of Record`：某类信息的唯一权威记录点
- `design-time`：目标、结构、参数、验收层级、拓扑基线这类静态设计信息
- `run-time`：当前状态、当前阻塞、当前 gate、下一步、挂起分支、恢复入口这类执行态信息
- `controlled mutation`：允许在 `PLAN_PATH` 中进行的受控更新，只限实例参数修订、拓扑正式化、主任务变化或 Hard Gate 决策；不写实时进度
- `Authoritative Copy`：进入 `<REFERENCE_DIR>` 的本地来源副本；它是该来源在本轮研究中的可复用证据本体
- `topic registry`：研究线注册表；它是本轮 topic 编号、slug、seed_files、must_answer 的唯一设计态注册点
- `gate model`：plan 中定义的允许关卡集合与默认推进路径
- `gate state`：status 中记录的当前 gate、下一 gate 与下一得分动作

约定：

- 本模板统一以 `Source of Record` 作为主术语。
- 历史文档中出现的 `Source of Truth`，在本模板语境下等价理解为对应对象的 `run-time` 或 `design-time Source of Record`。
- `_INDEX.md` 即使物理上放在 `<REFERENCE_DIR>` 中，语义上仍属于 `navigation layer`，不是 evidence 本体，也不是 artifact。

### Canonical Retrieval Names（固定检索名）

后续实例化、执行、handoff 或局部提醒中，优先使用下面这些英文 canonical names 做检索、定位和引用：

- `Instantiation-Execution Routing Gate`
- `Instantiation Mode`
- `Execution Mode`
- `Autonomous Execution Protocol`
- `Topology Formalization Gate`
- `Exploration-Exploitation Decision Framework`
- `Foundation Sufficiency Check`
- `Early Saturation Protocol`
- `Structural Spine`
- `Wave Gate Scoreboard`
- `Suspended Branch Protocol`
- `30-Second Local Evidence Retrieval`
- `human-on-the-loop`

避免用“Quick Start”“60 秒使用说明”这类弱锚点做检索；默认统一使用上述 canonical names。

### Structural Spine（结构主线）

每份实例化 plan 都必须能快速回答：哪个对象记录什么，谁能改什么，什么不能写到哪里。

| object | role | mutation boundary |
| --- | --- | --- |
| `PLAN_PATH` | `design-time Source of Record`；定义目标、参数、拓扑基线、Wave 设计、验收层级、中断规则 | 允许 `controlled mutation`；不写实时进度、worklog、当前阻塞 |
| `STATUS_PATH` | `run-time Source of Record`；记录当前状态、当前 gate、当前缺口、下一步、挂起分支、失败探索和恢复入口 | 持续更新；不重写 plan 中的静态蓝图 |
| `SEED_DIR` | `living output surface`；承接本轮输入，也是回填后的长期主题文档 | 只写 topic 内容与回填；不写执行态控制信息 |
| `REFERENCE_DIR` | `evidence Source of Record`；承接可定位、可追溯的 ground truth | 每个重要来源单独成文；不写过程性状态或临时想法 |
| `ARTIFACT_DIR` | `derived synthesis layer`；承接 evidence summary、question list、cross-topic synthesis | 不替代证据本体，也不替代执行状态 |
| `README / _INDEX` | `navigation layer`；承接 `Read Path` 与 30 秒导航 | 不承接长篇论证、执行状态或证据本体 |

补充规则：

- `PLAN_PATH` 不是“完全静态、绝不改动”的文档，而是允许 `controlled mutation` 的设计态权威文档。
- 如果中途 formalize 出新 topic，允许更新 `PLAN_PATH`；但这类更新必须体现为结构同步，而不是实时进度记录。
- 如果新增规则无法明确落到上面某个对象，或者说不清谁是它的 `Source of Record`，先不要加入模板。

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
- 以 `Suspended Branch Protocol` 处理高难但暂不可得的问题，默认 `human-on-the-loop`，不让同步人工反馈阻塞主线
- 让输入目录持续生长，而不是每轮都另起一堆无法承接的报告

## Instantiation Contract（实例化契约）

### 先明确这些实例参数

每一份实例化 plan 都必须有一个 `Instance Config` 区；它是本轮实例参数的唯一设计态注册点。

复制模板前，先明确下面这些参数：

- `PLAN_NAME`：这轮计划的名称
- `TEMPLATE_VERSION`：本轮实例化所继承的模板版本，默认直接抄写模板顶部的 `template_version`
- `ROUND_LABEL`：例如 `一轮`、`二轮`、`第三轮`
- `PLAN_PATH`：具体计划文件路径
- `STATUS_PATH`：状态文件路径
- `SEED_DIR`：本轮输入目录
- `REFERENCE_DIR`：本轮落 ground truth 的目录，默认建议直接设为 `<SEED_DIR>/_reference`
- `ARTIFACT_DIR`：本轮 artifacts 目录，默认建议直接设为 `<SEED_DIR>/_artifacts`
- `FINAL_DELIVERABLE`：这轮调研最终服务于什么产出
- `AUDIENCE`：谁会读最终产出
- `ROUND_FOCUS`：本轮主任务；例如 `扩事实 / 补机制 / 补趋势 / 补限制 / 组合`
- `DERIVED_TOPIC_COUNT`：由 `TOPIC_REGISTRY` 条目数派生；不要把它当作独立设计输入
- `TOPIC_REGISTRY`：研究线注册表本体；它在 plan 中有独立 section，不应分散到其他位置重复定义
- `WAVE0_SHARED_DOC_FLOOR`：Wave 0 共享资料最低配额
- `WAVE1_DOC_FLOOR_PER_TOPIC`：每条研究线的最低文档配额
- `PRIMARY_SOURCE_FLOOR`：每条研究线一手来源最低配额
- `SECONDARY_SOURCE_FLOOR`：每条研究线高质量二手来源最低配额
- `RECENT_SOURCE_FLOOR`：每条研究线近期趋势来源最低配额
- `LIMITATION_SOURCE_FLOOR`：每条研究线限制 / 争议 / 失败模式来源最低配额
- `HARD_GATES_ENABLED`：本轮是否启用 Hard Gates；`yes / no`

默认建议值：

- `WAVE0_SHARED_DOC_FLOOR = max(8, DERIVED_TOPIC_COUNT * 2)`
- `WAVE1_DOC_FLOOR_PER_TOPIC = 8`
- `PRIMARY_SOURCE_FLOOR = 4`
- `SECONDARY_SOURCE_FLOOR = 2`
- `RECENT_SOURCE_FLOOR = 1`
- `LIMITATION_SOURCE_FLOOR = 1`
- `HARD_GATES_ENABLED = no`

如果研究范围明显更窄或更宽，可以改，但必须在具体 plan 中显式写清楚为什么改。

### Mode Split（任务模式拆分）

路由默认值、歧义处理、硬停点与禁止动作，统一以前文 `Instantiation-Execution Routing Gate` 为准。

本节只定义两种 mode 的职责边界，避免在模板里出现第二份路由规则。

| mode | goal | default end state | must not imply |
| --- | --- | --- | --- |
| `Instantiation Mode` | 只生成或修复 `plan + status` | `current_gate = instantiation_complete` | 目录已初始化或 `Wave 0` 已开始 |
| `Execution Mode` | 初始化目录并推进 `Wave 0 -> Wave 1 -> Wave 2 -> Readiness Check` | `current_gate = readiness_passed` 或主线显式挂起 | 还停留在模板实例化阶段 |

### 冷启动使用协议（Cold Start Usage）

本模板必须能在没有任何历史对话上下文的环境中单独使用。新的 agent 只加载这一个文件时，应按下面顺序工作。

#### A. Instantiation Mode

1. 确认最小输入：至少需要一个 `SEED_DIR`。如果连 `SEED_DIR` 都没有，无法实例化，应中断并请求用户提供。
2. 从 `SEED_DIR` 读取 seed 文件、README、已有 artifacts / reference，推断 `TOPIC_REGISTRY`、`DERIVED_TOPIC_COUNT`、`FINAL_DELIVERABLE` 与 `AUDIENCE`。
3. 无法确定但不阻塞实例化的字段，先在 `Instance Config` 中写成显式假设，不要把它留在对话上下文里。
4. 复制 `## 可直接复制的 Plan Skeleton`，完成 `PLAN_PATH`。
5. 复制 `## 配套 Status File Skeleton`，完成 `STATUS_PATH`。
6. 初始化 status 的最小字段：
   - `state = not_started`
   - `current_mode = instantiation_only`
   - `current_wave = Instantiation`
   - `current_gate = instantiation_complete`
   - `next_gate = setup_ready`
   - `required_next_step = initialize execution surfaces`
7. 完成实例化检查后停止，不自动进入目录初始化与 Wave 执行。

Instantiation-only hard stop：

- `Instantiation Mode` 的完成态是：`plan + status` 已可交付给下一步执行者，而不是“已经开始 Setup”
- 如果 status 已经出现 `current_mode = execution`、`current_wave = Wave 0` 或任何 reference/artifact 落盘动作，就说明已经越界进入执行态
- 在 `Instantiation Mode` 中，允许写入的是：实例参数、topic registry、topology baseline、core gaps、初始 gate state、resume entry
- 在 `Instantiation Mode` 中，不允许写入的是：Wave 进度、目录初始化完成声明、已落库证据、已完成 artifact

Instantiation 完成前必须检查：

- 所有 `<PLACEHOLDER>` 都已被替换，或被明确标注为“暂按假设执行”
- `PLAN_PATH`、`STATUS_PATH`、`SEED_DIR`、`REFERENCE_DIR`、`ARTIFACT_DIR` 都可定位
- `Instance Config` 已存在且已填实
- 研究线注册表（topic registry）已写入 plan，而不是只存在于临时分析中
- status 文件已经存在，并包含当前恢复入口

#### B. Execution Mode

1. 再次确认 `PLAN_PATH` 与 `STATUS_PATH` 已存在，且实例化检查已经通过。
2. 初始化或更新 `REFERENCE_DIR`、`ARTIFACT_DIR`、`SEED_DIR/README.md`、`REFERENCE_DIR/README.md`、`ARTIFACT_DIR/README.md`、`REFERENCE_DIR/_INDEX.md`。
3. 把 status 切到执行态：
   - `current_mode = execution`
   - `current_wave = Wave 0`
   - `current_gate = setup_ready`
4. 按 plan 中的 `Wave 0 → Wave 1 → Wave 2 → Readiness Check` 推进。
5. 进度、缺口、挂起分支、失败探索和恢复入口全部写入 status，而不是留在聊天上下文里。

说明：

- `setup_ready` 表示目录初始化已经完成，下一活跃波次就是 `Wave 0`
- 本模板没有独立的 `Setup` wave；`Setup` 是进入 `Wave 0` 前的准备动作，不是单独波次

冷启动时不要假设：

- 用户记得上一轮对话里的口头约定
- 当前 agent 能访问创建模板时的讨论上下文
- 未写入 plan / status / README 的判断会被下一位接手者知道
- status 可以稍后再补；status 是执行协议的一部分，不是收尾文档

### Instantiation Output Quality Rules（实例化输出质量规则）

这一节专门用于提高 LLM 生成 `plan/status` 的稳定性。

- 实例化产物默认只包含 skeleton 要求的 section；不要把模板解释区、`Execution Protocol`、`Appendix` 原样复制进实例文档
- `PLAN_PATH` 的目标是“这一轮的具体 plan”，不是“对模板的复述”或“对规则的二次讲解”
- `STATUS_PATH` 的初始目标是“给执行者一个稳定起点”，不是“提前汇报 Wave 进度”
- 如果信息不足，优先写显式假设、gap 或 pending candidate；不要发明 topic、对象、趋势或结论
- 优先短表格、短清单、短字段；不要把模板 prose 大段扩写进实例
- 任何 `<PLACEHOLDER>` 要么被替换，要么被明确标注为“暂按假设执行”；不要静默漏填
- 不要手填一个独立的 `topic_count`；统一使用 `derived_topic_count`，并以 `topic registry` 条目数为准
- `reference_dir` 与 `artifact_dir` 默认从 `seed_dir` 派生；只有 override 时才单独说明原因
- 初始 status 一律优先采用模板提供的推荐初始化值，除非当前任务明确要求直接进入执行态

### 目录初始化强约束

- 在正式开始 Wave 0 之前，必须先创建 `REFERENCE_DIR`、`ARTIFACT_DIR` 与 `STATUS_PATH`
- 在正式开始 Wave 0 之前，必须先准备好 `SEED_DIR/README.md`、`REFERENCE_DIR/README.md` 与 `ARTIFACT_DIR/README.md`
- 如果没有特殊原因，`REFERENCE_DIR` 就直接使用 `<SEED_DIR>/_reference`
- 如果没有特殊原因，`ARTIFACT_DIR` 就直接使用 `<SEED_DIR>/_artifacts`
- 只有在确有必要时，才把 `REFERENCE_DIR` 或 `ARTIFACT_DIR` 放到 `SEED_DIR` 之外；一旦这样做，必须在 plan 中解释原因
- 无论目录放在哪里，都必须保证接手者能在 30 秒内定位到本轮 reference、artifacts 与 status
- 这三个 `README.md` 的目标不是做完整索引，而是让不完全清楚上下文的接手者快速理解目录内容的意义、边界与默认阅读顺序

---

## 可直接复制的 Plan Skeleton

把下面整段复制出来，再替换占位符：
从下一行 `# <PLAN_NAME>` 开始，到 `## 配套 Status File Skeleton` 之前，都是 plan skeleton 正文。

# <PLAN_NAME>

> 对应状态文件：`<STATUS_PATH>`
> `<PLAN_PATH>` 是本轮的 `design-time Source of Record`；实时状态、当前阻塞、gate state、恢复入口，一律写入 `<STATUS_PATH>`。
> `PLAN_PATH` 允许 `controlled mutation`，但只允许修订设计态结构，不写实时进度。
> 实例化时只复制这个 skeleton；不要把模板前文说明区、后文 `Execution Protocol`、`Appendix` 一起复制进实例 plan。

## Instance Config

> 这是本轮实例参数的唯一设计态注册点。除 `topic registry` 本体外，后文不再重复定义这些参数。

| field | value |
| --- | --- |
| `plan_name` | `<PLAN_NAME>` |
| `template_version` | `<TEMPLATE_VERSION>` |
| `round_label` | `<ROUND_LABEL>` |
| `plan_path` | `<PLAN_PATH>` |
| `status_path` | `<STATUS_PATH>` |
| `seed_dir` | `<SEED_DIR>` |
| `reference_dir` | `<REFERENCE_DIR>` |
| `artifact_dir` | `<ARTIFACT_DIR>` |
| `final_deliverable` | `<FINAL_DELIVERABLE>` |
| `audience` | `<AUDIENCE>` |
| `round_focus` | `<ROUND_FOCUS>` |
| `derived_topic_count` | `<DERIVED_TOPIC_COUNT>` |
| `wave0_shared_doc_floor` | `<WAVE0_SHARED_DOC_FLOOR>` |
| `wave1_doc_floor_per_topic` | `<WAVE1_DOC_FLOOR_PER_TOPIC>` |
| `primary_source_floor` | `<PRIMARY_SOURCE_FLOOR>` |
| `secondary_source_floor` | `<SECONDARY_SOURCE_FLOOR>` |
| `recent_source_floor` | `<RECENT_SOURCE_FLOOR>` |
| `limitation_source_floor` | `<LIMITATION_SOURCE_FLOOR>` |
| `hard_gates_enabled` | `<HARD_GATES_ENABLED>` |

## 调研目的与服务对象

这轮 Deep Research 不是为了产出调研笔记本身。

真正的目的是：为 `<FINAL_DELIVERABLE>` 提供可靠的原材料地基。

最终产出的读者是：`<AUDIENCE>`

本轮主任务是：`<ROUND_FOCUS>`

这份最终产出至少要满足下面要求：

- 系统性：覆盖关键维度，不遗漏，不失衡
- 逻辑性：每个判断都有证据支撑，推理链条可追溯
- 一致性：跨主题术语统一、口径统一、评估框架统一
- 专业可读：默认读者是专业人士，不需要手把手解释，但需要准确、严谨、无歧义

权威信源优先规则（最高优先级，不可违反）：

> 当权威一手来源已经足以支撑某个判断时，不为满足配额额外引入低质量二手来源。配额是防止搜太浅的下限，不是必须凑满的目标。宁缺毋滥。

## 本轮核心缺口

[这里必须写 3 到 5 条本轮仍未解决的核心缺口。不要写“还不够全面”这种空话，要写“哪类判断还悬空、缺什么证据、为什么影响最终产出”。]

### 1. <Gap 1>

### 2. <Gap 2>

### 3. <Gap 3>

### 4. <Gap 4，可选>

### 5. <Gap 5，可选>

## Control Map

### Structural Spine（本轮采用）

| object | role |
| --- | --- |
| `<PLAN_PATH>` | `design-time Source of Record`；目标、参数、拓扑基线、Wave 设计、验收层级、中断规则 |
| `<STATUS_PATH>` | `run-time Source of Record`；当前状态、当前 gate、当前缺口、下一步、挂起分支、恢复入口 |
| `<SEED_DIR>` | `living output surface`；本轮输入，也是回填后的输出 |
| `<REFERENCE_DIR>` | `evidence Source of Record`；可定位、可追溯的 ground truth 的 `Authoritative Copy` |
| `<ARTIFACT_DIR>` | `derived synthesis layer`；evidence summary、question list、cross-topic synthesis |
| `README / _INDEX` | `navigation layer`；默认 `Read Path` 与 30 秒导航入口 |

### Wave Gate Scoreboard（gate model）

这里记录的是本轮 plan 采用的 `gate model`，不是执行中的 `gate state`。执行中的 `current_gate / next_gate / next_scoring_action` 一律写入 `<STATUS_PATH>`。

| gate_model_field | design-time definition |
| --- | --- |
| `allowed_current_gate_values` | `instantiation_complete / setup_ready / wave0_complete / wave1_complete / wave2_complete / readiness_passed` |
| `default_transition_path` | `instantiation_complete -> setup_ready -> wave0_complete -> wave1_complete -> wave2_complete -> readiness_passed` |
| `allowed_next_scoring_actions` | `+reference / +backfill / +artifact / +index / +decision` |
| `run-time_authoritative_copy` | `<STATUS_PATH>.Gate State` |

补充说明：

- `setup_ready` 表示初始化动作已经完成，可以正式开始 `Wave 0`
- `setup_ready` 是 gate，不是独立 wave

### Control Hierarchy

- `Wave Gate Scoreboard`：只负责“当前关卡系统是什么、当前推进到哪一关、下一得分动作是什么”
- `搜够了没有：停止条件`：`topic-level stop condition`；只判断单条研究线何时可以停止补搜
- `Readiness Check`：`round closeout gate`；只判断本轮现在是否可以 closeout
- `Hard Gates`：`optional stricter overlay`；只在高风险 / 高价值最终产出时作为加严层
- `成功标准`：`post-pass success state`；只描述通过 `Readiness Check` 后应呈现的完成态

## 输入建模

本轮研究直接以 `<SEED_DIR>` 为起点。

输入对象包括：

- 目录中的 topic seed 文件
- 目录中的已有摘要 / 初步判断 / 问题清单
- 上一轮留下的 `_artifacts` 与相关本地 `_reference`（如果存在）

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

[这里写入稳定后的研究线注册表。不要只写“见 seed 目录”；必须把编号、slug、seed_files、current_hypothesis、why_it_matters、must_answer 明确写在 plan 里。]

topic 数量、编号顺序与 slug 统一以这一节为准；其他 section 只引用，不再维护第二份列表。

推荐结构：

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

### 当前拓扑基线（Current Topology Baseline）

这里写的是本轮实例化时正式采用的 `topology baseline`；它属于 `PLAN_PATH` 的设计态结构，不是执行中的实时工作日志。

推荐结构：

```md
- carry_forward_topics:
- new_topics:
- recent_change:
- pending_topic_candidates:
```

当前有效 topic 数量始终由 `topic registry` 派生，不在其他 section 单独维护第二个计数器。

执行中的 topic 增减、formalization 是否已同步、以及推进中的结构变化，一律写入 `<STATUS_PATH>` 的 `Topology Delta / Formalization State`。

## 输出契约

### 1. Ground Truth 参考材料

- 所有进入最终推理链条的重要来源，都应以独立 `md` 的 `Authoritative Copy` 形式落在 `<REFERENCE_DIR>`
- `REFERENCE_DIR` 的完成单位不是“看过这个链接”，而是“这个链接已经被整理成可复用、可定位、可引用、可自给自足的独立 `md` 文档”
- `<REFERENCE_DIR>/_INDEX.md` 负责 `30-Second Local Evidence Retrieval`，语义上属于 `navigation layer`

### 2. 输入目录的持续生长

`<SEED_DIR>` 不是只读输入，而是这轮研究的 `living output surface`。

每条研究线对应的 seed 文件都应被更新，新增固定章节：

```md
## 历史摘要（保留，不修改）

## 本轮新增证据
<!-- 每条新增事实都带 <REFERENCE_DIR>/*.md 本地引用 -->

## 本轮新增机制理解
<!-- 从描述上升到为什么这样设计 -->

## 本轮新增趋势与难点
<!-- 有时间证据支撑的趋势 + 实践难点与失败模式 -->

## 当前判断（本轮综合后）
<!-- 综合历史内容与本轮新增后的判断，每条判断带本地引用 -->
```

规则：

- 历史摘要不删改，只保留
- 所有本轮新增内容进入固定章节
- 每条新增关键判断都必须带本地引用
- 如果某个判断被本轮推翻或修正，在“当前判断”中注明，不删除旧内容

### 3. 过程性 Artifacts

`<ARTIFACT_DIR>` 是 `derived synthesis layer`；它承接 evidence summary、question list 与 cross-topic synthesis，但不替代 `REFERENCE_DIR` 存放证据本体，也不替代 `STATUS_PATH` 存放当前执行状态。

至少包括：

- 每条研究线一份 `evidence-summary`
- 每条研究线一份 `question-list`
- 一份横向综合 `W2-cross-topic-synthesis`
- 一份 `ARTIFACT_DIR/README.md`

## Wave 设计与验收

### Wave 0：建立共同 Ground Truth 地基

- purpose: 固定共享地基、共同术语和高可信入口，避免各研究线各自从零开始
- minimum:
  - 至少 `<WAVE0_SHARED_DOC_FLOOR>` 份共享型 ground truth
  - 其中大多数来自官方文档、官方仓库、官方规范或高可信研究
  - 至少 1 份来自安全 / 限制 / 约束相关材料
  - 至少 1 份来自高质量对比、实践复盘或失败分析
  - `<REFERENCE_DIR>`、`<ARTIFACT_DIR>` 与 `STATUS_PATH` 已经先被初始化

### Foundation Sufficiency Check（Wave 0 → Wave 1）

进入 Wave 1 前至少确认：

- 核心术语已有工作定义，对象分类已有共享地基
- 每条研究线已有明确深挖起点
- `<REFERENCE_DIR>/_INDEX.md` 已经可用

### Wave 1：按研究线分别深挖

- purpose: 把每条研究线从“名称和观点”推进到“机制和证据”
- 每条研究线都要从 5 个视角扩展：
  - 证据
  - 根本机制
  - 趋势
  - 难度
  - 争议 / 失败模式
- minimum per topic:
  - 至少 `<WAVE1_DOC_FLOOR_PER_TOPIC>` 份该研究线专属 ground truth
  - 至少 `<PRIMARY_SOURCE_FLOOR>` 份一手来源
  - 至少 `<SECONDARY_SOURCE_FLOOR>` 份高质量二手分析
  - 至少 `<RECENT_SOURCE_FLOOR>` 份近期趋势来源
  - 至少 `<LIMITATION_SOURCE_FLOOR>` 份限制 / 失败 / 争议来源
- 每条研究线都必须形成一份 `evidence-summary` 和一份 `question-list`

Early saturation 只在满足模板中的 `Early Saturation Protocol` 时允许使用，且必须写入 `<STATUS_PATH>`。

### Wave 2：横向比对与综合判断

- purpose: 把分题结果重新收束成整体结构和跨主题判断
- minimum:
  - 每个横向判断都能追溯到具体 `<REFERENCE_DIR>/*.md`
  - 每条研究线至少有 2 个与其他研究线发生交叉验证的结论
  - 明确区分“硬事实”“分析判断”“趋势推测”

### Readiness Check：最终验收闸门

至少覆盖下面 5 项：

- `30-Second Local Evidence Retrieval`
- 每线“机制 + 趋势 + 难点”检查
- 横向综合检查
- 拓扑稳定性检查
- 接手可继续性检查

### 搜够了没有：停止条件（topic-level stop condition）

每条研究线只有同时满足下面条件，才能算第一轮搜集完成：

- 核心对象清单已经稳定，不再持续新增关键名字
- 新搜到的材料大多在重复已知事实，而不是贡献新信息
- 该研究线的固定问题都已经有证据支撑
- 至少有 1 轮对“反例、限制、争议”的专门补搜
- 已完成一次“官方说法 vs 第三方验证 / 实践证据 / 事故复盘”交叉核验
- 所有重要但未解的问题，都已经被明确归类为 `continue / suspend / archive / redirect`

## 研究线的具体目标

[这里按研究线注册表展开。每条研究线都要写到同样粒度。]

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

## 成功标准（post-pass success state）

达到下面状态，才算真正满足目标：

- `<REFERENCE_DIR>` 中有一批高可信、可追溯的 ground truth 文档
- 每条研究线至少形成一组可复用证据包，而不是临时搜索结果
- 对每条研究线都能解释机制、趋势和难点
- 每个重要判断都能追溯到本地 reference 文档
- 对趋势、难度、争议都有专门证据，而不是顺手一提
- 可以明确说清楚“哪些问题不是没做，而是被主动 `suspend`，以及为什么”
- 后续新的 agent 接手时，只看 `<SEED_DIR> + <REFERENCE_DIR> + <ARTIFACT_DIR> + <STATUS_PATH>` 就能继续往下研究

## Hard Gates（可选）

默认不启用；只有当 `hard_gates_enabled = yes` 时，才把它叠加到 `Readiness Check` 上。

启用时至少检查：

- 没有 P0 级结论处于“只有单一弱来源支撑”的状态
- 所有关键术语都在跨主题范围内完成口径对齐
- 所有高价值结论都已明确标注“硬事实 / 分析判断 / 趋势推测”
- 至少完成一轮针对反例和失败模式的专门检索

---

## 配套 Status File Skeleton

```md
# <PLAN_NAME> 执行状态（Progress / State）

> 对应计划：`<PLAN_PATH>`
> 本文件是本轮执行态的 `run-time Source of Record`：记录执行中的当前状态、当前缺口、当前 gate、挂起分支、失败探索和恢复入口；不重复 plan 中的静态蓝图。

## 当前执行快照（Current Execution Snapshot）

- state: `not_started / in_progress / blocked / completed`
- current_mode: `instantiation_only / execution`
- current_wave: `Instantiation / Wave 0 / Wave 1 / Wave 2 / Readiness Check`
- blocking_issue:
- required_next_step:
- largest_gap_if_stop_now:
- recommended_resume_entry:

## Gate State

- current_gate: `instantiation_complete / setup_ready / wave0_complete / wave1_complete / wave2_complete / readiness_passed`
- next_gate:
- next_scoring_action: `+reference / +backfill / +artifact / +index / +decision`
- stalled_scoring_actions_since_last_gap_reduction:
- last_gap_reduction:

## Plan / Status Sync

- plan_placeholders_cleared: `yes / no / partial`
- plan_status_sync: `yes / no`
- current_topology_synced_to_plan: `yes / no`

## 目录与集成状态（Directory / Integration State）

- seed_readme_ready: `yes / no / partial / n_a`
- reference_readme_ready: `yes / no / partial / n_a`
- artifact_readme_ready: `yes / no / partial / n_a`
- reference_index_ready: `yes / no / partial / n_a`
- seed_backfill_status:
- artifact_status:

## Topology Delta / Formalization State

当前有效 topic 数量始终由 plan 中的 `topic registry` 派生；此处只记录增量与同步状态。

- new_topics:
- pending_topic_candidates:
- recent_change:
- registry_sync_done: `yes / no`

## Wave 0：共享 Ground Truth 地基

- target_floor:
- docs_landed:
- completion_status: `not_started / in_progress / passed / failed`
- foundation_sufficiency_check: `not_started / passed / failed`
- gap:

## Wave 1：按研究线深挖

### <NN>-<topic-slug>

- doc_count:
- primary_count:
- primary_source_status: `open / early_saturation / closed`
- secondary_count:
- recent_count:
- limitation_count:
- early_saturation_reason:
- evidence_summary:
- question_list:
- status: `not_started / in_progress / passed / blocked`
- gap:

## Wave 2：跨主题综合

- synthesis_file:
- cross_checks_done:
- unresolved_conflicts:
- status: `not_started / in_progress / passed / blocked`

## Readiness Check

- 30_second_local_evidence_retrieval: `pass / partial / fail`
- mechanism_trend_difficulty_check: `pass / partial / fail`
- cross_topic_synthesis_check: `pass / partial / fail`
- topology_stability_check: `pass / partial / fail`
- handoff_continuity_check: `pass / partial / fail`
- overall_status: `pass / fail`

## Suspended Branches

- branch:
- state: `suspended / archived / redirected / compressed`
- why:
- confirmed_so_far:
- still_missing:
- reopen_trigger:

## Failed Explorations

只记录有代表性的失败探索，避免后续重复无效路径。

- exploration:
- why_tried:
- what_found:
- why_failed:
- lesson:

## Resume Checkpoint

- last_completed_step:
- last_verified_result:
- safe_to_interrupt: `yes / no`
- recommended_next_step:
- next_after_that:
- do_not_forget:

## Worklog

- <YYYY-MM-DD>: <本次推进内容>
```

### 推荐初始化快照（降低首版漂移）

`Instantiation Mode` 推荐初始值：

```md
- state: `not_started`
- current_mode: `instantiation_only`
- current_wave: `Instantiation`
- blocking_issue:
- required_next_step: `initialize execution surfaces`
- largest_gap_if_stop_now: `<如果现在停止，执行者会缺什么>`
- recommended_resume_entry: `read Instance Config -> topic registry -> Gate State`

- current_gate: `instantiation_complete`
- next_gate: `setup_ready`
- next_scoring_action: `+index`
```

`Execution Mode` 刚开始时的推荐值：

```md
- state: `in_progress`
- current_mode: `execution`
- current_wave: `Wave 0`
- blocking_issue:
- required_next_step: `complete Wave 0 shared ground truth setup`
- largest_gap_if_stop_now: `<共享地基仍未落盘的最大缺口>`
- recommended_resume_entry: `read Gate State -> Wave 0 -> Directory / Integration State`

- current_gate: `setup_ready`
- next_gate: `wave0_complete`
- next_scoring_action: `+reference`
```

---

## Execution Protocol（执行协议）

这一部分是模板级执行参考协议，不是实例化 skeleton 的追加章节。

- 生成 `plan` 时，默认不要把本 section 原样复制进实例文档
- 生成 `status` 时，默认只按 skeleton 与推荐初始化快照落盘
- 只有当实例 plan 明确需要展开某条协议细则时，才把相关规则摘要写入实例产物；不要整段复写模板

### Autonomous Execution Protocol（自主执行协议，MUST READ）

这一节是本模板的核心执行协议。它只在 `Execution Mode` 生效；如果当前仍在 `Instantiation Mode`，默认停在 `instantiation_complete`。

#### 1. 默认模式：静默自主推进（MUST）

- **MUST**：按 Wave / Step 检查点持续推进，状态写入 `<STATUS_PATH>`
- **MUST NOT**：主动停下来向用户汇报或等待确认
- **MUST NOT**：在对话中重复 status 文件已经记录的内容
- **MUST**：每完成一个有意义的步骤（一份 reference 落库、一条研究线完成、一个波次达标、一个 readiness 缺口修复），更新 status 文件后立刻继续下一步
- **MUST**：默认推进粒度是“连续把整段主链往前跑”，不是“做一小步就回话”

#### 2. 允许中断用户的条件（ONLY）

**ONLY interrupt when** 下面四种情况之一成立：

1. **主线阻塞且无法绕开**：整条主线被阻塞，且无法通过 `suspend`、`archive`、`redirect` 绕开。单个分支卡住不算主线阻塞。
2. **研究方向需要根本性调整**：核心假设错误、最终产出定义需要变更、或研究线注册表需要重大重构。补证据、扩对象、换搜索策略不算根本性调整。
3. **涉及高风险、不可逆或难回滚操作**：下一步会带来高风险真实动作、难以回滚的写入、外部发布、付费、删除或权限风险。
4. **用户明确要求实时协同**：用户在本轮任务中明确要求同步讨论、逐步确认或实时汇报。

#### 3. 不允许中断用户的情况（MUST NOT）

**MUST NOT interrupt for**：

- `Instantiation Mode` 刚完成，需要进入 `Execution Mode`
- Wave 之间的过渡
- 单个研究线的配额达标或完成
- 发现某个分支需要 `suspend`、`archive` 或 `redirect`
- 证据配额全部达标
- 遇到搜索困难但可以绕开
- 发现新的高价值方向
- 某条研究线的停止条件已满足
- 某个新对象已经明确应升格为独立 topic
- Readiness Check 某项未通过但可以自主补齐

#### 4. 进度可见性靠文件，不靠对话

- `<STATUS_PATH>` 是默认进度沟通机制
- Worklog 必须持续追加，记录关键推进和关键判断
- 用户主动询问进度时可以简要回答，但默认不主动发起进度汇报
- 如果用户中途插入其他任务，恢复时优先读 `<STATUS_PATH>` 的当前状态、Gate State、Suspended Branches、Failed Explorations 和 Resume Checkpoint

#### 5. 与 human-on-the-loop 原则的关系

- 长程任务默认按 `human-on-the-loop` 处理；高难分支优先登记后继续推进。分支处置细则见后文 `## Suspended Branch Protocol`

### Topology Formalization Gate（拓扑正式化闸门）

这一步用于处理中途 scope 扩张时的结构同步。

如果新的研究对象已经形成独立问题簇、独立对象清单或独立工件需求，就应当把它升格为新 topic。

一旦升格为新 topic，必须在进入下一波次前同步下面对象：

- `PLAN_PATH`
- `STATUS_PATH`
- `TOPIC_REGISTRY`
- 输入目录中的 topic 索引文件（如 `topics/README.md`）
- 新 topic seed 文件

不允许继续一边按旧拓扑推进，一边口头承认“这其实已经是新 topic”。

### Exploration-Exploitation Decision Framework（探索 / 利用决策框架）

目的：在“探索新方向”和“深挖已知线索”之间做稳定判断，避免机械凑配额，也避免漏掉真正改变拓扑的新方向。

#### Exploration Signals

出现下面信号时，应该考虑探索新方向：

- **高频未归类概念**：连续多份 reference 指向同一个现有 topic 难以容纳的新概念
- **未建模维度**：多个来源指向同一个新的机制、风险、评价维度或生命周期阶段
- **核心问题未回答**：配额接近达标，但 `must_answer` 仍有实质性空洞
- **横向依赖变强**：新方向会影响多个 topic 的结论、推荐、baseline 或最终产出结构

#### Exploitation Signals

出现下面信号时，应该继续深挖或收束已知线索：

- **证据收敛**：新增材料大多重复已知事实
- **问题清单收敛**：旧问题逐步被回答，新问题产生速度明显下降
- **反例搜索饱和**：专门搜索限制、争议、失败模式后没有发现新的关键反例
- **机制稳定**：核心机制已经能简洁解释，并且有多个高可信来源支撑

#### Decision Rules

- **继续深挖当前线**：exploitation signals 不足，且 exploration signals 不足以改变拓扑
- **Suspend 当前分支**：当前线已接近饱和，但新方向重要、暂时缺材料或访问受限
- **Formalize 新 topic**：新方向满足 Topology Formalization Gate，并且会产生独立 evidence summary / question list / artifact 需求
- **Archive 当前分支**：继续下钻边际收益低，且不太可能改变核心判断

这套框架是判断启发，不是新的硬配额。最终仍以 `FINAL_DELIVERABLE`、`must_answer` 和本地证据质量为准。

### Foundation Sufficiency Check（Wave 0 → Wave 1，地基充分性检查）

进入 Wave 1 前，必须确认 Wave 0 不是“配额达标但地基不足”。

验收标准：

- 所有 topic 的核心术语，都能在 Wave 0 文档或研究线注册表中找到工作定义
- 所有 topic 的对象分类，都能映射到共享地基里的共同层或明确说明其差异
- 每条研究线都有明确的 Wave 1 起点：优先来源、关键对象、关键问题或已知缺口
- `<REFERENCE_DIR>/_INDEX.md` 已能作为共享 ground truth 的 `30-Second Local Evidence Retrieval` 入口

如果任何一条不满足，先补 Wave 0 或研究线注册表，再进入 Wave 1；不要把共享地基债务推迟到 Wave 1 中途处理。

### Early Saturation Protocol（提前饱和协议）

配额是防止浅搜的下限，不是鼓励低质量凑数的上限。

当某个来源类型或子问题已经明显饱和时，可以提前停止该维度的搜索，但必须在 `<STATUS_PATH>` 中记录理由。

适用条件：

- 已有来源来自权威一手来源、高可信研究或核心维护者说明
- 连续多轮搜索新增材料主要重复已知事实
- 继续搜索只会引入低质量来源，无法改变核心机制、趋势或限制判断
- 该维度的核心判断已经能被本地 reference 支撑

status 记录建议：

```md
- primary_count: `3`
- primary_source_status: `early_saturation`
- early_saturation_reason: `新增材料连续重复核心机制，继续搜索只会引入低质量来源；当前 3 份 primary source 已足以支撑本轮判断。`
```

Early saturation 只能降低“继续凑数”的优先级，不能绕过 `must_answer`、失败模式覆盖、Readiness Check 或关键结论的证据要求。

### Instance Plan Authority Binding（执行期只认实例 plan 的设计态定义）

进入 `Execution Mode` 后，下面这些设计态规则统一以当前实例 `PLAN_PATH` 为准；本模板不在这里维护第二份并行版本。

| plan section | execution-time meaning | run-time record location |
| --- | --- | --- |
| `输出契约` | 定义什么必须落到 `REFERENCE_DIR / ARTIFACT_DIR / SEED_DIR / README / _INDEX` | `<STATUS_PATH>.目录与集成状态` + `Worklog` |
| `Wave 设计与验收` | 定义 `Wave 0 / Wave 1 / Wave 2 / Readiness Check` 的目标、floor 与通过条件 | `<STATUS_PATH>.Wave 0 / Wave 1 / Wave 2 / Readiness Check` |
| `搜够了没有：停止条件` | 定义单条研究线何时 `continue / suspend / archive / redirect` | `<STATUS_PATH>.Wave 1` + `Suspended Branches` |
| `成功标准` | 定义通过 `Readiness Check` 后应呈现的完成态 | closeout judgment + `<STATUS_PATH>.Readiness Check` |
| `Hard Gates` | 只在 `hard_gates_enabled = yes` 时叠加到 `Readiness Check` | `<STATUS_PATH>.Readiness Check` 或 `blocking_issue` |

执行约束：

- 不要在 `status`、`artifact` 或 `worklog` 中再写第二份 `输出契约 / Wave 设计 / 停止条件 / 成功标准 / Hard Gates`
- 如果执行中发现这些设计态定义需要变化，先按 `controlled mutation` 更新 `PLAN_PATH`，再继续执行
- 如果实例 plan 缺少上表中的关键 section，先修 plan，再继续推进；不要靠对话临时补规则

### 证据采集协议

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

#### `## 核心内容摘录` 写法规则

定位：这一节是源头内容的“硬核精华提取”，目标是让读者不回 URL 就能把这份 reference 当作该来源的本地权威替代。

写什么：

- 关键论证链条和推理逻辑
- 重要数字、参数、阈值、性能指标
- 关键表格、对比矩阵、分层结构的忠实摘录
- 方法论要点、实验设计、测试条件
- 必要的短引文，其余以结构化摘要和转述为主
- 事故 / 案例的关键时间线和因果链
- 标准 / 规范的条款级摘要

不写什么：

- 不做二次解读或评论
- 不重复 `## 关键事实` 已经覆盖的要点
- 不抄录与本研究无关的背景铺垫
- 不整段复制纯文学性描述或营销话术

篇幅指引（按来源价值弹性控制）：

- 高价值一手来源（official / academic）：500-1500 字的结构化摘要
- 中等价值来源（practitioner）：200-500 字
- 低价值来源：可留空，注明“关键事实已充分覆盖，无需额外摘录”

忠实度要求：

- 摘要和短引文必须忠实于原文，不美化、不夸大、不把推断写成原文结论
- 如果是翻译，标注原文语言
- 数字和术语必须与原文一致，不做单位换算或近似处理
- 如果原文有歧义或矛盾，如实记录，不擅自取舍
- 遵守来源许可、版权限制和合理引用边界；不要把 reference 写成原文镜像

`captured_excerpt` 字段说明：

- `yes`：核心内容已充分摘录，后续使用时不需要回看原文
- `partial`：部分关键内容已摘录，但仍有值得补充的段落
- `no`：未做摘录；仅适用于低价值来源，且 `## 关键事实` 已充分覆盖

补充建议字段：

- `claims_supported:`
- `date_scope:`
- `related_entities:`

命名建议：

- `00-shared-<source-slug>.md`
- `<NN>-<topic-slug>-<source-slug>.md`

其中 `<NN>` 与 `<topic-slug>` 来自研究线注册表。

### 已验证的高杠杆执行行为（写入计划，必须遵守）

- 以“证据落库”为单位推进：每一次有效探索都必须落为 `<REFERENCE_DIR>/*.md`，否则视为未完成
- 以“对象清单稳定”为停止前提：围绕同一研究线持续扩对象与对照面，直到核心对象清单稳定
- 以“下钻到机制”为深挖目标：关键对象不只看 README，还要沿 docs -> schema / code / issue / 反例逐级下钻
- 以“边取证边回填”避免集成债：新增证据落库后立刻回填到对应 seed 文件和 `<ARTIFACT_DIR>` 中
- 以“持续自校验”保证 `30-Second Local Evidence Retrieval`：每个波次结束后都做一次相关检查，并维护 `<REFERENCE_DIR>/_INDEX.md`
- 无外部阻塞时按 Wave / Step 检查点持续自主推进

### 什么值得存进 `<REFERENCE_DIR>`

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

### Suspended Branch Protocol（探索分支处置协议）

目的：

- 控制探索树扩张，只保留会推进 `must_answer / 当前 gap / FINAL_DELIVERABLE` 的分支

处理等级：

- `discard`：相关性弱、可信度不足、或只重复已知结论
  - 处理：不落库、不回填 seed、不写 artifact
- `compress`：公开信息不足或边际收益低，但结论本身值得记住
  - 处理：只在 `question-list`、`status` 或综合 artifact 里留一句压缩结论
- `suspend`：问题本身重要，但当前继续追会明显卡在 `access boundary / disclosure boundary / 搜索重复 / 边际收益过低`
  - 处理：不阻塞主线，先继续推进其他高价值分支；同时必须把这个分支登记为 `suspended`
- `archive`：继续下钻边际收益低，且不太可能改变核心判断
  - 处理：封存时只写推进到哪里、为什么暂不继续、什么条件下重开
- `redirect`：其他问题更可能提升证据强度、缩小不确定性或改变核心判断时，立即转向

#### `suspend` 与 `archive` 的区别

- `suspend`：问题仍然重要，只是当前不值得继续死磕；默认期待未来可能被新线索、新资料或新访问入口重启
- `archive`：问题当前已经不值得继续投入；即使未来重开，优先级通常也低于其他未解问题

`human-on-the-loop` 提醒：高难分支优先 `suspend and continue`；需要人工同步介入时，按前文 `Autonomous Execution Protocol` 的中断条件处理。

#### Suspended Branch 最低记录格式

建议在 status、综合 artifact 或 closeout 文档里至少保留下面结构：

```md
- branch: `<topic-slug / question>`
- state: `suspended`
- why_suspended: `<access boundary / disclosure gap / repeated search / low marginal return>`
- confirmed_so_far:
- still_missing:
- reopen_trigger:
```

### 并行执行建议

这件事适合并行推进，但要有明确分工。

建议分成：

- 主线程：维护总问题、统一标准、去重、综合判断、拓扑同步
- 研究线线程：每条研究线一个线程

主线程职责：

- 统一证据采集格式
- 维护 `<REFERENCE_DIR>` 命名规范
- 避免不同线程重复抓同一来源
- 在 Wave 2 做跨主题综合
- 当 scope 扩张到足以形成独立 topic 时，先做结构同步再继续推进

各研究线线程职责：

- 深挖自己主题
- 把高价值来源落为 `<REFERENCE_DIR>/*.md`
- 回填到对应 seed 文件
- 维护本研究线的 evidence summary 与 question list

为了避免写冲突，建议按前缀分工：

- 主线程写共享地基：`00-shared-*`
- 研究线 `<NN>` 只写：`<NN>-<topic-slug>-*`

### 执行节奏

推荐顺序：

1. 列权威来源优先级清单，只抓高可信来源
2. 初始化 `<REFERENCE_DIR> / <REFERENCE_DIR>/_INDEX.md / <ARTIFACT_DIR> / <STATUS_PATH>`，先建 `30-Second Local Evidence Retrieval` 入口再写结论
3. 扩对象、案例和机制差异
4. 上升到机制抽象
5. 补趋势、难点和失败模式
6. 做跨主题综合

如果某一步还没有达到对应检查点，不要机械进入下一步。

## Appendix：Template Maintenance（模板维护附录）

### Quality Calibration Loop（四维质量校准）

这一节用于维护模板本身，不属于每轮执行态 status 的必填字段。

每次迭代主模板时，先做一轮轻量质量校准，不要一上来大改结构。

校准维度：

- 系统性：关键对象、证据类型、失败模式和最终产出需求是否都被覆盖
- 结构性：topic registry、Wave、reference、artifact、status 之间是否有清晰依赖关系
- 游戏性：执行者是否知道下一步怎样得分、何时升级、何时停止、何时挂起分支
- 简洁性：是否存在重复规则、过长说明、低价值约束或会让执行者跳读的噪音

迭代规则：

- 每轮只选 1 到 2 个最影响执行质量的问题修
- 优先修会改变执行行为的规则，其次修表达，最后才修版式
- 每次调整都要写清楚 `current_score`、`smallest_next_move` 和 `do_not_change_yet`
- 如果一次改动需要重排多个大章节，先暂停，把它登记为下一轮候选，而不是当场大改

## 这个模板真正要守住的东西

以后无论你研究的主题是什么，只要还是“给定一个目录，从若干 topic seed 出发，做逐轮 Deep Research，并让本地知识库继续生长”，真正不能丢的是下面这些东西：

- 输入目录必须先被建模成研究线注册表
- 每轮都必须先写清楚最终服务于什么产出
- 每轮都必须有 `Instance Config`
- 每轮都必须显式区分 `Instantiation Mode` 与 `Execution Mode`
- 每轮都必须有 Wave 0 / 1 / 2 和 Readiness Check
- 每轮都必须以本地 evidence 落库作为完成单位
- 每轮都必须要求输入目录本身生长，而不是只生成旁路报告
- 每轮都必须有明确停止条件
- 每轮都必须保留高难问题的 `suspend` 语义
- 每轮都必须做到 `30-Second Local Evidence Retrieval` 成立
- 每轮的 reference 文档都必须做到硬核内容自给自足
- plan / status / reference / artifact / navigation 的对象边界必须清楚

如果这些约束还在，这个框架就还是同一个框架。具体主题、目录名、研究线数量、配额数字，都只是实例化参数。
