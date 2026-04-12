# Codex Subagents Runtime Controls and Cost

- source_url: https://developers.openai.com/codex/subagents
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 08
- trust_level: official
- why_it_matters: this page shows the real execution layer that advanced Codex skills often depend on
- claims_supported: subagents are enabled by default in current releases; activity is in app and CLI; they cost more tokens; they inherit sandbox policy; custom agents can override model/sandbox/MCP/skills config; recursion depth is controlled; CSV batch fan-out exists experimentally
- canonical_exception: no

## 关键事实

- Current Codex releases enable subagent workflows by default.
- Subagent activity is currently surfaced in the Codex app and CLI; IDE visibility is coming later.
- Codex only spawns subagents when explicitly asked.
- Subagent workflows consume more tokens than comparable single-agent runs.
- Subagents inherit the parent sandbox policy and live runtime approval overrides.
- Custom agent files can define:
  - `name`
  - `description`
  - `developer_instructions`
  - optional `model`
  - `model_reasoning_effort`
  - `sandbox_mode`
  - `mcp_servers`
  - `skills.config`
- Global settings include `agents.max_threads`, `agents.max_depth`, and job runtime limits.
- The docs explicitly warn that raising `max_depth` can increase token use, latency, and local resource consumption.
- Experimental CSV batch fan-out via `spawn_agents_on_csv` exists for structured parallel workflows.

## 与本研究的关系

- Essential for Topic `03` because many high-end Codex skill workflows are actually `skill + custom agents + sandbox + MCP`.
- Essential for Topic `08` because research-oriented orchestration depends on this layer.

## 可直接引用的术语 / 概念

- `enabled by default`
- `consume more tokens`
- `agents.max_threads`
- `agents.max_depth`
- `spawn_agents_on_csv`

## 模型 / 宿主 / 版本相关信息

- This source directly ties skill usefulness to model choice, reasoning effort, sandboxing, and approval behavior.
- It is strong evidence that model/runtime policy is part of practical skill design.

## 风险与局限

- Some subagent workflows are explicitly experimental.
- Strong capabilities come with real token, latency, and predictability tradeoffs.

