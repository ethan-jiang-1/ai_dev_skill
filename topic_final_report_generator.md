# Round Three Topic Final Report Generator

> 用途：把一个 `round3_topicN` 目录下已经基本收集完成的研究材料，稳定收束成 `final/` 下的主报告与 supporting docs。
>
> 这不是 deep research 模板。
> 这是一份 `final report generator` 模板，内部采用 progressive stages。

## 1. 这份模板解决什么问题

当一个 topic 已经经过多轮信息收集后，目录里通常会同时存在下面几层内容：

- 一份最初的母题或 seed 文档
- 若干拆分后的子题文档
- `_reference/` 中的大量原始证据
- `_artifacts/` 中的问题清单、证据摘要、工作结构、closeout 文档
- 一个准备装配最终产物的 `final/` 目录

此时真正的问题已经不是“还要不要继续搜”，而是：

- 哪些内容已经足够稳定，可以进入最终报告
- 哪些内容应当只作为 supporting docs 或证据索引
- 哪些内容还只是研究过程，不应直接进入 final
- 怎样把一堆 topic 线索装配成一份可读、可审、可继续复用的 final report

这份模板专门解决这件事。

## 2. 这份模板不解决什么问题

这份模板不负责：

- 从零开始做 research
- 大规模扩展 `_reference/`
- 临时追加新的研究线
- 把 topic 写成营销文案或投资 memo

如果当前 topic 仍然处于“核心事实未闭合、材料很薄、主要矛盾还不清楚”的状态，不应使用本模板，而应先走 research 模板。

## 3. 适用目录形态

默认适用于如下目录结构：

```text
round3_topicN/
  seed 或母题.md
  00-母题或背景.md
  01-xxx.md
  02-xxx.md
  ...
  NN-xxx.md
  _reference/
  _artifacts/
  final/
```

如果不是完全一致，也至少要具备三层：

1. `topic 主文或拆分研究线`
2. `_reference/` 证据层
3. `_artifacts/` 中间收口层

`final/` 可以为空，也可以已有半成品。

## 4. 输入、输出、角色

### 输入

- `seed / 母题文档`
- `00..NN` 或等价的分题文档
- `_reference/` 中的证据文档
- `_artifacts/` 中的 evidence-summary、question-list、closeout、cross-topic synthesis 等材料
- 当前已有的 `final/` 内容

### 输出

标准输出不是固定长相，而是一个 `final package`。

最常见的输出包括：

- `final/` 下 1 份主报告
- `final/` 下 0 到 1 份证据索引
- `final/` 下 0 到 N 份按功能组织的 supporting docs

其中：

- 轻 topic 可能只有 `主报告 + 1 份 supporting note`
- 中等 topic 往往是 `主报告 + 证据索引 + 若干 supporting docs`
- 重 topic 才需要完整的多文件包

### 执行角色

执行者的角色不是研究员，而是：

`report generator / synthesis editor / boundary enforcer`

也就是说，执行者负责做四件事：

- 识别稳定内容
- 锁定边界
- 重新组织结构
- 拒绝把研究仓库直接伪装成 final

## 5. 总原则

在进入具体阶段前，先锁住这 13 条总原则：

1. 先收束边界，再写主报告。
2. 先做 cross-topic synthesis，再决定 final 的章节结构。
3. 主报告只承载判断、结构、范围与边界，不承载资料堆积。
4. supporting docs 承载长表、证据矩阵、案例链、条款链、方法说明和长解释。
5. topic 文档不是 final，`_artifacts/` 也不是 final。
6. 主报告必须可连续阅读，不能要求读者先读完全部 supporting docs。
7. 任何强断言都必须能回指到稳定 evidence pack。
8. 若某项内容仍未收敛，只能写成 `open issue / residual gap`，不能伪装成结论。
9. 正文应移除只对制作过程有意义的标签，例如 `topicN`、`roundN`、`final package`、`本次交付` 一类表述。
10. 关键术语或缩写在第一次出现时，应尽量补出中文解释与英文全称；如果先出现的是英文术语，也应补出中文含义，至少让读者首次阅读不必猜。
11. 如果 supporting docs 在阅读上实际承担“附录”角色，就应在文件名和标题中明确标示，而不是只在作者脑中默认。
12. 最终文字应面向中文读者重写，而不是把英文研究笔记直接翻成中文；句子要顺、段落要能连续阅读，避免“字是中文、语感却像工作底稿”。
13. `00-主报告` 只要调用了附录中的证据，就应在正文里直接补上轻引用编号，例如 `E01`、`E02`，不能把证据关系只留在附录里。

