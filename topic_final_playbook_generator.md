1# 面向 AI Coding 工程师的 Topic Final Playbook Generator

> 用途：把一组已经完成多轮 Deep Research 的 topic 材料，稳定收束成一套面向 AI coding engineer 的 `progressive playbook package`。
>
> 这不是 deep research 模板。
> 这是一份 `final synthesis / best-practice playbook generator` 模板，内部采用 progressive stages。
>
> 默认世界观：
>
> - 默认不是写 `主报告 + 大附录`
> - 默认是写 `主 Playbook / 主指南 + 少量功能型 supporting docs`
> - 默认不是科学研究报告，也不是冷冰冰的 research archive
> - 默认要把读者从“知道一些”带到“知道下一步怎么做”
> - 默认要让读者愿意一路往下读，结构上 `深入浅出、简洁推进、渐入佳境`
> - 默认采用 `先读后编`：先学会读现成样本及其背后的设计思路，再进入编制、组合与 leverage

## 1. 这份模板解决什么问题

当一轮 topic research 基本完成后，仓库里往往已经同时存在：

- `topic registry` 这类总入口
- 多份按研究线拆开的 topic 文档
- `_reference/` 里的原始证据
- `_artifacts/` 里的 evidence summary、cross-topic synthesis、comparison table、baseline draft、recommendation draft、readiness check
- 若干状态文件、阶段性 closeout 或 handoff 草稿

这时真正的问题通常已经不是“还要不要继续搜”，而是：

- 哪些材料已经足够稳定，可以进入 final
- 哪些材料只是 research 过程，不应直接出现在 final
- 怎样把多 topic 研究结果收束成一套对 AI coding engineer 真正有用的交付物
- 怎样把“事实、判断、建议、边界、最佳实践、练习路径”整理成可读、可执行、可回指的内容
- 怎样让读者一打开主文档，就明白为什么原始会有这些 Deep Research 诉求、为什么会拆成这些 topic、自己接下来该怎么上手
- 怎样避免把最终交付写成“虽然完整，但没有人真想从头读到尾”的科学报告式材料

尤其当 topic 指向 skill、prompt、workflow、tooling practice 这类对象时，真正难点通常不是“网上能不能找到现成样本”，而是：

- 怎样找到值得读的样本
- 怎样从样本里读出作者背后的设计思路
- 怎样把“借鉴样本”转成“自己会编、会改、会组合、会 leverage”
- 怎样把这条成长路径写成一个渐进、自说明、可反复复用的 Playbook

这份模板专门解决这件事。

## 2. 这份模板不解决什么问题

这份模板不负责：

- 从零开始做 research
- 为了凑完整度临时追加新的研究线
- 无限制扩张 `_reference/`
- 把 topic 输出伪装成论文、市场宣传稿或投资 memo
- 把工程研究写成只讲概念、不讲采用边界的泛泛综述
- 把“找到了几个样本”误当成“已经形成可教、可用、可复现的方法”

如果当前 topic 仍然处于“核心事实未闭合、对象分类还在摇摆、关键推荐语法尚未成形”的状态，不应使用本模板，而应先继续 research 收口。

## 3. 适用目录形态

这份模板默认适配的，不再是“一个 topic 一个私有目录”的形态，而是 `shared topics workspace`。

默认目录类似：

```text
topics/
  00-topic-registry.md
  01-xxx.md
  02-xxx.md
  03-xxx.md
  ...
  _reference/
  _artifacts/
```

其中：

- `00-topic-registry.md` 负责列出 topic 拆分与边界
- `01..NN` 负责承载各 topic 的 living docs
- `_reference/` 负责存原始证据
- `_artifacts/` 负责存证据摘要、综合判断、比较表、baseline draft、recommendation draft

`final/` 在当前工作流里不是前置条件。

也就是说：

- 可以先没有 `final/`
- 在 Stage 5 确认 final file map 之后，再创建 `topics/final/` 或项目级 `final/`
- 如果已有半成品 final，也只把它当供稿源，不默认当正确答案

如果目录不是完全一致，也至少要具备四层：

1. `registry / 入口层`
2. `topic living docs`
3. `_reference/` 证据层
4. `_artifacts/` 中间收束层

## 4. 输入、输出、角色

### 输入

当前工作流下的标准输入，更接近下面这组对象：

