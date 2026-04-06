# gstack 全量评估

## 1. 我先帮你“扫描”了一遍这个仓库，skill 版面里有什么

这个仓库最重要的不是 README 的叙事力度，  
而是它背后那套非常完整的 **skill / skill-like 系统**。

当前 snapshot 里，我先确认到这些核心对象：

- 36 个顶层 skill 入口
- 4 个 OpenClaw 原生 skill
- 40 个 `SKILL.md`
- 37 个 `SKILL.md.tmpl`
- 7 个 `review/specialists/*.md`
- 1 个 QA reference
- 1 个 QA report template

从结构上看，它不是平铺式 prompt 仓库，  
而是一套由多个层级组成的系统。

## 1.1 我实际在评估哪些 skill-like 单元

### 第一层：顶层显式 skill

代表路径：

- `office-hours/SKILL.md`
- `plan-ceo-review/SKILL.md`
- `plan-eng-review/SKILL.md`
- `review/SKILL.md`
- `qa/SKILL.md`
- `ship/SKILL.md`
- `browse/SKILL.md`
- `autoplan/SKILL.md`
- `cso/SKILL.md`
- `retro/SKILL.md`

这一层是最传统意义上的 skill。

### 第二层：模板化 skill 母版

代表路径：

- `office-hours/SKILL.md.tmpl`
- `review/SKILL.md.tmpl`
- `qa/SKILL.md.tmpl`
- `browse/SKILL.md.tmpl`

这一层不是“草稿”，而是生成正式 skill 的源头。

### 第三层：复合 skill 的子模块

代表路径：

- `review/specialists/security.md`
- `review/specialists/performance.md`
- `review/specialists/testing.md`
- `qa/references/issue-taxonomy.md`
- `qa/templates/qa-report-template.md`

这一层说明部分 skill 已经不是单文件，而是模块化技能包。

### 第四层：runtime 支撑单元

代表路径：

- `browse/src/server.ts`
- `browse/src/browser-manager.ts`
- `browse/src/snapshot.ts`
- `design/src/cli.ts`
- `design/src/commands.ts`
- `bin/gstack-config`
- `bin/gstack-update-check`

这层虽然不是 Markdown skill，  
但它们直接决定 skill 是否真有执行力，所以必须算进评估范围。

### 第五层：OpenClaw 原生 skill

代表路径：

- `openclaw/skills/gstack-openclaw-office-hours/SKILL.md`
- `openclaw/skills/gstack-openclaw-ceo-review/SKILL.md`
- `openclaw/skills/gstack-openclaw-investigate/SKILL.md`
- `openclaw/skills/gstack-openclaw-retro/SKILL.md`

这层说明 gstack 已经有跨宿主扩展意识。

## 1.2 这些对象之间是什么关系

我对它们的关系理解是：

- 顶层 skill 负责对外暴露角色与入口
- 模板层负责统一结构与公共流程块
- 子模块层负责把复杂 skill 拆深
- runtime 层负责给 skill 提供真实执行力
- OpenClaw 层负责把方法论迁移到别的 agent 宿主

也就是说，gstack 真正的对象不是“若干 prompt”，  
而是一个能持续运转的 skill runtime。

## 2. 我的评估框架

为了避免只写“这仓库很强”，我把评估分成两套：

- 主体分析框架：1-5 分，用来拆结构和横向比较
- 尾部总评框架：1-10 分六维，用来做最终收口

## 2.1 主体分析框架

我在前面的拆解和评分总表里，主要按这些维度看：

- 结构化程度
- 可验证性
- 复用性
- 工具依赖
- 协作价值
- 可维护性
- 学习成本
- 落地门槛

这套框架的作用是：  
先把 gstack 的不同层次拆开，而不是一锅端。

## 2.2 尾部总评框架

最后收口我会用 1-10 分六维：

- 规则密度
- 认知增量
- 失败模式覆盖
- 独立可执行性
- AI Agent 特异性
- 使用频率期望

这一套更适合判断：

- 它为什么突出
- 它的突出是不是可区分的
- 它到底属于什么梯队

## 3. 总体判断

先给一句最核心的话：

**gstack 不是 skill 仓库的“大号版本”，而是把 AI 工程流程、浏览器执行层、模板治理和长期运维拼成一个整体系统的仓库。**

它的价值不在任何单点，而在系统组合。

## 3.1 我认为它最强的地方

