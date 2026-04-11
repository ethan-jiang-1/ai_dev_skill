# Skill 工程从借鉴到编制的实践 Playbook

> 读者画像：
>
> - 你已经和 AI coding agent 合作过一段时间
> - 你知道 skill 很重要，但常见卡点还是：
>   - 去哪找
>   - 找到了怎么看
>   - 拿到了敢不敢装
>   - 自己写时为什么总像零散 prompt
>
> 这份 Playbook 不打算写成科学研究报告。
> 它要做的，是把你从“知道一点 skill”带到“知道先看什么、先练什么、怎么借鉴、怎么起自己的 baseline”。

## 这套包怎么读

这份 `00` 不是孤立正文，而是整套 final package 的主导航。

如果你现在最关心的是不同问题，建议这样读：

| 你现在最关心什么 | 先读哪里 | 再跳哪里 |
| --- | --- | --- |
| 现成 skill 到底去哪找、先看什么 | 本页 `2-4` 节 | [附录A-代表性Skill样本与拆解索引](./附录A-代表性Skill样本与拆解索引.md) |
| 到底哪些对象该扮演什么角色 | 本页 `3` 和 `5` 节 | [附录C-角色分工与组合比较](./附录C-角色分工与组合比较.md) |
| 我想知道这些判断背后的证据从哪来 | 本页先通读 | [附录B-证据总表与引用索引](./附录B-证据总表与引用索引.md) |

也可以先把这张包结构图记住：

```text
00 主 Playbook
  -> 负责把你带起来
  -> 负责给出先看什么、先练什么、怎么起 baseline

附录A 样本索引
  -> 负责告诉你先拆哪些样本，重点看什么

附录B 证据索引
  -> 负责告诉你主文档里的判断从哪里来

附录C 角色比较
  -> 负责告诉你为什么不是单一赢家，而是职责拆分
```

## 先给结论

- 不要从空白 `SKILL.md` 开始。先读现成样本，再编自己的 skill，成长速度会快得多。[E02][E09]
- 当前最稳的答案不是找“单一赢家”，而是先把 skill 生态拆成不同职责层：学习入口、样板库、installer、治理层。[E03][E12]
- 对新进入者最有杠杆的三个入口是：[E03][E06][E07]
  - `skills.sh`
  - `github/awesome-copilot`
  - `vercel-labs/agent-skills`
- 真正能落地的 baseline 不是“多装几个 skill”，而是：[E03][E04][E08]
  - 用样板库学习
  - 用 installer 受控装载
  - 用治理和评测纪律防止错误扩散

## 1. 我们为什么会做这轮研究

这轮研究原本并不是为了做一个“生态盘点大全”。

它真正要解决的是一个很具体的问题：当 AI coding agent 已经进入真实工程之后，我们到底该怎样找 skill、读 skill、借 skill、编 skill，最后把它变成自己的工作流，而不是一直停留在“看别人很厉害，自己写出来却像 prompt 碎片”的阶段。[E01]

这也是为什么最开始会拆成三个 topic：

| Topic | 它负责解决什么 |
| --- | --- |
| `01` 方法论与规范接口 | skill 到底是什么，最小共同层是什么，哪些约定值得当工作标准 |
| `02` 工具链与生命周期 | 哪些对象在管样板、安装、治理、发布、评测，职责怎么拆 |
| `03` 生态信号与采用判断 | 哪些入口最值得学，哪些对象值得试，哪些对象只能参考不能直接信 |

如果不先把这三件事拆开，最终就很容易把下面这些东西混成一团：

- 样板库
- installer
- 目录站
- 社区学习入口
- 治理和发布工具

一混类，后面就会开始追“总冠军”；一旦追“总冠军”，你很快就会误把学习入口当工程基座，或者误把安装便利当可信度。[E02][E12]

如果你想先用一张图把这 3 个 topic 的关系看明白，可以先看这个：

```text
原始困惑
  -> 我到底去哪里找 skill
  -> 找到了怎么看
  -> 看完以后怎么变成自己的 workflow

01 方法论与规范接口
  -> skill 到底是什么
  -> 最小共同层是什么

02 工具链与生命周期
  -> 样板 / 安装 / 治理 / 评测 怎么拆

03 生态信号与采用判断
  -> 哪些入口最值得学
  -> 哪些对象值得试
  -> 哪些对象只能参考不能直接信

最后收束成 00
  -> 先读后编
  -> 最小 baseline
  -> guardrails
```