- `topic registry`
- `01..NN` 的 topic 文档
- `_reference/` 中的证据文档
- `_artifacts/` 中的 evidence summary、question list、cross-topic synthesis、comparison table、baseline draft、recommendation draft、readiness check
- 计划文件、状态文件或 closeout 文档
- 如果已经存在，则包括历史 final 草稿

要特别注意：

- `topic registry` 往往不是正文素材，但它决定边界与拆题逻辑
- `shared artifacts` 往往比单个 topic 文档更适合做主骨架
- `status / readiness check` 不是 final 正文，但很适合帮助判断是否已经够稳
- 如果 topic 本身具有学习路径属性，`代表性样本清单` 与 `样本拆解笔记` 通常应被视作高价值供稿源

### 输出

标准输出默认不是传统技术报告，而是一个 `best-practice oriented progressive playbook package`。

默认推荐输出：

- `1` 份主 Playbook / 主指南
- `0-1` 份快速上手或操作 checklist
- `2-4` 份功能型 supporting docs
- 必要时 `1` 份证据索引

推荐先在下列输出模式里做选择：

1. `渐进式 Playbook 包`
   - 默认模式
   - 适合需要把读者一步步带起来的 topic
   - 特别适合 skill、prompt、workflow、tooling practice 等“看样本很重要”的对象
2. `决策简报包`
   - 适合读者已熟悉对象，只需要快速得出采用判断
   - 主文档更短，附录更轻
3. `参考手册包`
   - 适合稳定知识面较宽、读者更常做查阅而不是线性阅读的 topic
   - supporting docs 权重更高
4. `比较 + handoff 包`
   - 适合需要把对象比较、边界、责任分工交给执行团队落地的场景

默认附录强度选择：

- `中附录`
  - 也就是主 Playbook 足够自立
  - 但仍保留少量功能型 supporting docs 用于证据、比较、边界、清单

默认推荐的输出风格是：

- 面向 AI coding engineer
- 强调 `recommendation / baseline / guardrails / adoption boundary / practice path`
- 强调“怎么用、为什么这样用、先看什么、先练什么、什么不能直接抄”
- 默认采用 `先给抓手，再给判断，再给例子，再给边界，再给进阶`
- 在关键位置优先使用 `小例子 / 对照例子 / 拆解例子`
- 在真正能降低理解成本时使用 `图文配合`，例如流程图、结构图、对照表、标注截图
- 不追求写成纯技术可行性报告
- 不写成科学研究报告式的平铺展开
- 也不退化成纯观点文章或 research archive

### 执行角色

执行者的角色不是普通研究员，而是：

`synthesis editor / playbook architect / operator-facing boundary enforcer`

也就是说，执行者负责：

- 识别稳定事实
- 抽取稳定判断
- 把判断改写成推荐语法、最佳实践语法与训练路径语法
- 锁定主 Playbook 与 supporting docs 的边界
- 拒绝把 research archive 直接伪装成 final

## 5. 总原则

在进入具体阶段前，先锁住这 19 条总原则：

1. 先定义 final 要解决的读者任务，再写章节。
2. 先做 cross-topic synthesis，再决定主 Playbook 结构。
3. 当前工作流默认面向已经写过代码、但仍在 skill / workflow / leverage 上卡住的技术读者，不需要把基础概念讲成科普。
4. 默认主文档不是 `主报告`，而是 `主 Playbook / 主指南`。
5. 对 skill、prompt、workflow 这类对象，默认采用 `先读后编`：先看现成样本，先读作者思路，再进入自己的编制与组合。
6. “网上找到现成样本并不难”不是结论；真正要交付的是“如何借样本快速成长”的路径。
7. 主 Playbook 优先承载 `判断、推荐、学习弧线、baseline、组合方式、边界、纪律、练习路径`，不承载资料堆积。
8. supporting docs 承载长表、证据矩阵、样本清单、兼容性附录、比较表、方法说明和详细展开。
9. `topic docs` 不是 final，`_artifacts/` 也不是 final；它们只是 final 的供稿源。
10. 任何强断言都必须能回指到稳定 evidence pack。
11. 若某项内容尚未收敛，只能写成 `open issue / residual gap / not yet recommended`，不能伪装成结论。
12. 输出风格默认是 `best practice + decision support + guided onboarding`，不是传统学术技术报告。
13. 如果证据更支持“角色分工”或“组合推荐”，就不要强行写成单一赢家。
14. 主 Playbook 默认应让人愿意连续阅读，而不是只适合被动查阅。
15. 正文默认采用 `抓手 -> 判断 -> 例子 -> 边界 -> 下一步` 的推进节奏，避免大段平铺论述。
16. 例子不是装饰品；如果某个抽象判断不配一个最小例子、对照例子或拆解例子就很难懂，优先补例子。
17. 图文配合只在真正降低理解成本时使用；不要为了“看起来丰富”而堆图。
18. 正文应移除只对制作过程有意义的标签，例如 `topicN`、`roundN`、`waveN`、`本次交付`、`final package`。
19. 关键术语或缩写第一次出现时，应补出中文解释与英文全称，避免技术读者误解口径。
20. 最终文字必须服务“AI coding engineer 接下来怎么做、先练什么、怎样借鉴样本而不是闭门造车”，而不是停留在“我们研究过什么”。

