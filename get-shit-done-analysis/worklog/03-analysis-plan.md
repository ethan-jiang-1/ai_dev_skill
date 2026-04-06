# get-shit-done 分析计划

## 工作原则

- 不再重复拉取外部仓库
- 直接基于已经落到 `source_snapshot/get-shit-done/` 的 snapshot 继续分析
- 分析重点只放在 skill-like 内容
- 其他安装、CI、包装层只做辅助说明

## 为什么这次的重点不是“整个仓库”

你已经明确了：  
我们最关心的不是泛泛地做仓库介绍，而是找出这里面 **类似 skill 的东西**。

所以这个项目的后续分析优先级是：

1. 先找 front matter 文件
2. 再找承担 skill 职责的 workflow
3. 再判断这些单元如何被编排
4. 最后才补充其他外围结构

## 分析拆解顺序

### 第一层：识别 skill-like 单元

主要看：

- `commands/gsd/*.md`
- `agents/*.md`
- `get-shit-done/workflows/*.md`
- `get-shit-done/references/*.md`
- `get-shit-done/templates/*.md`

识别方法：

- 有没有 front matter
- 有没有明确职责
- 有没有 allowed tools / tools
- 有没有 objective / role / process / verification 结构
- 能不能被单独复用或被编排调用

### 第二层：拆 skill-like 单元分工

我会把它们分成四类：

- 入口 skill：command
- 专职 skill：agent
- 编排 skill：workflow
- 支撑 skill：reference / template

### 第三层：分析核心流水线

重点追这条线：

- `/gsd-new-project`
- `/gsd-discuss-phase`
- `/gsd-plan-phase`
- `/gsd-execute-phase`
- `/gsd-verify-work`
- `/gsd-ship`

我想确认的是：

- 每一步调用了哪些 skill-like 单元
- front matter 在入口层起什么作用
- workflow 如何把 agent 串起来
- `.planning/` 工件如何形成项目记忆

### 第四层：做评估

最终评估不以“功能多不多”为核心，  
而以“skill 系统做得好不好”为核心。

重点会评：

- 结构化程度
- skill 暴露方式是否清晰
- front matter 设计是否稳定
- 编排逻辑是否成熟
- 验证强度是否足够
- 复用边界是否明确

## 这次 eval_skills 的产出重点

后续 `eval_skills/` 会重点回答这些问题：

- 这个仓库里的 skill-like 内容到底有哪些
- 哪些是真正的 skill
- 哪些是 skill 的变形
- 它和 addyosmani 的 `agent-skills` 有什么本质差别
- 它到底是在卖一组 skill，还是在卖一套 skill runtime

## 暂时降级处理的部分

这些内容会提，但不会占主要篇幅：

- npm 安装细节
- 社区信息
- 语言本地化内容
- 次级治理文件
- 非核心宣传文案

## 当前判断

这个项目最值得评估的不是“命令很多”，  
而是它把 skill 做成了一套可安装、可调度、可记忆、可验证的操作系统。

所以接下来的 `eval_skills/` 文档，会明确以 **skill-like 单元分析** 为主线。