## 6. Progressive Stages

整个 final report generation 分成 9 个阶段。每个阶段都有明确目标、动作、产物和退出条件。

### Stage 0: Grounding

#### 目标

先摸清当前 topic 的真实材料形态，确认这不是“脑补中的目录”，而是真正可装配的输入集。

#### 动作

- 核对 topic 目录中的真实文件名。
- 核对 `_reference/`、`_artifacts/`、`final/` 是否存在。
- 数清分题数量、参考材料数量、中间件数量。
- 识别是否已存在 closeout、cross-topic synthesis、evidence summary 一类高价值骨架文件。

#### 产物

- 一份简短的 `inventory view`
- 一张 `当前可用骨架清单`

#### 退出条件

只有当执行者已经明确：

- 主题叫什么
- 分题有几条
- 证据主要在哪里
- 哪些文件可以作为高层骨架

才能进入下一阶段。

### Stage 1: Freeze the Report Object

#### 目标

先定义 final report 到底要写什么对象，避免把 scope 写得比研究材料更大。

#### 动作

- 用一句话重写研究对象。
- 明确 `in scope / out of scope`。
- 明确 final report 要回答的核心问题。
- 明确哪些“真实动机”不必显式写进正文，例如商业动机、融资动机、内部推进动机。

#### 产物

- 一句 `report object statement`
- 一张 `scope card`
- 一句 `final question`

#### 退出条件

只有当执行者能稳定回答“我们到底在写什么，而不是在写什么”时，才能继续。

### Stage 2: Audit and Grade the Material

#### 目标

把现有材料分层，不同层有不同用途，不能混写。

#### 动作

- 把 topic 目录中的内容分成 4 层：
  - `seed / 母题层`
  - `line research 层`
  - `evidence 层`
  - `closeout / synthesis 层`
- 对每层判断其在 final 中的用途：
  - 作为主报告骨架
  - 作为 supporting docs 来源
  - 作为证据引用
  - 仅保留为工作痕迹

#### 产物

- 一张 `material grading map`

#### 退出条件

只有当执行者已经能明确说出“哪个文件是主骨架，哪个文件只是供稿源”时，才能继续。

### Stage 3: Extract Stable Claims

#### 目标

从大量材料里抽出真正稳定、可落正文的 claim。

#### 动作

- 从 cross-topic synthesis、closeout summary、evidence summary 中抽取：
  - `硬事实`
  - `分析判断`
  - `趋势推测`
  - `未闭合问题`
- 要求每条核心 claim 都能回指到至少一组证据。
- 禁止把“写得很像结论”的 working notes 直接当 final claim。

#### 产物

- 一份 `stable claims list`
- 一份 `do-not-say list`

#### 退出条件

只有当主报告可能出现的一级结论已经基本固定，才能继续。

### Stage 4: Lock the Final Boundary

#### 目标

在写作前锁定 final report 的边界，防止正文越写越大、越写越飘。

#### 动作

- 定义主报告允许写的边界。
- 定义主报告不写但 supporting docs 可以写的边界。
- 定义整个 final 都不能写的边界。
- 明确是否采用：
  - 主报告 + supporting docs
  - 多册分卷
  - 单一长报告

默认推荐：

- `1 份主报告 + 证据索引（可选） + 若干 supporting docs`

#### 产物

- 一份 `boundary lock`
- 一份 `final package decision`

#### 退出条件

只有当执行者不再犹豫“这段应该进正文还是进 supporting docs”，才能继续。

### Stage 5: Design the Final Package

#### 目标

先设计 final 的文件结构，而不是先开始写正文。

