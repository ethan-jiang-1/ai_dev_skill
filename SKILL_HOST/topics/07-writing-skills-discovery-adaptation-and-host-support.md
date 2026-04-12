# Topic 07: Writing Skills Discovery, Adaptation, and Host Support

## 历史摘要（保留，不修改）

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

## 本轮新增证据

- 2026 年 writing skills 已经形成相当清楚的几个子类：
  - technical writing / documentation standardization [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md)
  - human-style prose correction / anti-AI-tone [ref](./_reference/07-good-prose-human-style-reuse-pattern.md)
  - UX writing / microcopy / content audits [ref](./_reference/07-ux-writing-cross-host-compatibility-signal.md)
  - multilingual document-writing conventions [ref](./_reference/07-document-writing-multilingual-skill-scope.md)
  - academic / scientific writing standards [ref](./_reference/07-academic-writing-standards-skill-signal.md)
- 这些写作 skill 的安装路径已经明显平台化：
  - `npx skills add ... --skill technical-writer`
  - registry-first 发现和安装正在替代手动复制目录 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)
- 有些写作 skill 已经开始显式声明 host compatibility：
  - 某些 skill 直接写出兼容 Claude Desktop、Claude Code、Codex CLI / IDE
  - 同时明确 ChatGPT 不支持 skills [ref](./_reference/07-ux-writing-cross-host-compatibility-signal.md)
- writing skill 的内容形态，并不只是“文风模板”：
  - 有的是文档类型与流程集合 [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md)
  - 有的是 prose heuristics [ref](./_reference/07-good-prose-human-style-reuse-pattern.md)
  - 有的是专业子领域规范 [ref](./_reference/07-academic-writing-standards-skill-signal.md)
  - 有的还把 translation 和 writing 明确拆开 [ref](./_reference/07-document-writing-multilingual-skill-scope.md)

## 本轮新增机制理解

- 写作类 skill 之所以特别适合“先找现成的，再装起来再改”，是因为它们很多时候依赖的是：
  - 规则
  - 例子
  - 检查清单
  - 风格原则
  而不是高度宿主专属的 runtime orchestration
- 这意味着写作 skill 的可复用性通常高于深度研究 skill：
  - 一部分可直接跨宿主用
  - 一部分只要替换 `references/` 或 style guides 就能继续用
  - 只有当 skill 深度依赖 hooks、rules、plugin bundles 或外部 linters 时，宿主差异才会显著放大 [ref](./_reference/00-shared-agent-skills-best-practices.md) [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](./_reference/05-opencode-skills-rules-and-instructions-bridge.md)
- 写作 skill 的真正学习价值，也正好在这里：
  - 你不需要先会“写一个完美 skill”
  - 你先读懂别人把风格、结构和检查点怎么拆，就已经在学 skill authoring 的核心思路了

## 本轮新增趋势与难点

- 一个很清楚的趋势是：writing skills 正在细分，而不是停留在泛泛的“帮我写文章”：
  - technical writer
  - UX writing
  - academic writing
  - multilingual document writing
  - anti-AI-tone / better prose [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/07-good-prose-human-style-reuse-pattern.md) [ref](./_reference/07-ux-writing-cross-host-compatibility-signal.md)
- 另一个趋势是：host compatibility 正在从隐含事实变成 skill 包装语言的一部分 [ref](./_reference/07-ux-writing-cross-host-compatibility-signal.md)
- 难点主要在三处：
  - 安装容易，但质量判断不容易
  - style skill 很容易看起来“有道理”，但实际输出可能被压平 [ref](./_reference/07-good-prose-human-style-reuse-pattern.md)
  - narrow-domain writing skills 看起来更专业，但也更容易给人一种“已经自动保证正确”的错觉 [ref](./_reference/07-academic-writing-standards-skill-signal.md)

## 本轮新增维护 / 版本管理 / 模型要求

- writing skills 的维护成本通常低于研究型技能：
  - 很多只需要更新 examples、术语表、style guides、规则文本
  - 不一定需要复杂的外部依赖或 runtime orchestration
- 但不是没有模型要求：
  - multilingual writing 更依赖模型语言能力 [ref](./_reference/07-document-writing-multilingual-skill-scope.md)
  - academic / technical writing 更依赖 stronger reasoning 和长期一致性 [ref](./_reference/07-academic-writing-standards-skill-signal.md)
  - 如果 skill 还结合 lint、hooks 或文档流水线，那就会重新进入强宿主依赖区域 [ref](./_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
- 从生命周期角度看，registry + CLI 已经让“发现 / 安装 / 更新”比过去轻松很多，但“选哪个 skill 值得长期留下”依然要靠人工判断 [ref](./_reference/00-shared-skills-sh-docs-registry-safety-and-telemetry.md) [ref](./_reference/00-shared-skills-cli-management-and-updates.md)

## 当前判断（本轮综合后）

- 写作类 skill 是目前最适合普通实践者“先借力、再成长”的 skill 类别之一，这个判断是成立的。
- 它们的最大优势，是复用门槛低、安装路径清楚、很多只需轻量替换参考材料就能开始服务自己的 workflow [ref](./_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](./_reference/07-good-prose-human-style-reuse-pattern.md)
- 它们的主要风险，不在于装不上，而在于你可能高估了 skill 的质量、风格保持能力或专业可靠性 [ref](./_reference/07-academic-writing-standards-skill-signal.md)
- 如果目标是“快速理解 skill 能分装什么、怎么借别人 skill 学会自己的 skill 判断”，写作类 skill 仍然是最好的入口之一。

