# OpenCode Agents and Permissions

- source_url: https://opencode.ai/docs/agents
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: page last updated 2026-04-07
- date_scope: 2026-04
- related_topic: 05, 06, 08
- trust_level: official
- why_it_matters: OpenCode makes permissions and subagents explicit, which is crucial for understanding how advanced skills can or cannot execute
- claims_supported: OpenCode has primary agents and subagents; agents can carry custom prompts/models/tool access; permissions are explicit and per-agent; markdown-defined subagents can deny edit/bash/webfetch
- canonical_exception: no

## 关键事实

- OpenCode distinguishes primary agents and subagents.
- Subagents can be invoked by primary agents for specialized tasks and can also be manually invoked with `@`.
- Agents are configurable with custom prompts, models, and tool access.
- Permissions for `edit`, `bash`, and `webfetch` can be set to `ask`, `allow`, or `deny`.
- Permissions can be overridden per agent.
- Markdown-defined subagents can embed permission rules directly in frontmatter.

## 与本研究的关系

- Essential for Topic `05` because it shows how OpenCode operationalizes agent decomposition.
- Essential for Topic `08` because research-oriented skills often require subagents plus permission design, not just instructions.
- Useful for Topic `06` as a contrast with hosts that hide more of this execution layer.

## 可直接引用的术语 / 概念

- `primary agents`
- `subagents`
- `ask / allow / deny`
- `Markdown agents`
- `tool access`

## 模型 / 宿主 / 版本相关信息

- This source explicitly links agent behavior to model selection and tool permissions.
- It is one of the strongest host docs for showing that advanced skill outcomes depend on execution policy, not just skill content.

## 风险与局限

- This source explains the execution framework but not the exact performance characteristics of each model/backend combination.
- It should be paired with actual workflow examples later in Wave 1.

