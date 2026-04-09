# gstack: /plan-eng-review (Scope Challenge, Search-First, Completeness, Coverage Diagram)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/plan-eng-review/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: /plan-eng-review 把“工程层面的计划审查”拆成可复用协议：Step 0 的 scope/复杂度挑战、Search Before Building、Completeness 偏好、Distribution check，以及 Test review 的 coverage diagram/回归测试铁律。这些都是把“为什么这样设计”落到工程门禁的机制证据。
- claims_supported:
  - 计划评审可通过 checklist + 交互式 gate 显式化（而非靠“自审”）
  - “Search before building”与 built-in/pitfalls 检索可降低重复造轮子与踩坑概率
  - 以 coverage diagram 方式把“测试覆盖”从口号变为可审计产物
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: AskUserQuestion, WebSearch, git

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: plan-eng-review/SKILL.md

## 关键事实

- Step 0: Scope Challenge 中显式规定：
  - 最小变更集（scope creep 挑战）
  - complexity smell（>8 files 或 >2 new classes/services 触发）
  - Search check（built-in / best practice / pitfalls）
  - Completeness check（100% coverage、全 edge cases）
  - Distribution check（新 artifact 需要 build/publish pipeline，否则必须显式标注不在 scope）
- Review sections 强调逐段审查（Architecture → Code Quality → Tests → Performance），并要求“一次一个 issue 的 AskUserQuestion”。
- Test review 以“diagram every codepath + branch + error path + user flow”的方式构建 coverage diagram，并宣称“100% coverage is the goal”。
- 对回归有 “IRON RULE”：发现回归必须加入 regression test，不走 AskUserQuestion，不允许跳过。

## 与本研究的关系

- 为 digested_cap/01 与 digested_cap/02 提供“计划阶段绑定验证/测试”的机制样本，可与 GSD 的 Nyquist 形成对照（Nyquist 更偏 requirements→tests 映射，plan-eng-review 更偏 codepath/userflow 覆盖图）。

## 可直接引用的术语 / 概念

- “Search check”
- “Completeness check”
- “Distribution check”
- “100% coverage is the goal”
- “IRON RULE … regression test”

## captured_excerpt

摘录（来自 `plan-eng-review/SKILL.md`）：

> “100% coverage is the goal.”
>
> “IRON RULE: … a regression test is added … No skipping.”

## 风险与局限

- 该技能偏“完整性最大化”，迁移到企业环境需增加“风险分级/变更类型”来决定覆盖深度，避免过度流程化拖慢。
- coverage diagram 的产出质量依赖执行者对代码流/用户流的理解；需要配合工具化（覆盖率/静态分析/trace）做落地校验。

