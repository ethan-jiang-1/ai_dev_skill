# Topic 08: Deep Research Skills Discovery, Adaptation, and Host Support

## 为什么这个 topic 要改成现在这样

前一个版本更像“怎么自己设计一个 Deep Research skill”。这和你当前真正想做的事也有一点偏。你现在更需要的是：先把外面已经存在的 deep research skill 生态摸清楚，看看哪些是真的有料，哪些只是换皮搜索；再看不同 coding agent 是否提供了特别好的承载和支持，让人可以更快借用、实验、改造，而不是一上来就从零自建整套研究系统。

所以这一篇应该从“发现和借力”出发，而不是从“从零搭建”出发。

## 这一篇要解决的核心问题

1. 现在所谓 deep research skill，常见到底分成哪几类。
2. 哪些只是搜索封装，哪些已经进入真正的研究编排。
3. Claude、Codex、Cursor、OpenCode 各自对这类 skill 提供了什么特别支持。
4. 现成的 deep research skill 去哪里找，怎么判断真假深度。
5. 拿到以后哪些部分可以直接用，哪些需要按宿主能力去适配。

## 这一篇应该覆盖的内容

- 研究型 skill 的主要类型：
  - 确定性数据源检索型。
  - 网页与知识库聚合型。
  - 代码库探索与资料交叉型。
  - 子代理并发研究型。
  - 带验证、去重、证伪、引用控制的深度研究编排型。
- 这一篇要特别厘清的一个判断：
  - “能搜索”不等于“能做 deep research”。
  - 真正更有价值的 skill，通常不仅负责搜，还负责拆题、并发、验证、汇总和约束风险。
- 四个宿主对 deep research skill 的支持重点：
  - Claude Code：
    - 现成案例最丰富。
    - 有递归研究、Valyu、授权闸门等成熟线索。
    - 特别适合研究“高复杂度研究 skill 是如何长出来的”。
  - Codex CLI：
    - 内置安装器和原生 subagents 很适合承接现成研究型 skill。
    - 对工程型用户来说，研究工作流更容易和 CLI 任务融合。
  - Cursor：
    - 原生异步子代理让“研究线程并行化”更自然。
    - 适合研究 IDE 内部如何把代码库探索和外部资料检索结合起来。
  - OpenCode：
    - 原生 subagents、混合检索、兼容外部技能路径，使它非常适合做研究 skill 的桥接与实验。
    - 尤其适合研究“现成 deep research skill 能否部分迁移过来”。
- 这一篇要重点研究“怎么辨别一个现成 deep research skill 值不值得用”：
  - 数据源是否可靠。
  - 是否只是普通网页搜索包装。
  - 是否有任务分解和多路径探索。
  - 是否有交叉验证、去重和引用约束。
  - 是否有停止条件、轮数控制、权限边界。
- 这一篇还应研究“适配和改造”的现实路径：
  - 哪些 skill 只换检索源就能继续用。
  - 哪些 skill 明显依赖宿主专属 subagent 机制。
  - 哪些 skill 的思路能迁，但执行壳子必须重写。

## 这一篇明确不应该覆盖的内容

- 不把重点放在“如何自己从零发明 deep research architecture”。
- 不把一般性的 skill 编写方法论放进来。
- 不把四家所有能力全景介绍一遍，这篇只聚焦研究类 skill 的发现、判断、承载与改造。

## 这一篇和现有 DR 材料的连接点

- Claude 材料提供了最丰富的研究型 skill 线索，包括 Valyu、递归子代理、授权控制等。
- Codex 材料提供了 Smart Search 和原生 subagent workflow 的工程化视角。
- Cursor 材料提供了异步子代理与 IDE 场景下并行研究的视角。
- OpenCode 材料提供了原生 subagents、混合检索和跨路径兼容的桥接视角。

## 下一轮 Deep Research 的预期产出

下一轮这篇应该写成一份“研究型 skill 发现与判断指南”。它要帮助读者回答：外面哪些 deep research skill 值得跟，四个宿主分别在哪些地方最能承接这类 skill，哪些现成 skill 可以直接拿来试，哪些只能借鉴思路再做适配，而不是把重点放在从零发明一整套研究系统。

