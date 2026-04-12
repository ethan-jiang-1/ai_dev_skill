# Claude Code Tool Permissions, Web Controls, and Subagent Inheritance

- source_url: https://code.claude.com/docs/en/settings and https://code.claude.com/docs/en/sub-agents
- source_type: official_docs
- accessed_at: 2026-04-12 17:02:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 02, 06, 08
- trust_level: official
- why_it_matters: clarifies the practical runtime surface for research-oriented skills in Claude Code by showing which tools require permission, how background subagents inherit approvals, and how tool access can be narrowed or expanded
- claims_supported: WebSearch and WebFetch are permission-gated; Task/Agent orchestration semantics have evolved; subagents inherit tools and permissions by default but can be restricted; background subagents auto-deny anything not pre-approved
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Claude Code settings docs list:
  - `Task` as the subagent-running tool in the main tool table
  - `WebFetch` as permission-required
  - `WebSearch` as permission-required
- The same settings docs show `permissions.deny` can hide sensitive files like `.env`, `.env.*`, `secrets/**`, and credentials files from discovery and reads.
- Subagent docs say:
  - subagents run in their own context window
  - by default they inherit all tools from the main conversation, including MCP tools
  - `tools` and `disallowedTools` can narrow capabilities
  - if `Agent` is omitted from a main-thread agent’s tools list, it cannot spawn subagents
- The docs also record an evolution signal:
  - in version `2.1.63`, `Task` was renamed to `Agent`
  - existing `Task(...)` references still work as aliases
- Background subagents require approvals up front:
  - Claude prompts before launch for the permissions the subagent will need
  - once running, the background subagent inherits those approvals
  - anything not pre-approved is auto-denied
- Claude’s subagent docs explicitly recommend subagents for:
  - isolating high-volume operations
  - running parallel research
  - chaining multi-step workflows

## 核心内容摘录

- Claude’s current host contract for research-like work is explicit rather than implicit:
  - the main settings surface treats `WebFetch` and `WebSearch` as permission-gated tools
  - sensitive-file hiding can be expressed directly through `permissions.deny`
  - background subagents are not free-form workers; they inherit only what was approved before launch, and anything outside that envelope is auto-denied
- The subagent docs also make the execution model concrete:
  - subagents have isolated context windows
  - they inherit main-thread tools and MCP access by default
  - that inheritance can then be narrowed with `tools` or `disallowedTools`
  - omitting `Agent` from a parent agent’s tool list prevents further delegation
- There is also a real semantic-evolution signal here:
  - `Task` was renamed to `Agent`
  - legacy `Task(...)` references still work as aliases
  - this matters for cross-host skill reuse, because community skills may still encode older call shapes

## 与本研究的关系

- Important for Topic `02` because it sharpens Claude’s real research/runtime boundary beyond generic “supports subagents.”
- Important for Topic `06` because it gives a host-specific example of explicit permission and delegation semantics.
- Important for Topic `08` because advanced research skills often assume search, fetch, delegation, and safe context isolation are all available together.

## 可直接引用的术语 / 概念

- `WebFetch` / `WebSearch` require permission
- `background subagents ... auto-deny anything not pre-approved`
- `inherit all tools from the main conversation, including MCP tools`
- `Task was renamed to Agent`
- `run parallel research`

## 模型 / 宿主 / 版本相关信息

- This source shows Claude’s runtime constraints are relatively explicit and documented.
- It also shows that research-skill portability can break on tool permissions even when the skill format itself is portable.

## 风险与局限

- Settings docs expose the host contract, but they do not guarantee every community skill handles these constraints correctly.
