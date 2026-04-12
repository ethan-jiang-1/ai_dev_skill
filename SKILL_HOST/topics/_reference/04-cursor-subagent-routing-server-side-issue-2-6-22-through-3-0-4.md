# Cursor Subagent Routing Server-Side Issue from 2.6.22 through 3.0.4

- source_url: https://forum.cursor.com/t/task-tool-not-injected-in-ide-sessions-subagents-unavailable-custom-subagents/156421
- source_type: official_forum
- accessed_at: 2026-04-12 16:42:00 CST
- published_or_updated_at: 2026-04-01 to 2026-04-07 thread activity
- date_scope: 2026-Q2
- related_topic: 04, 06, 08
- trust_level: official
- why_it_matters: this is stronger than generic bug chatter because Cursor staff explicitly confirmed a server-side provisioning problem affecting subagents across versions, and also revealed hidden routing assumptions tied to plan and model restrictions
- claims_supported: Task tool provisioning could fail independently of local agent files or model choice; the problem persisted across 2.6.22, rollback to 2.5, and 3.0.4; subagent routing for some request-based enterprise users depended on Composer availability; the eventual fix was server-side
- canonical_exception: no

## 关键事实

- The report documents custom and built-in subagents failing because the `Task` tool was not available in Cursor IDE sessions.
- The affected version explicitly listed was `2.6.22`, dated `2026-03-27`.
- Cursor support confirmed:
  - the `Task` tool was not being provisioned in those agent sessions
  - the issue was server-side
  - it was not caused by subagent file setup or model selection
- The same thread later records that the user tested:
  - rollback to `2.5`
  - upgrade to `3.0.4`
  and still saw the same issue.
- Cursor support also disclosed an important hidden runtime dependency:
  - for request-based enterprise users, subagents were currently routed through Composer
  - team-level model restrictions could therefore block subagent availability
- On `2026-04-07`, support reported that a server-side fix had been deployed to correct how model restrictions interacted with subagent routing.

## 与本研究的关系

- Important for Topic `04` because it proves Cursor subagent reliability is not only a local client-version story; backend provisioning and account configuration matter too.
- Important for Topic `06` because this is a concrete interoperability break: nominally identical skills can behave differently depending on hidden host routing logic.
- Important for Topic `08` because deep research skills often rely on delegated execution, which becomes fragile when Task/subagent routing depends on plan and model policy.

## 可直接引用的术语 / 概念

- `Task tool was not being provisioned`
- `server-side issue`
- `2.6.22`
- `3.0.4`
- `subagents ... currently routed through Composer`

## 模型 / 宿主 / 版本相关信息

- This source shows that Cursor subagent behavior is influenced by backend routing and admin policy, not just by the visible skill or agent file.
- It is especially valuable for understanding why some workflows feel intermittently portable or reproducible only on some teams.

## 风险与局限

- This is official forum evidence rather than a formal engineering postmortem.
- It is still highly valuable because staff explicitly confirmed the failure mode and the server-side fix.