## 2. 为什么这件事最该坚持“先读后编”

先说一个最现实的判断：

今天在网上找到现成 skill，通常已经不是最难的一步。真正难的，是你拿到这些东西之后，到底会不会读、会不会拆、会不会借、会不会把别人的经验转成自己的判断。[E06][E07][E09]

这也是为什么“先读后编”不是一个姿态问题，而是一个效率问题。

### 如果你一上来就闭门自己写，最容易踩的坑

- 把 `SKILL.md` 写成一大块说明文，完全没有 progressive disclosure
- 不会写 `description / use-when`，结果 skill 不触发或者乱触发
- 把某个平台的扩展字段误当成通用规范
- 只会写内容，不会设计 supporting files、scripts、compatibility note
- 还没验证过效果，就开始堆很多 skill

### 为什么先读现成样本会更快

- 目录站和社区聚合站已经把“去哪里找样本”这件事大幅简化了。[E06][E07]
- 官方样板库已经把“优秀 skill 一般长什么样”展示得很直白。[E05]
- 官方 guide 也在主动鼓励“先看、先借鉴、再改造成自己的 workflow”，但同时强调要把 skill 当 code-like asset 来审查。[E09]

可以把这条路径记成一句很实用的话：

> 先借现成样本缩短冷启动，再靠实验把借来的东西变成自己的经验。

## 3. 先看哪几类样本，而不是乱看一圈

最省时间的做法，不是漫无目的看很多仓库，而是先按职责去看。

| 先看什么 | 它最适合回答什么问题 | 正确用法 | 最容易误读成什么 |
| --- | --- | --- | --- |
| `skills.sh` | 现成 skill 在哪里、生态入口长什么样 | 当 discovery / directory 入口 | 误当质量背书系统 |
| `github/awesome-copilot` | 社区都在分享什么、教程入口在哪里 | 当 learning hub 和扩搜入口 | 误当工程基座 |
| `vercel-labs/agent-skills` | 一个高质量样板库通常怎么组织 | 当结构样板和内容参考库 | 误当 installer / governance 层 |
| `vercel-labs/skills` | 现成 skill 怎么安装、更新、对接多宿主 | 当 install / distribution 层 | 误当 trust / evaluation 层 |
| `skill-forge` | skill 怎么走审计、发布、治理 | 当 governance / publish 层跟踪对象 | 误当冷启动时唯一答案 |

这张表背后的意思很简单：

- `skills.sh` 和 `awesome-copilot` 解决的是“找什么看”
- `agent-skills` 解决的是“优秀样板长什么样”
- `skills` 解决的是“怎么装进去”
- `skill-forge` 解决的是“怎么把质量和治理补上”[E03][E08][E12]

把它画成一张极简图，会更容易记：

```text
找入口
  -> skills.sh
  -> awesome-copilot

学结构
  -> vercel-labs/agent-skills

装进去
  -> vercel-labs/skills

补治理
  -> skill-forge
```

### 一个够用的阅读顺序

1. 先用 `skills.sh` 和 `awesome-copilot` 把视野打开。[E06][E07]
2. 再去读 `vercel-labs/agent-skills` 这种高质量样板库，看结构和 use-when。[E05]
3. 读到想试时，再看 `vercel-labs/skills` 这类 installer / manager 是怎么把东西装到 project 或 global scope 的。[E08]
4. 真要进入团队使用，再把 trust gate、evaluation、versioning、治理补上。[E03][E04]

如果你现在就想按顺序挑具体样本，直接跳到 [附录A-代表性Skill样本与拆解索引](./附录A-代表性Skill样本与拆解索引.md)。

## 4. 怎样读一个现成 skill，才不会只看热闹

很多人拿到一个 skill 仓库时，只会看 README，或者只盯着入口文件。

这远远不够。

更有效的读法是下面这个顺序：

### 第一步：先看它在解决什么任务，不要先看它写了多少话

先找：

- `description`
- `Use when`
- skill 名称
- 这组 skill 是按什么切分的

你要先判断它到底在解决：

- 一个任务
- 一个流程阶段
- 一个角色
- 还是一个完整系统

如果这一步看不清，后面很容易把样板库、runtime、workflow system 全混掉。

### 第二步：再看它的骨架，而不是先钻细节

