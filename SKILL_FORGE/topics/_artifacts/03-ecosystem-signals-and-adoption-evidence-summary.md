# 03 / 生态信号、可信度与采用判断 / Evidence Summary

- `status`: `in_progress`
- `wave`: `Wave 2 / limitation and difference slice in progress`
- `doc_count`: `13`
- `current_focus`: `在“容易发现”之上，继续补独立效果证据、clone / security / quality 反证，以及第三方教学层。`

## 本轮新增证据栈

- `03-ecosystem-signals-and-adoption-github-changelog-agent-skills.md`
  - GitHub 已把 Agent Skills 作为正式产品能力推到 changelog 层。
- `03-ecosystem-signals-and-adoption-vercel-changelog-open-ecosystem.md`
  - Vercel 已把目录、安装和统计作为开放生态公开发布。
- `03-ecosystem-signals-and-adoption-vercel-kb-learning-leverage.md`
  - 官方 guide 直接把借鉴现成 skill 与持续实验视为高杠杆路径，同时要求像审查代码一样审查 skill。
- `03-ecosystem-signals-and-adoption-skills-sh-directory-signals.md`
  - 目录站已经公开暴露多 agent 支持、Official / Audits / Docs 入口与 `91623` 规模字段。
- `03-ecosystem-signals-and-adoption-npm-skills-cli-adoption.md`
  - `skills` CLI 的最近一月下载量达到 `2879420`，分发层已有强信号。
- `03-ecosystem-signals-and-adoption-awesome-copilot-repo-signals.md`
  - GitHub 官方社区聚合层已具备大规模学习入口特征。
- `03-ecosystem-signals-and-adoption-vercel-skills-repo-signals.md`
  - 生态工具链层同时暴露增长信号与治理压力。
- `03-ecosystem-signals-and-adoption-vercel-agent-skills-repo-signals.md`
  - 官方样板库不仅存在，而且仍在持续修订。
- `03-ecosystem-signals-and-adoption-skill-forge-repo-signals.md`
  - 方法论 / 治理型项目可能值得跟踪，但公共采用信号仍薄。
- `03-ecosystem-signals-and-adoption-trust-boundaries.md`
  - 共享 skill 的安全边界需要独立判断，不能和发现便利度混为一谈。
- `03-ecosystem-signals-and-adoption-independent-effectiveness-benchmark.md`
  - 补上 public skills 平均收益有限、版本与上下文不匹配会伤害结果的独立 benchmark。
- `03-ecosystem-signals-and-adoption-clone-security-and-quality-risks.md`
  - 补上 clone inflation、结构性安全弱点与 validation / quality 脱钩证据。
- `03-ecosystem-signals-and-adoption-third-party-tutorial-layer.md`
  - 补上生态已形成外部教学层与成长入口的 secondary evidence。

## 当前最稳的判断

- 现成 skill 的发现成本确实已经显著下降，这不是错觉，而是目录站、社区聚合站、CLI 分发层共同作用的结果。
- “借鉴别人 skill 再通过反复实验转成自己的经验”已经有很强的现实基础，不再只是个人经验之谈。
- 可信度判断必须至少拆成四层:
  - 官方产品 / 官方文档认可
  - 官方或大平台名下的样板 / 生态仓库维护信号
  - 分发与安装调用信号
  - 社区聚合与学习入口信号
- `learning value` 与 `engineering maturity` 不能混为一谈:
  - 某对象可能极适合学习，但还不适合重押采用
  - 某对象可能分发面很大，但仍需要更严的安全审查
- 第二轮之后可以更稳地说:
  - `好找` 是真的
  - `能学到东西` 也是真的
  - 但 `能直接提升任务效果且可放心部署` 远远不是自动成立

## 当前机制理解

- 目录站、聚合站和样板库降低的是“进入生态”和“观察模式”的成本。
- 官方样板库和高活跃仓库降低的是“少走明显弯路”的成本。
- 真正决定能不能直接采用的，仍然是来源可信度、权限边界、脚本可审计性与持续维护情况。
- 第二轮新增的关键机制判断是:
  - adoption signal 至少要拆成 `discovery`、`learning`、`trust`、`effectiveness`
  - clone inflation 会放大“看起来很多”的错觉
  - validation 与表面结构质量无法替代任务级评测

## 当前缺口

- 还缺把这些独立反证映射回具体候选对象的 scorecard，才能真正进入排序阶段。
- 还缺更细的“哪些对象适合学、哪些对象适合装、哪些对象只适合拆开看”的分级口径。
- 还没有把“学习入口推荐”和“工程基座推荐”正式拆成最终排名口径。
