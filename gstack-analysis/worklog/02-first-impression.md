# gstack 第一印象

## 这项目首先像什么

第一眼看它像“skill 仓库”，但深入一点就会发现，它更准确地像下面三种东西的叠加：

- 一套 AI 工程流程操作系统
- 一套可安装、可升级、可评估的 skill runtime
- 一个以浏览器 automation 为核心突破口的 AI 开发工作台

所以如果只把它理解成“很多 slash command 的合集”，会低估它。

## 它服务谁

从 README 的定位看，它最明确服务三类人：

- 技术型 founder / CEO
- 第一次正式把 AI 拉进工程流程的人
- 已经有研发流程，希望把 review / QA / ship 系统化的人

它不是主要为“写一个 prompt 收藏夹”服务，  
而是为“把 AI 纳入真实工程闭环”服务。

## 它解决的核心问题

我目前看到它主要在解四类问题：

### 1. AI agent 会写，但不稳

仓库大量内容在解决：

- 会不会跳步骤
- 会不会漏验证
- 会不会乱提 scope
- 会不会一边做一边失焦

### 2. 浏览器能力如果太慢，QA 就做不起来

`ARCHITECTURE.md` 讲得很清楚，gstack 的关键突破不是“会不会调 Playwright”，而是：

- 持久化 Chromium daemon
- 子秒级浏览器命令
- 登录态、cookie、tab 持续保留

这让 `/browse`、`/qa`、`/design-review` 这些 skill 真正可用。

### 3. 手写 skill 文档很容易漂移

它通过 `SKILL.md.tmpl` 和 `gen:skill-docs`，把一部分说明从人工维护改成源代码生成，  
这其实是在解决“prompt 仓库文档漂移”问题。

### 4. 多 session / 多 agent / 多宿主的治理

从 `setup --host`、OpenClaw、extension、timeline、learnings、telemetry 这些层面看，  
它关心的不是一次性运行，而是长期使用、多人协作、跨工具迁移。

## 为什么它属于高价值的 skill 仓库

因为它不仅满足“有 SKILL.md”这个表层标准，还满足更关键的几点：

- skill 入口显式
- 输入与动作边界清楚
- 工具权限有约束
- skill 之间有顺序与协作关系
- runtime 与验证机制不是口头描述，而是工程实现

这点比很多只会写角色提示词的仓库更强。

## 它和传统 skill 仓库最不一样的地方

### 它不是平铺式技能目录

传统仓库经常是：

- 每个 skill 单独存在
- 彼此并排
- 关系弱

而 gstack 更像：

- 一个 sprint 流程
- 一个 review pipeline
- 一个 design -> implementation -> QA -> ship 的链条

### 它把“prompt 工程”推进到了“runtime 工程”

这里真正难抄的不是 skill prose，  
而是这些东西的组合：

- `browse/src/*`
- `design/src/*`
- `bin/*`
- `extension/*`
- `.github/workflows/*`

也就是说，强度不只在写法，还在基础设施。

### 它把操作性元规则写得特别重

例如：

- preamble 统一处理 upgrade / telemetry / session / learnings
- AskUserQuestion 有固定格式
- Search Before Building 被制度化
- review / QA / deploy 都有反跳步约束

这说明它最在意的是 agent 的失控点。

## 当前初步判断

### 仓库类型

- 主类型：AI 工程工作流 / skill runtime 仓库
- 次类型：浏览器自动化 + 设计辅助 + release automation 工具箱

### skill-like 单元的主战场

- 顶层 `<skill>/SKILL.md`
- `SKILL.md.tmpl`
- `review/specialists/*.md`
- `qa/references/*.md`
- `qa/templates/*.md`
- `openclaw/skills/*/SKILL.md`

### 最值得深入的四个观察点

- `/browse` 为什么能成为全仓库能力底座
- skill 模板系统如何减少文档漂移
- `/autoplan` 和多 review skill 如何形成编排链
- 它的“学习、升级、遥测、会话追踪”如何把一次性 skill 变成长期系统

## 第一轮风险判断

这仓库很容易出现两个误判：

### 误判 1：它只是营销文案很强

目前看不是。  
README 叙事很强，但底层确实有：

- daemon 架构
- 模板生成
- 测试分层
- 多宿主接入

### 误判 2：skill 太多，可能只是堆数量

也不能直接这么下结论。  
因为它的数量背后其实有分工：

- 入口 skill
- 评审 skill
- browser / design 底层能力
- OpenClaw 对接
- 文档和评估机制

真正要评的，不是“数量多不多”，而是“有没有结构密度和复用性”。

## 暂定一句话判断

gstack 不是“很多 AI 命令”的仓库，  
而是一套把 AI 工程纪律、浏览器执行力和多角色审查流程做成产品化技能系统的仓库。
