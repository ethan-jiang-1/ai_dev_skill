# Codex Model Snapshots and CLI-Optimized Runtime

- source_url: https://developers.openai.com/api/docs/models/codex-mini-latest
- source_type: official_model_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current model docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 06, 08
- trust_level: official
- why_it_matters: strengthens the model/versioning side of the Codex host analysis beyond generic product pages
- claims_supported: codex-mini-latest is specifically tuned for Codex CLI; snapshots are an explicit mechanism for consistency; OpenAI differentiates CLI-optimized and high-capability Codex models
- canonical_exception: no

## 关键事实

- `codex-mini-latest` is explicitly described as a fine-tuned version of `o4-mini` specifically for use in Codex CLI.
- It exposes a `200,000` token context window and `100,000` max output tokens.
- The model page explicitly documents `Snapshots` as the mechanism to lock a specific version for consistent behavior.
- The page positions `codex-mini-latest` as faster and cheaper than higher-end Codex models.

## 与本研究的关系

- Important for Topic `03` because it sharpens the distinction between Codex host behavior and Codex model strategy.
- Important for Topic `06` because snapshot/versioning support is a meaningful comparison dimension.

## 可直接引用的术语 / 概念

- `fine-tuned version of o4-mini specifically for use in Codex CLI`
- `Snapshots`
- `200,000 context window`
- `100,000 max output tokens`

## 模型 / 宿主 / 版本相关信息

- This is direct evidence that Codex runtime strategy is partially model-tiered.
- It supports the claim that some Codex workflows can be optimized for CLI responsiveness rather than maximum capability.

## 风险与局限

- Snapshot support improves consistency, but not all client surfaces necessarily expose identical model selection defaults.

