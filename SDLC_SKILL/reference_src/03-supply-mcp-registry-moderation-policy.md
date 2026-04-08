# MCP Registry Moderation Policy (Permissive; status=deleted)

- source_url: https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/moderation-policy.mdx
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: 该 policy 明确 MCP Registry 的“内容治理”口径非常宽松（minimal-to-no moderation），并说明移除机制以 `status="deleted"` 为主。这决定了企业不能把 registry 当作默认安全过滤器，必须在下游聚合器/内部流程做额外治理。

## Key Facts

- Policy scope：适用于官方 registry `registry.modelcontextprotocol.io`；subregistries 可有自己的 policy。（Ref: moderation policy）
- Disclaimer：registry 不保证 moderation 能力，消费者应假设“minimal-to-no moderation”；registry 依赖上游包注册表（NPM/PyPI/Docker）或下游 subregistries 做更深入 moderation。（Ref: moderation policy）
- 会移除的内容：illegal content、malware、spam（含批量重复提交/营销垃圾）、non-functioning servers。（Ref: moderation policy）
- 通常不会移除：low-quality/buggy servers、存在安全漏洞的 servers、重复功能 servers、adult content。（Ref: moderation policy）
- Removal 机制：将 server 的 `status` 设置为 `"deleted"`；metadata 仍可通过 API 访问；极端情况下可能覆盖/擦除 metadata（例如 metadata 本身违法）。（Ref: moderation policy）

## Claims Supported

- “官方 MCP Registry 的治理是 permissive 的，不能作为安全背书；安全扫描/评级更适合由下游 subregistry/企业内部流程承担。”（主题 2 dist；安全/治理）
- “`deleted` 更像‘发现层信号’而不是彻底删除；历史记录保留使审计与追责更可行，但也要求消费方正确处理状态。”（治理机制）

## Captured Excerpts (keep short)

> consumers should assume minimal-to-no moderation.

## Terms / Concepts

- moderation policy
- subregistry policy
- `status: deleted`

## Risks / Limits

- Policy 只覆盖“移除标准与机制”，不提供漏洞披露/安全扫描的承诺；企业采用时仍需结合 OWASP/供应链实践建立额外 guardrails。

