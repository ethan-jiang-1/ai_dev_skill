# get-shit-done 完整评估

## 总结论

如果按照我们这次最关心的标准来判断，  
`get-shit-done` 的价值不在于“它是不是有一个叫 skill 的目录”，  
而在于它把大量 **skill-like 内容** 组织成了一套可运行的工程系统。

换句话说：

- 它不一定处处都写着 skill
- 但 command、agent、workflow、reference、template 这些东西，本质上都在承担 skill 职责

所以这项目不是“像不像 skill 仓库”这么简单，  
而是“它把 skill 演化成了更完整的 runtime”。

## 我们最关心的判断：这里面到底有没有 skill

有，而且很多。

只是它们分成了不同形态：

### 显式 skill

- `commands/gsd/*.md`
- `agents/*.md`

这两类最好识别，  
因为 front matter 很明显。

你一看就知道：

- 它叫什么
- 它干什么
- 它能用哪些工具

### 变形 skill

- `get-shit-done/workflows/*.md`
- `get-shit-done/references/*.md`
- `get-shit-done/templates/*.md`

这些不一定都用 YAML front matter，  
但在系统职责上，它们就是 skill 的延展形态：

- workflow 负责 orchestration
- reference 负责 shared constraints
- template 负责 shared outputs

## front matter 为什么是关键识别点

你说得对，这类仓库很多时候看 front matter 就知道八九不离十。

在 `get-shit-done` 里尤其明显：

### command front matter

它定义：

- `name`
- `description`
- `argument-hint`
- `allowed-tools`

这就是一个能力入口最核心的元数据。

### agent front matter

它定义：

- `name`
- `description`
- `tools`
- `color`

这就是一个专职执行单元最核心的元数据。

所以从“skill 识别”这条线来说，  
这个仓库完全符合“通过 front matter 暴露能力单元”的范式。

## 它和普通 skill 仓库的不同点

普通 skill 仓库通常做到这里就结束了：

- 定义 skill
- 写 prompt
- 给几个使用例子

`get-shit-done` 继续往前走了三步：

### 1. 做了编排层

它不是只有入口 skill，  
还有 workflow 把多个 skill-like 单元串起来。

### 2. 做了状态层

它不是一次性 prompt 触发完就结束，  
而是把项目状态落到 `.planning/`。

### 3. 做了验证层

它不是只负责产出内容，  
还负责检查、修正、补缺和交付 gating。

这三点加起来，让它从 skill catalog 升级成了 skill runtime。

## 如果只从结构上看，最重要的五层是什么

### 第一层：command

这是最接近“skill 入口卡片”的层。  
用户通过 `/gsd-*` 进入系统。

### 第二层：agent

这是最接近“专业技能模块”的层。  
每个 agent 都对应一个固定职责。

### 第三层：workflow

这是最接近“技能编排器”的层。  
负责把多个角色和规则串起来。

### 第四层：reference

这是共享知识层。  
它把经验变成稳定规则，避免每个 prompt 各说各话。

### 第五层：template

这是共享产物层。  
它把项目记忆和输出格式标准化。

## 我的评估框架

为了避免只做仓库介绍，这里我按 5 个尺度来看这些 skill-like 单元：

- 结构化程度：定义是否清晰，能不能稳定复用
- 验证强度：是否把检查、证据、门槛写进流程
- 复用范围：能不能跨项目迁移
- 工具依赖：越高表示越依赖特定 runtime 或外部能力
- 协作价值：对多 agent、多 session、长期项目有没有帮助

评分说明：

- 1 = 很低
- 3 = 中等
- 5 = 很高

## 每类 skill-like 单元的细评

### 1. command skills

- 职责：暴露 `/gsd-*` 能力入口，把任务路由到对应 workflow
- 核心机制：front matter 声明能力名、描述、工具权限，再通过 `execution_context` 绑定下游资源
- 我的理解：这是整套系统的“skill 注册入口层”
- 优点：识别非常清楚；入口统一；权限边界明确；易于枚举和治理
- 缺点：单看 command 不足以理解全流程，必须继续追 workflow
- 适用边界：适合任何需要“显式可调用能力入口”的 agent runtime
- 多尺度评估：结构化程度 5 / 验证强度 3 / 复用范围 5 / 工具依赖 2 / 协作价值 5

### 2. agent skills