## 6. Progressive Stages

整个 final package generation 分成 9 个阶段。每个阶段都有明确目标、动作、产物和退出条件。

### Stage 0: Grounding the Workspace

#### 目标

先摸清当前 workspace 的真实材料形态，确认输入不是想象中的单 topic 目录，而是共享 topic 工作区。

#### 动作

- 核对 `topic registry` 是否存在。
- 核对 `01..NN` topic 文档数量与命名。
- 核对 `_reference/`、`_artifacts/` 是否存在。
- 统计高价值骨架文件，例如：
  - `cross-topic synthesis`
  - `formal comparison table`
  - `final recommendation`
  - `baseline workflow draft`
  - `readiness check`
  - `样本清单 / exemplar inventory`
  - `样本拆解 / exemplar teardown`
- 识别当前是否已经存在可直接转 final 的骨架。

#### 产物

- 一份 `workspace inventory view`
- 一张 `high-value skeleton list`

#### 退出条件

只有当执行者已经明确：

- 有几个 topic
- 原始为什么要拆成这些 topic
- 哪些是共享骨架文件
- 证据主要分布在哪里
- 哪些草稿最接近 final 语法

才能进入下一阶段。

### Stage 1: Freeze the Reader Outcome

#### 目标

先定义 final package 到底要帮读者完成什么任务，而不是先定义它看起来像哪种文体。

#### 动作

- 用一句话重写 `package object statement`。
- 用一句话重写 `reader job-to-be-done`。
- 用一句话写清 `reader stuck point`，即读者原本卡在哪里。
- 明确 `in scope / out of scope`。
- 明确 final package 想回答的核心问题。
- 明确正文不显式展开的内部动机，例如组织内部推进动机、个人偏好、临时试验背景。

#### 产物

- 一句 `package object statement`
- 一句 `reader job statement`
- 一句 `reader stuck point`
- 一张 `scope card`
- 一句 `final question`

#### 退出条件

只有当执行者能稳定回答下面三个问题，才能继续：

- 这份 final 在研究什么
- 这份 final 要帮 AI coding engineer 做出什么判断或行动
- 这份 final 打算把读者从什么困惑，带到什么能力状态

### Stage 2: Audit and Grade the Material

#### 目标

把当前材料按“适合做什么”而不是按“来自哪里”进行分层。

#### 动作

- 把现有材料分成 5 层：
  - `registry layer`
  - `topic research layer`
  - `reference evidence layer`
  - `shared synthesis layer`
  - `status / readiness layer`
- 对每层判断其在 final 中的用途：
  - 作为主 Playbook 骨架
  - 作为 supporting docs 来源
  - 作为证据引用
  - 仅保留为工作痕迹
- 优先识别哪些 `_artifacts/` 已经接近：
  - 推荐结论
  - baseline 语法
  - 比较框架
  - 采用纪律
  - 样本拆解框架
  - 练习路径

#### 产物

- 一张 `material grading map`

#### 退出条件

只有当执行者已经能明确说出“哪些文件能写进主 Playbook，哪些只能当 supporting docs 供稿源，哪些只该留在工作区”时，才能继续。

### Stage 3: Extract Stable Judgments

#### 目标

从大量材料里抽出真正稳定、可直接转成 final 的 judgment，而不是只抽 claim。

#### 动作

