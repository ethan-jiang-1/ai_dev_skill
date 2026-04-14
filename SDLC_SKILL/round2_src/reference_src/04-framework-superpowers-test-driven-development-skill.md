# obra/superpowers: `test-driven-development` skill (`SKILL.md`)

- source_url: https://github.com/obra/superpowers/blob/main/skills/test-driven-development/SKILL.md
- source_type: official_repo_skill
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这是 Superpowers 把 TDD（red-green-refactor）写成不可协商纪律的机制证据：要求实现代码之前必须先写并观察到失败测试；若先写了实现代码，必须删除重来。它把“防跑偏/防回归”从理念变成可执行门禁。

## Key Facts

- 给出不可违背的规则（Iron Law）：没有“先失败的测试”就不能写 production code；并要求“先写了实现则必须删除并重来”。（Ref: SKILL.md）
- 将流程固化为 Red-Green-Refactor：写最小失败测试（RED）-> 必须观察其失败 -> 写最小实现（GREEN）-> 必须观察其通过且不引入其它失败 -> 再重构。（Ref: SKILL.md）
- 使用范围明确覆盖：新特性、bug 修复、重构、行为变更；例外需要“问人类伙伴”。（Ref: SKILL.md）
- 强调验证步骤不可跳过（Verify RED / Verify GREEN 均标注为 mandatory），并列出常见“理性化借口”与反驳。（Ref: SKILL.md）

## Claims Supported

- “Superpowers 通过把 TDD 写成不可跳过的顺序门禁（先红后绿、验证不可省略），提升变更的可回归性与抗幻觉能力。”（主题 4 framework；机制）

## Captured Excerpts (keep short)

> NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST

## Terms / Concepts

- red-green-refactor
- verify RED / verify GREEN (mandatory)
- delete-and-rewrite discipline

## Risks / Limits

- 该 skill 将 TDD 作为默认纪律，但现实项目中是否适用仍受代码库测试基础、执行时间成本与团队约束影响；并且需要宿主具备运行测试/读取输出的执行通道。

