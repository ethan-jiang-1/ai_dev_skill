# skill-codex: Claude Plugin Delegation to Codex CLI

- source_url: https://github.com/skills-directory/skill-codex
- source_type: practitioner_repo
- accessed_at: 2026-04-12 11:49:29 CST
- published_or_updated_at: current public repo snapshot accessed 2026-04-12; exact latest commit timestamp not exposed in fetched page
- date_scope: current-2026
- related_topic: 02, 03, 06
- trust_level: practitioner
- why_it_matters: this repository shows a concrete cross-host interoperability pattern where a Claude Code plugin/skill does not try to become native Codex; instead it wraps `codex exec` and exposes Codex model, reasoning, and sandbox choices from inside Claude workflows
- claims_supported: cross-host interoperability can be packaged as host-to-host delegation rather than one-host equivalence; advanced skills increasingly encode runtime policy choices such as model, reasoning effort, sandbox mode, and context-budget hygiene
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The repository is explicitly titled `Codex Integration for Claude Code`.
- It states its purpose as enabling Claude Code to invoke the Codex CLI for automated code analysis, refactoring, and editing workflows.
- The repo is structured as a Claude Code plugin, with both `.claude-plugin` metadata and a `plugins/skill-codex` folder.
- Installation is offered in two forms:
  - plugin installation through Claude Code marketplace commands
  - standalone skill extraction into `~/.claude/skills/codex`
- The documented workflow asks Claude to:
  - choose a Codex model such as `gpt-5.4`, `gpt-5.3-codex-spark`, or `gpt-5.3-codex`
  - choose reasoning effort
  - select sandbox mode
  - run `codex exec ... --full-auto`
- The README also notes a context-hygiene decision:
  - thinking tokens on stderr are suppressed by default to avoid bloating Claude Code context

## 核心内容摘录

- This repo is valuable because it shows a third kind of portability beyond direct reuse and directory sync:
  - one host can package the other host as a delegated runtime
- That means cross-host interoperability in 2026 is not just:
  - “copy the same `SKILL.md` everywhere”
  - or “translate tool names when needed”
- It can also mean:
  - use a skill or plugin in Host A to drive Host B as a specialized worker
- The runtime contract is especially informative:
  - model selection remains explicit
  - reasoning effort remains explicit
  - sandbox choice remains explicit
  - context-pressure from delegated output is managed deliberately
- So the interoperability story is increasingly about orchestration and governance, not only shared file format.

## 与本研究的关系

- Important for Topic `06` because it is a concrete interoperability package rather than an abstract compatibility claim.
- It also reinforces Topic `02` and Topic `03` by showing how Claude and Codex are already being combined as differentiated roles inside one workflow.

## 可直接引用的术语 / 概念

- `delegate prompts to codex`
- `plugin installation`
- `standalone skill extraction`
- `thinking tokens`
- `sandbox mode`

## 模型 / 宿主 / 版本相关信息

- The repo assumes an installed and authenticated Codex CLI.
- It is especially useful because it surfaces model and runtime controls directly in the cross-host workflow rather than hiding them.

## 风险与局限

- This is a practitioner repository, not an official interop contract from Claude or OpenAI.
- Its existence does not prove native equivalence between hosts; it proves that delegated interop is valuable enough to package explicitly.
