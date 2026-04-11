# Triggering Logic And Description Design

- `source_url`: `https://agentskills.io/skill-creation/optimizing-descriptions`
- `source_type`: `authoring-guide`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这份 guide 直接说明 `description` 不是装饰字段，而是 skill routing 的核心接口。`
- `claims_supported`:
  - `description` 是 skill 触发机制的中心字段
  - 触发精度本身是可被测试和优化的
  - 方法论上需要把“描述写法”当作工程问题，而不是文案问题

## 关键事实

- 页面明确说 `description` 是 agents 决定是否加载 skill 的 `primary mechanism`。
- 页面解释，agents 在 startup 只加载 `name` 与 `description`，由此判断 skill 是否相关。
- 页面明确指出:
  - `under-specified description`
  - `over-broad description`
  都会损伤触发质量。
- 页面还给出硬约束: `The specification enforces a hard limit of 1024 characters`。
- 页面进一步指出，一个简单的一步任务即使描述吻合，也不一定触发 skill，因为 agent 可能已经能单独完成。

## 与本研究的关系

- 对 `01` 而言，这份材料非常重要，因为它把 method 从“怎么写正文”推进到“怎么设计可触发的 skill 接口”。
- 这也说明 `description` 的地位已经远高于一般 README 摘要，它更接近 routing rule。

## 风险与局限

- 这份 guide 更偏 authoring best practice，而不是强制规范。
- 它说明了应该如何优化触发，但不保证不同客户端的触发行为完全一致。