对标准 `SKILL.md` 样本，先看：

- frontmatter
- 正文的阶段切分
- supporting files 有没有被合理下沉
- `scripts/` 和 `references/` 怎么配合

`vercel-labs/agent-skills` 就是非常好的骨架样本：它清楚地暴露了 `SKILL.md + scripts + references` 这种结构，也把 `Use when` 写成了真正的路由线索。[E05]

### 第三步：读作者怎么管边界

真正值得借的，不只是写法，更是边界感。

你应该专门找：

- 哪些东西进 `SKILL.md`
- 哪些东西被下沉到 `references/`
- 哪些步骤必须先验证再继续
- 哪些内容是 host-specific 的

这一步非常关键，因为很多新手最容易复制的是表面格式，最容易漏掉的是作者如何避免乱触发、如何做 progressive disclosure、如何限制工具和上下文膨胀。[E02][E17]

### 第四步：用“拆解例子”训练自己的眼睛

本地其实已经有几组很好的拆解样本，可以直接拿来练手：

- `agent-skills`：
  - 最适合学生命周期切分和 skill 组合
  - 看它如何把 Define / Plan / Build / Verify / Review / Ship 串起来 [E13]
- `get-shit-done`：
  - 最适合学 command / agent / workflow / reference / template 五层结构
  - 看它如何把“skill-like system”做成运行时 [E14]
- `superpowers`：
  - 最适合学 bootstrap、hooks、宿主适配和行为测试
  - 看它如何验证“agent 真的按规则用了 skill” [E15]
- `gstack`：
  - 最适合学高级系统样本
  - 看它如何把模板、浏览器 runtime、specialist review 和多宿主适配捆在一起 [E16]

### 一个很实用的阅读口诀

```text
先看入口 -> 再看骨架 -> 再看边界 -> 再看支撑层 -> 最后才模仿
```

如果你想把这套读法落到具体样本上，不要停在这里，直接去看 [附录A-代表性Skill样本与拆解索引](./附录A-代表性Skill样本与拆解索引.md)。

## 5. 自己起步时，一个够稳的 baseline 长什么样

当前最稳的结论不是“挑一个项目 all in”，而是先搭一个职责拆分清楚的最小 baseline。[E03][E12]

```text
发现入口
  -> 样板库学习
    -> 先写 portable core
      -> 单独补 surface note
        -> 受控安装
          -> trust gate
            -> A/B 评测
              -> 版本固定与回滚
                -> role-based bundles
```

### 这条 baseline 的最小组成

| 层 | 当前最像的对象 | 你应该怎么用 |
| --- | --- | --- |
| discovery / learning | `skills.sh`, `github/awesome-copilot` | 找样本、找入口、扩视野 |
| sample library | `vercel-labs/agent-skills` | 学结构、学分层、学 `Use when` |
| install / distribution | `vercel-labs/skills` | 受控装载到 project 或 global scope |
| governance / publish | `skill-forge` | 补审计、发布、质量门槛 |
| evaluation / versioning discipline | 你自己的流程 | 防止 skill 污染和回归扩散 |

### 当前最小可执行 workflow

1. 从现成样板开始，不从空白文档起步。[E04]
2. 用 `portable core` 起草自己的 skeleton，只先保留最小共同层。[E02][E17]
3. 把 surface-specific 字段和行为单独写成 compatibility note。[E02]
4. 用 installer / manager 放进受控 scope，而不是一上来全局扩散。[E04][E08]
5. 安装后先走 trust gate，先读 `SKILL.md`、`scripts/`、关键 `references/`。[E04][E09][E10]
6. 对代表性任务做 with / without A/B evaluation。[E04][E11]
7. 记录已验证版本，保留 rollback 路径。[E04]
8. 按角色或任务打 bundle，不做全量默认激活。[E04]

这条 workflow 最重要的特征，不是“工具很多”，而是职责拆得清楚。[E04][E12]

如果你想看“为什么是这几层、每层最容易被误读成什么”，直接跳到 [附录C-角色分工与组合比较](./附录C-角色分工与组合比较.md)。

## 6. 从借鉴到自己会编，不要一步跳太远

最常见的失败不是“没有资料”，而是跳得太快。

更稳的练法是四段：

### 阶段 1：先借一个好样本，不要先发明

目标：

- 看懂什么叫合理的 `description`
- 看懂正文和 supporting files 怎么分层
- 看懂作者如何写边界

