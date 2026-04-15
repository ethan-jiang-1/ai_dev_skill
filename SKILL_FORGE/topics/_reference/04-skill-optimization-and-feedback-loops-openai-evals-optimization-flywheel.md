# OpenAI Evals Optimization Flywheel

- `source_url`: `https://developers.openai.com/api/docs/guides/model-optimization`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `official`
- `why_it_matters`: `OpenAI model optimization 文档把 evals、prompt iteration、test data 和 continuous feedback flywheel 放在同一条优化流程里，可迁移为 skill 修改前后的基线测量与回归验证。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - 优化应先建立 eval baseline，而不是直接改指令
  - eval feedback 应驱动后续 prompt / dataset / model 调整
  - 代表性真实输入对于评估优化是否有效很关键

## 关键事实

- OpenAI 文档强调模型输出具有非确定性，且模型快照与模型族变化会影响行为，因此需要持续测量和调优。
- model optimization workflow 包含：
  - 写 evals 建立 baseline
  - 提供 prompt / context / instructions
  - 使用代表性 test data 运行 eval
  - 根据 eval feedback 调整 prompt 或数据
  - 持续重复优化循环
- 文档还建议可以在写 prompt 前先写 evals，接近 behavior-driven development 的思路。
- OpenAI Evals 支持用 test inputs 和 ground truth labels 运行评测。

## 核心内容摘录

- 对 `04` 最关键的迁移点是：
  - skill 修订前应先有 baseline
  - 修改后用代表性样本跑同一套 eval
  - 不能只看单个 demo 是否变好
  - feedback 应进入下一轮修订或样本集扩展

## 与本研究的关系

- 这份材料支持 `04` 的最小 eval loop。
- 它强调的是 eval-driven optimization，不是单纯 prompt tweaking。
- 对 skill 来说，可迁移为：
  - skill behavior evals
  - trigger / no-trigger cases
  - tool trajectory assertions
  - output contract checks
  - baseline vs candidate comparison

## 可直接引用的术语 / 概念

- `evals`
- `baseline`
- `test data`
- `feedback`
- `optimization workflow`
- `behavior-driven development`

## 风险与局限

- OpenAI 文档主要面向 model output optimization，不是 skill package optimization。
- 迁移到 skill 时必须扩展 eval target：除了最终输出，还要覆盖触发、workflow adherence、tool-use contract、supporting files 和 versioning。
