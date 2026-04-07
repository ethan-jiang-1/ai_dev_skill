# digested_src 二轮 Deep Research Progressive Plan

## 目标

针对 `digested_src` 里的 4 个主题，各做一轮更深入的 Deep Research。

这一轮不是重复第一轮摘要，而是要系统扩大：

- 内容广度
- 证据密度
- 根本机制理解
- 趋势判断
- 难度分层
- 现实约束与失败模式

同时，把搜到的高价值材料沉淀到：

- `/Users/bowhead/ai_dev_skill/SDLC_SKILL/reference_src`

这些材料要作为后续分析的 ground truth，而不是临时浏览痕迹。

## 输入

本轮研究直接以这 4 份文件为起点：

- `/Users/bowhead/ai_dev_skill/SDLC_SKILL/digested_src/01-基础规范与宿主平台生态.md`
- `/Users/bowhead/ai_dev_skill/SDLC_SKILL/digested_src/02-聚合器注册表与分发安全.md`
- `/Users/bowhead/ai_dev_skill/SDLC_SKILL/digested_src/03-企业官方来源社区索引与MCP共生.md`
- `/Users/bowhead/ai_dev_skill/SDLC_SKILL/digested_src/04-SDLC方法论框架与工程治理.md`

## 输出

本轮执行后应至少形成三类资产：

### 1. Ground truth 参考材料

存放位置：

- `/Users/bowhead/ai_dev_skill/SDLC_SKILL/reference_src`

形式：

- 每个高价值来源单独存成一个 `md`
- 不追求全文镜像，重点保存结构化摘录、关键信息、来源链接、研究价值判断

### 2. 每个主题的二轮研究结果

每个主题都应形成更深版本，至少能回答：

- 现在知道了什么
- 证据来自哪里
- 背后根本机制是什么
- 生态趋势是什么
- 实际难点和争议点是什么

### 3. 跨主题综合结论

最终需要能够横向回答：

- 哪些是基础设施层事实
- 哪些是平台分发层趋势
- 哪些是供给层真实高密度来源
- 哪些是方法论层真正高杠杆框架

## 总体策略

这轮 Deep Research 不建议直接把 4 个主题完全割裂后并行暴力搜索。  
更稳的做法是“先共享地基，再分题深挖，再横向综合”。

建议采用 3 个波次推进：

### Wave 0：建立共同 ground truth 地基

目标：

- 为 4 个主题先建立一组共用的高可信资料底座
- 优先抓官方文档、官方仓库、规范文档、主仓 README、官方 marketplace / docs 页面

优先来源类型：

- 官方 docs
- 官方 GitHub 仓库
- 规范文档
- 官方博客 / release notes
- 高可信论文或安全研究

这一波的重点不是下结论，  
而是把后续 4 题都会反复用到的“硬事实”先固化到 `reference_src`。

### Wave 1：按 4 个主题分别深挖

每个主题都要从同样 5 个视角继续扩展：

- 证据：关键事实有没有一手来源支撑
- 根本：背后的真正抽象或机制是什么
- 趋势：最近在往哪个方向演化
- 难度：采用、维护、迁移、学习的难点在哪
- 争议：社区意见分歧、局限、失败模式是什么

### Wave 2：横向比对与综合判断

把 4 条线重新收回来，做交叉问题判断：

- 哪些平台和机制是基础层
- 哪些市场和聚合器只是入口，不是最终答案
- 哪些供给源值得长期追踪
- 哪些方法论框架是真正能迁移的工程抽象

## 证据采集协议

`reference_src` 里的每个 `md` 建议遵循统一结构：

```md
# 标题

- source_url:
- source_type:
- accessed_at:
- related_topic:
- trust_level:
- why_it_matters:

## 关键事实

## 与本研究的关系

## 可直接引用的术语 / 概念

## 风险与局限
```

命名建议：

- `01-<topic>-<source-slug>.md`
- `02-<topic>-<source-slug>.md`
- `03-<topic>-<source-slug>.md`
- `04-<topic>-<source-slug>.md`

其中 `<topic>` 对应四个主题：

- `host`
- `dist`
- `supply`
- `framework`

例如：

- `01-host-agentskills-spec.md`
- `02-dist-vercel-skills-cli.md`
- `03-supply-awesome-agent-skills.md`
- `04-framework-superpowers.md`

## 什么值得存进 reference_src

不是所有搜到的页面都值得存。  
优先保留下面这些高信号材料：

- 官方规范页
- 官方仓库 README / docs
- 明确说明产品机制的官方文档
- 关键框架的核心设计文档
- 安全研究、协议分析、趋势论文
- 解释机制差异的高质量技术文章
- 能提供真实约束、真实失败模式、真实采用门槛的案例

弱化这类来源：

- 纯流量型媒体综述
- 只做表面排名的文章
- 没有实证和机制分析的泛博客

## 四条研究线的具体目标

### 主题 1：基础规范与宿主平台生态

研究目标：

