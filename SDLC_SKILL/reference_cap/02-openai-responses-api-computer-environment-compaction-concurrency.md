# OpenAI: From Model to Agent (Responses API Computer Environment, Concurrent Sessions, Output Cap, Compaction, Skill Loading Pipeline)

- source_url: https://openai.com/index/equip-responses-api-computer-environment/
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: 该文披露了 OpenAI 官方 agent loop 在“执行与可控性”上的工程机制：多会话并发（concurrent sessions）、对工具输出长度的硬 cap（保留头尾并标注截断）、compaction（压缩上下文以延长任务续航）、以及 skills 的分阶段加载（metadata→bundle→copy→append instructions）。这些是一手的“机制落地证据”，可用于支撑 wave-based 并行、上下文腐化治理、以及能力单元的可执行 contract。
- claims_supported:
  - agent loop 支持多个 shell sessions 并发运行，并用 scheduler 编排
  - tool output 有长度上限，超过时保留开头与结尾并标注中间移除
  - compaction 会在多步推理中压缩上下文以保留关键事实并丢弃低价值细节
  - skills 按需加载是分阶段管道：先加载 metadata，再加载 bundle 并复制到 container，最后把 instructions 追加到 context
- date_scope: accessed 2026-04-09
- related_frameworks: OpenAI agent loop (Responses API), skills
- related_tools: concurrent shell sessions, scheduler, output cap, compaction, skill bundles

## 关键事实

- 并发执行：文中明确 “Support concurrent sessions”，并描述在 agent loop 中能并发运行多个 shell sessions（由 scheduler 编排），用于加速任务与分离执行上下文。`source_url`
- 输出 cap：文中明确 “output cap”，当 tool output 达到上限时，会保留输出的 beginning 与 end，并在中间插入标记表示中间内容被移除，从而避免上下文被大量日志淹没。`source_url`
- compaction：文中明确 “Compaction”，用于在多步任务中压缩累积上下文，保留关键事实与任务状态，丢弃低价值细节，降低 context rot 风险。`source_url`
- skills 加载管道（progressive loading）：
  - 先加载 skill metadata
  - 再把 skill bundle 拷贝进 container
  - 最后把 instructions 追加到 context（append）供模型使用。`source_url`

## 与本研究的关系

- 为 `digested_cap/02` 提供“官方机制落地”证据：并发与上下文治理不是纯 prompt 约定，而是通过 scheduler、output cap 与 compaction 的工程手段实现。
- 为能力单元架构提供可迁移抽象：output cap / compaction / progressive skill loading 是宿主实现细节，但其背后的通用模式（避免日志淹没、长期任务续航、按需加载能力）可迁移到其他框架或企业内部平台。

## 可直接引用的术语 / 概念

- “Support concurrent sessions”
- “output cap”
- “Compaction”
- “load the skill bundle into the container … append instructions to context”

## captured_excerpt

摘录（来自 output cap / compaction 描述，保持简短）：

> “If the output reaches the cap, we keep the beginning and end …”

## 风险与局限

- 该文描述的是官方平台实现机制，但并未提供对照实验来证明每个机制在所有场景下都提升正确性；企业迁移仍需结合自身工作负载做评估与回归验证。

