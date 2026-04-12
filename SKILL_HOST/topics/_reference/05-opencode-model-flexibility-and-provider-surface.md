# OpenCode Model Flexibility and Provider Surface

- source_url: https://opencode.ai/docs/models
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: published around 2025-11; current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: OpenCode’s model/provider flexibility is one of its biggest differentiators for skill portability and experimentation
- claims_supported: OpenCode supports 75+ providers and local models; model config is explicit; provider auth is built in; recommended coding/tool-calling models are documented; agent-level model overrides exist
- canonical_exception: no

## 关键事实

- OpenCode uses AI SDK and Models.dev to support `75+` LLM providers.
- It supports local models.
- The default model can be set in OpenCode config.
- `/models` is the model selection surface.
- The docs explicitly recommend a short list of models that work well for coding and tool calling, including `GPT 5`, `GPT 5 Codex`, and `Claude Sonnet 4.5`.
- Agent config can override global model options.

## 与本研究的关系

- Critical for Topic `05` because OpenCode’s portability story depends heavily on model/provider flexibility.
- Useful for Topic `06` because this is a major point of contrast with more vertically integrated hosts.

## 可直接引用的术语 / 概念

- `75+ LLM providers`
- `local models`
- `/models`
- `agent config overrides global options`

## 模型 / 宿主 / 版本相关信息

- This is one of the strongest host sources for model-flexibility analysis.

## 风险与局限

- More provider choice does not automatically mean more consistent skill behavior.
- It may increase configuration complexity and model-specific edge cases.

