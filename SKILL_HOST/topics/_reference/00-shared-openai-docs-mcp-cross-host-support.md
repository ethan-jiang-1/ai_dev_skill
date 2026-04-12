# OpenAI Docs MCP Cross-Host Support

- source_url: https://developers.openai.com/learn/docs-mcp
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current guide snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 04, 06, 07, 08
- trust_level: official
- why_it_matters: this is a concrete example of how skills, MCP, and AGENTS-style instructions can be composed across multiple coding-agent hosts
- claims_supported: the same MCP server can be used in Codex, VS Code Agent mode, and Cursor; AGENTS.md is used as a behavioral steering layer; OpenAI explicitly recommends pairing Docs MCP with an OpenAI Docs skill
- canonical_exception: no

## 关键事实

- OpenAI hosts a public documentation MCP server at `https://developers.openai.com/mcp`.
- The same guide provides setup paths for:
  - Codex
  - VS Code in Copilot Agent mode
  - Cursor
- For Codex, the guide recommends adding an `AGENTS.md` snippet so the agent consults Docs MCP without needing explicit repeated prompts.
- The same pattern is recommended for Cursor.
- The guide also explicitly recommends pairing the Docs MCP server with an `OpenAI Docs Skill`.

## 与本研究的关系

- Important shared evidence for Topics `03`, `04`, and `06`.
- Strongly supports the idea that modern workflows are often `skill + MCP + AGENTS/rules`, not just raw skill files.

## 可直接引用的术语 / 概念

- `Docs MCP`
- `AGENTS.md`
- `OpenAI Docs Skill`
- `native MCP support`

## 模型 / 宿主 / 版本相关信息

- This source is especially useful for cross-host workflow patterns rather than host-specific internals.
- It shows at least one real 2026 pattern where a skill is expected to guide tool selection rather than replace the tool.

## 风险与局限

- This guide is about OpenAI docs retrieval, not a general-purpose skills standard.
- It should be used as a composition example, not as a universal host-contract definition.

