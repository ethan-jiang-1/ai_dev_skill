# 02 / Skill 工程化工具链与生命周期 / Evidence Summary

- `status`: `in_progress`
- `wave`: `Wave 1 / first topic-specific slice complete`
- `doc_count`: `8`
- `current_focus`: `固定 lifecycle 分段，并把 installer / sample / governance / runtime / library manager 的边界拆清。`

## 本轮新增证据栈

- `02-skill-toolchain-and-lifecycle-github-loader-paths-and-scope.md`
  - 固定 project scope / personal scope 与 loader 路径语义。
- `02-skill-toolchain-and-lifecycle-skills-cli-manager-role.md`
  - 确认 `skills` 的核心职责是 installer / manager / compatibility layer。
- `02-skill-toolchain-and-lifecycle-agent-skills-sample-library-role.md`
  - 确认 `vercel-labs/agent-skills` 的核心职责是 sample library，而不是治理层。
- `02-skill-toolchain-and-lifecycle-skill-forge-governance-pipeline-role.md`
  - 确认 `skill-forge` 更接近 post-authoring governance / publish pipeline。
- `02-skill-toolchain-and-lifecycle-open-skills-local-runtime-bridge.md`
  - 确认 `open-skills` 代表本地 runtime bridge / execution adapter 层。
- `02-skill-toolchain-and-lifecycle-ai-agent-skills-library-manager.md`
  - 确认 `Ai-Agent-Skills` 代表 curated library manager / workspace manager 层。
- `02-skill-toolchain-and-lifecycle-skills-vs-agents-md-boundary.md`
  - 固定了 skills 与 `AGENTS.md` 的对象边界。
- `02-skill-toolchain-and-lifecycle-lifecycle-segmentation-and-combination-baseline.md`
  - 形成第一版 lifecycle segmentation 与组合式 baseline 草案。

## 当前最稳的判断

- 当前生态里最容易被混淆的不是“有没有工具”，而是“这些工具各自负责哪一段工程工作”。
- `vercel-labs/skills` 与 `Ai-Agent-Skills` 都涉及安装和管理，但前者更像通用 installer / manager，后者更像 curator-oriented library manager。
- `vercel-labs/agent-skills` 与 `skill-forge` 都有很高学习价值，但一个偏样板内容层，一个偏治理 / publish 层。
- `open-skills` 说明 lifecycle 里还存在独立的 runtime bridge / execution adapter 层，不能简单塞进 installer。

## 当前机制理解

- lifecycle 至少已经分化出:
  - loader placement
  - sample library
  - install / manager
  - library management
  - runtime bridge
  - governance / publish
  - registry / directory
- 如果目标是尽快形成自己的 skill workflow，最像 baseline 的不是单一仓库，而是多层组合。

## 当前缺口

- 还缺更多真实限制与失败样本，来判断这些层之间的接口摩擦在哪里。
- 还缺更多对象，来验证 `library-manager` 与 `install-manager` 的边界是否稳定。
- 还没有把“最低可行组合”写成更具体的 workflow step-by-step baseline。
