# superpowers 全量评估

## 1. 我先帮你“扫描”了一遍这个仓库，skill 版面里有什么

这个仓库的核心不是“大量代码”，  
而是围绕 coding agent 行为塑形的一套 skill 系统。

当前 snapshot 里，我确认到这些核心对象：

- 14 个显式 `SKILL.md`
- 3 个兼容命令入口
- 1 个显式 agent 定义
- 1 套 SessionStart hook 注入机制
- 5 类以上测试子系统
- 多宿主分发入口，覆盖 Claude Code、Cursor、Codex、OpenCode、Gemini、Copilot CLI

从结构上看，它不是 prompt 集合型仓库，  
而是一个 **agent workflow plugin**。

## 1.1 我实际在评估哪些 skill-like 单元

### 第一层：顶层显式 skill

代表路径：

- `skills/using-superpowers/SKILL.md`
- `skills/brainstorming/SKILL.md`
- `skills/writing-plans/SKILL.md`
- `skills/subagent-driven-development/SKILL.md`
- `skills/systematic-debugging/SKILL.md`
- `skills/test-driven-development/SKILL.md`
- `skills/requesting-code-review/SKILL.md`
- `skills/finishing-a-development-branch/SKILL.md`

这一层是最标准意义上的 skill 入口。

### 第二层：复合 skill 支撑模块

代表路径：

- `skills/brainstorming/visual-companion.md`
- `skills/brainstorming/spec-document-reviewer-prompt.md`
- `skills/subagent-driven-development/implementer-prompt.md`
- `skills/subagent-driven-development/spec-reviewer-prompt.md`
- `skills/subagent-driven-development/code-quality-reviewer-prompt.md`
- `skills/systematic-debugging/root-cause-tracing.md`
- `skills/test-driven-development/testing-anti-patterns.md`

这一层说明很多 skill 已经不是单文件，而是模块化技能包。

### 第三层：命令兼容层

代表路径：

- `commands/brainstorm.md`
- `commands/write-plan.md`
- `commands/execute-plan.md`

这层虽然不是主体系，但仍承担迁移桥接职责，  
因此也算 skill-like 单元。

### 第四层：注入与宿主适配层

代表路径：

- `hooks/hooks.json`
- `hooks/session-start`
- `.claude-plugin/plugin.json`
- `.cursor-plugin/plugin.json`
- `.codex/INSTALL.md`
- `.opencode/INSTALL.md`
- `docs/README.codex.md`
- `docs/README.opencode.md`
- `gemini-extension.json`

这层决定 skill 如何被发现、注入和跨宿主使用。

### 第五层：测试与验证层

代表路径：

- `docs/testing.md`
- `tests/claude-code/`
- `tests/skill-triggering/`
- `tests/explicit-skill-requests/`
- `tests/opencode/`
- `tests/subagent-driven-dev/`

这层不是 skill 本体，但它决定这些 skill 是否真的能稳定工作。

## 1.2 这些对象之间是什么关系

我对它们的关系理解是：

- 顶层 skill 负责对 agent 暴露行为单元
- `using-superpowers` 负责统一技能使用纪律
- hook 负责在 session 启动时灌入纪律
- 流程 skill 把任务推进到 spec、plan、execute、review、finish
- 测试层验证这些动作是否真的发生

也就是说，superpowers 真正想构建的不是一个“技能目录”，  
而是一个 **持续把 agent 推向固定开发流程的行为系统**。

## 2. 我的评估框架

为了避免只写印象，我分两套框架来评：

- 主体分析框架：1-5 分，用来横向拆对象
- 尾部总评框架：1-10 分六维，用来做最终收口

## 2.1 主体分析框架

主体部分按这些维度看：

- 结构化程度
- 可验证性
- 复用性
- 工具依赖
- 协作价值
- 可维护性
- 学习成本
- 落地门槛

这套框架的目的，是先把 superpowers 各层拆开看清。

## 2.2 尾部总评框架

尾部我用 1-10 六维：

- 规则密度
- 认知增量
- 失败模式覆盖
- 独立可执行性
- AI Agent 特异性
- 使用频率期望

这套框架更适合回答：

- 它到底强在哪
- 它和普通 skill 仓库差在哪
- 仓库级总分应该怎么下

## 3. 总体判断

先给一句最核心的话：

**superpowers 不是把 agent 能做的事变多，而是把 agent 做事的方式变得更有纪律。**

它的真正价值不在某个神奇 prompt，  
而在下面这套组合：

