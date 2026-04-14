# Fission-AI/OpenSpec: README

- source_url: https://github.com/Fission-AI/OpenSpec
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: OpenSpec 明确以 brownfield（老系统增量改造）为主要场景，并把每次变更固化为 proposal/specs/design/tasks 的工件包，通过 `/opsx:*` 命令驱动“提案-实施-归档”的可审计流，是研究“增量规约/制品导向”治理抽象的高密度一手样本。

## Key Facts

- 哲学与适用面：README 用 “fluid not rigid / iterative not waterfall / built for brownfield not just greenfield” 等原则定位其工作流，明确强调非瀑布、可迭代、可扩展到团队/企业。
- 工件化工作流：README 给出示例：`/opsx:propose <change>` 会创建变更目录并产出 `proposal.md`、`specs/`、`design.md`、`tasks.md`；随后 `/opsx:apply` 执行任务；`/opsx:archive` 归档并更新 specs，为下一次变更做准备。
- 分发与更新：README 给出全局 CLI 安装（npm）与项目初始化（`openspec init`），并提供 `openspec update` 用于刷新 agent 指令与激活最新 slash commands。
- 多工具支持：README 指向 `docs/supported-tools.md` 并宣称支持 20+ tools，并提供扩展工作流 profile 选择（`openspec config profile` + `openspec update`）。
- 对比口径：README 在“vs Spec Kit / vs Kiro”部分给出定位差异（强调更轻、更可自由迭代）。
- 其它治理点：README 提到匿名遥测（只收集 command names 与版本；可通过环境变量 opt-out）。

## Claims Supported

- “Brownfield 增量改造”更适合工件包与 delta/change folder 的治理抽象，而不是一次性全局 spec。（主题4 framework）
- 框架通过将 proposal/specs/design/tasks 作为一等制品，使“对齐-实施-归档”成为可重复流程，降低长周期漂移。（主题4 framework）

## Captured Excerpts (keep short)

> built for brownfield not just greenfield

## Terms / Concepts

- artifact-guided workflow
- `/opsx:propose` / `/opsx:apply` / `/opsx:archive`
- change folder (`proposal.md`, `design.md`, `tasks.md`)
- `openspec update`

## Risks / Limits

- README 提供了典型路径与对比口径，但对“与不同宿主/IDE 的具体集成方式、产物目录规范”的细节，需要进一步抓取 docs（workflows/commands/concepts/supported-tools）。

