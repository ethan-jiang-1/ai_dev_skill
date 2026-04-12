# Agent Skills Description Optimization

- source_url: https://agentskills.io/skill-creation/optimizing-descriptions
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled last month before access
- date_scope: current-2026
- related_topic: 01, 07, 08
- trust_level: official
- why_it_matters: the description field is tiny, but it controls discovery quality, false positives, and cross-skill confusion
- claims_supported: skills are typically consulted only when specialized capability is needed; discoverability depends on client-specific registration; a strong description materially affects activation quality
- canonical_exception: no

## 关键事实

- The page emphasizes that agents usually consult skills only for tasks beyond their default capability.
- It highlights specialized knowledge, uncommon formats, and domain workflows as the cases where descriptions matter most.
- It explicitly notes that discoverability varies by client, for example via a directory, config file, or CLI flag.
- Description quality directly affects whether the right skill is activated at the right time.

## 与本研究的关系

- Useful for Topic `01` because it reinforces why the description field is part of the runtime contract, not cosmetic metadata.
- Useful for Topic `07` because reusing existing writing skills depends on understanding how they describe their trigger conditions.
- Useful for Topic `08` because deep-research skills are especially vulnerable to under-triggering or over-triggering.

## 可直接引用的术语 / 概念

- `specialized knowledge`
- `discovery varies by client`
- `description quality`

## 模型 / 宿主 / 版本相关信息

- This is a cross-client guidance page.
- It supports the argument that activation behavior is partly standardized and partly host-dependent.

## 风险与局限

- This source is about one metadata field, not the entire lifecycle.
- It should be combined with spec and host docs for stronger claims.

