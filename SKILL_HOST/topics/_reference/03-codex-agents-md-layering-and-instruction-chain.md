# Codex AGENTS.md Layering and Instruction Chain

- source_url: https://developers.openai.com/codex/guides/agents-md
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current guide snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 06
- trust_level: official
- why_it_matters: Codex’s persistent instruction chain is a core boundary line between AGENTS.md and skills
- claims_supported: Codex reads AGENTS files before work begins; global and project scopes have explicit precedence; nested overrides are supported; instruction size is capped; fallback filenames can be configured
- canonical_exception: no

## 关键事实

- Codex reads `AGENTS.md` files before doing work.
- Discovery precedence:
  - global scope in `~/.codex`
  - project root down to current working directory
  - nested files later in the chain override earlier guidance
- Codex supports `AGENTS.override.md`.
- Combined instruction size is capped by `project_doc_max_bytes`, default `32 KiB`.
- Alternate fallback filenames can be configured through `project_doc_fallback_filenames`.
- `CODEX_HOME` can redirect the global profile.

## 与本研究的关系

- Important for Topic `03` because skills in Codex live next to a strong always-on instruction chain.
- Important for Topic `06` because comparison across hosts requires separating persistent guidance from on-demand workflow objects.

## 可直接引用的术语 / 概念

- `instruction chain`
- `AGENTS.override.md`
- `project_doc_max_bytes`
- `project_doc_fallback_filenames`
- `CODEX_HOME`

## 模型 / 宿主 / 版本相关信息

- This is host-side configuration behavior, not model behavior.
- It explains why some workflow logic belongs in AGENTS and not in skills.

## 风险与局限

- The guide is about instruction loading, not direct skill packaging.
- It must be combined with the skills docs to analyze the true boundary.