- 从 cross-topic synthesis、comparison table、final recommendation、baseline draft、evidence summary、样本拆解材料中抽取：
  - `硬事实`
  - `对象分类`
  - `代表性样本`
  - `角色分工`
  - `推荐组合`
  - `采用纪律`
  - `跨平台边界`
  - `常见误区`
  - `练习路径`
  - `未闭合问题`
- 要求每条核心 judgment 都能回指到至少一组证据。
- 禁止把“写得像结论”的 working note 直接当 final judgment。
- 同时形成一份 `do-not-say list`，避免：
  - 说大话
  - 提前封王
  - 把局部优势写成通用结论
  - 把“借鉴样本”误写成“机械抄模板”

#### 产物

- 一份 `stable judgments list`
- 一份 `do-not-say list`

#### 退出条件

只有当主 Playbook 的一页判断、一级结论与主要练习路径已经基本固定，才能继续。

### Stage 4: Lock the Output Mode and Boundary

#### 目标

在写作前锁定 final 的输出模式，防止把 operator-facing best-practice 内容重新写回传统技术综述。

#### 动作

- 定义主 Playbook 允许写的边界。
- 定义主 Playbook 不写、但 supporting docs 可以写的边界。
- 定义整个 final 都不能写的边界。
- 锁定主文档文体：
  - `渐进式主指南`
  - `可连续阅读的 best-practice Playbook`
  - 不是 `科学研究报告`
- 在下面几种输出模式中做选择：
  - `渐进式 Playbook 包`
  - `决策简报包`
  - `参考手册包`
  - `比较 + handoff 包`
- 选择附录强度：
  - `轻附录`
  - `中附录`
  - `重附录`

默认推荐：

- 输出模式选 `渐进式 Playbook 包`
- 附录强度选 `中附录`
- 结构为 `1 份主 Playbook + 少量功能型 supporting docs + 可选证据索引`
- 主文体选 `可连续阅读的渐进式主指南`

#### 产物

- 一份 `boundary lock`
- 一份 `output mode decision`
- 一份 `appendix intensity decision`

#### 退出条件

只有当执行者不再犹豫“这段到底是主 Playbook、功能型附录、还是根本不该进 final”时，才能继续。

### Stage 5: Design the Final Package

#### 目标

先设计 final 的文件结构、读者路径和文件功能，再开始正式写正文。

#### 动作

- 为主 Playbook 命名。
- 为 supporting docs 命名。
- 决定是否单独拆出证据索引。
- 决定是否单独拆出样本清单、样本拆解、比较表、兼容性附录、治理清单。
- 先设计读者阅读顺序，再设计文件顺序。
- 先设计章节节奏，再设计章节标题。
- 默认按“功能”和“学习弧线”而不是按原 topic 顺序组织 final。

推荐的章节节奏：

1. 用一个读者会立刻认出的困惑、场景或问题开篇
2. 紧接着给出当前章节最关键的判断
3. 用一个最小例子、对照例子或拆解例子把判断讲实
4. 再补适用边界、常见误区与不该怎么做
5. 最后给出下一步动作或把读者带到下一章节

如果某章天然适合图文配合，优先考虑：

- `流程图`：适合讲步骤、分阶段工作流、调用链
- `结构图`：适合讲组成关系、层次、角色分工
- `对照表`：适合讲方案差异、边界、取舍
- `标注截图`：适合讲真实样本拆解、关键片段阅读路径

但要注意：

- 图只服务理解，不服务装饰
- 图不能替代正文判断
- 图多但判断弱，仍然算失败

推荐文件命名语法：

- 主 Playbook：`00-<研究对象>+<实践Playbook或主指南>.md`
- 功能型 supporting docs：`附录X-<功能>.md` 或 `<功能>-<对象或用途>.md`

面向当前工作流的典型例子：

- `00-Skill工程从借鉴到编制的实践Playbook.md`
- `附录A-代表性Skill样本与拆解索引.md`
- `附录B-证据总表与引用索引.md`
- `附录C-角色分工与组合比较.md`
- `附录D-工作流基线与评测清单.md`

#### 默认学习弧线

如果没有更强理由，主 Playbook 默认按下面这条弧线组织：

1. 为什么这个 topic 值得做 Deep Research，原始诉求是什么
2. 当前研究对象是什么，不是什么
3. 先看哪些代表性样本，为什么不要闭门造车
4. 怎样读样本，怎样还原作者的设计思路与取舍
5. 怎样从样本中抽取可迁移模式，而不是机械抄写
6. 对读者来说，最小可执行 baseline 是什么
7. 怎样从 baseline 走向自己的编制、组合与 leverage
8. 使用时必须保留哪些 guardrails、评测动作与治理纪律
9. 还有哪些 open issues，以及读者下一步应该练什么

