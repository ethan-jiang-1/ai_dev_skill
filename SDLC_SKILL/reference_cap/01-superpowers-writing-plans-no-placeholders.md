# superpowers: Writing Plans (No Placeholders, Atomic Steps, Explicit Paths/Commands)

- source_url: https://github.com/obra/superpowers/blob/917e5f53b16b115b70a3a355ed5f4993b9f8b73d/skills/writing-plans/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 01-planning
- trust_level: official
- why_it_matters: 该技能把“计划文档”定义为可交给零上下文工程师执行的协议，强调无占位符、原子步骤、显式文件路径/命令/预期输出与频繁 commit。这是把“计划可执行性”做成机制约束的直接样本。
- claims_supported:
  - 计划必须细到可验证的原子步骤（含 test/command/expected output）
  - “No placeholders”可显著减少 agent 执行时的猜测空间与偷懒式省略
  - 计划结构显式绑定 TDD 与频繁 commit，有利于回滚与审计
- date_scope: as of git commit 917e5f53b16b115b70a3a355ed5f4993b9f8b73d (2026-04-06)
- related_frameworks: superpowers
- related_tools: git worktrees (suggested), TDD, subagent-driven execution

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/superpowers
- commit: 917e5f53b16b115b70a3a355ed5f4993b9f8b73d
- file_path: skills/writing-plans/SKILL.md

## 关键事实

- 强制要求先写计划再动代码；计划应假设执行者“零上下文且品味存疑”，因此必须把必要信息写全。
- 规定计划保存路径与命名规范：`docs/superpowers/plans/YYYY-MM-DD-<feature-name>.md`。
- 强调“bite-sized task granularity”：每步 2-5 分钟，典型序列为：写 failing test → 跑到 fail → 写最小实现 → 跑到 pass → commit。
- 提供任务模板：明确 Create/Modify/Test 的具体文件路径，并在计划中包含 test 命令与预期失败信息。
- “No Placeholders”列出禁止项：TBD/TODO/“add validation”/“write tests”但不给测试代码/“similar to task N”等。
- Self-Review checklist：spec coverage、placeholder scan、type consistency。

## 与本研究的关系

- 为 round2_cap/01 的“计划必须绑定验证”提供具体写法模板。
- 与 GSD 的 Plan Checker/Nyquist 配合时，可形成“计划写法规范 + 自动检查”的双层防线。

## 可直接引用的术语 / 概念

- “No Placeholders”
- “Each step is one action (2-5 minutes)”
- “Exact file paths always”

## captured_excerpt

摘录（来自 `skills/writing-plans/SKILL.md`）：

> “No Placeholders … never write: ‘TBD’, ‘TODO’, … ‘Write tests for the above’ (without actual test code)”

## 风险与局限

- 对计划粒度要求很高，可能导致“计划写得太长”；需要与 AGENTS.md 研究结论结合，找到“最小但足够”的粒度。
- 模板偏代码实现视角，对安全/合规/性能等非功能性约束需要额外模板支持（与 Nyquist/ASVS 等对接）。

