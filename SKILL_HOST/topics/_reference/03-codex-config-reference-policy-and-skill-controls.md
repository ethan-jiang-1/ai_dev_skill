# Codex Config Reference: Approval Policy, Sandbox, Web Search, and Skill Controls

- source_url: https://developers.openai.com/codex/config-reference
- source_type: official_docs
- accessed_at: 2026-04-12 17:45:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 06, 08
- trust_level: official
- why_it_matters: this page is the most granular official contract for Codex runtime governance (approvals, sandboxing, web search modes, MCP allowlists) and per-skill overrides in `config.toml`
- claims_supported: approval policy is multi-mode and can be granular; sandbox/network controls are explicit; web search has explicit allowed modes and tool config; skills can be enabled/disabled via `skills.config`; MCP servers can be allowlisted with identity checks; model and reasoning effort are explicit config surfaces
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- `approval_policy`:
  - controls when Codex pauses for approval before executing commands
  - supports granular allow/auto-reject by prompt category; `on-failure` is deprecated in favor of `on-request` (interactive) or `never` (non-interactive)
- `sandbox_mode`:
  - explicit sandbox policy for filesystem/network access during command execution
- Skill controls via `skills.config`:
  - `skills.config` is a per-skill override array stored in `config.toml`
  - entries include:
    - `skills.config.<index>.path`: path to a skill folder containing `SKILL.md`
    - `skills.config.<index>.enabled`: enable/disable the referenced skill
- Web search governance:
  - `allowed_web_search_modes`: allowed values for `web_search` (`disabled`, `cached`, `live`)
  - `tools.web_search`: web search tool configuration (object form supports search context size, allowed domains, and approximate user location)
- MCP governance:
  - `mcp_servers`: allowlist of MCP servers; both server name and identity must match or the server is disabled
- Model governance:
  - `model` is explicitly configurable (example given: `gpt-5.4`)
  - `reasoning_effort` is an exposed configuration surface (documented in the same reference schema)

## 核心内容摘录

- The config reference makes “skill usefulness” explicitly dependent on governance:
  - approval policies decide whether a workflow can run uninterrupted
  - sandbox/network settings decide whether shell + network steps are even possible
  - web search modes (`disabled/cached/live`) turn “research skills” into either live retrieval workflows or offline/bounded ones
  - MCP allowlists prevent silent “tool exists but can’t be used” surprises at scale

## 与本研究的关系

- Topic `03`: hard evidence that Codex treats skills as part of an engineered runtime contract, with explicit controls for safety, governance, and repeatability.
- Topic `06`: supports cross-host comparison: Codex exposes the constraint surface (approvals/sandbox/search/MCP allowlists) in a machine-configurable way rather than hiding it.
- Topic `08`: research skills must explicitly account for `web_search` mode, sandbox/network, and approvals, otherwise they become “installable but non-runnable”.

## 可直接引用的术语 / 概念

- `approval_policy` (`on-request`, `never`, granular)
- `sandbox_mode`
- `skills.config.<index>.path`
- `skills.config.<index>.enabled`
- `allowed_web_search_modes` (`disabled`, `cached`, `live`)
- `tools.web_search` (domains, context size, approximate location)
- `mcp_servers` allowlist + identity match
- `model` / `reasoning_effort`

## 模型 / 宿主 / 版本相关信息

- This reference is a schema-like snapshot of Codex governance surfaces as of 2026-04-12, useful even when some pages do not display explicit “last updated” timestamps.

## 风险与局限

- A config surface being documented does not guarantee every environment enables it (enterprise/admin policies can override).
- Web search behavior can still depend on provider/runtime policy beyond the local config fields.

