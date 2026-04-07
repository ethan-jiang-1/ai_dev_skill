# SDLC Agent Skill Deep Research 并行执行方案

## 结论

这件事更适合并行，不适合串行。

原因很直接：

- 串行会让搜索、分析、筛选互相阻塞
- 每做完一段都要重新装载上下文，agent 很容易漂移
- 你真正想要的是更快扩大样本池，同时更快形成可落地 shortlist

所以正确姿势不是“先做方向 1，再做方向 2，再做方向 3”，  
而是：

- 三个方向同时开跑
- 中间只通过统一字段交换结果
- 最后回收到一张总表和一份 shortlist

## 并行结构

建议把研究拆成三个并行线程：

### Thread A：来源扫描

职责：

- 找 marketplace
- 找 GitHub 框架、工具集、组织仓库
- 找宿主生态里的 skills / plugins / workflows 入口
- 扩充候选池

产出重点：

- 新来源
- 新候选对象
- 来源可信度
- 来源密度

不要做：

- 不要深挖 skill 内部设计
- 不要过早做最终优先级

### Thread B：能力拆解

职责：

- 分析候选对象到底提供什么 skill-like 单元
- 标记 SDLC 覆盖面
- 分析它解决什么 agent 失控问题
- 识别值得复刻的设计模式

产出重点：

- skill 单元
- SDLC 阶段
- problem solved
- reusable unit

不要做：

- 不要继续发散找来源
- 不要沉迷社区热度比较

### Thread C：落地筛选

职责：

- 判断是否真能拿下来使用
- 看安装成本、迁移成本、维护负担
- 判断是直接采用、局部摘取还是只作参考
- 形成 Top N shortlist

产出重点：

- install entry
- dependency weight
- portability
- evidence of real use
- recommended action

不要做：

- 不要扩张候选池
- 不要替代 Thread B 去做细颗粒度能力分类

## 三线程怎么衔接

并行不等于完全独立。  
最好的方式是“一张共享候选表 + 三个线程各写自己字段”。

建议流程：

1. Thread A 先快速灌入候选对象
2. Thread B 从候选表里挑高价值对象做能力拆解
3. Thread C 从候选表里挑可安装对象做落地筛选
4. 三边持续回填同一套字段
5. 最后按 `recommended_action` 和 `reusable_unit` 汇总

这样不是串行，而是带有轻度依赖的并行。

## 统一主键

为了方便合并，每个对象最好固定用下面的主键：

- `name`
- `repo_or_package_url`
- `host_ecosystem`

如果三条线程都围绕这三个主键回填，就不会在合并时出现：

- 同一个项目被记成三种名字
- 一个仓库和它的 marketplace 页面被误当成两个对象
- 相同 skill 被重复统计

## 建议共享字段

每个线程都写入同一张表，字段如下：

- `name`
- `repo_or_package_url`
- `source_channel`
- `host_ecosystem`
- `artifact_type`
- `sdlc_stage`
- `problem_solved`
- `reusable_unit`
- `install_entry`
- `dependency_weight`
- `portability`
- `evidence_of_real_use`
- `community_signal`
- `recommended_action`
- `notes`

其中可以按线程分工：

- Thread A 主要填：`source_channel` `host_ecosystem` `artifact_type` `community_signal`
- Thread B 主要填：`sdlc_stage` `problem_solved` `reusable_unit`
- Thread C 主要填：`install_entry` `dependency_weight` `portability` `evidence_of_real_use` `recommended_action`

## 最后的合并出口

最后不要输出三份平行笔记，而是回收到两个总出口：

### 出口 1：总表

作用：

- 保留全量候选池
- 能回看来源、能力、落地性
- 方便后续继续增量研究

### 出口 2：shortlist

只保留最值得处理的对象，建议分四类：

- 直接使用
- 拆出迁移
- 值得观察
- 放弃

这样最后的研究结果就不会只是“知道很多”，而是“能决定下一步拿什么”。

## 并行研究时最重要的约束

如果你要三线并行，真正要管住的是这三件事：

- 纳入标准一致
- 字段定义一致
- 结论粒度一致

否则三条线程最后会变成：

- 一条在线找链接
- 一条在线聊方法论
- 一条在线写主观点评

最后根本拼不起来。

## 最实用的理解方式

你可以把它理解成一个漏斗：

- Thread A 负责把漏斗口做大
- Thread B 负责识别哪些东西真的有 skill 价值
- Thread C 负责把可用的东西真正筛出来

这就是并行，但不是混乱并行。

## 推荐执行法

如果要马上开跑，我建议这样做：

1. 先定义统一字段和纳入标准
2. 同时启动三个 direction
3. 每个 direction 只回答自己的主问题
4. 中途不要求一次性写完整报告，只要求持续回填共享表
5. 最后再统一生成总结与 shortlist

这会比串行做三份 Deep Research 省事很多，也更符合 agent 的工作方式。
