# Cross-Host Codex-Claude Loop Example

- source_url: https://skills.sh/bear2u/my-skills/codex-claude-loop
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: first seen 2026-01-23
- date_scope: 2026-Q1
- related_topic: 06, 08
- trust_level: practitioner
- why_it_matters: this is a rare explicit example of a skill that does not merely claim compatibility, but encodes a handoff workflow across multiple coding agents
- claims_supported: cross-host skills are now being packaged as deliberate workflows; host portability can mean orchestration between tools rather than one-tool equivalence; install breakdowns reveal multi-host usage
- canonical_exception: no

## 关键事实

- The skill encodes an engineering loop where:
  - Claude Code handles planning and implementation
  - Codex handles validation and review
  - Context handoff is part of the workflow contract
- The workflow includes `codex exec`, `codex exec resume --last`, and repeated validation loops.
- The page reports:
  - first seen `Jan 23, 2026`
  - weekly installs `28`
  - installs across `codex`, `gemini-cli`, `opencode`, `claude-code`, `cursor`, and `github-copilot`

## 与本研究的关系

- Important for Topic `06` because it shows a different kind of portability: workflow interoperability instead of single-host equivalence.
- Important for Topic `08` because advanced research/engineering skills may increasingly orchestrate multiple agents rather than stay inside one host.

## 可直接引用的术语 / 概念

- `Claude Code: Architecture, planning, and execution`
- `Codex: Validation and code review`
- `Context Handoff`
- `codex exec resume --last`

## 模型 / 宿主 / 版本相关信息

- This is a practitioner ecosystem example, not an official host contract.
- It is still valuable because it shows how users are actually operationalizing multi-agent skill workflows in 2026.

## 风险与局限

- A cross-host workflow can be installable across many tools while still depending heavily on one or two of them for core steps.