对 skill / prompt / workflow 这类 topic，`第 3-5 步` 通常不应省略，因为：

- 现成样本往往不难找
- 真正难的是长期实验、反复比较、慢慢长出自己的判断
- 借鉴别人做过的 skill 或 workflow，通常会显著缩短这条成长曲线

#### 产物

- 一份 `final file map`
- 一份 `chapter-to-file mapping`
- 一份 `reader journey map`

#### 退出条件

只有当 final 目录结构、各文件职责与读者阅读顺序已经稳定，才能继续写作。

### Stage 6: Build the Evidence Map

#### 目标

在正文写作前先把 evidence map 搭好，避免主 Playbook 做判断、附录做证据、二者却对不上。

#### 动作

- 给主 Playbook 关键 judgment 分配稳定编号。
- 每个 judgment 映射到：
  - 主要 topic 供稿源
  - 主要 `_artifacts/` 文件
  - 主要 `_reference/` 文件
- 标记哪些 judgment 需要 `例子支持`，哪些 judgment 需要 `图文支持`。
- 决定正文采用：
  - `轻引用`
  - `正文轻引用 + 附录重证据`
  - `附录索引回指`

默认推荐：

- `正文轻引用 + supporting docs 重证据`

对当前这类 best-practice Playbook，默认进一步要求：

- 主 Playbook 中的推荐结论、样本选择、组合建议、边界判断至少采用轻引用。
- 正文中的轻引用应能直接回指到附录中的证据编号。
- 关键例子如果来自真实样本、真实工作流或真实对照材料，也应能回指到证据来源。
- 不要出现“正文在下判断，证据只藏在 supporting docs 里且正文完全不标”的情况。

#### 产物

- 一份 `evidence map`
- 一份 `judgment-to-source matrix`

#### 退出条件

只有当主 Playbook 中每条关键推荐与边界判断都知道“证据从哪里来”，才能继续。

### Stage 7: Assemble the Main Playbook

#### 目标

写出一份真正可连续阅读、可自说明、且对 AI coding engineer 有行动价值的主 Playbook。

#### 动作

- 先写开篇：为什么原始会做这轮 Deep Research，以及原始 topic 是怎样拆出来的。
- 再写研究对象与范围卡片。
- 再写代表性样本、样本拆解方法、baseline workflow、推荐结构、角色分工、边界与保留项。
- 对每个一级章节，至少显式决定一次：
  - 是否需要一个最小例子
  - 是否需要一个对照例子
  - 是否需要一个图文配合点
- 不按原始 `01..NN` 顺序机械拼接 topic。

主 Playbook 默认应回答：

1. 为什么这个 topic 值得深挖，原始问题到底是什么
2. 当前研究对象是什么，不是什么
3. 有哪些代表性样本值得先读，为什么
4. 怎样读样本，怎样还原作者背后的设计思路
5. 哪些做法值得借鉴，哪些只是表面长得像
6. 对 AI coding engineer 来说，最小可执行 baseline 是什么
7. 怎样从“借鉴样本”走到“自己会编、会改、会组合、会 leverage”
8. 使用时必须保留哪些纪律、信任边界与评测动作
9. 哪些内容是 portable baseline，哪些只是 surface-specific extension
10. 还有哪些问题没闭合，暂时不建议写死

主 Playbook 默认的呈现要求：

- 开篇尽快给出抓手，不要前两屏都在讲背景
- 抽象判断后面，优先跟一个最小例子
- 复杂比较优先做成对照表，而不是一长段形容词
- 讲样本拆解时，优先让读者看见“关键片段 + 你的解读”
- 小节结尾尽量能回答“所以我下一步该做什么”

主 Playbook 写完后，还要专门做一轮 `reader polish`：

- 去掉 `topicN / roundN / waveN / final package` 一类过程标签。
- 检查术语第一次出现时是否已解释清楚。
- 如果英文术语先出现，补出中文解释；如果中文术语先出现且后文会频繁缩写，补出英文全称与缩写。
- 检查是否面向技术读者写作，而不是陷入学术摘要腔或工作底稿腔。
- 检查是否已经把“先读什么、先做什么、别直接做什么”写清楚。
- 检查是否已经把“可执行 baseline”和“不可越过的边界”写清楚。
- 检查是否有必要补一个最小例子、一个对照表或一个结构图来降低理解门槛。
- 检查是否存在大段抽象论述连续出现、却没有抓手的情况。
- 检查主 Playbook 中的关键判断是否已挂上附录证据编号。

