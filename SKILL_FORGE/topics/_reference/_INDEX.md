# Wave 0 Shared Reference Index

> `accessed_at`: `2026-04-11`

## Shared Docs

- `00-shared-github-about-agent-skills.md`
  - category: `skill-definition-or-structure`
  - use: GitHub 对 skill 的定义、project/personal 存放位置、共享在线 skill 的官方认可

- `00-shared-github-create-agent-skills.md`
  - category: `skill-interface-or-loading-convention`
  - use: `SKILL.md` 事实结构、frontmatter 字段、脚本资源模型、`allowed-tools` 风险边界

- `00-shared-agents-md-home.md`
  - category: `skill-interface-or-loading-convention`
  - use: `AGENTS.md` 与 skill 的边界、层级优先级、repo-level agent context

- `00-shared-vercel-skills-cli.md`
  - category: `runtime-or-loader-compatibility`
  - use: installer / distribution / multi-agent compatibility / single source of truth

- `00-shared-vercel-agent-skills.md`
  - category: `official-or-semi-official-sample`
  - use: 高质量官方样板库的结构、`SKILL.md + scripts + references` 组织方式

- `00-shared-skill-forge-readme.md`
  - category: `audit-or-governance-tooling`
  - use: post-authoring、审计、发布、安全、discoverability、executability

- `00-shared-awesome-copilot-readme.md`
  - category: `comparison-or-adoption-analysis`
  - use: 社区聚合层、Learning Hub、third-party inspection 警告、成长加速器视角

- `00-shared-skills-sh-home.md`
  - category: `registry-or-marketplace-entry`
  - use: 目录站、统一安装命令、多 agent 生态入口、公开信号层

## Topic 03 Docs

- `03-ecosystem-signals-and-adoption-github-changelog-agent-skills.md`
  - category: `official-product-signal`
  - use: GitHub 已将 Agent Skills 作为正式产品能力公开发布

- `03-ecosystem-signals-and-adoption-vercel-changelog-open-ecosystem.md`
  - category: `official-ecosystem-signal`
  - use: Vercel 明确把发现、安装、统计与多 agent 兼容打包成开放生态

- `03-ecosystem-signals-and-adoption-vercel-kb-learning-leverage.md`
  - category: `learning-leverage-and-practice-guide`
  - use: 解释为什么借鉴现成 skill 能加速成长，以及为什么仍要保留审查纪律

- `03-ecosystem-signals-and-adoption-skills-sh-directory-signals.md`
  - category: `registry-or-marketplace-entry`
  - use: 目录站规模、Official / Audits / Docs 入口、多 agent 暴露信号

- `03-ecosystem-signals-and-adoption-npm-skills-cli-adoption.md`
  - category: `distribution-and-adoption-metric`
  - use: `skills` CLI 包与月下载量，证明分发层已出现显著调用

- `03-ecosystem-signals-and-adoption-awesome-copilot-repo-signals.md`
  - category: `community-hub-signal`
  - use: GitHub 官方社区聚合层的规模与近期维护信号

- `03-ecosystem-signals-and-adoption-vercel-skills-repo-signals.md`
  - category: `toolchain-and-governance-signal`
  - use: installer / ecosystem service 层的增长与治理压力

- `03-ecosystem-signals-and-adoption-vercel-agent-skills-repo-signals.md`
  - category: `official-sample-library-signal`
  - use: 官方样板库的规模、近期修订与学习价值

- `03-ecosystem-signals-and-adoption-skill-forge-repo-signals.md`
  - category: `emerging-project-signal`
  - use: 方法论 / 发布治理型项目的早期采用信号与边界

- `03-ecosystem-signals-and-adoption-trust-boundaries.md`
  - category: `limitation-risk-failure-mode`
  - use: 共享 skill 的权限、安全与污染风险边界

## Topic 02 Docs

- `02-skill-toolchain-and-lifecycle-github-loader-paths-and-scope.md`
  - category: `loader-placement-model`
  - use: project / personal scope 与多目录装载语义

- `02-skill-toolchain-and-lifecycle-skills-cli-manager-role.md`
  - category: `installer-manager`
  - use: `skills` CLI 的安装、更新、检查与兼容层职责

- `02-skill-toolchain-and-lifecycle-agent-skills-sample-library-role.md`
  - category: `sample-library`
  - use: 官方样板库的职责边界与结构角色

- `02-skill-toolchain-and-lifecycle-skill-forge-governance-pipeline-role.md`
  - category: `governance-publish`
  - use: post-authoring 治理、扫描、修复、发布层

- `02-skill-toolchain-and-lifecycle-open-skills-local-runtime-bridge.md`
  - category: `runtime-bridge`
  - use: 本地 / MCP runtime bridge 的对象类型

- `02-skill-toolchain-and-lifecycle-ai-agent-skills-library-manager.md`
  - category: `library-manager`
  - use: 团队 / 个人 curated skill library 的管理层

- `02-skill-toolchain-and-lifecycle-skills-vs-agents-md-boundary.md`
  - category: `object-boundary`
  - use: skills 与 `AGENTS.md` 的边界

- `02-skill-toolchain-and-lifecycle-lifecycle-segmentation-and-combination-baseline.md`
  - category: `cross-source-synthesis`
  - use: lifecycle 分段草案与组合式 baseline

## Coverage Check

- `skill-definition-or-structure`: covered
- `skill-interface-or-loading-convention`: covered
- `official-or-semi-official-sample`: covered
- `runtime-or-loader-compatibility`: covered
- `audit-or-governance-tooling`: covered
- `registry-or-marketplace-entry`: covered
- `limitation-risk-failure-mode`: covered via `00-shared-github-create-agent-skills.md` and `00-shared-skill-forge-readme.md`
- `comparison-or-adoption-analysis`: covered via `00-shared-awesome-copilot-readme.md` and `00-shared-skills-sh-home.md`
