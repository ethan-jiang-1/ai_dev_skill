# Promptfoo Agent Trajectory Regression

- `source_url`: `https://www.promptfoo.dev/docs/guides/evaluate-coding-agents/`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `official`
- `why_it_matters`: `Promptfoo 的 coding agent eval 文档直接说明 agent eval 不能只看最终输出，还要看中间步骤、工具调用、成本、延迟和失败路径；这正适合迁移到 workflow skill 的 executability regression。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - agent / skill 类 workflow 的评测对象应包括 intermediate steps 和 tool trajectory
  - skill 回归测试应覆盖工具调用、步骤数量、路径漂移和最终输出
  - 非确定性会在多步 agent / skill workflow 中被放大

## 关键事实

- Promptfoo 将 coding agent eval 与普通 LLM eval 区分开：普通模型更像一次输入到输出的函数，agent 会反复决策、执行、观察和迭代。
- 文档强调多步 agent 的非确定性会在每次工具调用、文件读取、重试和路径选择中累积。
- 对 agent 来说，两个结果即使最终答案类似，中间行为也可能完全不同；成本、延迟和失败模式会因此差异很大。
- Promptfoo 的 assertions 支持 trajectory 相关检查，例如工具是否被调用、工具参数是否匹配、工具顺序是否符合预期、步骤数量是否合理。

## 核心内容摘录

- 对 `04` 最关键的机制是：skill regression 不能只检查 final answer。
- Workflow skill 的质量应至少拆成：
  - 是否触发
  - 是否按步骤执行
  - 是否使用正确工具
  - 是否以合理顺序使用工具
  - 是否没有出现明显步骤膨胀
  - 最终输出是否满足要求

## 与本研究的关系

- 这份材料可以直接支撑 `Workflow Executability Failure` 和 `Tool-Use Contract Failure` 两类 failure taxonomy。
- 它也说明 `04` 的 eval loop baseline 需要加入 trajectory assertions，而不是只加入 output assertions。
- 对 coding agent skill 来说，`trajectory:tool-used`、`trajectory:tool-args-match`、`trajectory:tool-sequence` 和 `trajectory:step-count` 这类检查可被迁移为 skill workflow regression gates。

## 可直接引用的术语 / 概念

- `agent evals`
- `intermediate steps`
- `trajectory`
- `tool calls`
- `step count`
- `regression`

## 风险与局限

- Promptfoo 的文档面向 agent / prompt / RAG eval，不是专门为 `SKILL.md` 设计。
- 迁移到 skill workflow 时，需要把 skill 的触发、metadata、支持文件和宿主 agent 行为显式建模。