#### 产物

- 一份 `main playbook draft`

#### 退出条件

主 Playbook 必须满足：

- 读者只读主 Playbook 也能明白核心结论
- 一打开就知道为什么会有这轮 Deep Research 与这些 topic
- 不需要先读完 supporting docs 才知道该怎么入手
- 不像 topic 拼盘或资料库
- 读起来像一个能把人带进去的主指南，而不是科学报告换皮
- 明显在服务“学习路径、采用判断与工作流建议”

### Stage 8: Assemble Supporting Documents

#### 目标

把主 Playbook 不适合承载、但又必须存在的重材料下沉到功能型 supporting docs。

#### 动作

- 把证据索引下沉。
- 把样本清单、样本拆解长表、正式比较表下沉。
- 把兼容性矩阵、字段支持矩阵、治理清单、评测清单下沉。
- 把逐 topic 细展开下沉。
- 把方法说明、术语口径、数据口径说明下沉。
- 把会打断主线节奏的重图表下沉，但把真正有助于理解主线的少量关键图留在主 Playbook。

supporting docs 应按功能组织，而不是按 research 顺序简单复制。

如果某份 supporting doc 在读者视角上本质就是附录，就直接命名为：

- `附录A-...`
- `附录B-...`
- `附录C-...`

#### 产物

- `supporting-docs-1..N`

#### 退出条件

只有当主 Playbook 已经足够轻、足够顺，而关键支撑内容没有丢失时，这一阶段才算完成。

### Stage 9: Consistency Review and Acceptance Gate

#### 目标

做最终一致性检查，确保 final 真的是一套 operator-facing playbook package，而不是研究仓库的换皮版。

#### 动作

- 检查主 Playbook 标题是否准确、是否过大。
- 检查文件名是否能直接说明对象和功能。
- 检查正文里是否残留 `topicN / roundN / waveN / final` 一类过程标签。
- 检查关键缩写第一次出现时是否给出必要扩写。
- 检查正文是否已经按中文技术读者的阅读习惯润色。
- 检查主 Playbook 的关键判断是否已补上证据编号。
- 检查主 Playbook 与 supporting docs 口径是否一致。
- 检查 scope 是否漂移。
- 检查是否误把内部执行动机写进正文。
- 检查是否有推荐语句没有证据回指。
- 检查 final 是否真正形成：
  - 推荐结论
  - baseline 语法
  - guardrails
  - practice path
  - open issues

#### 产物

- 一份 `acceptance result`

#### 退出条件

通过以下全部检查才算完成：

- 主 Playbook 可独立阅读
- supporting docs 与正文不冲突
- 文件名和标题准确
- 过程标签已清理
- 关键术语首现可读
- 中文语感已润色
- 主 Playbook 已对关键判断做轻引用
- 关键 judgment 均可追溯
- 明显比原始 topic 材料更收束
- 读者读完后知道“为什么会做这轮研究、该先看什么、该先做什么、接下来怎么练”

## 7. 主 Playbook 与 supporting docs 的分流规则

执行时，默认使用下列分流规则：

### 进主 Playbook

- 为什么原始会有这些 Deep Research 诉求
- 研究对象与范围卡片
- 最核心的一页判断
- 开篇抓手型例子或场景
- 代表性样本与阅读顺序
- 样本拆解方法与可迁移模式
- 角色分工或推荐组合
- 最小可执行 baseline
- 怎样从借鉴走到自己的编制、组合与 leverage
- 必须保留的 guardrails
- 对采用边界有决定作用的结构性判断
- 读者下一步的练习路径
- 少量真正能降低理解门槛的关键图表

### 进 supporting docs

- 长表
- 证据链
- 样本总表
- 样本拆解长表
- 候选对象 scorecard
- 正式比较表
- 跨平台兼容附录
- 字段支持矩阵
- 评测清单
- 治理清单
- 逐 topic 详细展开
- 方法说明与数据口径说明
- 主线阅读不需要、但作为补充很有价值的扩展图表