产物：

- 一页拆解笔记
- 一张“值得借什么 / 不值得抄什么”清单

### 阶段 2：只改写 portable core

目标：

- 不着急追平台特性
- 先让自己的 skill 具备最小共同层

产物：

- 自己的 `SKILL.md` skeleton
- 一份很短的 `compatibility note`

### 阶段 3：进入受控试用

目标：

- 不再只看“看起来合理”
- 开始看“真实任务上有没有帮助”

产物：

- 一个 controlled trial
- 一组 with / without 对照结果
- 一条最近验证通过的版本记录

### 阶段 4：再做组合、注入和治理

目标：

- 从“会写一个 skill”走到“会维护一套 skill 工作流”

产物：

- role-based bundles
- trust gate
- version pinning
- rollback
- 定期清理策略

如果你现在还没有稳定写过一个最小 skill，不要先去学最复杂的 runtime 框架。先把前三步走稳，收益最高。

## 7. 一定要保留的 guardrails

下面这几条不是锦上添花，而是 baseline 本体。

### Guardrail 1：把 skill 当 code-like asset 看

不要因为它是 Markdown 或目录对象，就把它当“安全的上下文素材”。

装之前至少看：

- `SKILL.md`
- `scripts/`
- 会进上下文的 `references/`
- 权限和工具边界

官方和社区层都已经明确给出这个提醒：现成 skill 很好找，但安装前必须检查来源和内容。[E07][E09][E10]

### Guardrail 2：不要把“能发现”误当“值得信任”

- 目录站证明的是 discovery，不是质量保证。[E06]
- 社区聚合站证明的是学习入口，不是工程背书。[E07]
- download、star、收录都不能自动替代任务级验证。[E10][E11]

### Guardrail 3：不要把 installer 误当 evaluation system

`vercel-labs/skills` 很强，但它解决的是安装、更新、兼容和单一事实源，不是“它装进去以后一定更好用”。[E08][E12]

### Guardrail 4：不要全量激活，优先 role-based bundles

skill 一多，selection failure 和 recall overload 会很快出现。

更稳的策略是：

- 先按任务包
- 再按角色包
- 最后才考虑扩库

这一步不是优化项，而是避免 selection failure 的 baseline 纪律。[E04]

### Guardrail 5：不要把一个平台的扩展字段抄成通用标准

跨 `Codex / GitHub / Claude` 真正稳的是 `portable core`，不是所有 frontmatter 扩展都能自然通用。[E02][E17]

如果你需要把这几条 guardrail 讲给别人听，并且希望能回指到证据，不要只用主文档口头转述，直接配合 [附录B-证据总表与引用索引](./附录B-证据总表与引用索引.md)。

## 8. 如果你今天就要开始，先做这 5 件事

1. 用 `skills.sh` 或 `awesome-copilot` 找 `3` 个看起来风格不同的样本。[E06][E07]
2. 先完整拆一个 `vercel-labs/agent-skills` 类样本，不急着写自己的。[E05][E13]
3. 只写一个最小 `portable core` skeleton，不写大而全版本。[E02][E17]
4. 先在 project scope 做 controlled trial，不做全局铺开。[E04][E08]
5. 保留最小 A/B 评测和版本记录，不要只靠“感觉更顺手”。[E04][E11]

如果你照这五步走，你已经不再是在“碰运气地试 skill”，而是在建立自己的 skill engineering 手感。

## 9. 读完之后，你下一步该怎么练

给自己定一个很小但完整的练习循环：

### 第一次练习

- 读一个高质量样板
- 拆出它的结构和边界
- 写自己的最小骨架

### 第二次练习

- 把它装进一个 project-scoped controlled trial
- 做一次 with / without 对照
- 修掉最明显的误触发和膨胀问题

### 第三次练习

- 再读一个系统级样本，例如 `superpowers` 或 `get-shit-done`
- 看看自己缺的是内容、编排、注入还是治理

当你开始能稳定回答下面这几个问题时，你就不再只是“会用别人 skill”，而是在长自己的 skill engineering 能力：

- 我为什么选这个样本，不选那个
- 我借的是它的哪一层，不是整套照抄
- 我的 portable core 和 host-specific extension 分界在哪里
- 我的 trust gate、evaluation、rollback 在哪里

这时你再去追更复杂的 skill system，就会快很多。