- skill 入口清晰，信号很强
- 浏览器 daemon 让 QA / browse / design 类 skill 真正可执行
- 模板生成机制把 prompt 文档治理推进了一步
- 多角色 review pipeline 有完整生命周期意识
- learnings / timeline / upgrade / team-init 说明它在服务长期使用

## 3.2 我认为它最明显的代价

- 体系很厚
- 初学者理解负担不小
- 很多能力依赖 runtime 和环境
- 想完整迁移它，并不便宜

## 3.3 它在 skill 仓库里属于哪一类

如果粗分，我会把 skill 仓库分成三类：

- 提示词集合型
- 工作流组织型
- runtime 系统型

gstack 明显属于第三类，  
而且是第三类里完成度比较高的一种。

## 4. 每个 skill 或 skill 类别的细节评估

## 4.1 顶层 skill 入口系统

### 我评估的对象

- 顶层 `<skill>/SKILL.md`
- 根级 `SKILL.md`

### 我为什么觉得它强

- 入口名字非常产品化
- front matter 统一
- description 写得很像“什么时候该用这个角色”
- 工具权限显式

### 它的真实价值

这一层把“角色分工”做得很有辨识度。  
比起很多模糊的 prompt 文件，它的入口设计更像能力 API。

### 它的问题

- 文件很长
- preamble 很重
- 初次阅读时，独特内容会被共用内容稀释

## 4.2 模板化技能治理系统

### 我评估的对象

- `SKILL.md.tmpl`
- `scripts/gen-skill-docs.ts`
- `skill-docs.yml`

### 我为什么觉得它非常强

它击中了 prompt 仓库最核心的长期问题：

- 文档漂移
- 重复块维护分叉
- 命令和说明不一致

### 它最有价值的点

- 人写判断，代码管一致性
- 生成产物直接可消费
- CI 能做 freshness 检查

### 它的问题

- 模板系统本身会提高仓库理解门槛
- 不是所有团队都愿意维护这类生成链

## 4.3 浏览器与设计 runtime

### 我评估的对象

- `browse/src/*`
- `design/src/*`
- `extension/*`
- 部分 `bin/*`

### 我为什么觉得它是 gstack 的差异化底座

很多仓库可以写 review prompt，  
但很少能把 agent 的浏览器执行层做成真正长期可用的基础设施。

### 它最突出的地方

- persistent daemon
- localhost token auth
- ref system
- cookie import 安全处理
- 运行时版本重启逻辑

### 它的问题

- 迁移难
- 环境依赖重
- 维护复杂度显著高于纯文档仓库

## 4.4 审查与交付闭环

### 我评估的对象

- `/plan-ceo-review`
- `/plan-eng-review`
- `/plan-design-review`
- `/plan-devex-review`
- `/review`
- `/qa`
- `/ship`
- `/land-and-deploy`
- `/canary`
- `/document-release`
- `/retro`

### 我为什么觉得这是仓库的流程骨架

它不是说“你需要 review”，  
而是把 review 拆成：

- 战略 review
- 架构 review
- 设计 review
- DX review
- 代码 review
- QA
- 发布
- 复盘

### 它最厉害的地方

- 生命周期完整
- 多角色边界清晰
- 很多 skill 会读前一阶段的产物
- 有明显的“前一阶段为后一阶段服务”的意识

### 它的问题

- 小项目会觉得很重
- 如果团队不接受纪律，这套链路很容易被嫌麻烦

## 4.5 多宿主、学习与运维系统

### 我评估的对象

- `openclaw/skills/*`
- `setup`
- `bin/gstack-team-init`
- `bin/gstack-config`
- `bin/gstack-learnings-*`
- `bin/gstack-timeline-*`
- `gstack-upgrade/`

### 我为什么觉得这层容易被低估

因为很多人看 gstack，只会看 `/browse`、`/qa`、`/review`。  
但长期来看，真正决定“是不是系统”的，是：

- 会不会升级
- 会不会记忆
- 会不会跨工具分发
- 会不会支持团队模式

### 它的优点

- 产品意识强
- 长期使用意识强
- 很适合多项目、多 session 场景

### 它的问题

- 系统治理负担会增加
- 配置、安装、宿主差异会带来额外复杂性

## 5. 我认为最强的 skill

如果只能挑一个我认为最强、最能代表 gstack 方法论的，我会选：

## `/browse`

### 原因不是它最花哨

而是它解决的是最底层、最硬的问题：

- agent 没有眼睛
- 浏览器调用太慢
- 状态不连续
- 真实 QA 很难做

### 为什么它比单纯的 review 或 QA skill 更关键

