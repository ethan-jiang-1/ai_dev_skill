# gstack: ship/SKILL.md (Pre-flight Checks, Test/Review/PR Pipeline, Governance Prompts)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/ship/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: /ship 把“从本地完成到可交付 PR”的发布链条写成可执行工作流，并引入治理机制（proactive 开关、telemetry 选择、routing 注入、vendoring 迁移提示）。这类能力单元直接触达企业 SDLC 的控制点（测试、审查、发布）。
- claims_supported:
  - “Ship 不是 push 一下”，而是带 preflight/test/review/versioning/changelog/PR 的完整 pipeline
  - “治理提示”可以把安全/偏好（proactive/telemetry/routing）变成显式状态，而非隐式猜测
  - “文档/路由注入”属于持续改进机制，降低长期漂移
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: git, gh (PR), gstack-config, AskUserQuestion

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: ship/SKILL.md

## 关键事实

- 文件头部描述 /ship 的目标：合并 base branch、跑测试、review diff、更新 VERSION 与 CHANGELOG、提交、push、创建 PR。
- 该文件标记为“AUTO-GENERATED”，并给出再生成命令提示（文档防漂移机制）。
- Preamble 里包含大量确定性治理动作（节选）：
  - update check
  - session tracking（近期 session 计数）
  - telemetry 模式选择（community/anonymous/off）
  - proactive 行为开关（是否自动建议/自动触发 skill）
  - routing rules 注入 CLAUDE.md 的一次性提示
  - vendoring deprecated 提示并提供迁移到 team mode 的步骤
- 对 spawned session（被 orchestrator 拉起）有特殊规则：不使用交互式 AskUserQuestion、自动选推荐选项、跳过升级/遥测/路由等一次性提示，避免打断。

## 与本研究的关系

- 这是“审查/发布/运维”能力单元如何落到具体控制流的强证据：skill 不只是建议，而是带一整段 preamble+流程协议。
- 也提供了“治理选项显式化”的样本：把用户偏好与安全选择写成可持久化状态（config/marker files），减少跨会话不一致。

## 可直接引用的术语 / 概念

- “Pre-flight”
- “AUTO-GENERATED … do not edit directly”
- “proactive behavior”
- “telemetry”
- “routing rules”
- “vendoring is deprecated”

## captured_excerpt

摘录（来自 `ship/SKILL.md`）：

> “Ship workflow: detect + merge base branch, run tests, review diff … push, create PR.”
>
> “AUTO-GENERATED … do not edit directly”

## 风险与局限

- 大量治理逻辑依赖本地文件与命令可用性（`gh`、git 状态、权限）；企业环境需要适配内部 PR/CI 系统（GitLab/Bitbucket）。
- 文档中包含外部链接与一次性交互提示，迁移到企业版需替换为内网合规策略与统一配置通道。