#### 动作

- 为主报告命名。
- 为 supporting docs 命名。
- 按功能而不是按原 topic 顺序组织 supporting docs。
- 决定证据索引是否单独成文。

推荐默认做法：

- 先命名主报告，再决定 supporting docs 是否需要分拆。
- 文件名先按“功能”命名，再按“对象”命名。
- 只有在一个 topic 的 supporting docs 明显超过 2 份时，才需要认真设计编号与层次。

推荐文件命名语法：

- 主报告：`00-<研究对象>+<任务类型>.md`
- supporting docs：`<功能>-<对象或用途>.md`

例如：

- `00-波浪运动预测与DP辅助控制落地可行性研究.md`
- `证据总表与引用索引.md`
- `TRL与控制边界.md`
- `部署接口与工程约束.md`
- `条款矩阵-认证合规.md`
- `方法说明-证据分级与引用规则.md`

#### 产物

- 一份 `final file map`
- 一份 `chapter-to-file mapping`

#### 退出条件

只有当 final 目录结构已经稳定，才能继续写作。

### Stage 6: Build the Evidence Map

#### 目标

在正文写作前，先把证据索引结构搭出来，避免后面正文和 supporting docs 失联。

#### 动作

- 给主报告关键 claim 分配稳定编号。
- 每个 claim 映射到：
  - 主要 topic 供稿源
  - 主要 `_artifacts/` 文件
  - 主要 `_reference/` 文件
- 决定正文采用：
  - 轻引用
  - 密集引用
  - 文后索引

默认推荐：

- `正文轻引用 + supporting docs 重证据`

对研究性质报告，默认进一步要求：

- `00-主报告` 至少对关键判断采用轻引用。
- 正文中的轻引用应能直接回指到附录中的证据编号。
- 不要出现“主报告在下判断，证据只藏在附录里但正文完全不标”的情况。

#### 产物

- 一份 `evidence map`
- 一份 `claim-to-source matrix`

#### 退出条件

只有当主报告中每条关键结论都已知道“证据从哪里来”，才能继续。

### Stage 7: Assemble the Main Report

#### 目标

写出一份真正可连续阅读的主报告。

#### 动作

- 先写一页判断或摘要。
- 再写研究对象与范围卡片。
- 再按“读者最需要理解的顺序”组织章节。
- 不按原始 `00..NN` 顺序机械拼接。

主报告默认应回答：

1. 研究对象是什么
2. 当前可落地到哪一层
3. 为什么这条路线在技术上成立
4. 优先场景是什么
5. 工程落地难点是什么
6. 首个合理边界是什么
7. 还有哪些问题没闭合

主报告写完后，还要专门做一轮 `reader polish`：

- 去掉 `topicN / roundN / final` 之类只对制作过程有意义的词。
- 检查术语第一次出现时是否已解释清楚。
- 如果英文术语先出现，补出中文解释；如果中文术语先出现且后文会反复使用缩写，补出英文全称与缩写。
- 检查句子是否符合中文读者的阅读习惯，而不是研究笔记直译腔。
- 检查是否能让第一次接触该问题的读者顺着章节自然读下去。
- 检查 `00-主报告` 中的关键判断是否已挂上附录证据编号。

#### 产物

- 一份 `main report draft`

#### 退出条件

主报告必须满足：

- 读者只读主报告也能明白核心判断
- 不需要依赖 supporting docs 才能理解文章对象
- 不像 topic 拼盘或资料库

### Stage 8: Assemble Supporting Documents

#### 目标

把正文不适合承载、但又必须存在的内容下沉到 supporting docs。

#### 动作

- 把长表下沉。
- 把条款矩阵下沉。
- 把价格带、案例链、交付链、测试链下沉。
- 把证据索引单独整理。

supporting docs 应当按功能组织，而不是按 research 顺序简单复制。

如果某份 supporting doc 实际承担附录角色，就直接命名为：

- `附录A-...`
- `附录B-...`
- `附录C-...`

#### 产物

- `supporting-docs-1..N`

#### 退出条件

只有当正文已经变轻，而关键支撑内容没有丢失时，这一阶段才算完成。

