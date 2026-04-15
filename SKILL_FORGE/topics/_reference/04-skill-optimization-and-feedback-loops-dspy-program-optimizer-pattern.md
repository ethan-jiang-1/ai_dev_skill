# DSPy Program Optimizer Pattern

- `source_url`: `https://dspy.ai/learn/optimization/optimizers/`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `official`
- `why_it_matters`: `DSPy optimizer 文档提供了从 examples、metrics、traces、candidate instructions 到 iterative search 的 program-level optimization 模式，可作为 skill artifact 局部自动修订的机制原型。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - 优化对象可以是 program / module，不必限于单段 prompt
  - optimizer 需要 metric、training inputs 和 candidate search
  - trace 和 failure analysis 可用于生成更好的 instructions、few-shot examples 或 rules

## 关键事实

- DSPy optimizer 被定义为调优 DSPy program 参数的算法，目标是最大化用户指定的 metric。
- optimizer 的输入通常包括：
  - program
  - metric
  - training inputs
- 文档说明训练样本可以很少，甚至不完整，但足以启动优化。
- 不同 optimizer 会合成 few-shot examples、生成更好的 natural-language instructions、构建 datasets 或 fine-tune LM weights。
- MIPROv2 会生成 instructions 和 demonstrations，并通过搜索探索候选方案。
- SIMBA 会识别困难样本，分析失败，并生成 self-reflective improvement rules 或加入成功 demonstrations。
- GEPA 会基于 program trajectory 反思哪些有效、哪些无效，并提出补 gap 的 prompts；它也可以利用 domain-specific textual feedback。
- 文档也提醒最终仍需实验和迭代，优化运行有成本，数据量和 trial 数会影响结果。

## 核心内容摘录

- 对 `04` 最关键的迁移点是：
  - skill 可以被视为一种 artifact-level program
  - metric / cases / traces 决定优化方向
  - 自动候选修订应先作用在局部部件，而不是直接重写整个 skill
  - failure analysis 可以转成 rules、examples 或 instruction edits

## 与本研究的关系

- 这份材料支持 `04` 的 automation 子题。
- 它不应被理解为“自动 prompt tuning 就是 skill tuning”，而应被理解为：
  - candidate revision generator
  - failure-aware proposal engine
  - metric-driven search pattern
- 后续 skill 优化可以借鉴它的闭环：
  - metric 定义
  - examples / traces 收集
  - 局部候选生成
  - regression comparison
  - promote / reject

## 可直接引用的术语 / 概念

- `optimizer`
- `program`
- `metric`
- `training inputs`
- `MIPROv2`
- `SIMBA`
- `GEPA`
- `program trajectory`

## 风险与局限

- DSPy 的对象模型是 program / module，不是 `SKILL.md` package。
- 直接把 optimizer 套到完整 skill 上风险较高；更合理的迁移方式是作用于 description、examples、workflow step wording、tool contract 等局部部件。
- 自动优化可能 overfit eval set，因此必须保留 held-out / regression / boundary samples。
