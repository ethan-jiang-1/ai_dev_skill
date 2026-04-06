# GitHub 项目分析 Flow

## 目标

这个 flow 要解决的是一个固定场景：

- 你只给我一个 GitHub 地址
- 我先把分析用的目录结构自动搭起来
- 再把 source snapshot 放好
- 再把后续分析规划写清楚
- 最后在统一结构里持续产出评估结果

所以这个文件不是在描述某一个项目，  
而是在定义一个可复用的 GitHub 项目分析服务。

## 输入与输出

### 输入

- 一个 GitHub URL

例如：

```text
https://github.com/owner/repo
```

### 输出

一个标准化分析目录，内部至少包含四层：

```text
<project-analysis>/
├── github_src/
├── source_snapshot/
├── worklog/
└── eval_skills/
```

## 单项目原则

这个 flow 默认一次只处理一个 GitHub 项目。

也就是：

- 你给我一个 GitHub URL
- 我只为这一个项目搭目录
- 我只为这一个项目做分析规划
- 我只为这一个项目产出评估

不默认同时处理多个项目，  
也不默认做多项目并行对比。

## 核心关注点

这个 flow 虽然会盘点整个仓库，  
但真正最优先分析的，不是所有代码和所有文档，而是仓库里那些 **skill 类内容**。

这里的 skill 不一定真的叫 `skill`，也不一定一定在 `skills/` 目录里。  
它也可能是：

- command
- workflow
- agent
- prompt module
- reference-driven capability
- template-backed execution unit

判断标准不是名字，而是它是不是一个“可复用的能力单元”。

## skill 类内容的识别规则

分析时优先找这些东西：

- 带 front matter 的 Markdown 文件
- front matter 里有 `name`、`description`、`allowed-tools`、`tools`、`model`、`color` 之类字段
- 明显在描述角色、流程、约束、输入输出、验证方式的文件
- 虽然不叫 skill，但本质上在承担 skill 职责的命令、workflow、agent、reference

也就是说，后续分析时最重要的问题是：

- 这个仓库里的“skill-like 单元”有哪些
- 它们分别承担什么职责
- 它们通过什么 front matter 或结构暴露能力
- 它们之间如何被编排

## skill 评估原则

这个 flow 最重要的不是做一篇泛泛的仓库介绍，  
而是先把仓库里的 skill 找出来，再按 skill 的方式去评估。

评估时要尽量贴近这个参考产物的思路：

- `/Users/bowhead/ai_dev_skill/addyosmani-agent-skills/eval_skills/agent-skills-全量评估.md`

这里的意思不是机械照抄格式，  
而是要继承它的分析精神：

- 先盘点这个仓库里到底有哪些 skill
- 再总结这些 skill 的共同结构
- 再给出评估框架
- 再对最关键的 skill 或 skill 类别做细评
- 最后给总体判断

如果一个仓库里的 skill 不是显式叫 skill，  
那就要先把 command / agent / workflow / reference / template 这类 skill-like 单元识别出来，再按同样逻辑评。

full 评估必须满足这几个最低标准：

- 先说清楚正在评估哪些 skill-like 单元
- 说清楚它们分别在哪里，不要只写抽象结论
- 先给评估框架，再开始评
- 至少给出代表性 skill 或 skill 类别的逐项细评
- 最后再给总体判断，而不是一上来就空泛总结

也就是说：

- 不允许只写“这个仓库很强/很系统”
- 必须写出“我评估的对象是谁、路径在哪、结构长什么样、为什么这么评”

## 标准目录结构

当只收到一个 GitHub URL 时，我默认要先搭出下面这套结构：

```text
<repo-name>-analysis/
├── github_src/
│   └── github_url.md
├── source_snapshot/
│   └── <repo-name>/
├── worklog/
│   ├── 01-file-inventory.md
│   ├── 02-first-impression.md
│   └── 03-analysis-plan.md
└── eval_skills/
    ├── 01-总览.md
    ├── 02-结构拆解.md
    ├── 03-核心机制.md
    ├── 04-优缺点.md
    ├── 05-评分总表.md
    └── <repo-name>-全量评估.md
```

