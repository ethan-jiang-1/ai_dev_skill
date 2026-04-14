# 01-planning Evidence Summary (Wave 1/2)

目标：把“能力单元本质与前置规划机制”的关键判断，压缩成可复用的 evidence map（每条都有 `../reference_cap/*.md` 回指）。

## Key Claims → Evidence Pointers

能力单元不是“换个说法下指令”，而是“改变执行机制/控制流/门禁”的对象：
- GSD：orchestrator→agent 分工、fresh context、file-based state、wave execution（`../reference_cap/01-gsd-architecture-orchestrator-agent-pattern.md`）
- gstack：skill routing 与 hard gate（禁止实现、只产出 design doc）（`../reference_cap/01-gstack-office-hours-hard-gate-design-doc.md`）
- GABBE：10-phase SDLC + human gates + RARV（`../reference_cap/01-gabbe-loki-mode-sdlc-phases-rarv.md`）

“Define/Design 阶段最大价值是阻止模型过早写代码”，可通过硬门禁实现：
- /office-hours 明确 HARD GATE：只产出 design document（`../reference_cap/01-gstack-office-hours-hard-gate-design-doc.md`）

“计划=可验证执行树”，需要把验证/测试与计划绑定，并在执行前做计划质量检查：
- Nyquist Validation：requirements→test commands 映射、产出 `{phase}-VALIDATION.md`（`../reference_cap/01-gsd-features-nyquist-plan-checker-wave-exec.md`）
- Plan Checker 8 维校验（含 verification commands、Nyquist compliance）（`../reference_cap/01-gsd-features-nyquist-plan-checker-wave-exec.md`）

计划审查需要显式化 scope 决策，避免 silent scope creep（扩张/缩减）：
- /plan-ceo-review：四种 scope mode + 每个 scope 变化必须 AskUserQuestion opt-in（`../reference_cap/01-gstack-plan-ceo-review-scope-modes-and-directives.md`）

“Completeness/coverage/edge cases/observability”可以作为计划评审的第一类对象（而不是实现后的补丁）：
- /plan-ceo-review：zero silent failures、observability is scope、diagrams mandatory（`../reference_cap/01-gstack-plan-ceo-review-scope-modes-and-directives.md`）
- /plan-eng-review：coverage diagram、回归测试 iron rule、distribution check、search-before-building（`../reference_cap/01-gstack-plan-eng-review-completeness-and-coverage.md`）

计划写法需要“无占位符 + 原子步骤 + 明确命令/路径/预期输出”，降低执行阶段猜测空间：
- superpowers/writing-plans（`../reference_cap/01-superpowers-writing-plans-no-placeholders.md`）

Context files（AGENTS.md/CLAUDE.md 等）在生态中普遍存在，但并非总是提升成功率；冗余/不必要要求可能伤害成功率与成本：
- Context files 内容结构与盲点：功能指令多，安全/性能少（`../reference_cap/01-arxiv-2511.12884-agent-readmes-context-files.md`）
- 实证评估：context files 可能降低 success rate 并提高成本 20%+；建议最小 requirements（`../reference_cap/01-arxiv-2602.11988-evaluating-agents-md-helpfulness.md`）

“治理/门禁/并行/安全策略”应通过可版本化配置面显式控制，而非隐式约定：
- `.planning/config.json` schema、workflow toggles、gates、safety、parallelization、不可关闭的 prompt injection guard（`../reference_cap/01-gsd-configuration-schema-and-gates.md`）

## Notes

- 仅记录可回指证据，不在此处做长篇推理。