### 不进 final

- 未收敛的 working note
- 原始 question list 全量正文
- 未被正文或附录消费的散碎摘录
- 只表达执行痕迹、不形成判断的过程材料
- 为了显得“完整”而硬塞进去的 topic 顺序拼接

## 8. 标题与命名规则

当 final playbook generator 进入命名阶段时，优先遵守以下规则：

### 文件名规则

凡写成 `<...>` 的文件名片段，都是占位符，必须在真正生成 final 时回填为具体对象名。

不要把下面这些提示词误当成真实文件名：

- `主报告`
- `主 Playbook`
- `supporting doc`
- `准确主标题`
- `best-practice report`

文件名总原则：

- 必须让人一眼知道“这份文件在解决什么问题”
- 优先表达“对象 + 功能”
- 默认优先使用 `主 Playbook / 主指南` 语法，而不是 `主报告`
- 不需要为了整齐硬凑 appendix 序列
- 如果已经明显是附录角色，就直接用 `附录A/B/C`

禁止使用无语义文件名：

- `00-总报告.md`
- `final-report.md`
- `topic-final.md`
- `补充材料.md`
- `其他说明.md`

### 主文档命名规则

- 主文档名必须后定，不能直接沿用 seed 标题。
- 主文档名必须明显小于整个赛道。
- 主文档名最好同时说明：
  - 研究对象
  - 决策边界或学习任务
  - 文档类型

推荐语法：

- `<研究对象> + <实践Playbook>`
- `<研究对象> + <从样本到实战指南>`
- `<研究对象> + <采用判断与工作流指南>`
- `<研究对象> + <角色分工与最佳实践>`

### 标题规则

- 标题必须锚定对象，而不是锚定整个大赛道。
- 标题必须能体现“这是给 AI coding engineer 的操作性主文档”。
- 标题应优先突出：
  - 推荐对象
  - 使用边界
  - 学习任务或任务类型

例如：

- `Skill 工程从借鉴到编制的实践 Playbook`
- `面向 Coding Agent 的 Skill 采用判断与工作流指南`
- `Skill 样本阅读、组合与治理最佳实践`

都比：

- `AI Agent Skill 全景综合研究报告`

更准确，因为前者明确了对象与任务，后者过大。

### Supporting Docs 命名规则

- supporting docs 的名字应由功能驱动，而不是由固定 appendix 槽位驱动。
- 先问这份文档是干什么的，再决定它叫什么。
- 如果读者视角上它就是附录，就直接在文件名和标题里标成附录。

推荐功能名包括：

- `代表性样本与拆解索引`
- `证据总表与引用索引`
- `候选对象角色分工与组合比较`
- `跨平台兼容与使用边界`
- `字段支持矩阵`
- `最小评测清单`
- `治理与版本纪律`
- `方法说明`
- `数据口径说明`
- `术语与对象分类表`

如果某个 topic 不需要这些文档，就不要为了整齐硬造。

## 9. 推荐的最终文件结构

对不同重量级、不同读者任务的 topic，推荐不同的最终文件结构。

### Pattern A：渐进式 Playbook 轻包

```text
final/
  00-<研究对象+实践Playbook>.md
  <可选 quick-start 或 checklist>.md
```

适用条件：

- 研究对象较单一
- supporting material 不多
- 主 Playbook 本身已能承载绝大多数判断

### Pattern B：渐进式 Playbook 标准包

```text
final/
  00-<研究对象+从样本到实战指南>.md
  附录A-代表性样本与拆解索引.md
  附录B-证据总表与引用索引.md
  附录C-角色分工与组合比较.md
```

适用条件：

- 这是当前工作流的默认推荐结构
- 默认附录强度为 `中附录`
- 大多数 shared topics workspace 都应先从这套结构考虑

### Pattern C：渐进式 Playbook + 参考工具包

```text
final/
  00-<研究对象+实践Playbook>.md
  01-<研究对象+快速上手清单>.md
  附录A-代表性样本与拆解索引.md
  附录B-证据总表与引用索引.md
  附录C-跨平台兼容与使用边界.md
  附录D-工作流基线与评测清单.md
```

适用条件：

- 主 Playbook 之外，读者还需要可直接执行的 quick-start
- 样本、边界、评测三个维度都需要单独承载

### Pattern D：决策简报包

