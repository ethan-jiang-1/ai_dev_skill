# mcp-research SKILL.md: Tool Selection, Evidence Discipline, and “Don’t Trust Memory”

- source_url: https://raw.githubusercontent.com/ahgraber/skills/main/skills/mcp-research/SKILL.md
- source_type: practitioner_skill_definition
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: last commit touching file 2026-04-09 (GitHub commit `fa281fb`)
- date_scope: 2026-Q2
- related_topic: 06, 08
- trust_level: practitioner
- why_it_matters: this is a concrete 2026 “research discipline” skill that encodes tool-routing and quality rules; it supports the claim that valuable research skills package governance steps (source selection, conflict handling, fact/inference separation) rather than only search calls
- claims_supported: research workflows should prefer primary docs; tool routing should be explicit; dependency/version decisions require current verification; conflicts should be reported with safe recommendations; outputs should separate sourced facts from inferences
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The skill instructs the agent to announce invocation: `mcp-research`.
- It states its core intent explicitly:
  - use MCP-provided tools to retrieve current, verifiable information instead of relying on memory for fast-changing ecosystems.
- It provides explicit tool-routing guidance:
  - `mcp__context7__resolve-library-id` + `mcp__context7__query-docs` for official docs/API usage
  - `mcp__exa__get_code_context_exa` for code-centric examples across docs/GitHub/Stack Overflow
  - `mcp__exa__web_search_exa` for broader current web context (announcements/release notes)
  - `mcp__jina__search_web` + `mcp__jina__read_url` for discovery + clean extraction
  - arXiv/PDF tools only for paper-level work
- Default workflow is explicit:
  - classify request type, start narrow (official docs first), resolve library id before querying, keep queries specific, synthesize and separate facts from inferences.
- Quality rules include:
  - prefer primary docs for API signatures/behavior
  - verify current versions before recommending
  - cite concrete tool findings; report conflicts and recommend safe paths (pin/test/release notes)
  - state limits explicitly when coverage is weak

## 核心内容摘录

- The skill encodes “research governance” as operational steps:
  - source hierarchy (official → examples → broad web)
  - explicit conflict handling
  - explicit epistemic labeling (facts vs inferences)

## 与本研究的关系

- Topic `06`: supports the portability framing that “useful interoperability” often depends on translating tool surfaces while preserving the research method and evidence discipline.
- Topic `08`: provides a concrete example of a research skill that is not just a search wrapper; it is a routing + validation + synthesis contract.

## 可直接引用的术语 / 概念

- “don’t rely on memory for fast-changing libraries”
- “prefer primary/official documentation”
- “separate sourced facts from inferences”
- explicit MCP tool routing (`context7` / `exa` / `jina`)

## 模型 / 宿主 / 版本相关信息

- This skill assumes the host provides MCP tool wiring with those tool names; cross-host reuse may require translating tool labels and permission envelopes.

## 风险与局限

- Tool availability is host- and policy-dependent; a host without MCP support (or with restricted MCP allowlists) cannot execute this workflow as written.
- Even when tools exist, provider/network/approval constraints can force fallbacks; the skill’s value depends on the runtime contract being satisfiable.

