# Skill Engineering Research Topic Registry

这份 registry 的目的，是把原始 seed 计划拆成可独立开展 Deep Research 的主题文件。

当前拆分只做 topic decomposition，不执行研究，不产出排序结论。

主 seed 文件：

- `../_raw_idea/skill-engineering-research-plan.md`

拆分原则：

- 不按 `P1-P5` 直接拆，因为那是执行阶段，不是研究主题
- 按三层结构拆：方法与规范、工程链路、生态验证
- 每个 topic 都必须能独立形成一轮 Deep Research 输入

当前 topic 数量：`3`

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

## Mapping From Original Plan

- `P1 建立候选池` 主要服务于 `02` 和 `03`
- `P2 工程能力拆解` 主要服务于 `02`
- `P3 社区信号验证` 主要服务于 `03`
- `P4 横向对比与排序` 依赖 `02` 和 `03` 的综合
- `P5 推荐结论与落地建议` 依赖 `01 + 02 + 03` 的最终收束

## Usage Note

下一步如果要基于 `DEEP_RESEARCH_PROGRESSIVE_PLAN_TEMPLATE_V4.md` 开始实例化计划，这个目录可以直接作为 `SEED_DIR` 使用。