### Stage 9: Consistency Review and Acceptance Gate

#### 目标

做最终一致性检查，避免 final 看起来像写完了，其实口径到处冲突。

#### 动作

- 检查主报告标题是否准确、是否过大。
- 检查文件名是否能直接说明 topic 对象。
- 检查正文里是否残留 `topicN / roundN / final` 一类过程标签。
- 检查关键缩写第一次出现时是否给出必要扩写。
- 检查正文是否已经按中文读者的阅读习惯润色，而不是停留在工作底稿语感。
- 检查 `00-主报告` 的关键判断是否已补上证据编号。
- 检查主报告与 supporting docs 口径是否一致。
- 检查 scope 是否漂移。
- 检查是否误把内部动机写进正文。
- 检查是否有强断言没有证据回指。
- 检查 final 是否仍然像 `report generator` 产物，而不是 `deep research dump`。

#### 产物

- 一份 `acceptance result`

#### 退出条件

通过以下全部检查才算完成：

- 主报告可独立阅读
- supporting docs 与正文不冲突
- 文件名和标题准确
- 过程标签已清理
- 关键术语首现可读
- 中文语感已润色
- `00-主报告` 已对关键判断做轻引用
- 关键 claim 均可追溯
- 明显比 topic 原始材料更收束

## 7. 主报告与 supporting docs 的分流规则

执行时，默认使用下列分流规则：

### 进主报告

- 定义研究对象的内容
- 最核心的一页判断
- 最关键的几条稳定结论
- 对落地边界有决定作用的结构性判断
- 读者若不知道就无法理解全文的必要背景

### 进 supporting docs

- 长表
- 证据链
- 条款级矩阵
- 价格带长解释
- 详细案例链
- 逐 topic 展开
- 方法说明
- 数据口径说明
- 时间线或事件编年

### 不进 final

- 未收敛的 working note
- 仅用于补搜的 question list 原文
- 未被正文或 supporting docs 消费的散碎摘录
- 只表达执行痕迹、不形成判断的过程材料

## 8. 标题与命名规则

当 final report generator 进入命名阶段时，优先遵守以下规则：

### 文件名规则

以下是命名规则；凡出现在“禁止使用”下的名字，都是反例，不是推荐模板。

凡写成 `<...>` 的文件名片段，都是占位符，必须在真正生成 `final/` 时回填为具体对象名。
不要把占位符原样留在最终文件里，也不要把：

- `主报告`
- `supporting doc`
- `准确主标题`

这类提示词误当成真实文件名。

- 文件名必须让人一眼知道“这份报告在研究什么”。
- 文件名优先表达“对象”和“功能”，而不是表达“它在目录里的位置”。
- 文件名不必强行使用 `appendix-A/B/C` 这套前缀，除非 supporting docs 数量较多且确实需要排序。
- 禁止使用无语义的：
  - `00-总报告.md`
  - `final-report.md`
  - `topic1-final.md`
- supporting docs 也禁止使用无语义名字：
  - `附录1.md`
  - `补充材料.md`
  - `其他说明.md`

### 主报告命名规则

- 主报告名必须后定，不能沿用最初的 seed 标题。
- 主报告名必须明显小于整个大赛道。
- 主报告名最好同时说明：
  - 研究对象
  - 研究边界
  - 任务类型

推荐语法：

- `<研究对象> + <任务类型>`
- `<研究对象> + <边界> + <任务类型>`

### 标题规则

- 标题必须明显小于“整个大赛道”。
- 标题要锚定：
  - 研究对象
  - 边界
  - 任务类型

例如：

- `波浪/运动预测与 DP 辅助控制落地可行性研究`

就比：

- `深度学习驱动 DP 控制商业化综合报告`

更准确，因为前者说明了对象、边界和任务，后者过大。

### Supporting Docs 命名规则

- supporting docs 的名字应当由“功能”驱动，而不是由固定 appendix 槽位驱动。
- 先问这份文档是干什么的，再决定它叫什么。
- 如果这份文档在读者视角上就是附录，就直接在文件名和标题里标为 `附录A/B/C...`。

