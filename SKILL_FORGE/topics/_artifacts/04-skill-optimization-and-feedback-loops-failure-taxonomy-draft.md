# 04 / Skill Failure Taxonomy Draft

- `status`: `draft`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-skill-forge-artifact-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-description-trigger-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-evaluation-versioning-loop.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-agent-trajectory-regression.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-superpowers-feedback-driven-revision.md`

## 目的

这份草案用于把 skill 失败从“prompt 不够好”拆开，方便后续把失败样本定位到具体 artifact 层。

## Failure Classes

### 1. Trigger / Discoverability Failure

- 应触发但未触发
- 不应触发但误触发
- 描述过窄，真实任务语言未覆盖
- 描述过宽，导致 skill 被错误加载

### 2. Workflow Executability Failure

- agent 看到了 skill，但没有按步骤执行
- agent 跳过检查点或中间产物
- workflow 太长，被当作背景知识吸收
- 执行流程缺少 stop condition 或 handoff condition

### 3. Tool-Use Contract Failure

- 该调用工具时未调用
- 不该调用工具时调用
- 工具调用顺序错误
- 输出格式或 schema 不稳定
- 工具结果未正确影响下一步决策

### 4. Structural / Packaging Failure

- `SKILL.md`、scripts、references 的分层不清
- 支撑文件缺失或链接损坏
- README / description / actual capability 不一致
- 多平台安装路径或链接导致 shadowing / duplicate copy

### 5. Safety / Governance Failure

- skill 携带敏感文件或凭据风险
- 权限 / allowed tools 边界不清
- 第三方 skill 未经审查直接进入工作流
- critical issue 未能在发布前阻断

### 6. Versioning / Regression Failure

- 修改后没有代表性任务回归
- 新版本修复一个失败，同时引入另一个失败
- 没有 version pinning 或 fallback
- 已废弃 skill 仍被继续使用

### 7. Trajectory Regression Failure

- 最终答案看似正确，但中间步骤明显偏航
- 工具调用数量异常膨胀
- 工具调用顺序不符合 workflow 约束
- 工具参数与预期 schema 或语义不匹配
- agent 绕开了 skill 要求的关键检查点

### 8. Feedback Loop Failure

- 线上失败没有被记录为 trace
- 用户修正没有进入后续 eval dataset
- 人工审阅结果没有形成可复用标签
- offline regression 与 online monitoring 断开
- 同类失败反复出现但没有进入 failure taxonomy

## Artifact-Layer Mapping

| Failure Class | Most Likely Artifact Layer | Typical Signal | First Revision Target | Default Gate |
| --- | --- | --- | --- | --- |
| Trigger / Discoverability Failure | `name` / `description` / metadata / trigger examples | 应触发未触发，或误触发 | description wording, inclusion / exclusion examples | trigger + no-trigger cases |
| Workflow Executability Failure | workflow steps / checkpoints / stop or handoff conditions | agent 读到 skill 但跳步、漏检查点 | step wording, checkpoint structure, verification steps | trajectory + output contract |
| Tool-Use Contract Failure | tool instructions / arg schema / output contract | 工具调用错序、参数不稳、结果未进入后续决策 | tool contract wording, examples, schema hints | tool-used / args / sequence assertions |
| Structural / Packaging Failure | `SKILL.md` layout / references / scripts / links | 支撑文件缺失、链接坏、分层不清 | package structure, references, install paths | structure audit + smoke install |
| Safety / Governance Failure | `allowed-tools` / release checks / security guidance | 权限边界模糊、危险动作未阻断 | allowed-tools, guardrails, publish gate | hard block + human review |
| Versioning / Regression Failure | case pack / revision log / fallback policy | 修一处坏一片、无 baseline 对比 | compare contract, versioning, rollback notes | baseline vs candidate compare |
| Trajectory Regression Failure | workflow body / tool sequencing / intermediate checkpoints | final answer 看似对，但中间轨迹偏航 | step order, tool sequencing hints, intermediate deliverables | step-count + tool-sequence + transcript review |
| Feedback Loop Failure | trace capture / annotation queue / dataset backfill | 线上失败不回流，重复问题反复出现 | trace logging, dataset intake, taxonomy labels | online-to-offline replay path |

## Promotion Decision Examples

### Example 1. Trigger false negative

- Symptom: code-review request should load a review skill but does not.
- Root failure class: `Trigger / Discoverability Failure`.
- Nearest artifact layer: `description`, metadata, and trigger examples.
- Candidate revision: broaden the description to include the missing user phrasing and add a no-trigger counterexample to keep scope tight.
- Promote only if trigger cases improve and no-trigger cases do not regress.

### Example 2. Configuration verification gap

- Symptom: task reports success because request returns `200`, but the actual provider or feature state did not change.
- Public practice anchor: `superpowers` proposes adding configuration-change verification to `verification-before-completion`.
- Root failure class: `Workflow Executability Failure`.
- Nearest artifact layer: verification step design inside the skill body.
- Candidate revision: add a gate that checks the observable difference, not only operation success.
- Promote only if representative configuration-change cases now verify the intended state rather than generic success.

### Example 3. Mock-interface drift

- Symptom: tests pass but runtime crashes because mocks copied buggy implementation method names.
- Public practice anchor: `superpowers` proposes adding the anti-pattern explicitly to `testing-anti-patterns`.
- Root failure class: `Tool-Use Contract Failure`.
- Nearest artifact layer: testing reference file plus subagent prompt discipline.
- Candidate revision: require reading the interface first, then deriving mocks from the interface rather than implementation.
- Promote only if the revised guidance catches the mismatch without introducing a large rate of false positives in normal tests.

### Example 4. Trajectory regression without output regression

- Symptom: final answer still looks acceptable, but tool sequence, step count, or intermediate checkpoints drift.
- Root failure class: `Trajectory Regression Failure`.
- Nearest artifact layer: workflow steps and tool sequencing hints.
- Candidate revision: tighten step ordering, add checkpoint language, and assert the expected tool sequence in the case pack.
- Promote only if protected trajectory assertions remain stable across already-passing cases.

### Example 5. Safety or process-hygiene fix

- Symptom: stale background processes or risky actions make later tests or releases unreliable.
- Public practice anchor: `superpowers` proposes process hygiene for E2E subagents.
- Root failure class: `Safety / Governance Failure` or `Workflow Executability Failure`, depending on scope.
- Nearest artifact layer: process hygiene instructions, cleanup checklist, or publish gate.
- Candidate revision: add cleanup and verification steps, and keep dangerous cases behind an explicit human promotion gate.
- Do not auto-promote based only on the target case; require manual review because safety fixes can widen constraints elsewhere.

## 使用方式

- 每个失败样本先归入一个主类。
- 如果跨类，优先记录最靠近根因的 artifact 层。
- 每次 skill 修订必须写明试图修复的 failure class。
- 回归测试应覆盖已知高频 failure class，而不是只覆盖 happy path。
- promote / reject 决策应同时记录：修了哪类 failure、改动了哪个 artifact 层、用哪些 cases 验证、是否引入新的回归。
