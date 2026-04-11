# Topic 02: Claude Code Skills Deep Dive

## 为什么 Claude Code 值得单独成篇

在目前这 4 份材料里，Claude Code 的那一份最完整，也最像“skill 生态已经长出方法论”的样子。它不只是讲目录和安装，而是已经自然延伸到了 marketplace、hooks、内容流水线、递归研究、授权闸门等更成熟的能力层。也就是说，Claude 这一篇不是一个普通的宿主介绍，而更像“skill 走到高成熟度以后会变成什么样”。

因此，这一篇的任务不是重复 skill 基础概念，而是把 Claude Code 中真正有代表性的独特能力、独特工作方式和独特边界讲清楚。

## 这一篇要解决的核心问题

1. Claude Code 里的 skill 运行模型是什么样。
2. 全局级与项目级 skill 分别适合装什么。
3. Claude 的 marketplace、hooks、settings、project docs 如何和 skill 协同。
4. Claude 为什么特别适合承载复杂研究 skill 和复杂内容流水线 skill。
5. Claude skill 体系的强项和局限分别是什么。

## 这一篇应该覆盖的内容

- Claude 的双层作用域模型：
  - 全局级适合个人方法论、安全状态、跨仓库协调状态。
  - 项目级适合团队共享规范、仓库绑定流程、项目专属生成规则。
- 为什么 Claude 对“状态隔离”特别敏感：
  - 敏感凭证不应进入项目级。
  - 个人学习状态不应污染团队级行为。
  - skill 的部署位置本身就是治理策略的一部分。
- Claude 的生态化特征：
  - 原生 marketplace 和 plugin 式分发。
  - 与 `CLAUDE.md`、settings、hooks 的协作关系。
  - skill 不是单独工作，而是嵌在整套代理行为塑形系统里。
- Claude 上最值得深挖的两类代表性 skill：
  - 深度研究与递归子代理编排。
  - 写作风格提取、技术写作强制、内容营销流水线。
- Claude skill 的独特优势：
  - 在复杂流程塑形上材料最丰富。
  - 在“技能 + hooks + 规则 + 流水线”联动方面最成熟。
  - 有大量现成的优质案例可供拆解。
- Claude skill 的局限或代价：
  - 复杂能力往往已经逼近“skill 不再是纯 skill，而是 skill + hooks + settings + 外部服务”的组合体。
  - 如果不注意 token 经济和触发边界，技能很容易变胖。
  - 递归研究类 skill 如果没有授权和轮数约束，容易失控。

## 这一篇明确不应该覆盖的内容

- 不做四家并列比较，只在必要时顺带提一句“这和其他家不同”。
- 不把写 skill 的普适方法写进来，那是后面的 authoring 专题。
- 不把 deep research skill 的通用设计空间展开成独立方法论，那是后面的研究专题。

## 这一篇和现有 DR 材料的连接点

这篇几乎完全建立在 `Claude Code Skills 探索与集成.md` 之上，因为那份材料已经提供了：

- 全局与项目作用域的完整解释。
- 渠道与评估套路。
- 多种部署范式。
- 深度研究、Valyu、递归子代理、授权闸门。
- 风格提取、技术写作、内容流水线。

## 下一轮 Deep Research 的预期产出

下一轮不应只写“Claude 有哪些 skill”，而应回答：如果一个人只学一个宿主的 skill 生态，Claude 能教会他哪些最成熟的方法论，以及哪些高阶能力已经不能只靠一个 `SKILL.md` 独立完成。

