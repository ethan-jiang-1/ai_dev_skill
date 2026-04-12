# OpenCode Providers: /connect, Credential Storage, and BaseURL Overrides

- source_url: https://opencode.ai/docs/providers/
- source_type: official_docs
- accessed_at: 2026-04-12 17:55:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: provider configuration is a core “runtime seam” for OpenCode; it directly affects model availability, tool gating (e.g., websearch), and portability/maintenance cost for skills
- claims_supported: OpenCode supports many providers/local models; `/connect` stores credentials locally; providers are configured in opencode config; baseURL overrides support proxies/custom endpoints; OpenCode Zen/Go are curated model bundles
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- OpenCode supports `75+` LLM providers and local models (built on AI SDK and Models.dev).
- Adding a provider requires:
  - adding API keys via the `/connect` command
  - configuring the provider in OpenCode config (`provider` section)
- Credential storage location (official):
  - keys added via `/connect` are stored in `~/.local/share/opencode/auth.json`
- Provider base URL override:
  - `baseURL` can be set per provider (useful for proxies/custom endpoints)
- OpenCode Zen / OpenCode Go:
  - curated model lists provided by the OpenCode team, intended to be tested/verified to work well with OpenCode
  - the docs recommend starting with Zen and using `/models` to see recommended models

## 核心内容摘录

- The provider surface makes OpenCode highly flexible but also increases drift risk:
  - the same skill can behave differently depending on provider/tool availability
  - credentials and config become part of the operational contract for advanced skills

## 与本研究的关系

- Topic `05`: adds concrete operational details (auth.json location, /connect flow, baseURL overrides) that explain why OpenCode is powerful for experimentation but configuration-heavy.
- Topic `06`: supports the cross-host “runtime seam” claim: portability is not only file format; it is also provider setup and credential governance.
- Topic `08`: deep research workflows are especially sensitive to provider/tool gating; provider selection can decide whether “research tools exist” at runtime.

## 可直接引用的术语 / 概念

- `/connect`
- `~/.local/share/opencode/auth.json`
- `provider` config section
- `baseURL`
- `OpenCode Zen` / `OpenCode Go`
- `/models`

## 模型 / 宿主 / 版本相关信息

- Provider choice is a first-order variable for OpenCode:
  - it changes which models are available
  - it can affect which tools are enabled (some tools are provider-gated in other OpenCode docs)

## 风险与局限

- This doc describes configuration and auth storage, not security posture; teams still need policy decisions around key management and machine access.
- “Works with OpenCode Zen/Go” is a useful baseline, but it does not imply equal behavior across all providers and local models.

