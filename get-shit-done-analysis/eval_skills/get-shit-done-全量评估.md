# get-shit-done 全量评估

## 1. 我先帮你“玩”了一遍这个仓库，skill 版面里有什么

这个仓库最值得看的，确实不是 npm 包装层，也不是文档层，  
而是它里面那一整套 **skill-like 单元**。

它和普通 skill 仓库不一样的地方在于：

- 它不是只有一层 skill
- 它把 skill 做成了分层系统
- 它把 skill 从“提示卡片”推进成“工程 runtime”

### 仓库里 skill 主要落在哪里

- `commands/gsd/*.md`：68 个 command 入口文件
- `agents/*.md`：24 个 agent 角色文件
- `get-shit-done/workflows/*.md`：68 个 workflow 编排文件
- `get-shit-done/references/*.md`：35 个 reference 规则文件
- `get-shit-done/templates/*.md`：43 个 template 工件文件

如果只看最显式、最像传统 skill 的内容：

- `commands/gsd/*.md`
- `agents/*.md`

这两层加起来有 **92 个显式 skill 单元**。

如果把变形后的 skill 也算上：

- workflow
- reference
- template

那就还有 **146 个变形 skill 单元**。

也就是说，这仓库真正有研究价值的核心，不是“命令多”，  
而是它把 **238 个 skill / skill-like 单元** 组织成了一套系统。

### 这套 skill 版面的大致分工

#### 第一层：command skills

路径：

- `commands/gsd/new-project.md`
- `commands/gsd/discuss-phase.md`
- `commands/gsd/plan-phase.md`
- `commands/gsd/execute-phase.md`
- `commands/gsd/verify-work.md`
- `commands/gsd/ship.md`

这一层负责：

- 暴露用户入口
- 声明 front matter
- 绑定允许工具
- 路由到 workflow

#### 第二层：agent skills

路径：

- `agents/gsd-planner.md`
- `agents/gsd-executor.md`
- `agents/gsd-verifier.md`
- `agents/gsd-project-researcher.md`
- `agents/gsd-codebase-mapper.md`
- `agents/gsd-code-reviewer.md`

这一层负责：

- 把工作职责拆成专职角色
- 规定每个角色的工具边界
- 规定角色的执行纪律

#### 第三层：workflow skills

路径：

- `get-shit-done/workflows/new-project.md`
- `get-shit-done/workflows/discuss-phase.md`
- `get-shit-done/workflows/plan-phase.md`
- `get-shit-done/workflows/execute-phase.md`
- `get-shit-done/workflows/verify-work.md`

这一层负责：

- 真正做流程编排
- 决定什么时候问问题
- 决定什么时候拉上下文
- 决定什么时候 spawn agent
- 决定什么时候更新状态与进入下一步

#### 第四层：reference skills

路径：

- `get-shit-done/references/questioning.md`
- `get-shit-done/references/verification-patterns.md`
- `get-shit-done/references/planning-config.md`
- `get-shit-done/references/context-budget.md`
- `get-shit-done/references/tdd.md`

这一层负责：

- 沉淀共享规则
- 防止每个 prompt 各说各话
- 给 workflow 和 agent 提供统一方法论

#### 第五层：template skills

路径：

- `get-shit-done/templates/project.md`
- `get-shit-done/templates/requirements.md`
- `get-shit-done/templates/roadmap.md`
- `get-shit-done/templates/state.md`
- `get-shit-done/templates/VALIDATION.md`
- `get-shit-done/templates/UAT.md`

这一层负责：

- 约束产物形状
- 让 `.planning/` 真正成为项目记忆
- 降低长期任务中的随机性

### 它的 skill 版面有什么共同结构

#### command skills 的共同结构

以 `commands/gsd/new-project.md`、`commands/gsd/list-workspaces.md` 为代表，  
共同结构是：

- YAML front matter
- `name`
- `description`
- `allowed-tools`
- `argument-hint`
- `<objective>`
- `<execution_context>`
- `<process>`

这说明 command 不是文档，  
而是 **能力入口声明**。

#### agent skills 的共同结构

以 `agents/gsd-planner.md`、`agents/gsd-verifier.md` 为代表，  
共同结构是：

- YAML front matter
- `name`
- `description`
- `tools`
- `color`
- `<role>`
- `<project_context>`
- `<core_principle>` 或其他约束块
- `<process>` / `<verification_process>` 之类的结构化段落

这说明 agent 不是普通 persona，  
而是 **强约束角色型 skill**。

#### workflow skills 的共同结构

以 `get-shit-done/workflows/new-project.md` 为代表，  
共同结构是：

- `<purpose>`
- `<required_reading>`
- `<available_agent_types>`
- `<process>`
- `<step ...>`

