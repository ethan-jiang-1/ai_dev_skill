# 02 / skill-toolchain-and-lifecycle / Skill 工程化工具链与生命周期

- `status`: `seed`
- `seed_files`:
  - `../_raw_idea/skill-engineering-research-plan.md`
  - `../_raw_idea/github_skill-forge.md`

- `current_hypothesis`:
  - 当前生态里的候选对象大多只覆盖 skill 生命周期的一段，很少有单一项目能覆盖从编写到治理、分发和评估的全链路。
  - 最有价值的基座项目，不一定是“内容最多”的仓库，而是能把 skill 变成可工程化交付物的工具链或 pipeline。
  - 对 coding agent 场景来说，后处理审计、装载兼容、分发治理，可能比“帮你生成 skill 内容”更稀缺。

- `why_it_matters`:
  - 原计划最核心的问题之一，就是哪些对象真的在降低 skill 打磨、复用、发布成本。
  - 如果不先拆清楚各项目覆盖 skill 生命周期的哪一段，后续的横向对比和推荐会把不同类型对象混在一起。

- `must_answer`:
  - Skill 生命周期应该如何稳定拆分，例如编写、组织、触发、装载、治理、发布、分发、评估。
  - 每类候选对象本质上是什么，例如内容库、样板仓库、加载器、审计器、registry、pipeline，还是组合方案。
  - 哪些项目真正降低了交付成本，哪些项目只是提供了结构参考或内容示例。
  - 对多平台 agent 环境来说，哪些能力最接近“基座能力”，例如标准化、校验、安全门槛、安装分发、兼容层。
  - 最终更可能出现单一基座胜出，还是多工具组合更合理。

- `non_goals`:
  - 不在本 topic 内给出最终推荐名次。
  - 不把社区采用度本身当作主要判断标准，那属于另一个 topic。

- `expected_output_shape`:
  - 一份可复用的 skill 生命周期分解框架。
  - 一套用来分析候选项目职责边界、强弱项和工程定位的统一模板。