推荐功能名包括：

- `证据总表与引用索引`
- `TRL与控制边界`
- `优先落地场景与扩展路径`
- `部署接口与工程约束`
- `认证合规矩阵`
- `方法说明`
- `数据口径说明`
- `时间线`
- `案例链`

如果某个 topic 不需要这些文档，就不要为了整齐硬造。

## 9. 推荐的最终文件结构

对不同重量级的 topic，推荐不同的最终文件结构。

### Pattern A：轻 topic

```text
final/
  00-<回填为实际主报告名：研究对象+边界+任务类型，禁止写“主报告”>.md
  <回填为实际功能名或附录名，可选>.md
```

适用条件：

- 研究对象较单一
- supporting material 不多
- 没有必要拆成多份说明文档

### Pattern B：标准 topic

```text
final/
  00-<回填为实际主报告名：研究对象+边界+任务类型，禁止写“主报告”>.md
  <回填为证据索引的实际名字，例如：附录A-证据总表与引用索引>.md
  <回填为实际功能名或附录名1>.md
  <回填为实际功能名或附录名2>.md
  <回填为实际功能名或附录名3，可选>.md
```

适用条件：

- 这是默认推荐结构
- 大多数 round3 topic 都应先从这套结构考虑

### Pattern C：重 topic

```text
final/
  00-<回填为实际主报告名：研究对象+边界+任务类型，禁止写“主报告”>.md
  <回填为证据索引的实际名字>.md
  <多个回填后的功能导向文档或附录名>
```

适用条件：

- topic 证据层很重
- 存在多套矩阵、方法、时间线或案例链需要拆开承载

### Pattern D：单一长报告

不推荐，但在以下条件同时满足时可以接受：

- topic 本身很轻
- 证据链短
- 不会让正文失控膨胀

但不建议直接做单一超长 Markdown。

## 10. 标准验收清单

在宣布 final 完成前，逐项检查：

1. `对象检查`
- 主报告是否用一句话讲清在研究什么
- 是否明确写清 `in scope / out of scope`

2. `结构检查`
- 是否先有一页判断
- 是否存在主报告与 supporting docs 分工
- 是否仍存在 topic 拼盘感

3. `边界检查`
- 是否把不该写的内部动机写进了正文
- 是否把研究对象写大了
- 是否把未闭合问题写成了确定结论

4. `证据检查`
- 关键 claim 是否可回指
- 主报告是否采用了稳定 evidence pack
- `00-主报告` 是否对关键判断补了轻引用编号
- 是否存在一段重要判断找不到来源

5. `工程检查`
- 文件名是否准确
- 标题是否准确
- supporting docs 命名是否表达功能
- final 目录是否已经比原 topic 材料明显更收束

6. `表达检查`
- 英文术语第一次出现时是否补了中文
- 中文术语第一次出现且后文会频繁缩写时，是否补了英文全称
- 句子是否适合中文读者连续阅读，是否仍带明显工作底稿腔

## 11. 给后续 topic 的复用方法

对任何一个新的 `round3_topicN`，执行顺序固定为：

1. 先做 `Stage 0-2`
2. 再做 `Stage 3-4`
3. 再做 `Stage 5-6`
4. 最后做 `Stage 7-9`

不要跳过前面的收束步骤直接写主报告。

如果 topic 材料很重，重点加在：

- Stage 3: stable claims extraction
- Stage 4: boundary lock
- Stage 6: evidence map

如果 topic 材料很轻，重点加在：

- Stage 0: inventory
- Stage 2: material grading
- Stage 7: main report assembly

## 12. 这份模板真正要守住的东西

这份模板最重要的不是格式，而是下面这套纪律：

- 把研究材料变成 final，不等于把材料复制一遍
- 把 topic 写成 final，不等于按 `00..NN` 顺序拼起来
- 一份真正合格的 final，必须先经过：
  - 对象重写
  - 边界收窄
  - claim 抽取
  - 证据映射
- 主报告与 supporting docs 的分流

如果这些步骤没做，再多内容也只是 research archive，不是 final report
