# 04 / Skill 持续优化、评测闭环与反馈回流 / Evidence Summary

- `status`: `done_for_round`
- `wave`: `Wave 1 + Wave 2 backfill + runner-spec extension`
- `doc_count`: `9`
- `current_focus`: `把 04 从 skill artifact 优化扩展到 trajectory regression、CI quality gate、offline / online feedback loop、program optimizer、eval-driven optimization flywheel 与本地 runner 实现模式。`

## 本轮新增证据栈

- `04-skill-optimization-and-feedback-loops-skill-forge-artifact-optimization.md`
  - 确认 `skill-forge` 是 `04` 的优先起步对象之一，因为它把 discoverability、executability、结构一致性、安全与发布前治理纳入 skill artifact 级优化。
- `04-skill-optimization-and-feedback-loops-description-trigger-optimization.md`
  - 确认 `description` 与 metadata 是 skill triggering / routing 的核心接口，触发优化不是正文 prompt 优化的附属品。
- `04-skill-optimization-and-feedback-loops-evaluation-versioning-loop.md`
  - 确认 skill lifecycle 需要 test、deploy、monitor、iterate / deprecate、version pinning 与 fallback，支持最小 eval / replay / regression loop 的必要性。
- `04-skill-optimization-and-feedback-loops-promptfoo-agent-trajectory-regression.md`
  - 确认 workflow skill 的 regression 不应只看 final answer，还应检查 intermediate steps、tool calls、tool args、tool sequence 与 step count。
- `04-skill-optimization-and-feedback-loops-promptfoo-ci-quality-gates.md`
  - 确认 skill 修订可以迁移 CI quality gate 思路，用 pass-rate threshold、fail-on-error、security scan 与 report artifact 阻断坏版本。
- `04-skill-optimization-and-feedback-loops-langsmith-offline-online-feedback-loop.md`
  - 确认 production traces、online evaluation、offline datasets、human feedback 与 annotation queues 可以形成持续优化闭环。
- `04-skill-optimization-and-feedback-loops-dspy-program-optimizer-pattern.md`
  - 确认自动优化可以被理解为 program-level candidate revision pattern，而不是简单 prompt tuning。
- `04-skill-optimization-and-feedback-loops-openai-evals-optimization-flywheel.md`
  - 确认 eval baseline、representative test data、feedback 与 iterative optimization flywheel 是修改前后比较的基础。
- `04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`
  - 确认本地 `gstack` 已有可迁移的 skill eval 工程模式：LLM judge、agent E2E runner、NDJSON / JSONL trace parsing、tool-call extraction、touchfile selection、structured eval store 与 before / after compare。

## 当前最稳的判断

- `04` 的研究对象应从 skill artifact 级优化开始，而不是从通用 prompt optimization 开始。
- `skill-forge` 代表的是一种 post-authoring optimization 路线：
  - 结构审计
  - discoverability 检查
  - workflow executability 检查
  - 安全扫描
  - 发布前阻断
  - 多平台分发一致性
- skill 持续优化至少有三类稳定入口：
  - 触发 / 发现优化
  - workflow / tool-use 执行优化
  - eval / versioning / fallback 闭环
- 补完第二批证据后，可以更稳地扩展为五类入口：
  - artifact governance
  - trigger / discoverability tuning
  - trajectory / tool-use regression
  - offline / online feedback loop
  - candidate revision / optimizer pattern

## 当前机制理解

- Skill optimization 不是单一动作，而是一个闭环：
  - 发现失败样本
  - 判断失败类型
  - 定位到 artifact 层
  - 修改对应部件
  - 用代表性任务回放
  - 决定 promote、fallback 或继续修改
- `skill-forge` 更偏发布前治理，但它提供了 `04` 需要的 artifact-level failure vocabulary。
- Claude lifecycle / versioning 证据补上了发布后的 eval / monitor / iterate 视角。
- Promptfoo 证据补上了 trajectory-level regression 与 CI gate 机制。
- LangSmith 证据补上了 production trace 到 offline regression dataset 的 feedback loop。
- DSPy / OpenAI 证据补上了 metric / baseline / candidate revision / eval feedback 的优化 flywheel。
- 本地 `gstack` 证据补上了真实 runner / collector / compare 的实现形态，说明 `04` 可以继续从文档模板推进到可执行 regression runner。

## 当前缺口

- 还缺公开案例说明一次 skill 修订如何被量化比较。
- `04` 的结论已回填到 W2 synthesis、workflow baseline、formal comparison、final recommendation 和 readiness check。
- 已补出一版 `SKILL.md regression harness` 模板、tool config sketch、agent adapter contract、local case pack、机器可读 YAML、case pack JSON schema、mock adapter / assertion spec、mock runner、mock run report 与 runner prototype spec；后续缺口从“有没有 harness 样板”转为“是否把 mock runner 产品化为 JSON report、可配置 matcher，并接入真实 Codex adapter 跑 baseline / candidate 对比”。
