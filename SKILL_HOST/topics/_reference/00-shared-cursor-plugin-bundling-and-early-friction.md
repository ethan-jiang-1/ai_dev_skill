# Cursor Plugin Bundling and Early Friction

- source_url: https://cursor.com/changelog/page/3
- source_type: official_changelog_plus_official_forum_context
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: 2026-02-17 changelog plus 2026-01-29 to 2026-02-14 official forum reports
- date_scope: 2026-Q1
- related_topic: 04, 06, 08
- trust_level: official
- why_it_matters: shows both where Cursor is heading and where early 2026 reality still had operational roughness
- claims_supported: Cursor is moving toward bundled plugin installs that include skills/subagents/MCP/hooks/rules; early subagent rollout had task-tool reliability problems in the field
- canonical_exception: no

## 关键事实

- `2026-02-17` Cursor changelog states that marketplace plugins can package skills, subagents, MCP servers, hooks, and rules into a single install.
- This is a major signal that Cursor is treating `skills` less as isolated files and more as one component in an installable bundle.
- Official Cursor forum threads from late January to mid-February 2026 reported task-tool failures for custom subagents during the early 2.4 rollout.
- Forum moderation acknowledged the issue and users reported workarounds and regressions across some 2.4.x builds.

## 与本研究的关系

- Useful for Topic `04` because it explains why pure file-format support is not the whole story.
- Useful for Topic `06` because plugin-bundled extensibility and runtime stability are distinct evaluation axes.
- Useful for Topic `08` because research skills often rely on subagent execution, where rough edges matter.

## 可直接引用的术语 / 概念

- `plugins package skills, subagents, MCP servers, hooks, and rules`
- `Cursor Marketplace`
- `Task tool`
- `early rollout friction`

## 模型 / 宿主 / 版本相关信息

- These are host/runtime signals, not format-level facts.
- They are especially relevant to adoption risk and operational readiness.

## 风险与局限

- The limitation evidence includes official forum discussion, which is weaker than a formal RCA.
- Still valuable because it captures real rollout friction that polished docs often omit.

