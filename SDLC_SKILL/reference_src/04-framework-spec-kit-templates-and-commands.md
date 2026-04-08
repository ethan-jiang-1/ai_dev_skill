# github/spec-kit: Templates + Command Contracts (`templates/`)

- source_url: https://github.com/github/spec-kit/tree/main/templates
- source_type: official_repo_assets
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: README 之外的“机制实现级证据”。`templates/` 同时包含工件模板（spec/plan/tasks/checklist/constitution）与 `/speckit.*` 命令的执行契约（含 scripts、handoffs、extension hooks、gate/checklist 检查）。它展示 Spec Kit 如何把 spec-driven development 落成可执行的流程与可版本控制的工件链路。

## Key Facts

- `templates/spec-template.md` 把 “User Scenarios & Testing” 标记为 mandatory，并要求 user story 按优先级组织、每条 story 独立可测试（单独实现也应能交付 MVP slice）。（Ref: `templates/spec-template.md`）
- `templates/plan-template.md` 明确实现计划会引用 spec 文件，并在 Phase 0 research 前设置 “Constitution Check” gate，要求在研究/设计阶段前后复核 gates。（Ref: `templates/plan-template.md`）
- `templates/tasks-template.md` 要求 tasks 按 user story 分组并显式标注并行能力 `[P]`，同时强调 foundational phase 会阻塞所有 user story；并给出 “tests (optional) but if included must be written first and fail before implementation” 的强约束提示。（Ref: `templates/tasks-template.md`）
- `templates/checklist-template.md` 明确 checklist 由 `/speckit.checklist` 基于 spec/plan/tasks 上下文生成，并要求用实际项目条目替换 sample items。（Ref: `templates/checklist-template.md`）
- `/speckit.specify` 命令模板（`templates/commands/specify.md`）定义：
  - 在生成 spec 前检查 `.specify/extensions.yml` 的 `hooks.before_specify`（支持 optional/mandatory hooks；condition 表达式不在此处求值）。（Ref: `templates/commands/specify.md`）
  - 自动创建 feature spec 目录（默认 `specs/<prefix>-<short-name>`）并写入 `spec.md`；同时把 resolved feature dir 持久化到 `.specify/feature.json` 以供下游命令复用。（Ref: `templates/commands/specify.md`）
  - 规范化澄清策略：最多保留 3 个 `[NEEDS CLARIFICATION]` 标记，并对剩余不确定性做合理默认假设。（Ref: `templates/commands/specify.md`）
  - 在生成 spec 后自动生成 “Specification Quality Checklist” 并对 spec 做自检，必要时迭代修正。（Ref: `templates/commands/specify.md`）
- `/speckit.plan` 命令模板（`templates/commands/plan.md`）定义：
  - 通过脚本 `{SCRIPT}`（bash/powershell）setup 规划工作区并产出 FEATURE_SPEC/IMPL_PLAN 等路径信息。（Ref: `templates/commands/plan.md`）
  - 产出 research.md、data-model.md、contracts/、quickstart.md 等设计工件，并通过 agent script 更新 agent-specific context。（Ref: `templates/commands/plan.md`）
  - 同样支持 `.specify/extensions.yml` 的 before/after hooks。（Ref: `templates/commands/plan.md`）
- `/speckit.implement` 命令模板（`templates/commands/implement.md`）定义：
  - 运行前检查 feature 目录下的 checklists/ 完成度；若存在未完成 checklist，会要求用户确认是否继续实施。（Ref: `templates/commands/implement.md`）
  - 强制以 tasks.md + plan.md 为实现上下文，按 phase/dependency 执行 tasks，并要求完成任务后把 tasks 标记为 `[X]`。（Ref: `templates/commands/implement.md`）
  - 在实现前包含“项目忽略文件”的检测与创建/补全逻辑（.gitignore/.dockerignore/.eslintignore 等），强调工程化落地细节。（Ref: `templates/commands/implement.md`）

## Claims Supported

- “Spec Kit 的治理不是抽象理念，而是通过模板化工件与命令契约把 gates/checklists/hooks/工件产出变成默认执行路径。”（主题 4 framework；机制）
- “Spec Kit 把扩展机制纳入执行契约（`.specify/extensions.yml` hooks），但将 condition 解释留给 HookExecutor，体现了框架在可扩展性与治理边界上的显式分层。”（主题 4 framework；扩展生态/责任边界）

## Captured Excerpts (keep short)

> User Scenarios & Testing *(mandatory)*

## Terms / Concepts

- spec directory (`specs/<prefix>-<short-name>`)
- `.specify/feature.json`
- constitution check gate
- tasks grouped by user story; `[P]` parallel marker
- `.specify/extensions.yml` hooks (optional/mandatory)
- checklists gating before implement

## Risks / Limits

- 这些是命令模板与流程契约；是否“强制执行”取决于宿主/CLI 对命令模板的实际执行方式，以及团队是否把 checklist/gate 作为流程门禁。

