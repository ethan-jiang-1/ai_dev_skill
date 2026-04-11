# 02 / Skill 工程化工具链与生命周期 / Question List

- `status`: `in_progress`

## 已初步回答

- 生命周期该如何稳定拆成编写、装载、治理、发布、分发、评估
  - 当前至少可稳定拆出 `loader placement`、`sample library`、`install-manager`、`library-manager`、`runtime-bridge`、`governance-publish`、`registry-directory`。
- 哪些对象是 installer / loader，哪些是样板，哪些是治理工具
  - `vercel-labs/skills` 是 installer / manager。
  - `vercel-labs/agent-skills` 是 sample library。
  - `skill-forge` 是 governance / publish pipeline。
  - `open-skills` 是 local runtime bridge。
  - `Ai-Agent-Skills` 是 curated library manager。
- 单一基座与组合式工具链，哪种更符合当前生态现实
  - 当前更像组合式工具链更合理。

## 仍待补充

- 各层之间最常见的接口摩擦是什么，例如 install 之后如何 audit、audit 之后如何 publish
- 哪些对象真正覆盖了 evaluation / refresh / rollback 之类后续运维动作
- 多 agent 兼容到底是 installer 负责得更多，还是 library manager 负责得更多
- 什么样的组合最接近“自己可立即上手的一套 baseline”
