# Cursor Task Tool Issues Persisted into 2.5

- source_url: https://forum.cursor.com/t/task-tool-not-available-to-agent-when-subagent-delegation-context-is-injected-2-5-17-windows/152174
- source_type: official_forum
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: 2026-03
- date_scope: 2026-Q1
- related_topic: 04, 08
- trust_level: official
- why_it_matters: proves the early Task/subagent reliability issue did not disappear immediately after the 2.4 launch cycle
- claims_supported: task tool problems persisted into 2.5.17 on Windows; the issue tied to subagent delegation context remained live after earlier 2.4.x reports
- canonical_exception: no

## 关键事实

- The forum thread documents `Task` tool failures in `Cursor 2.5.17` on Windows.
- The thread explicitly links back to earlier 2.4-era task-tool failures.
- This means Cursor’s subagent execution issues were not only launch-week noise; they persisted across release lines.

## 与本研究的关系

- Important for Topic `04` because it sharpens the runtime-maturity caveat.
- Important for Topic `08` because research skills relying on subagent delegation need stable task invocation.

## 可直接引用的术语 / 概念

- `Task tool not available`
- `2.5.17`
- `subagent delegation context`
- `Windows`

## 模型 / 宿主 / 版本相关信息

- This source highlights build- and platform-specific behavior risk.

## 风险与局限

- Forum evidence is field evidence, not a formal engineering postmortem.
- Still valuable because it records real multi-version failure persistence.