如果后面需要多模型版本，就继续追加：

```text
eval_skills/
├── <repo-name>-全量评估_codex.md
├── <repo-name>-全量评估_opus.md
└── <repo-name>-全量评估_gpt.md
```

## 四层职责

### 1. github_src

这一层只记录输入来源，不做分析。

建议固定记录：

- GitHub URL
- owner / repo
- branch
- commit
- snapshot 日期

建议内容格式：

```markdown
URL: https://github.com/owner/repo
Owner: owner
Repo: repo
Branch: main
Snapshot Date: 2026-04-06
Commit: <commit-sha>
```

### 2. source_snapshot

这一层只放原始快照。

约束：

- 不混入评估内容
- 不写主观结论
- 尽量保持和源仓库一致

这一层回答的问题只有一个：

- 原始项目本身到底长什么样

### 3. worklog

这一层记录分析过程，不是最终结论。

适合记录：

- 看过哪些目录和关键文件
- 初步判断是什么类型项目
- 哪些模块值得深入
- 后续分析顺序怎么排

这层的价值在于：

- 可以中断后续做
- 可以追踪分析路径
- 可以区分过程判断和最终结论

### 4. eval_skills

这一层只放最终分析产物。

内容包括：

- 总览
- 结构拆解
- 核心机制
- 优缺点
- 评分
- 最终评估

这一层不是泛评估目录，  
而是专门放 **skill 类型内容评估** 的目录。

其中最重要的总评文件，默认命名为：

- `<repo-name>-全量评估.md`

## 默认执行流程

当你以后只给我一个 GitHub URL，我默认按下面流程执行。

### Step 1：解析 GitHub URL

我要先识别：

- owner
- repo 名称
- 默认分析目录名

默认目录名规则：

```text
<repo-name>-analysis
```

例如：

- `https://github.com/addyosmani/agent-skills`
- 对应目录：`agent-skills-analysis/`

### Step 2：搭建分析骨架

在根目录先创建：

```text
<repo-name>-analysis/
├── github_src/
├── source_snapshot/
├── worklog/
└── eval_skills/
```

这一步先搭空结构，再开始填内容。

### Step 3：写入输入源信息

在：

- `github_src/github_url.md`

中写入：

- URL
- owner
- repo
- branch
- snapshot 日期
- commit

### Step 4：拉取 source snapshot

把 GitHub 仓库拉到：

- `source_snapshot/<repo-name>/`

如果是只读分析任务，这一层默认当作原始材料区。

拉完之后有一个额外约束：

- snapshot 里的内部 `.git` 不再需要，应该删除
- 顶层大仓库自己的 `.git` 必须保留

也就是说：

- 保留主仓库 git
- 去掉 snapshot 自带 git 元数据

这样整个分析目录就是一个大的工作区，而不是 repo 里再套 repo。

### Step 5：做第一轮仓库盘点

优先读取这些内容：

- README
- docs
- package / config / root files
- skill-like 文件最集中的目录
- 测试目录
- CI 配置

第一轮盘点的目标不是下结论，而是判断：

- 项目类型是什么
- 入口文件在哪里
- skill-like 单元主要藏在哪些目录
- 哪些 front matter 文件最值得优先拆
- 工程规范主要靠什么表达

### Step 6：写 worklog

这一阶段要先把“怎么分析”规划出来。

至少输出三份过程文档：

- `01-file-inventory.md`：目录盘点
- `02-first-impression.md`：第一印象与项目类型判断
- `03-analysis-plan.md`：后续分析顺序与问题清单

这一步就是你说的“如何分析的这个事儿规划一下”。

### Step 7：开始 eval_skills 产出

产出顺序固定如下：

- `01-总览.md`
- `02-结构拆解.md`
- `03-核心机制.md`
- `04-优缺点.md`
- `05-评分总表.md`
- `<repo-name>-全量评估.md`

