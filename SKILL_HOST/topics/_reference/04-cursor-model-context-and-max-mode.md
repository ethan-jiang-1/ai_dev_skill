# Cursor Model Context and Max Mode

- source_url: https://docs.cursor.com/models
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled around 2025-07 and still current in 2026 access
- date_scope: current-2026
- related_topic: 04, 06, 08
- trust_level: official
- why_it_matters: skills and subagents are constrained by actual model/context options available in Cursor
- claims_supported: Cursor offers multiple providers and models; agent/tool capability is model-dependent; context windows vary widely; Cursor prunes context over time; Max Mode raises context windows with higher latency/cost
- canonical_exception: no

## 关键事实

- Cursor supports a wide range of frontier models from multiple providers.
- Model entries explicitly label whether a model supports `Agent` and `Thinking`.
- Normal context windows commonly sit around `60k-200k`, while `Max Mode` enables larger windows up to `1M` for some models.
- Cursor docs say it actively prunes non-essential context as chats progress.
- Max Mode is explicitly described as slower and more expensive.

## 与本研究的关系

- Important for Topic `04` because model/context constraints shape when skills versus rules versus new chats are practical.
- Important for Topic `08` because research-style workflows are especially sensitive to context budget.

## 可直接引用的术语 / 概念

- `Agent`
- `Thinking`
- `Max Mode`
- `200k tokens`
- `1M tokens`

## 模型 / 宿主 / 版本相关信息

- This source directly supports model-requirement analysis for Cursor-hosted skills.

## 风险与局限

- This is product-level model availability, not a specific guarantee that any given skill will run well on every model.

