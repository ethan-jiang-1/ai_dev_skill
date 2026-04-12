# Cursor Subagent and Skill Rollout Friction

- source_url: https://forum.cursor.com/t/task-tool-missing-for-custom-agents-in-cursor-agents-documentation-pages-return-errors/149771
- source_type: official_forum
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: 2026-01-29 to 2026-02-14
- date_scope: 2026-Q1
- related_topic: 04, 08
- trust_level: official
- why_it_matters: polished changelogs alone would hide that early 2026 Cursor rollout still had serious subagent reliability issues
- claims_supported: task tool regressions affected custom subagents across 2.4.x builds; official staff acknowledged awareness; rollback and configuration workarounds were discussed publicly
- canonical_exception: no

## 关键事实

- Users reported that the `Task` tool required for custom subagents was broken across some `2.4.x` releases.
- The official thread references `2.4.21`, `2.4.22`, and `2.4.27` behaviors.
- Cursor staff acknowledged the issue and lack of immediate fix timeline.
- Workarounds included rollback to earlier versions and avoiding some auto settings in specific cases.

## 与本研究的关系

- Important for Topic `04` because it shows that Cursor’s extension stack was still maturing operationally in 2026.
- Important for Topic `08` because deep research workflows depend heavily on reliable delegation.

## 可直接引用的术语 / 概念

- `Task tool`
- `custom subagents`
- `2.4.x regressions`
- `rollback workaround`

## 模型 / 宿主 / 版本相关信息

- The bug reports reference concrete models and builds in the field, highlighting that runtime behavior can diverge from docs and changelog promises.

## 风险与局限

- Forum evidence is weaker than a formal RCA, but it is valuable for real failure modes and operational confidence.