这样单个项目最后都会有一套一致的分析格式，方便后续继续补分析。

但内容重点要始终记住：

- 不是泛讲项目
- 而是优先讲 skill
- 如果 skill 是变形形态，就先把它识别出来
- `<repo-name>-全量评估.md` 要尽量接近“skill 全量评估”的写法
- 必须先盘点 skill 版面，再进入评估
- 必须把 skill 的位置、数量、结构写清楚
- 必须让读者看得出“你到底在评估什么”

### Step 8：如果需要，补多模型评估



## 如何分析一个 GitHub 项目

这个 flow 不只是搭目录，也包含分析规划。

### 第一类问题：它是什么

必须先回答：

- 这是库、框架、应用、模板、工具还是工作流项目
- 它服务谁
- 它解决什么问题
- 它的输入输出是什么

### 第二类问题：它怎么组织

必须拆清楚：

- 根目录结构
- skill-like 内容所在目录
- 配置和脚本目录
- 文档和规范目录
- 测试与 CI 目录

### 第三类问题：它怎么工作

必须追：

- 主流程是什么
- skill-like 单元怎么协作
- 状态如何流动
- 扩展点在哪里
- 验证机制是什么

### 第四类问题：它值不值得学

必须评估：

- 优点
- 缺点
- 设计取舍
- 适用边界
- 学习成本
- 落地门槛

### 第五类问题：它能不能复用

必须判断：

- 哪些做法可以迁移
- 哪些依赖原项目上下文
- 哪些其实就是 skill 设计
- 哪些只是局部技巧
- 哪些能形成方法论

## 通用评估维度

为了让不同 GitHub 项目能横向比较，我建议固定用这些维度：

- 结构化程度
- 可验证性
- 复用性
- 工具依赖
- 协作价值
- 可维护性
- 学习成本
- 落地门槛

分值范围统一：

- 1 = 很低
- 3 = 中等
- 5 = 很高

## 不同项目类型的分析重点

### 如果是框架或库

重点看：

- API 设计
- 扩展点
- 抽象边界
- 示例与文档质量
- 兼容性策略

### 如果是应用项目

重点看：

- 用户流
- 模块划分
- 数据流
- 部署方式
- 测试与上线策略

### 如果是工作流或提示工程项目

重点看：

- front matter 设计
- skill-like 单元划分
- 流程设计
- 触发条件
- 约束机制
- 验证机制
- 是否能减少 agent 失控

### 如果是 CLI 或开发工具

重点看：

- 命令入口
- 参数体系
- 配置方式
- 错误处理
- 与外部环境的耦合程度

## 默认交付物

以后你只要给我一个 GitHub URL，我默认应该至少交付这些东西：

- 标准目录结构
- 来源记录文件
- source snapshot
- 分析过程规划
- skill-like 单元识别结果
- 第一版总览
- 结构拆解
- 核心机制分析
- 优缺点评估
- 评分总表
- `<repo-name>-全量评估.md`

## 默认命名规则

### 分析目录命名

```text
<repo-name>-analysis
```

### snapshot 目录命名

```text
source_snapshot/<repo-name>
```

### 评估目录命名

```text
eval_skills/
```

### 过程记录目录命名

```text
worklog/
```

## 使用方式

以后你给我任务时，只需要给：

- 一个 GitHub URL

我默认会做三件事：

- 先为这一个项目搭完整目录结构
- 再为这一个项目规划怎么分析
- 再为这一个项目开始产出评估文件

也就是说，这个 flow 已经把“搭架子”和“分析规划”一起标准化了。

## 一句话总结

这个文件定义的是一个泛化后的 GitHub 项目分析服务：

- 输入只有 GitHub URL
- 一次只处理一个项目
- 中间自动搭标准分析骨架
- 同时输出分析计划
- 最后沉淀成统一格式的评估结果

以后你不需要再单独解释目录怎么建，  
只要给我 GitHub 地址，我就按这个 flow 开始做。