它不一定有 YAML front matter，  
但结构程度一点也不低。  
它本质上就是 **编排型 skill**。

#### reference skills 的共同结构

以 `get-shit-done/references/verification-patterns.md` 为代表，  
共同结构是：

- 一个非常明确的原则标题
- `core_principle`
- 场景化检查规则
- 可执行的 grep/bash 片段
- red flag / stub pattern / 验证步骤

这说明 reference 不是背景说明，  
而是 **共享检查规则 skill**。

#### template skills 的共同结构

以 `get-shit-done/templates/project.md` 为代表，  
共同结构是：

- 一个完整产物模板
- 模板正文
- 使用指南
- 字段解释
- 维护规则

这说明 template 也不是普通样板，  
而是 **产物标准化 skill**。

### 这套设计最有意思的地方

- 它强调的是 process，不只是 prompt prose
- 它默认真正的问题不是“agent 不会做”，而是“agent 会失焦、偷步骤、忘上下文”
- 它把 front matter、workflow、reference、template 组合成一个分层 skill 系统
- 它把 `.planning/` 做成项目记忆，让 skill 不再是一轮对话后就失效
- 它把 verify 放成硬门槛，而不是“顺手看看”

## 2. 我的评估框架

为了避免只做仓库介绍，下面我按 5 个尺度评这些 skill-like 单元：

- 结构化程度：边界清不清楚，能不能稳定复用
- 验证强度：有没有把证据、检查、回流机制写进流程
- 复用范围：能不能迁移到别的项目或别的 agent runtime
- 工具依赖：越高表示越依赖宿主 runtime、CLI、外部环境
- 协作价值：对多 agent、多 session、长期项目有没有帮助

评分说明：

- 1 = 很低
- 3 = 中等
- 5 = 很高

## 3. 总体判断

### 这套 skill 系统的总体优点

- front matter 信号非常强，command 和 agent 很容易识别
- workflow 层把 skill 串成了闭环，不再是平铺清单
- reference 层把共享规则收拢得很好，减少口径漂移
- template 层让项目记忆真正落地，而不是口头约定
- verify / gap closure / revision 这些机制说明它在认真处理 agent 失控问题

### 这套 skill 系统的总体缺点

- 体系很厚，小任务使用会显得重
- workflow、reference、template 虽然是 skill-like，但第一次看的人要自己完成抽象
- 大量 Markdown 文件让命名治理、引用治理、演进治理变得重要
- 对宿主 runtime 仍然有依赖，完整迁移不是零成本

### 我对它本质的理解

它不是“技能仓库”这么简单。  
它更接近：

- 一个 skill runtime
- 一个 agent 工作流操作系统
- 一个把工程纪律模块化的分发仓库

换句话说，它最想解决的问题不是：

- agent 会不会写代码

而是：

- agent 会不会乱开工
- agent 会不会不带状态持续漂移
- agent 会不会没有验证就宣布完成
- agent 会不会在多阶段任务中失去节奏

## 4. 每类 skill 的细节评估

### 4.1 command skills

- 评估对象：`commands/gsd/*.md` 共 68 个
- 代表文件：`new-project.md`、`plan-phase.md`、`execute-phase.md`、`verify-work.md`、`ship.md`
- 职责：暴露 `/gsd-*` 入口，把任务路由到 workflow
- 核心机制：front matter 声明 `name / description / allowed-tools`，正文声明 `objective / execution_context / process`
- 我的理解：这是整套系统最显式的 skill 注册层
- 优点：入口统一；权限边界清晰；很适合被宿主 runtime 枚举和调用
- 缺点：如果只看 command，不继续看 workflow，会误以为这只是“命令说明文档”
- 适用边界：适合所有需要显式能力入口的 agent 工具链
- 多尺度评估：结构化程度 5 / 验证强度 3 / 复用范围 5 / 工具依赖 2 / 协作价值 5

### 4.2 lifecycle command cluster

这里最关键的不是全部 68 个 command 平铺看，  
而是这 6 个生命周期入口：

- `commands/gsd/new-project.md`
- `commands/gsd/discuss-phase.md`
- `commands/gsd/plan-phase.md`
- `commands/gsd/execute-phase.md`
- `commands/gsd/verify-work.md`
- `commands/gsd/ship.md`

- 职责：覆盖项目从初始化到交付的完整生命周期
- 核心机制：把“想法 → 讨论 → 规划 → 执行 → 验证 → 交付”固定成健康顺序
- 我的理解：这组 command 是 GSD 的主干 skill 套件
- 优点：顺序清晰；有工程节奏；适合把 agent 拉回正常软件流程
- 缺点：对于单行小修或临时试验，明显偏重
- 适用边界：适合真实项目、跨文件改动、长期任务
- 多尺度评估：结构化程度 5 / 验证强度 5 / 复用范围 5 / 工具依赖 2 / 协作价值 5

