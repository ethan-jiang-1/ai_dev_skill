# OpenCode Agents, Permissions, and Subagent Design

- source_url: https://opencode.ai/docs/agents
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: updated 2026-04-07
- date_scope: 2026-04
- related_topic: 05, 08
- trust_level: official
- why_it_matters: this is where OpenCode exposes execution control most explicitly, which matters for advanced skill workflows
- claims_supported: agents can be primary or subagent; agents can set models and tools; markdown-defined subagents can carry permission rules; memory and explicit agent invocation exist
- canonical_exception: no

## 关键事实

- OpenCode distinguishes between primary agents and subagents.
- Agents can be configured with custom prompts, models, and tool access.
- Subagents can be defined in markdown and invoked manually or by primary agents.
- Agents can embed permission configuration directly in their markdown frontmatter.
- Agent memory can be enabled and scoped.

## 与本研究的关系

- Important for Topic `05` because OpenCode exposes agent execution policy directly.
- Important for Topic `08` because research workflows depend on agent decomposition and permission control.

## 可直接引用的术语 / 概念

- `primary agents`
- `subagents`
- `tool access`
- `memory`
- `markdown-defined agents`

## 模型 / 宿主 / 版本相关信息

- This source tightly couples skill execution potential with model and permission choices.

## 风险与局限

- Explicitness is powerful, but it also raises the configuration burden on users.