- 用 hook 把技能使用纪律注入 session
- 用 `using-superpowers` 强化“先查 skill 再行动”
- 用流程型 skill 串起 spec -> plan -> execute -> review -> finish
- 用行为测试验证这套流程真的发生

## 3.1 我认为它最强的地方

- 有明确的 bootstrap 机制，不依赖 agent 自觉
- skill 之间有很强的前后衔接关系
- 对跳步、臆断、无测试实现等失败模式覆盖很强
- 多宿主适配做得成熟
- 已经在测试真实 agent 行为，而不是只测脚本

## 3.2 我认为它最明显的代价

- 流程感强，轻任务会觉得偏重
- 结果高度依赖宿主是否稳定遵守 skill 纪律
- 核心逻辑高度依赖 wording 与规则文本的持续维护
- 跨宿主适配会带来长期维护压力

## 3.3 它在 skill 仓库里属于哪一类

如果粗分 skill 仓库，我会分三类：

- 提示词集合型
- 工作流组织型
- 行为入口治理型

superpowers 明显属于第三类，  
并且是第三类里完成度比较高的一种。

## 4. 每个 skill 或 skill 类别的细节评估

## 4.1 顶层 skill 入口系统

### 我评估的对象

- `skills/*/SKILL.md`

### 我为什么觉得它强

- 命名直白
- front matter 非常稳定
- `description` 明确描述触发条件
- 技能正文大多是 checklist、phase、gate，而不是松散叙述

### 它的真实价值

这一层让技能不是“主题文章”，  
而像一组可触发的行为 API。

### 它的问题

- 有些 skill 语气很强，会让部分用户觉得压迫
- 如果用户只想自由发挥，这层会显得过于硬性

## 4.2 `using-superpowers` 与 bootstrap 系统

### 我评估的对象

- `skills/using-superpowers/SKILL.md`
- `hooks/hooks.json`
- `hooks/session-start`

### 我为什么觉得它非常关键

因为它解决的是很多 skill 仓库最根本的问题：

- 技能存在，但 agent 不用

### 它最有价值的点

- session 一开始就注入技能使用纪律
- 明确“1% 相关也必须查 skill”
- 规定 process skill 先于 implementation skill
- 给多宿主做工具映射

### 它的问题

- 效果依赖宿主 hook 与注入机制是否稳定
- bootstrap 文本如果退化，会影响整个系统

## 4.3 流程型核心 skill 链

### 我评估的对象

- `brainstorming`
- `using-git-worktrees`
- `writing-plans`
- `subagent-driven-development`
- `executing-plans`
- `requesting-code-review`
- `finishing-a-development-branch`

### 我为什么觉得这是仓库骨架

它不是“几个不错的技巧”，  
而是一条完整开发链路。

### 它最厉害的地方

- 设计先行
- 计划细化
- 执行时强调 fresh subagent
- review 分 spec compliance 与 code quality
- 收尾阶段还有分支处理与交付决策

### 它的问题

- 小任务容易觉得过重
- 用户如果不接受阶段化推进，很难享受它全部价值

## 4.4 调试与 TDD 纪律层

### 我评估的对象

- `systematic-debugging`
- `test-driven-development`
- `verification-before-completion`

### 我为什么觉得这层很强

它不是说“最好测试一下”“最好找根因”，  
而是把这些动作变成刚性流程。

### 它最突出的地方

- debugging 分四 phase
- 明确禁止无 root cause 先修
- TDD 强调 red-green-refactor
- verification skill 负责防止“以为修好了”

### 它的问题

- 纪律越强，越容易和某些用户的工作习惯冲突
- 需要宿主与执行者真的愿意遵守流程

## 4.5 多宿主适配与测试层

### 我评估的对象

- `.claude-plugin/`
- `.cursor-plugin/`
- `.codex/`
- `.opencode/`
- `gemini-extension.json`
- `docs/testing.md`
- `tests/*`

### 我为什么觉得这层容易被低估

因为外部读者通常只看 skill 内容，  
但长期来看，真正决定 superpowers 能不能活下去的，是：

- 能不能被多个宿主稳定加载
- 能不能验证 skill 真的被触发
- 能不能验证行为链而不是口头承诺

### 它的优点

- 多宿主扩散能力强
- 行为测试意识强
- 已经能验证 trigger、review 顺序、subagent 调度等行为

### 它的问题

- 维护复杂度会随着平台数量上升
- 兼容矩阵会越来越重

## 5. 我认为最强的 skill

如果只能挑一个最能代表 superpowers 的 skill，我会选：

## `using-superpowers`

