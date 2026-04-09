# superpowers: Test-Driven Development Skill (Hard Enforcement via "Iron Law")

- source_url: https://github.com/obra/superpowers/blob/917e5f53b16b115b70a3a355ed5f4993b9f8b73d/skills/test-driven-development/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: 这是“能力单元=改变行为约束”的典型样本：不是提醒 TDD，而是宣称“先写 failing test，否则删除 production code 重来”，把开发控制流重排为 RED→GREEN→REFACTOR。
- claims_supported:
  - “强制 TDD”与“不可跳步”比软提示更能抵抗模型急躁与幻觉
  - “必须观察到 test fail”是验证测试有效性的机制性约束
  - 将验证步骤写成必经关卡，可以形成可迁移的调试/构建闭环
- date_scope: as of git commit 917e5f53b16b115b70a3a355ed5f4993b9f8b73d (2026-04-06)
- related_frameworks: superpowers
- related_tools: (varies by host; skill is instruction-level)

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/superpowers
- commit: 917e5f53b16b115b70a3a355ed5f4993b9f8b73d
- file_path: skills/test-driven-development/SKILL.md

## 关键事实

- 明确提出 “Iron Law”：没有 failing test 前禁止写 production code；如果写了则必须删除并重来。
- RED/GREEN/REFACTOR 的每一步都要求“验证”：
  - RED：必须运行测试并确认以预期方式失败（fail not error）
  - GREEN：必须运行测试并确认通过且不引入其他失败
- 明确反对“先写实现再补测试”，理由是“测试立即通过证明不了它在测对东西”。

## 与本研究的关系

- 直接支撑 digested_cap/02 对“强制闭环改变模型习惯”的判断：它把 TDD 作为流程门禁，而非建议。
- 也是“能力单元机制层 vs prompt 文本层”的分界例子：如果宿主能对步骤进行自动检查/回滚，将进一步增强确定性。

## 可直接引用的术语 / 概念

- “NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST”
- “Red-Green-Refactor”
- “MANDATORY. Never skip.”

## captured_excerpt

摘录（来自 `skills/test-driven-development/SKILL.md`）：

> “NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST”
>
> “Write code before the test? Delete it. Start over.”

## 风险与局限

- 该技能以“强语言约束”改变行为，但若缺少宿主侧的自动化检查（例如禁止落盘/禁止提交），仍可能被 agent 选择性忽略。
- 在大型遗留系统或缺少测试基建时，严格 TDD 可能导致节奏显著变慢，需要结合 Nyquist/Wave 0 脚手架策略。