- 职责：承接规划、执行、验证、审查、研究等专职角色
- 核心机制：front matter 定义角色与工具，正文定义职责、禁止项、上下文读取规则
- 我的理解：这是把 skill persona 工程化，而不是只写一段人设 prompt
- 优点：角色边界清晰；很适合 fresh context 调度；容易扩展专职能力
- 缺点：数量上来以后，角色重叠和命名治理会变复杂
- 适用边界：适合多 agent 分工、复杂项目、长链路任务
- 多尺度评估：结构化程度 5 / 验证强度 4 / 复用范围 4 / 工具依赖 3 / 协作价值 5

### 3. workflow skills

- 职责：把 command、agent、reference、template 串成完整流程
- 核心机制：结构化步骤、上下文读取、模式判断、agent 调度、状态推进
- 我的理解：这是 get-shit-done 最有含金量的“变形 skill”
- 优点：真正把 skill 变成系统；非常适合长流程；能降低 prompt 漂移
- 缺点：理解成本比 command 和 agent 更高；不看全局容易低估价值
- 适用边界：适合需要阶段推进、状态管理、验证闭环的任务
- 多尺度评估：结构化程度 5 / 验证强度 5 / 复用范围 4 / 工具依赖 3 / 协作价值 5

### 4. reference skills

- 职责：沉淀 questioning、verification、context budget、planning config 等共享规则
- 核心机制：把经验和约束从单个 prompt 中抽离为全局规则文件
- 我的理解：这是整个 skill runtime 的“共享脑内 checklist”
- 优点：减少重复；减少口径漂移；提升不同入口和角色之间的一致性
- 缺点：如果引用关系不清晰，容易让人忽略它们其实很关键
- 适用边界：适合任何希望把规则模块化、共享化的 skill 系统
- 多尺度评估：结构化程度 4 / 验证强度 4 / 复用范围 5 / 工具依赖 1 / 协作价值 5

### 5. template skills

- 职责：固定项目记忆和工作产物的形状
- 核心机制：把 `.planning/` 下的关键文档标准化，降低输出随机性
- 我的理解：这是“skill 产物标准化”层
- 优点：非常利于长期项目和多 session 协作；让状态管理变得真实可落地
- 缺点：如果项目很小，会显得偏重；模板太多时也会带来维护成本
- 适用边界：适合任何需要持续项目记忆和阶段性交付物的 agent 工作流
- 多尺度评估：结构化程度 5 / 验证强度 4 / 复用范围 4 / 工具依赖 1 / 协作价值 5

## 它最值得学的地方

### 1. 把 skill 做成分层系统

这是它最大的亮点。  
不是一个 skill 文件解决一切，而是不同层各司其职。

### 2. 用 front matter 暴露能力边界

这让 command 和 agent 很容易识别、分类、治理。

### 3. 用 workflow 承接复杂流程

入口薄、编排厚，这是对的。  
否则入口 prompt 很快会失控。

### 4. 用 reference 和 template 稳定系统

这一步让 skill 不只是“会说”，  
而是“持续说得一致、持续产出得一致”。

### 5. 用 `.planning/` 解决长期任务问题

这是它和很多 skill 仓库真正拉开差距的地方。

## 它的主要问题

### 1. 体系太厚

如果只是想复制几个 skill，  
这套系统显得偏重。

### 2. skill-like 边界需要分析者自己抽象

仓库内部虽然客观上已经形成：

- command
- agent
- workflow
- reference
- template

这五种 skill-like 单元，  
但概念命名没有完全统一成一个总框架。

### 3. 大量 Markdown 的治理成本不低

这种体系越大，越需要强命名规范和引用规范。

## 最终判断

如果你问我：

“这个 repo 里最值得看的，是不是 skill 类的东西？”

答案是：

**是，而且几乎整个仓库最有价值的部分都集中在这。**

但更准确地说：

它看的不只是 skill，  
而是 **skill 及其变形单元如何组成一套工程化 runtime**。

## 最终总评

`get-shit-done` 最值得研究的地方，不是单个 prompt 写得多漂亮，  
而是它证明了 skill 可以从一个静态说明文件，演化成：

- 有 front matter 的入口
- 有 front matter 的专职角色
- 有结构化编排的 workflow
- 有共享规则的 reference
- 有共享产物的 template
- 有持久状态的项目记忆
- 有验证闭环的工程流程

所以如果我们这条分析线的核心问题是：

“这个仓库里有没有值得学的 skill-like 设计？”

我的结论是：

**非常有，而且它的价值就在于 skill 已经不再只是 skill，而是一整套 skill runtime。**
