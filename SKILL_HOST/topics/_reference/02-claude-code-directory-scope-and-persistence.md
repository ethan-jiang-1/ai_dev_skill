# Claude Code Directory Scope and Persistence

- source_url: https://code.claude.com/docs/en/claude-directory
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 02
- trust_level: official
- why_it_matters: clarifies where skills, plugins, rules, agents, and memories actually live in Claude’s filesystem model
- claims_supported: project and global scope are explicit; skills, commands, rules, and agents are distinct; installed plugins persist under ~/.claude/plugins; plugin versions and orphan cleanup exist
- canonical_exception: no

## 关键事实

- Claude reads configuration and extensions from both project scope and global scope.
- `skills/<name>/SKILL.md` exists at both project and global levels and is shareable via version control when stored in the project.
- The `.claude` directory reference separates:
  - `skills/`
  - `commands/`
  - `rules/`
  - `agents/`
  - `agent-memory/`
  - `settings.json`
- Installed plugins live under `~/.claude/plugins/`.
- That plugin directory stores cloned marketplaces, installed plugin versions, and per-plugin data.
- Orphaned plugin versions are deleted `7` days after plugin update or uninstall.
- Claude also stores plaintext transcripts, history, file snapshots, and other session artifacts under `~/.claude`.

## 与本研究的关系

- Important for Topic `02` because scope and persistence are part of Claude’s actual maintenance model, not just architecture diagrams.
- Especially useful for discussing project-shareable vs personal-only behavior.

## 可直接引用的术语 / 概念

- `project and global scope`
- `~/.claude/plugins/`
- `orphaned versions are deleted 7 days after update or uninstall`
- `plaintext storage`

## 模型 / 宿主 / 版本相关信息

- This page is about host storage behavior rather than model behavior.
- It reveals that lifecycle management and data retention are major operational concerns.

## 风险与局限

- It covers persistence and storage well, but not marketplace strategy or authoring guidance by itself.