因为没有 `/browse` 这套底座，  
很多后续 skill 只能停留在“建议你检查一下”。

而有了它之后：

- `/qa` 可以真的点页面
- `/design-review` 可以真的看效果
- `/benchmark`、`/canary` 才更像真实工具

### 它代表了 gstack 的什么

它代表了 gstack 最核心的精神：

- 不只写流程
- 还要把关键执行层做出来

## 6. 我认为最容易被低估或流于形式的 skill

如果说哪个方向最容易被外部读者低估，我会选：

## 模板化技能治理系统

很多人会天然把 `SKILL.md.tmpl` 当成辅助文件，  
但我认为它其实是 gstack 非常重要的核心机制。

### 为什么容易被低估

- 不如 `/browse` 那么直观
- 不如 `/qa` 那么好展示
- 不如 README 里的故事那么有冲击力

### 为什么它实际很重要

因为没有这一层，  
gstack 这么多 skill 很容易在半年后变得越来越不一致。

也就是说，这一层不是 flashy capability，  
而是“系统能否长期稳定”的关键。

## 7. 如果让我给这套仓库下一个总评价

我会这样说：

**这不是一个把 AI 命令做多的仓库，而是一个把 AI 工程纪律做厚的仓库。**

它把下面这些东西拼到了一起：

- 明确入口
- 多角色流程
- 浏览器执行力
- 模板化治理
- 学习与运维系统
- 测试与评估

这使得它已经接近“AI 工程操作系统”的形态。

## 8. 尾部总评

下面开始用更苛刻的 1-10 六维结构收口。

## 8.1 六维评分

| 维度 | 分数 | 简评 |
|---|---:|---|
| 规则密度 | 10 | 仓库到处都是显式规则：front matter、preamble、模板占位符、review section、安全约束、session 与 routing 行为，规则密度极高。 |
| 认知增量 | 9 | 它不只是复述“先计划再写代码”，而是把 skill runtime、browser daemon、模板治理、多角色 review 组合出明显的新结构。 |
| 失败模式覆盖 | 9 | 对 agent 失焦、跳步、错误恢复、浏览器失效、文档漂移、版本漂移、长期遗忘等失败模式都有针对性设计。 |
| 独立可执行性 | 8 | 大部分 skill 和 runtime 都可直接运行、测试和集成，但完整体验仍依赖宿主、环境、浏览器和安装链。 |
| AI Agent 特异性 | 10 | 这套系统几乎完全围绕 AI agent 的弱点和强项设计，对普通人类工程流程并不只是简单复刻。 |
| 使用频率期望 | 9 | `/browse`、`/review`、`/qa`、`/ship`、`/office-hours`、`/autoplan` 都有高频使用潜力，不是看一次就吃灰的技能。 |

## 8.2 为什么是这个梯队

### 顶级维度

- 规则密度
- AI Agent 特异性

这两项我都给到 10，  
因为 gstack 最突出的地方正是：

- 它把规则显性化到了系统级
- 它几乎完全是为 agent 工作方式定制的

### 非满分但很高的维度

- 认知增量
- 失败模式覆盖
- 使用频率期望

这三项都很强。  
我没有都打满分，是因为：

- 有些机制仍然依赖宿主生态
- 一部分能力的长期效果还依赖团队是否真的持续使用

### 被压住的一项

- 独立可执行性

这不是说它不独立，  
而是说它和“只靠 Markdown 就能完整迁移”的仓库相比，  
明显更依赖自身 runtime 和宿主环境。

## 8.3 仓库级总分、换算分与评级

### 六维平均分

六维总分：

- `10 + 9 + 9 + 8 + 10 + 9 = 55`

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

它已经是第一梯队。

### 如果把它当 AI 工程系统看

它的真正价值更清楚：  
它不是某个单点能力最炫，  
而是多个工程层面一起咬合得很好。

### 如果从“可学什么”角度看

最值得学的三件事是：

- 模板化 skill 治理
- browser runtime 底座
- 多角色 review -> QA -> ship 闭环

### 如果从“最难抄什么”角度看

最难直接抄走的三件事是：

- persistent browser daemon
- 长期 learnings / timeline / upgrade 系统
- 多宿主下的一致体验治理

## 8.5 最终一句话总评

**gstack 是一套完成度很高的 AI 工程技能系统：它最强的不是某一个 prompt，而是把 prompt、runtime、验证、记忆、分发和流程纪律做成了一个能长期运转的整体。**