### 原因不是它内容最多

而是它决定了其他 skill 有没有机会稳定发挥。

### 为什么它比别的 skill 更关键

没有它的话：

- brainstorming 可能被跳过
- debugging 可能不会在 bug 前触发
- TDD 可能只停留在“推荐”
- 整条工作流会退化成用户手动挑技能

### 它代表了 superpowers 的什么

它代表 superpowers 最核心的设计理念：

- 技能系统必须先解决“怎么被使用”，再解决“能做什么”

## 6. 我认为最容易被低估或流于形式的 skill

如果说哪个方向最容易被外部读者低估，我会选：

## 测试与验证系统

很多人会把它看成仓库外围配套，  
但我认为它非常核心。

### 为什么容易被低估

- 没有 skill 正文那么显眼
- 不如 brainstorming 或 subagent 流程那么好讲故事
- 很多人默认“prompt 写得好就够了”

### 为什么它其实很重要

因为没有这层，  
superpowers 很容易退化成：

- 宣称自己能塑造 agent 行为
- 但没有证据证明这些行为真的发生

也就是说，这层不是装饰，而是可信度来源。

## 7. 如果让我给这套仓库下一个总评价

我会这样说：

**superpowers 是一套高纪律、强路由、可测试的 agent 软件开发工作流插件。**

它最有价值的地方，不是拓宽 agent 的能力面，  
而是显著压缩 agent 在真实工程任务里的失控空间。

## 8. 尾部总评

下面开始用 1-10 六维结构收口。

## 8.1 六维评分

| 维度 | 分数 | 简评 |
|---|---:|---|
| 规则密度 | 10 | skill 正文里充满 phase、gate、red flags、顺序要求、禁止事项和 transition 规则，规则密度极高。 |
| 认知增量 | 8 | “强制先查 skill + 强流程软件开发链 + 行为级测试”这个组合很有新意，但底层还是以文本行为塑形为主，不是全新 runtime 范式。 |
| 失败模式覆盖 | 10 | 对跳步、拍脑袋修 bug、无测试实现、偏题执行、假装完成等失败模式覆盖非常全面。 |
| 独立可执行性 | 8 | 仓库本身结构清楚、安装路径明确、测试方法明确，但完整效果仍依赖宿主插件机制和多平台支持。 |
| AI Agent 特异性 | 10 | 这套系统几乎完全围绕 agent 的弱点和行为偏差设计，不是一般人类流程文档的简单翻版。 |
| 使用频率期望 | 9 | brainstorming、writing-plans、systematic-debugging、TDD、review 这类 skill 都具备高频复用潜力。 |

## 8.2 为什么是这个梯队

### 满分维度

- 规则密度
- 失败模式覆盖
- AI Agent 特异性

这三项我给到 10，  
因为 superpowers 的最大特点正是：

- 规则非常显性
- 失败模式覆盖极广
- 几乎完全围绕 agent 的典型问题来设计

### 很高但非满分的维度

- 认知增量
- 独立可执行性
- 使用频率期望

之所以没有全部打满，是因为：

- 它虽有强组合创新，但仍主要依赖文本规则驱动
- 完整效果依赖宿主生态配合
- 某些强纪律 skill 不一定被所有用户高频采用

## 8.3 仓库级总分、换算分与评级

### 六维平均分

六维总分：

- `10 + 8 + 10 + 8 + 10 + 9 = 55`

平均分：

- `55 / 6 = 9.17`

### 百分制换算

- `9.17 / 10 × 100 = 91.7`

我给它的仓库级换算分是：

- **91.7 / 100**

### 最终评级

- **评级：S**

## 8.4 分层结论

### 如果只把它当 skill 仓库看

它是第一梯队。

### 如果把它当 agent workflow system 看

它的优势更清楚：  
它不是执行基础设施最重的那类，  
而是行为治理和流程纪律做得极强的那类。

### 如果从“最值得学什么”角度看

最值得学的三件事是：

- `using-superpowers` 这种 bootstrap 设计
- spec -> plan -> execute -> review 的强路由链
- 把 agent 行为当成测试对象来验证

### 如果从“最难复制什么”角度看

最难稳定复制的三件事是：

- 跨宿主一致的技能注入体验
- 强纪律 wording 的长期演进与回归验证
- 行为级测试体系的持续维护

## 8.5 最终一句话总评

**superpowers 是一套完成度很高的 agent 开发流程技能系统：它最强的不是某个单点能力，而是把技能入口治理、流程路由、失败模式约束和行为验证做成了一个闭环。**
