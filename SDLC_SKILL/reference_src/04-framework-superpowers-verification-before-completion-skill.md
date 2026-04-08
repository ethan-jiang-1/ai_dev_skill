# obra/superpowers: `verification-before-completion` skill (`SKILL.md`)

- source_url: https://github.com/obra/superpowers/blob/main/skills/verification-before-completion/SKILL.md
- source_type: official_repo_skill
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这是 Superpowers 把“防虚假完成/防漏验证”写成强制 gate 的机制证据：要求在任何“完成/修复/通过”等成功声明前必须运行验证命令并以输出作为证据。它把工程可靠性约束落到可操作的步骤与禁令上。

## Key Facts

- 明确给出不可违背的规则（Iron Law）：没有“新鲜的验证证据”就不能做任何完成/通过/修复等成功声明。（Ref: SKILL.md）
- 定义 gate function 的强制步骤：识别证明命令 -> 运行完整命令 -> 阅读完整输出/exit code -> 判断是否支持声明 -> 仅在此之后才能做成功声明。（Ref: SKILL.md）
- 给出常见失败类型映射：例如 “tests pass” 需要 0 failures 的测试输出；“bug fixed” 需要复现原始症状并通过等。（Ref: SKILL.md）
- 规定适用范围：在 commit/PR/task completion/转下一任务/表达满意 等场景前都应使用该 skill。（Ref: SKILL.md）

## Claims Supported

- “Superpowers 通过验证 gate 把 ‘Evidence before claims’ 作为强制流程约束，直接对抗 agent 的‘过早宣称完成’失败模式。”（主题 4 framework；机制/失败模式）

## Captured Excerpts (keep short)

> NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE

## Terms / Concepts

- verification gate
- evidence before claims
- fresh verification evidence

## Risks / Limits

- 该 skill 是规范性流程约束；在宿主缺少强制执行/审计机制时，仍依赖 agent 是否遵循与团队是否用其作为门禁。

