# LangSmith Offline Online Feedback Loop

- `source_url`: `https://docs.langchain.com/langsmith/evaluation-concepts`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `official`
- `why_it_matters`: `LangSmith evaluation concepts 明确区分 offline evaluation 与 online evaluation，并把 production traces 回流为 offline test cases，这正是 skill 持续优化需要的 feedback loop。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - 真实 production traces 可以转成后续 offline eval cases
  - offline eval 可用于 pre-deployment regression，online eval 可用于 production monitoring
  - human feedback 和 annotation queues 可作为高质量失败样本来源

## 关键事实

- LangSmith 把 evaluation 放在 application lifecycle 中，从 pre-deployment testing 延伸到 production monitoring。
- Offline evaluation 适合 benchmarking、regression testing、unit testing 和 backtesting。
- Online evaluation 适合 production monitoring、anomaly detection 和 production feedback。
- 文档明确提出持续改进闭环：online evaluations 暴露问题，问题进入 offline test cases，offline evaluations 验证修复，online evaluations 再确认生产改善。
- LangSmith 的 evaluation target 包括 datasets / examples / experiments，也包括 production runs / threads。
- Runs 包含真实输入、输出、中间步骤、metadata、feedback、latency 等信息。
- Human feedback 和 annotation queues 可以把人工审阅结果转成未来评测数据。

## 核心内容摘录

- 对 `04` 最关键的机制链条是：
  - 生产 trace 发现失败
  - 失败样本进入 dataset
  - 离线回归验证修订
  - 线上监控确认改善
  - 人工反馈补充高质量标签

## 与本研究的关系

- 这份材料补上了 `04` 的 trace / replay / feedback loop 证据。
- 它支持把 skill 失败样本分成两类：
  - offline examples: 有 reference output 或预期行为
  - online runs / threads: 来自真实使用，没有天然 ground truth，但有轨迹、反馈和异常信号
- 对 skill workflow 来说，LangSmith 模式可以迁移为：
  - 记录 skill 触发与执行 trace
  - 标记失败原因
  - 转成 regression dataset
  - 对新 skill 版本做 experiment comparison

## 可直接引用的术语 / 概念

- `offline evaluation`
- `online evaluation`
- `production traces`
- `runs`
- `threads`
- `annotation queues`
- `iterative feedback loop`

## 风险与局限

- LangSmith 是 application / agent observability 平台，不是 skill package spec。
- 迁移到 skill 需要先定义什么算一次 skill run：触发事件、加载内容、工具轨迹、输出和用户反馈都应进入 trace schema。