- 扩大对 `SKILL.md` / AgentSkills 的事实理解
- 明确各宿主平台到底如何支持 skill
- 找出“标准兼容”与“平台专有封装”的真实边界

必须回答：

- 哪些平台真兼容标准，哪些只是部分映射
- skill 的发现、加载、触发、权限、组合机制分别怎么做
- 哪个平台最适合软件开发类 skill 的长期积累

证据重点：

- AgentSkills / `SKILL.md` 官方规范
- Claude Code、Codex、Cursor、Windsurf、OpenCode、Copilot 官方 docs
- skills / plugins / workflows / rules / subagents 的官方说明

难点重点：

- 名义支持和真实运行模型之间的差异
- 术语相似但机制不同
- 跨宿主迁移时的隐性成本

### 主题 2：聚合器、注册表与分发安全

研究目标：

- 扩大对 skill 分发层的理解
- 把安装、分发、版本治理、安全扫描放到一个统一框架里看

必须回答：

- 现在的 skill 分发更像 npm、plugin market 还是文档目录
- 哪些平台最适合“发现并拿来用”
- 哪些机制最适合团队级安全分发

证据重点：

- Vercel Labs `skills`
- LobeHub marketplace
- Sundial Hub
- 相关 CLI、registry、security scan、versioning 文档

难点重点：

- 大市场里的噪音过滤
- 供应链安全和 prompt injection 风险
- 团队私有化和公共分发的分裂

### 主题 3：企业官方来源、社区索引与 MCP 共生

研究目标：

- 把内容供给层真正拆开
- 分清楚企业第一方、Awesome 清单、MCP 生态各自解决什么问题

必须回答：

- 企业官方 skill 仓库为什么有长期价值
- Awesome 索引真正能发现哪些长尾高质量资源
- skill 和 MCP 的关系到底是协作、替代还是分层

证据重点：

- Expo、Cloudflare、Hugging Face 等官方仓库
- `awesome-claude-skills`
- `awesome-agent-skills`
- `awesome-copilot`
- `awesome-mcp-servers`
- MCP 目录和检查器

难点重点：

- 企业仓库更新节奏快，信息可能变化
- Awesome 清单质量参差不齐
- MCP 和 skill 的边界经常被说混

### 主题 4：SDLC 方法论框架与工程治理

研究目标：

- 深挖这些框架到底在写入什么工程能力
- 找出哪些是真正可迁移的治理抽象

必须回答：

- 哪些框架适合个人，哪些适合团队
- 哪些在防漂移、防漏验证、防跑偏上最强
- 哪些更像“工程操作系统”，哪些只是轻量规则集

证据重点：

- Superpowers
- GSD
- Gstack
- BMAD-METHOD
- Spec Kit
- OpenSpec
- FDF
- Roo Code
- Aider

难点重点：

- 框架宣传话术与真实机制要分开
- 强风格化包装与可迁移机制要分开
- Brownfield / Greenfield / solo / team 场景适配不同

## 并行执行建议

这件事很适合用 coding agent 做并行推进，但要有明确分工。

建议分成 5 个线程：

- 主线程：维护总问题、统一标准、去重、综合判断
- 线程 A：主题 1
- 线程 B：主题 2
- 线程 C：主题 3
- 线程 D：主题 4

主线程职责：

- 统一证据采集格式
- 维护 `reference_src` 命名规范
- 避免不同线程重复下载同一来源
- 在 Wave 2 做跨主题综合

各主题线程职责：

- 深挖自己主题
- 把高价值来源落为 `reference_src/*.md`
- 在研究中明确记录：证据、根本、趋势、难点、争议

## 节奏建议

### Step 1

先为 4 个主题各列一份“权威来源优先级清单”，只抓高可信来源。

### Step 2

先充实 `reference_src`，不要一边浏览一边直接写结论。

### Step 3

每个主题完成一轮“扩内容”：

- 多找对象
- 多找案例
- 多找机制差异

### Step 4

每个主题完成一轮“找根本”：

- 为什么会这样设计
- 解决的底层问题是什么
- 这些机制在工程上对应什么抽象

### Step 5

每个主题完成一轮“找趋势与难点”：

- 生态正在往哪演化
- 哪些地方开始标准化
- 哪些地方依然混乱
- 实践门槛和失败模式是什么

### Step 6

最后做跨主题综合，不要只留 4 份平行研究结果。

## 成功标准

本计划执行完成后，应该达到下面状态：

- `reference_src` 中有一批高可信、可追溯的 ground truth 文档
- 对 4 个主题都不只是“知道名称”，而是能解释机制、趋势和难点
- 可以回答“什么值得长期追踪，什么只是噪音”
- 可以支撑后续继续细分、更深的 Deep Research

## 备注

这一轮研究应该鼓励深挖，而不是追求快搜快写。  
重点不是把链接堆多，而是逐步形成一套可靠的研究地基，让后续每一轮都能踩在已经沉淀的 evidence 上继续往前走。
