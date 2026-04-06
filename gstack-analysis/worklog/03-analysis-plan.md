# gstack 后续分析计划

## 当前已确认的事实

- 仓库默认分支是 `main`
- snapshot commit 是 `03973c2fabfb4988a2a4c2fefc44a7e280804884`
- 当前共有 40 个 `SKILL.md`
- 其中 36 个是顶层 skill 入口
- 另有 37 个 `SKILL.md.tmpl`
- `browse/`、`design/`、`bin/`、`extension/` 说明它不是纯文档仓库
- `.github/workflows/`、`package.json`、测试目录说明它有持续验证体系

## 后续分析目标

我接下来不是泛看整个仓库，而是围绕 skill-like 单元回答五个问题：

- 它到底有哪些 skill-like 单元
- 这些单元怎么分层
- 它们靠什么机制避免漂移与失控
- 哪些是能迁移的方法论，哪些高度依赖 gstack 自身 runtime
- 这套系统究竟强在“prompt 写法”，还是强在“工程化闭环”

## 分析主线

### Phase A：先识别对象

重点识别：

- 显式 skill：`<skill>/SKILL.md`
- 模板 skill：`<skill>/SKILL.md.tmpl`
- 角色或专题 skill：`review/specialists/*.md`
- reference / template skill：`qa/references/*`、`qa/templates/*`
- OpenClaw 适配 skill：`openclaw/skills/*/SKILL.md`

### Phase B：再拆结构

重点判断四层结构：

- 入口层：skill front matter 与触发方式
- 编排层：preamble、模板占位符、跨 skill 工作流
- runtime 层：browse、design、bin、extension
- 验证层：tests、evals、CI、skill docs freshness

### Phase C：最后评估

最终评估重点不放在“README 写得热不热血”，  
而放在：

- 规则密度
- 独立可执行性
- 失败模式覆盖
- AI agent 特异性
- 复用性与迁移性
- 使用频率期望

## 关键阅读顺序

### 第一组：定义定位

- `README.md`
- `docs/skills.md`
- `ETHOS.md`

目的：

- 看它如何描述 sprint 闭环
- 看它如何表达 builder philosophy
- 看它如何给每个 skill 定位

### 第二组：拆机制

- `ARCHITECTURE.md`
- `package.json`
- `browse/src/*`
- `design/src/*`

目的：

- 看浏览器 daemon 模型
- 看 skill 文档生成链
- 看 design tooling 是否只是口号

### 第三组：看代表性 skill

代表文件先抓这几类：

- `office-hours/SKILL.md`
- `plan-ceo-review/SKILL.md`
- `plan-eng-review/SKILL.md`
- `review/SKILL.md`
- `qa/SKILL.md`
- `ship/SKILL.md`
- `browse/SKILL.md`
- `cso/SKILL.md`
- `autoplan/SKILL.md`

目的：

- 看 front matter 是否一致
- 看 preamble 如何注入共性行为
- 看具体 skill 的执行纪律和验证要求

### 第四组：看周边支持层

- `review/specialists/*.md`
- `qa/references/issue-taxonomy.md`
- `qa/templates/qa-report-template.md`
- `openclaw/skills/*/SKILL.md`
- `.github/workflows/*`

目的：

- 看它是不是把 skill 继续细分成专题模块
- 看它如何把 Claude Code 之外的宿主纳入体系
- 看 CI 是否真的在盯技能质量

## 当前要避免的分析偏差

### 偏差 1：只按命令数量评价

不能只说“skill 很多”。  
必须回答：

- 哪些是入口层
- 哪些是模板层
- 哪些是 runtime 支撑
- 哪些是验证与运维层

### 偏差 2：只按代码量评价

`browse/` 和 `design/` 很重要，  
但如果忽略 `SKILL.md.tmpl`、preamble、review specialist，  
就会看漏它真正的 skill 设计。

### 偏差 3：过早下总体结论

必须先把：

- 结构拆清
- 机制讲清
- 代表性 skill 讲清

再给最终总评。

## 输出计划

后续最终产物按下面顺序写入 `eval_skills/`：

- `01-总览.md`
- `02-结构拆解.md`
- `03-核心机制.md`
- `04-优缺点.md`
- `05-评分总表.md`
- `gstack-全量评估.md`

## 暂定评估切口

为了保证评估有层次，我准备把 gstack 切成五类对象来评：

- 顶层 skill 入口系统
- 模板化文档与共用 preamble 系统
- browse / design 程序 runtime
- review / QA / ship 闭环
- 多宿主、升级、学习与运维系统

这样能避免把整个仓库压成一个笼统结论。