### 4.3 agent skills

- 评估对象：`agents/*.md` 共 24 个
- 代表文件：`gsd-planner.md`、`gsd-executor.md`、`gsd-verifier.md`、`gsd-code-reviewer.md`
- 职责：把大任务拆成规划、执行、验证、审查、研究等专职角色
- 核心机制：front matter 定义角色与工具，正文定义职责、硬约束、上下文读取规则
- 我的理解：这是 skill persona 工程化做得最成熟的一层
- 优点：角色边界清晰；很适合 fresh context；对子 agent 调度极友好
- 缺点：角色一多，命名和边界治理会越来越重要
- 适用边界：适合多 agent 分工、长链路任务、上下文预算敏感场景
- 多尺度评估：结构化程度 5 / 验证强度 4 / 复用范围 4 / 工具依赖 3 / 协作价值 5

### 4.4 gsd-planner

- 所在位置：`agents/gsd-planner.md`
- 职责：生成可执行 phase plan，负责拆任务、做依赖分析、保证决策覆盖
- 核心机制：读取已有上下文，强制对齐 `CONTEXT.md` 决策，必要时推荐 phase split
- 我的理解：这是整个系统里最关键的 planning skill 之一
- 优点：不是泛泛规划，而是把“用户已决策内容必须落地”写成强约束
- 缺点：如果上游讨论产物质量差，它也会受影响
- 适用边界：适合任何中大型 phase planning
- 多尺度评估：结构化程度 5 / 验证强度 5 / 复用范围 4 / 工具依赖 3 / 协作价值 5

### 4.5 gsd-verifier

- 所在位置：`agents/gsd-verifier.md`
- 职责：验证结果是否真的达成目标，而不是只检查文件存在
- 核心机制：goal-backward verification、previous verification re-check、gap closure 回流
- 我的理解：这是 GSD 最体现“反偷懒”精神的 agent skill
- 优点：它强调 outcome，而不是 task completion；这一点非常成熟
- 缺点：执行成本高；对“只想快点结束”的用法不友好
- 适用边界：适合重要 phase、bug fix、功能验收、发布前检查
- 多尺度评估：结构化程度 5 / 验证强度 5 / 复用范围 5 / 工具依赖 3 / 协作价值 5

### 4.6 workflow skills

- 评估对象：`get-shit-done/workflows/*.md` 共 68 个
- 代表文件：`new-project.md`、`plan-phase.md`、`execute-phase.md`、`verify-work.md`
- 职责：做真正的 orchestration
- 核心机制：上下文初始化、模式判断、agent 调度、状态推进、错误恢复
- 我的理解：这是 get-shit-done 最有含金量的变形 skill 层
- 优点：让 command 变薄，让规则共享，让复杂流程真正可维护
- 缺点：可见度不如 command front matter 直接，所以第一次看时容易低估价值
- 适用边界：适合所有阶段性、可回流、可验证的长任务
- 多尺度评估：结构化程度 5 / 验证强度 5 / 复用范围 4 / 工具依赖 3 / 协作价值 5

### 4.7 new-project workflow

- 所在位置：`get-shit-done/workflows/new-project.md`
- 职责：从 idea 进入项目初始化，串起 questioning、research、requirements、roadmap
- 核心机制：先做 runtime/init 检查，再做 brownfield 判断，再收集 config，再生成 `.planning/` 工件
- 我的理解：这是整个系统的入口 orchestration skill
- 优点：把最容易混乱的“项目起步阶段”做得很有章法
- 缺点：对于已经很明确的小改动会显得过重
- 适用边界：适合 0→1 或大型新阶段启动
- 多尺度评估：结构化程度 5 / 验证强度 4 / 复用范围 4 / 工具依赖 3 / 协作价值 5

### 4.8 reference skills

- 评估对象：`get-shit-done/references/*.md` 共 35 个
- 代表文件：`verification-patterns.md`、`questioning.md`、`planning-config.md`、`context-budget.md`、`tdd.md`
- 职责：沉淀共享规则，供 workflow 和 agent 引用
- 核心机制：把原则、检查清单、反模式、操作模式抽出来，避免重复内联
- 我的理解：这是 skill runtime 的共享脑内 checklist 层
- 优点：很利于治理；很利于复用；很利于统一口径
- 缺点：如果不了解引用关系，容易误以为这些只是附属文档
- 适用边界：适合任何需要把工程规则模块化的系统
- 多尺度评估：结构化程度 4 / 验证强度 4 / 复用范围 5 / 工具依赖 1 / 协作价值 5

### 4.9 verification-patterns

