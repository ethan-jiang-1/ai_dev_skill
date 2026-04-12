# OpenCode Permission Granularity and Command Policy

- source_url: https://opencode.ai/docs/permissions/
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: published last week before access
- date_scope: 2026-04
- related_topic: 05, 08
- trust_level: official
- why_it_matters: permission granularity is a major differentiator for OpenCode-hosted skills
- claims_supported: permissions can be allow/ask/deny; command-level pattern matching exists; per-agent overrides exist; markdown-defined agent permissions are supported
- canonical_exception: no

## 关键事实

- OpenCode permissions can be configured globally in `opencode.json`.
- Permission policies support command-pattern matching, for example allowing `git *` while denying `git push *`.
- Permissions can be overridden per agent.
- Markdown agent files can define permissions like:
  - `edit: deny`
  - `bash: ask`
  - `webfetch: deny`

## 与本研究的关系

- Important for Topic `05` because many advanced skills become usable or unusable depending on command policy.
- Important for Topic `08` because research and automation workflows often need fine-grained fetch/bash/edit control.

## 可直接引用的术语 / 概念

- `allow / ask / deny`
- `pattern matching`
- `git push *: deny`
- `per-agent overrides`

## 模型 / 宿主 / 版本相关信息

- This is operational governance, not model architecture, but it strongly affects what any model-hosted skill can safely do.

## 风险与局限

- Fine-grained permissions improve safety but can make complex workflows harder to debug when commands silently fall under a different rule than expected.

