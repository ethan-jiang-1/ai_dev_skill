# Codex Skills Locations, Lifecycle, and Policy

- source_url: https://developers.openai.com/codex/skills
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current Codex skills docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03
- trust_level: official
- why_it_matters: this is the main Codex source for where skills live, how they load, how they are installed, and how they are disabled
- claims_supported: skills exist across CLI/IDE/app; progressive disclosure uses metadata first; repo/user/admin/system scopes are explicit; plugins are the preferred reusable distribution path; skills can be disabled in config; openai.yaml supports invocation policy and dependencies
- canonical_exception: no

## 关键事实

- Skills are available in the Codex CLI, IDE extension, and Codex app.
- Codex uses progressive disclosure:
  - metadata first
  - full `SKILL.md` only when used
- A skill directory can include `SKILL.md`, `scripts/`, `references/`, `assets/`, and `agents/openai.yaml`.
- Codex activation supports:
  - explicit invocation via `/skills` or `$`
  - implicit invocation based on `description`
- Codex reads skills from:
  - repo scope under `.agents/skills` from current directory up to repo root
  - user scope under `$HOME/.agents/skills`
  - admin scope under `/etc/codex/skills`
  - system scope bundled with Codex
- Codex supports symlinked skill folders.
- For reusable distribution beyond local authoring, OpenAI recommends plugins.
- `$skill-installer` supports installing curated skills, and Codex can detect newly installed skills automatically.
- `[[skills.config]]` entries in `~/.codex/config.toml` can disable a skill without deleting it.
- `agents/openai.yaml` can define UI metadata, invocation policy, and tool dependencies such as MCP servers.

## 与本研究的关系

- Foundational for Topic `03`.
- It is the strongest official source for Codex-specific lifecycle and discovery mechanics.

## 可直接引用的术语 / 概念

- `repo / user / admin / system`
- `[[skills.config]]`
- `allow_implicit_invocation`
- `agents/openai.yaml`
- `plugins for reusable distribution`

## 模型 / 宿主 / 版本相关信息

- This page is Codex-specific and current.
- It shows Codex exposes more lifecycle controls around skills than a pure file-format view would imply.

## 风险与局限

- The page covers intended mechanics, not every operational edge case.
- It should be paired with subagent, hook, and product-surface sources.

