# 01 / skill-methodology-and-spec / Skill 方法论与规范接口

- `status`: `seed`
- `seed_files`:
  - `../_raw_idea/skill-engineering-research-plan.md`

- `current_hypothesis`:
  - Skill engineering 已经开始从“写 prompt 内容”转向“设计可复用、可发现、可治理的技能资产”，但方法论仍然分散。
  - 现阶段更可能存在若干事实标准和结构共识，而不是完整统一的官方标准。
  - 官方样板、社区 skill 仓库、工程化工具之间，可能共同定义了一个隐含接口层。

- `why_it_matters`:
  - 如果不先澄清 skill 的定义、边界和结构共识，后续对工具链和候选项目的比较会失真。
  - 最终要落到自己的 skill workflow，就必须先知道哪些约定值得固化，哪些只是个别仓库习惯。

- `must_answer`:
  - 在 coding agent 语境下，什么才能算一个可复用的 skill，而不只是提示词片段、规则文件或示例 recipe。
  - 当前主流 skill 结构通常由哪些组成部分构成，例如说明、触发条件、步骤、元数据、安装入口、分发信息。
  - 哪些结构约定是跨项目重复出现的事实共识，哪些只是单个生态或仓库私有格式。
  - “可发现性”和“可执行性”为什么会被视为 skill 质量的一部分，而不只是附加属性。
  - 是否已经存在可迁移的方法论框架，能指导 skill 的编写、组织、审计和复用。

- `non_goals`:
  - 不直接评估某个具体项目是否应进入前 3。
  - 不在本 topic 内做社区热度排序或采用判断。

- `expected_output_shape`:
  - 一份关于 skill 定义、结构要素、事实标准和方法论分层的稳定框架。
  - 一组后续 topic 共用的术语和判断口径。
