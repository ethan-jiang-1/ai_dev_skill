# OpenCode Tools: Websearch Provider Gating and Subagent Defaults

- source_url: https://opencode.ai/docs/tools/
- source_type: official_docs
- accessed_at: 2026-04-12 16:24:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: clarifies the practical execution surface for research-heavy skills by showing which tools are always present, which require provider setup, and which behave differently for subagents
- claims_supported: OpenCode exposes skill as a first-class tool; tools are enabled by default and governed by permissions; websearch is provider-gated; todowrite is disabled for subagents by default; webfetch and websearch are deliberately separated
- canonical_exception: no

## 关键事实

- OpenCode docs say that by default, all tools are enabled and do not need permission to run, though behavior can be controlled through permissions.
- `skill` is an explicit built-in tool that loads a `SKILL.md` file into the conversation.
- `todowrite` is disabled for subagents by default.
- `websearch` is only available when:
  - using the OpenCode provider
  - or `OPENCODE_ENABLE_EXA` is set
- The docs say `websearch` uses Exa AI and does not require a separate API key.
- The docs distinguish:
  - `websearch` for discovery
  - `webfetch` for retrieval from a known URL

## 与本研究的关系

- Important for Topic `05` because it makes OpenCode's research/runtime surface much more concrete than a generic "supports web tools" claim.
- Important for Topic `06` because provider gating and subagent defaults are real interoperability breakpoints across hosts.
- Important for Topic `08` because deep research skills often assume search, fetch, planning, and delegated execution are all simultaneously available.

## 可直接引用的术语 / 概念

- `all tools are enabled by default`
- `skill` as a built-in tool
- `todowrite is disabled for subagents by default`
- `OPENCODE_ENABLE_EXA`
- `websearch` for discovery, `webfetch` for retrieval

## 模型 / 宿主 / 版本相关信息

- This source shows that "tool availability" in OpenCode is partly a provider/runtime question, not only a permission question.
- It is especially relevant when comparing simple skills with research or orchestration skills.

## 风险与局限

- Convenience defaults reduce friction, but they also mean users need to understand hidden runtime assumptions such as provider selection and subagent tool defaults.
