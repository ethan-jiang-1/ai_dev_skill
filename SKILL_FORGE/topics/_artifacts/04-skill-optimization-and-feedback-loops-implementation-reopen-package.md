# 04 / Implementation Reopen Package

- `status`: `ready_for_scope_reopen`
- `purpose`: `把 04 当前已形成的文档基线压缩成 implementation-reopen handoff package，确保后续从 MD 研究转入真实 runner / adapter 实现时不再重新讨论边界。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-trio-consistency-review.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-method-stack-scorecard.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-delivery-checklist.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-codex-adapter-first-pass-handoff.md`

## Reopen Decision

当前 `04` 已达到：

- `research_ready`: `yes`
- `implementation_prep_ready`: `yes`
- `implementation_reopened`: `no`

原因不是方法论不足，而是当前仍未进入 non-MD implementation scope。

## SSOT Cluster

在 implementation reopen 时，以下文档应视为当前 SSOT cluster：

- failure classes and artifact mapping
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md`
- runnable case semantics
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`
- stack-role comparison
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-method-stack-scorecard.md`
- promotion discipline
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-delivery-checklist.md`
- runner structure
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`
- first Codex adapter boundary
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-codex-adapter-first-pass-handoff.md`

## First Legal Implementation Scope

如果现在 reopen implementation，第一阶段只允许做：

1. JSON comparison output
2. deterministic matcher externalization
3. one real Codex adapter
4. baseline / candidate run persistence

第一阶段不允许扩到：

- semantic judge
- multiple real adapters in parallel
- automatic candidate revision
- machine-readable parity beyond what first acceptance strictly needs

## First Acceptance Subset

由于 machine-readable case pack 目前只稳定覆盖第一批 `9` 个 gate cases，first real adapter 的最小验收应锁定在 YAML-covered subset。

建议顺序：

1. `review-no-trigger-001`
2. `review-output-001`
3. `ship-safety-001`
4. 之后再补：
   - `ship-trigger-001`
   - `ship-trajectory-001`
   - `code-review-quality-workflow-001`

`superpowers` 扩展 cases 当前应视为：

- `md_ready`
- `implementation_followup`

而不是 first adapter 的硬前置条件。

## Reopen Preconditions

真正开始 non-MD implementation 前，应先确认：

- [ ] 继续使用当前 failure taxonomy，不另起 compare 口径
- [ ] first adapter 只承诺 YAML-covered subset
- [ ] protected success set 作为 compare hard floor
- [ ] safety cases 不因“先打通流程”而降级
- [ ] branch state 允许 non-MD implementation work

## Acceptance Bar

第一阶段实现只有在下面条件同时满足时，才能说“adapter branch reopen 成功”：

1. 至少一个 no-trigger case 稳定通过
2. 至少一个 output-contract case 稳定通过
3. 至少一个 safety case 稳定阻断坏行为
4. candidate / baseline compare 能输出 machine-readable artifact
5. status 能明确写出哪些字段稳定、哪些字段仍近似

## If Reopen Fails

如果 implementation reopen 后仍失败，不应回退到“继续泛研究”。

正确做法是：

- 明确 blocker 是字段、trace、adapter install，还是 compare artifact
- 保持 `04` 的研究结论不回滚
- 只把 `real Codex adapter execution` 分支继续标成 `suspended`
