# GSD Reference: TDD Plan Type (One Feature per Plan, RED→GREEN→REFACTOR, 2-3 Atomic Commits)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/get-shit-done/references/tdd.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: 这是 GSD 对“如何在 agentic 执行中做 TDD”的官方规范：明确何时适合 TDD、TDD plan 的 frontmatter/type、RED/GREEN/REFACTOR 的 commit 模式、以及“一个 feature 一个 TDD plan”的粒度约束，避免把 TDD 退化为口号。
- claims_supported:
  - TDD 的价值在于设计质量与接口质量，而不仅是覆盖率
  - agentic TDD 需要更高上下文预算与更细粒度计划（2-3 execution cycles）
  - 通过 2-3 个原子 commits 把 TDD 纪律显式化，可审计可回滚
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: plan type=tdd, test frameworks, commit conventions

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_path: get-shit-done/references/tdd.md

## 关键事实

- 明确区分“适合 TDD”与“不适合 TDD”的任务类型，并给出 `expect(fn(input)).toBe(output)` 的启发式。
- 规定 TDD plan 的结构：frontmatter `type: tdd`，并要求 objective/context/feature/verification/success_criteria/output 等块。
- 明确执行流：
  - RED：写 failing test，必须 fail，commit `test(...)`
  - GREEN：写最小实现，必须 pass，commit `feat(...)`
  - REFACTOR：可选，保持 green，commit `refactor(...)`
- 强制粒度：一个 feature 一个 TDD plan；若 trivial 到可以 batch，建议直接跳过 TDD。
- 给出 test framework setup（当基建不存在时的 RED 阶段补齐策略）。

## 与本研究的关系

- 与 superpowers/TDD iron law 互证：同样强调“必须看见 fail 才能确定 test 在测对东西”，并把它协议化为计划模板与 commit 模式。

## 可直接引用的术语 / 概念

- “One feature per TDD plan.”
- “RED → GREEN → REFACTOR”
- “2-3 atomic commits”

## captured_excerpt

摘录（来自 `references/tdd.md`）：

> “If you can describe the behavior as `expect(fn(input)).toBe(output)` before writing `fn`, TDD improves the result.”

## 风险与局限

- 对 UI 与 glue code，TDD 的性价比较低；需要与任务类型路由配合，避免强制 TDD 拖慢整体节奏。