```text
final/
  00-<研究对象+采用判断与建议>.md
  附录A-证据总表与引用索引.md
  <可选比较表>.md
```

适用条件：

- 读者已熟悉对象
- 目标是快速得出采用判断，而不是带读者从头成长
- 不需要完整的渐进式学习弧线

默认不推荐直接退回 `单一长报告`。如果读者需要的是成长路径和最佳实践，优先保持 Playbook 形态。

## 10. 标准验收清单

在宣布 final 完成前，逐项检查：

1. `对象与读者检查`
   - 主 Playbook 是否用一句话讲清在研究什么
   - 是否明确写清 `in scope / out of scope`
   - 是否讲清读者原本卡在哪里
   - 是否讲清读者读完后要获得什么能力或判断

2. `学习弧线检查`
   - 是否交代了为什么原始会做这轮 Deep Research
   - 是否解释了为什么 topic 会这样拆
   - 是否给出了代表性样本与阅读顺序
   - 是否讲清怎样从“读样本”走到“自己会做”
   - 是否给出了下一步练习路径

3. `结构检查`
   - 是否先有一页判断
   - 是否存在主 Playbook 与 supporting docs 分工
   - 是否仍存在 topic 拼盘感
   - 是否已经形成推荐、baseline、guardrails、practice path、open issues 五层结构

4. `阅读体验检查`
   - 是否一开始就给了读者抓手，而不是长背景
   - 抽象判断后面是否补了必要的最小例子或对照例子
   - 复杂关系是否用了更易读的表格、结构图或流程图
   - 是否做到深入浅出、简洁推进、渐入佳境
   - 是否让人愿意继续往下读，而不是只适合被动查阅

5. `边界检查`
   - 是否把不该写的内部动机写进了正文
   - 是否把研究对象写大了
   - 是否把未闭合问题写成了确定结论
   - 是否把某平台私有能力误写成 portable baseline
   - 是否把“借鉴样本”误写成“可以不加判断地直接抄”

6. `证据检查`
   - 关键 judgment 是否可回指
   - 主 Playbook 是否采用了稳定 evidence pack
   - 主 Playbook 是否对关键判断补了轻引用编号
   - 关键例子、关键图示如来自真实材料，是否也可回指
   - 是否存在一段重要推荐找不到来源

7. `工程与表达检查`
   - 文件名是否准确
   - 标题是否准确
   - supporting docs 命名是否表达功能
   - final 目录是否已经比原始材料明显更收束
   - 英文术语第一次出现时是否补了中文
   - 中文术语第一次出现且后文会频繁缩写时，是否补了英文全称
   - 句子是否适合中文技术读者连续阅读
   - 是否已经把“怎么做、先做什么、不能怎么做”写清楚

## 11. 给后续 topic 的复用方法

对任何一个新的 shared topics workspace，执行顺序固定为：

1. 先做 `Stage 0-2`
2. 再做 `Stage 3-4`
3. 再做 `Stage 5-6`
4. 最后做 `Stage 7-9`

不要跳过前面的收束步骤直接写主 Playbook。

如果 topic 材料很重，重点加在：

- Stage 3: `stable judgments extraction`
- Stage 4: `output mode and boundary lock`
- Stage 6: `evidence map`

如果 topic 材料很轻，重点加在：

- Stage 0: `workspace inventory`
- Stage 2: `material grading`
- Stage 5: `reader journey design`
- Stage 7: `main playbook assembly`

如果 topic 具有明显的“学习路径”属性，额外重点加在：

- Stage 1: `reader stuck point`
- Stage 5: `default learning arc`
- Stage 7: `from reading exemplars to building your own`

## 12. 这份模板真正要守住的东西

这份模板最重要的不是格式，而是下面这套纪律：

- 把 research 材料变成 final，不等于把材料复制一遍
- 把 topic 写成 final，不等于按 `01..NN` 顺序拼起来
- 一份真正合格的 final，必须先经过：
  - 对象重写
  - 任务重写
  - judgment 抽取
  - 输出模式锁定
  - 证据映射
  - recommendation 语法收束
  - learning arc 设计
- 主 Playbook 与 supporting docs 的分流
- 从“研究结论”进一步收束到“AI coding engineer 可执行的 baseline、guardrails 与练习路径”
- 对 skill / prompt / workflow 这类对象，明确坚持 `先读后编`

如果这些步骤没做，再多内容也只是 research archive，不是 final playbook package。
