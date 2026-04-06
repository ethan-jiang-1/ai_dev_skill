# Define 与 Plan 阶段

## 这一阶段在解决什么

Define 和 Plan 阶段要解决的不是“怎么写代码”，而是：

- 我们到底在解决什么问题
- 解决对象是谁
- 成功标准是什么
- 哪些事情现在不做
- 后续执行顺序怎么排

如果这一步做不好，后面做得越快，偏得越远。

## 1. idea-refine

### 这个 skill 的职责

- 把模糊想法变成可以继续推进的一页纸
- 逼出用户对象、成功标准、关键假设与 MVP
- 防止“先做再说”

### 它的工作方式

- 先发散：重述问题、追问目标、生成多个方向
- 再收敛：对方向做价值 / 可行性 / 差异化评估
- 最后产出：problem statement、recommended direction、assumptions、MVP、not doing

### 我的理解

它本质上像“产品发现阶段的压缩器”。  
不是让 agent 一上来就想实现，而是先把模糊直觉变成有边界的机会点。

### 优点

- 能及时暴露假设
- 能逼出用户价值，而不是只讨论技术
- “Not Doing” 非常好，能防 scope creep
- 很适合项目前期和需求探索

### 缺点

- 依赖对话质量
- 对目标明确的小任务太重
- 如果用户只想快速开工，会觉得它拖节奏

### 我给它的建议用法

- 0→1 产品方向
- 模糊需求澄清
- 新功能 brainstorming
- 不要用于已经明确的具体修复

## 2. spec-driven-development

### 这个 skill 的职责

- 在写代码前先写规格
- 明确 objective、commands、project structure、code style、testing strategy、boundaries、success criteria
- 把“要做什么”固定下来

### 它的工作方式

- 先写 spec
- 再做计划
- 再拆任务
- 最后实现

它强调 gated workflow，也就是每一步都不应该直接跳过。

### 我的理解

这是最关键的上游 skill。  
一旦 spec 清楚，后面很多 skill 才有稳定输入。  
如果 spec 不清楚，planning 和 implementation 再规范也只是更高效地做错事。

### 优点

- 防止 agent 自行脑补需求
- 把成功标准显式化
- 对多人协作非常友好
- 对复杂变更尤其值钱

### 缺点

- 对小改动成本偏高
- 有变成模板文档的风险
- 如果 spec 不维护，很容易失真

### 我给它的建议用法

- 新功能
- 多文件变更
- 架构性改造
- 模糊需求澄清

## 3. planning-and-task-breakdown

### 这个 skill 的职责

- 把 spec 变成实施计划
- 拆成小任务
- 标出依赖关系
- 安排检查点和验证方式

### 它的工作方式

- 先只读分析，不立刻写代码
- 找依赖图
- 优先做垂直切片
- 每个任务都定义 acceptance criteria、verification、dependencies、files likely touched

### 我的理解

这是“让复杂事情变得可落地”的核心 skill。  
它最重要的不是拆任务，而是决定任务边界和顺序。

### 优点

- 非常适合中大型功能
- 很适合多 agent / 多人并行
- 能显著降低大提交和混乱 diff
- checkpoint 设计非常实用

### 缺点

- 小任务会显得过度规划
- 拆太细会增加流程负担
- 过度形式化会让执行变钝

### 我给它的建议用法

- 任务超过一个会话
- 涉及多个系统层
- 需要多人并行
- 风险较高的变更

## 这一阶段的横向结论

### 最强组合

- `idea-refine` 负责问题成形
- `spec-driven-development` 负责需求固化
- `planning-and-task-breakdown` 负责执行可控

### 最常见失败模式

- 没澄清用户对象就写 spec
- 写了 spec 但没有成功标准
- 拆任务只按文件层，不按用户价值切片
- 没有 checkpoint，结果越做越散

### 我的总评

Define 与 Plan 阶段是这套仓库最有“Google 工程味”的部分。  
它的价值不在多写几页文档，而在于把错误前移，把误解前移，把返工前移。
