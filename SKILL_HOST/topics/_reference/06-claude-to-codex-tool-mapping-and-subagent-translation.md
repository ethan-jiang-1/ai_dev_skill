# Claude-to-Codex Tool Mapping and Subagent Translation

- source_url: https://gist.github.com/jylkim/ab9cb20e834532ea567d767fef14d268
- source_type: practitioner_gist
- accessed_at: 2026-04-12 17:29:00 CST
- published_or_updated_at: created 2026-03-18
- date_scope: 2026-Q1
- related_topic: 06, 08
- trust_level: practitioner
- why_it_matters: this is a rare concrete migration artifact that does not merely claim cross-host compatibility; it explicitly translates Claude-oriented tool names, planning semantics, and subagent references into Codex-compatible behavior
- claims_supported: cross-host adaptation often requires a translation layer, not just a shared `SKILL.md`; tool names, worktree/planning assumptions, and subagent labels are portability breakpoints; some concepts map cleanly while others have no standard Codex equivalent
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The gist is explicitly framed as a way to translate Claude Code-specific tool references into Codex behavior when they appear inside skills, prompts, docs, or other instructions.
- It maps common tool references such as:
  - `Read` -> read-file or shell equivalents
  - `Edit` / `Write` -> `apply_patch`
  - `Glob` -> `rg --files` or `find`
  - `Grep` -> `grep_files` or `rg`
  - `Bash` -> shell-like command tool
  - `Skill` -> open and follow the referenced `SKILL.md`
  - `WebFetch` -> shell fetch or MCP
  - `WebSearch` -> `web_search`
  - `TaskCreate` / `TaskGet` / `TaskList` / `TaskUpdate` / `TaskStop` / `TaskOutput` -> `update_plan`
- It also maps subagent references:
  - `general-purpose` -> Codex `default` or `worker`
  - `Explore` -> Codex `explorer`
  - `Plan` -> no standard public Codex equivalent; do planning in the parent or simulate with a planning-only spawned agent
- The gist explicitly says not to assume direct Codex equivalents for:
  - `EnterPlanMode` / `ExitPlanMode`
  - some Claude-style subagent labels

## 核心内容摘录

- The most important thing about this artifact is not any single mapping, but its structure:
  - it treats cross-host reuse as a translation problem
  - not as a naive “drop the same instructions everywhere” problem
- The mapping divides portability into three categories:
  - concepts that map fairly directly, like `Edit -> apply_patch`
  - concepts that map only through a behavioral substitute, like `WebFetch` via shell or MCP
  - concepts with no stable public Codex equivalent, such as direct plan-mode switching
- The subagent section sharpens this further:
  - even when both hosts support delegation, the role taxonomy is different
  - `general-purpose`, `Explore`, and `Plan` are not universal runtime objects
  - the migration path is to reinterpret intent, not to preserve the exact label
- This is exactly the kind of evidence that turns “partial compatibility” from a slogan into an engineering statement:
  - if you want Claude-oriented skills to run well in Codex
  - you often need a compatibility layer that rewrites tool calls, planning assumptions, and agent-role references

## 与本研究的关系

- Important for Topic `06` because it is a direct portability/adaptation artifact.
- Important for Topic `08` because research skills frequently include tool references and subagent labels that are host-shaped rather than universal.

## 可直接引用的术语 / 概念

- `translate Claude Code-specific tool references into Codex behavior`
- `do not assume ... equivalent`
- `general-purpose -> default / worker`
- `Explore -> explorer`
- `Plan -> no standard public Codex equivalent`

## 模型 / 宿主 / 版本相关信息

- This source is practitioner-authored, not an official host contract.
- Its value is that it exposes the actual adaptation work needed when moving skills across hosts with similar overall capability but different tool vocabularies.

## 风险与局限

- Because this is a gist, it reflects one practitioner’s mapping strategy rather than official Codex guidance.
- Still highly useful because it is concrete, recent, and centered on exact portability breakpoints.
