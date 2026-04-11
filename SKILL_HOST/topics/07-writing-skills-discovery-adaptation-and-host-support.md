# Topic 07: Writing Skills Discovery, Adaptation, and Host Support

## 为什么这个 topic 要改成现在这样

前一个版本把重点放在“怎么自己写 skill”，这不完全贴合你真正想推进的方向。你更关心的其实是另一条更现实、更高杠杆的路径：先去找现成的 writing skill，装起来，读懂它背后的思路，拿来跑，边用边改，最后再慢慢长出自己的判断和能力。

这意味着这一篇不应该以“从零编写 skill”为中心，而应该围绕三个更实际的问题展开：

1. 现在网上和社区里已经有哪些写作类 skill 值得关注。
2. 不同 coding agent 在发现、安装、运行、改造这些 writing skill 上分别提供了什么支持。
3. 一个使用者如何通过借鉴现成 writing skill，而不是闭门造车，快速建立自己的方法论。

## 这一篇要解决的核心问题

1. 什么样的 skill 可以归入 writing skills。
2. 这些 writing skills 目前主要以哪些形态存在。
3. Claude、Codex、Cursor、OpenCode 各自为这类 skill 提供了哪些原生支持。
4. 如果拿到一个现成 writing skill，通常应该怎么判断、怎么装、怎么改。
5. 哪些部分容易跨宿主复用，哪些部分会被宿主能力卡住。

## 这一篇应该覆盖的内容

- 写作类 skill 的常见类别：
  - 写作风格提取与风格指纹。
  - 技术写作标准与文档约束。
  - README、ADR、文档重写与润色。
  - 内容创作与品牌化表达。
  - 面向社交媒体或营销内容的多形态输出。
- “先找现成 skill，再读懂再改”的成长路径为什么重要：
  - 自己从零琢磨太慢。
  - 优秀 skill 的真正价值常常藏在结构、触发边界、参考材料组织方式里。
  - 借鉴别人的 skill，不是抄文字，而是学习它如何把写作方法论编译成可执行流程。
- 四个宿主对 writing skill 的支持重点：
  - Claude Code：
    - 现成案例最丰富。
    - marketplace、plugin 安装和 hooks 联动能力强。
    - 特别适合研究风格提取、技术写作强制、内容流水线这种高成熟度写作 skill。
  - Codex CLI：
    - 更适合用安装器和全局 skill 来固化个人写作规则。
    - 写作类 skill 往往表现为清单式、检查点式约束。
    - 对 CLI 重度用户很自然，但生态样例可能不如 Claude 丰富。
  - Cursor：
    - 最重要的支持点是把 `.cursorrules` 和 writing skill 分开。
    - 非常适合把“不需要永远在线”的写作规范转成按需 skill。
    - 对 IDE 内文档写作、README、ADR 辅助尤其有价值。
  - OpenCode：
    - `AGENTS.md`、`instructions`、skills、plugins 可以一起协作。
    - 很适合研究“写作规范如何作为模块挂载”，以及现成写作 skill 如何跨生态借用。
- 这一篇应重点研究“如何看一个现成 writing skill”：
  - 它解决的到底是风格问题、文档标准问题，还是内容流水线问题。
  - 它是不是只是一个长 prompt。
  - 它有没有把大块样例、品牌指南、术语表外置。
  - 它是不是依赖宿主专属能力，例如 hooks、rules 或插件。
- 这一篇应研究“最小改造路径”：
  - 哪些内容可以直接复用。
  - 哪些只需要替换 reference 文件。
  - 哪些必须跟着宿主的 hooks、settings、rules 一起改。

## 这一篇明确不应该覆盖的内容

- 不把重点放在“怎么自己从零写一个 writing skill”。
- 不把 deep research 或 search orchestration 展开进来，那是另一个 topic。
- 不把四家全景比较全部塞进来，这篇只关注“写作类 skill”这个垂直场景。

## 这一篇和现有 DR 材料的连接点

- Claude 材料里已经有 style extract、technical writing、content creator 这类高价值线索。
- Codex 材料里有写作风格 skill 的清单化约束思路。
- Cursor 材料里最关键的是 `.cursorrules` 和 writing skill 的职责分离。
- OpenCode 材料里最关键的是 `AGENTS.md`、`instructions` 与 writing skill 的组合方式。

## 下一轮 Deep Research 的预期产出

下一轮这篇不应该写成“写作 skill 教程”，而应写成一份面向实践者的指南：现成 writing skill 去哪里找、怎么判断哪些值得装、四个宿主分别在哪些地方帮你省力，以及拿到之后通常如何做轻量改造，让它开始真正服务自己的写作与内容工作流。

