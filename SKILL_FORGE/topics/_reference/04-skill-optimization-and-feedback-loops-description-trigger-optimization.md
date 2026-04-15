# Description And Trigger Optimization As Skill-Level Tuning

- `source_url`: `https://agentskills.io/skill-creation/optimizing-descriptions`
- `source_type`: `authoring-guide`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `official`
- `why_it_matters`: `这份材料把 description 明确放在 skill routing / triggering 的核心位置，说明 skill optimization 的对象包括 metadata 与触发边界，而不是只包括正文 prompt。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - skill 的 `description` 是触发与加载决策的中心接口
  - 触发失败可以来自描述过窄、过宽或不匹配真实任务语言
  - discoverability tuning 应成为 `04` 的核心优化子题

## 关键事实

- guide 明确指出 `description` 是 agent 判断是否加载 skill 的 primary mechanism。
- agent 在 startup 阶段通常只看到 `name` 和 `description`，因此触发质量依赖 metadata，而不只是 skill 正文。
- 描述不足会导致漏触发。
- 描述过宽会导致误触发。
- 简单任务即使与 description 匹配，也可能不触发 skill，因为 agent 可能判断自己无需加载 skill。
- 这说明触发行为不是“写好正文后自然发生”的结果，而是一个需要设计和测试的接口问题。

## 核心内容摘录

- 这份材料最关键的机制链条是：
  - startup 只暴露轻量 metadata
  - agent 依赖 metadata 判断 skill 是否相关
  - description 过窄 / 过宽都会破坏路由质量
  - 因此 description tuning 不是文案润色，而是 routing interface tuning

## 与本研究的关系

- 对 `04` 来说，这份材料直接支持 `trigger / discoverability tuning` 作为 skill 持续优化的第一类失败模式。
- 它帮助区分：
  - prompt body optimization
  - metadata / description optimization
  - trigger boundary optimization
- 后续如果建立 eval set，应至少包含：
  - 应触发但未触发的样本
  - 不应触发但误触发的样本
  - 可由基础 agent 完成、无需加载 skill 的样本

## 可直接引用的术语 / 概念

- `description`
- `primary mechanism`
- `triggering`
- `under-specified description`
- `over-broad description`

## 风险与局限

- 这份材料更偏 authoring guidance，不是跨平台行为评测。
- 不同 host / agent 对 description 的具体路由实现可能不同，因此它应作为机制依据，而不是最终平台兼容矩阵。