- 所在位置：`get-shit-done/references/verification-patterns.md`
- 职责：把“怎么证明不是 stub”写成跨场景规则
- 核心机制：Exists / Substantive / Wired / Functional 四层验证模型
- 我的理解：这是 reference 层里最强的一份 shared skill
- 优点：非常实战；不仅讲原则，还给出 grep/bash 检查模式
- 缺点：偏工程检查语境，对纯创意任务帮助有限
- 适用边界：适合 feature、UI、API、路由、集成、模板替换等大量工程场景
- 多尺度评估：结构化程度 5 / 验证强度 5 / 复用范围 5 / 工具依赖 1 / 协作价值 5

### 4.10 template skills

- 评估对象：`get-shit-done/templates/*.md` 共 43 个
- 代表文件：`project.md`、`requirements.md`、`roadmap.md`、`state.md`、`VALIDATION.md`
- 职责：固定 `.planning/` 及其他产物的结构
- 核心机制：提供模板 + 字段解释 + 填写指南
- 我的理解：这是“让项目记忆和阶段工件可维护”的核心一层
- 优点：把长期协作最容易散掉的上下文显式收拢
- 缺点：对小任务偏重；模板太多时也要治理
- 适用边界：适合所有需要项目记忆、阶段性交付物、验收文档的场景
- 多尺度评估：结构化程度 5 / 验证强度 4 / 复用范围 4 / 工具依赖 1 / 协作价值 5

### 4.11 project.md template

- 所在位置：`get-shit-done/templates/project.md`
- 职责：规范 `.planning/PROJECT.md` 作为项目全局上下文文档
- 核心机制：把 What This Is、Core Value、Requirements、Context、Constraints、Key Decisions 固定下来
- 我的理解：这是长期任务里最重要的 context memory template
- 优点：不仅给模板，还给维护规则；非常适合防止项目漂移
- 缺点：需要团队或 agent 持续更新，否者会失真
- 适用边界：适合所有持续多 session 项目
- 多尺度评估：结构化程度 5 / 验证强度 4 / 复用范围 5 / 工具依赖 1 / 协作价值 5

## 5. 我认为这套仓库最强的 8 个 skill / skill-like 单元

### 从系统价值看

- `commands/gsd/plan-phase.md`：把模糊执行变成可落地规划
- `commands/gsd/verify-work.md`：把“看起来完成”拉回“被证明完成”
- `agents/gsd-planner.md`：强约束 planning
- `agents/gsd-verifier.md`：强约束 verification
- `get-shit-done/workflows/new-project.md`：把起步阶段系统化
- `get-shit-done/workflows/execute-phase.md`：把执行阶段持续纳入流程
- `get-shit-done/references/verification-patterns.md`：把验证经验变成共享规则
- `get-shit-done/templates/project.md`：把项目记忆真正固定下来

### 从“对 AI agent 的帮助”看

- `gsd-planner`：减少任务拆解失控
- `gsd-verifier`：减少假完成
- `verification-patterns.md`：减少 stub 交付
- `project.md`：减少跨会话漂移
- `plan-phase` / `execute-phase` / `verify-work`：减少“一口气写到底”的混乱节奏

## 6. 我认为最容易被低估的 skill-like 层

- workflow：因为没有统一 YAML front matter，第一次看时最容易被低估
- reference：因为长得像文档，但其实是共享规则 skill
- template：因为长得像模板，但其实在决定整个系统能不能保住长期记忆

换句话说，  
如果只盯着 command 和 agent，会把这个仓库看小很多。

## 7. 如果让我给这套仓库下一个总评价

### 一句话评价

这是一个把 command、agent、workflow、reference、template 五层内容组织成 **skill runtime** 的成熟仓库，不是普通 prompt 集合。

### 适合谁

- 想让 AI agent 参与真实工程而不只是写 demo 的团队
- 想给 agent 建立工作节奏、项目记忆、验证闭环的人
- 想研究 skill 如何从单文件演化成系统的人

### 不太适合谁

- 只想临时跑几个 prompt、不想要工程纪律的人
- 小任务优先、几乎不做验证的人
- 不愿意维护状态文件和流程工件的团队

### 我的最终结论

- 从 skill 识别角度看：很强，尤其是 command 与 agent 的 front matter 很清楚
- 从 skill 变形角度看：更强，workflow / reference / template 共同构成了系统价值
- 从工程成熟度看：很高，重点不在“多”，而在“闭环”
- 从学习门槛看：中等偏高，因为你必须把五层东西一起理解

如果只回答我们这次最关心的问题：

“这个 repo 里真正值得看的，是不是 skill 类型的东西？”

答案是：

**是，而且几乎整个仓库的核心价值都集中在 skill 及其变形单元上。**
