# Skill Engineering Research Topic Registry

这份 registry 的目的，是把原始 seed 计划拆成可独立开展 Deep Research 的主题文件。

当前拆分不是执行计划本身，而是 round-1 的正式研究拓扑。

主 seed 文件：

- `../_raw_idea/skill-engineering-research-plan.md`

新增 formalized topic 来源：

- `../_raw_idea/skill-continuous-optimization.md`

拆分原则：

- 不按 `P1-P5` 直接拆，因为那是执行阶段，不是研究主题
- 不把 `_raw_idea` 路径误当成“低优先级附录”，而是按研究语义判断是否应升级为正式 topic
- 当前按四层结构拆：方法与规范、工程链路、生态验证、持续优化闭环
- 每个 topic 都必须能独立形成一轮 Deep Research 输入

当前 topic 数量：`4`

## Topic List

- `01` / `skill-methodology-and-spec` / Skill 方法论与规范接口
  - file: `01-skill-methodology-and-spec.md`
  - focus: Skill engineering 是否已经形成可迁移的方法论、结构共识与事实标准

- `02` / `skill-toolchain-and-lifecycle` / Skill 工程化工具链与生命周期
  - file: `02-skill-toolchain-and-lifecycle.md`
  - focus: 哪些项目真正覆盖 skill 生命周期，并降低编写、装载、治理、发布成本

- `03` / `ecosystem-signals-and-adoption` / 生态信号、可信度与采用判断
  - file: `03-ecosystem-signals-and-adoption.md`
  - focus: 哪些候选对象值得持续跟踪、直接采用，哪些只适合作为参考样板

- `04` / `skill-optimization-and-feedback-loops` / Skill 持续优化、评测闭环与反馈回流
  - file: `04-skill-optimization-and-feedback-loops.md`
  - focus: Skill 发布后如何基于失败样本、评测、回放与反馈闭环持续精调，并优先从 `skill-forge` 这类 skill artifact 级优化对象切入，而不退化成单纯 prompt tuning

## Mapping From Original Plan

- `P1 建立候选池` 主要服务于 `02` 和 `03`
- `P2 工程能力拆解` 主要服务于 `02`
- `P3 社区信号验证` 主要服务于 `03`
- `P4 横向对比与排序` 依赖 `02 + 03`，并会受到 `04` 对持续优化能力判断的反向影响
- `P5 推荐结论与落地建议` 依赖 `01 + 02 + 03 + 04` 的最终收束
- `04` 额外承接原始计划中此前未被显式 formalize 的问题：skill 发布后的 failure taxonomy、eval loop、feedback-driven revision 和 human-in-the-loop optimization

## Topology Note

- `skill-continuous-optimization.md` 已按 `V6` 的 `Topology Formalization Gate` 判定为 `new_topic`
- 当前 registry 已完成同步，不再把这条线视为局部补段

## Usage Note

下一步如果要基于 `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V6.md` 继续实例化或重开计划，这个目录可以直接作为 `SEED_DIR` 使用。
