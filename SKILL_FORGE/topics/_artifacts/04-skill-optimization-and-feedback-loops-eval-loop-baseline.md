# 04 / Minimal Eval Replay Regression Loop Baseline

- `status`: `draft`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-skill-forge-artifact-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-description-trigger-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-evaluation-versioning-loop.md`

## 目标

建立一条最小可执行闭环，让 skill 修改不再只是主观改文案。

## Baseline Loop

### 1. Collect Cases

收集三类样本：

- 成功样本：skill 正确触发并完成任务
- 失败样本：skill 漏触发、误触发、偏航、工具误用或输出不稳定
- 边界样本：任务看似相关，但不应触发 skill 或应由基础 agent 处理

### 2. Classify Failure

使用 `04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md` 给失败样本分类。

最小要求：

- 每个样本至少有一个 failure class
- 每个样本写明疑似 artifact 根因
- 不允许只写“prompt 需要优化”

### 3. Localize Artifact Layer

把修订定位到具体层：

- name / description / metadata
- `SKILL.md` instruction body
- workflow step structure
- tool-use contract
- examples / counterexamples
- supporting files
- packaging / distribution / governance

### 4. Propose Revision

每个候选修订必须写明：

- 要修复哪个 failure class
- 修改了哪个 artifact 部位
- 预期改善什么行为
- 可能引入什么副作用

### 5. Replay Representative Cases

最小回放集合至少包含：

- 修订目标对应的失败样本
- 过去已经通过的成功样本
- 不应触发的边界样本
- 高风险工具调用样本

断言至少覆盖四层：

- trigger assertion：该触发时触发，不该触发时不触发
- trajectory assertion：关键步骤、工具调用、工具参数和步骤数量符合预期
- output assertion：最终输出满足格式、内容和边界要求
- safety assertion：高风险权限、凭据、外部命令或发布行为未恶化

### 6. Decide Promote / Reject / Fallback

通过条件：

- 目标失败样本改善
- 关键成功样本不回退
- 边界样本没有明显误触发增加
- 高风险工具行为没有恶化

如果不满足：

- reject candidate
- fallback to pinned version
- 或继续局部修订

## 最小产物

- `cases.md` 或等价样本清单
- `failure-taxonomy.md`
- `revision-log.md`
- `regression-result.md`
- pinned stable skill version
- CI / quality gate 配置或等价执行脚本
- online trace 到 offline dataset 的回流记录
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-skill-regression-harness-template.md`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.schema.json`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-adapter-and-assertion-spec.md`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`

## 当前限制

- 这还是 baseline 草案，已经补出 `SKILL.md regression harness` 模板、agent adapter contract、tool config sketch、local case pack 与 runner prototype spec。
- 后续如果继续深化，应先把 schema validation 接进 runner，再按 mock adapter / assertion spec 固定 assertion / compare 逻辑，最后接入一个真实 adapter。
