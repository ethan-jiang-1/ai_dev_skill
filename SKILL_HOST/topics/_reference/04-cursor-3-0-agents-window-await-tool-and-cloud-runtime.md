# Cursor 3.0 Agents Window, Await Tool, and Cloud Runtime

- source_url: https://cursor.com/changelog
- source_type: official_changelog
- accessed_at: 2026-04-12 16:24:00 CST
- published_or_updated_at: 2026-03-25 and 2026-04-02 relevant entries
- date_scope: 2026-Q2
- related_topic: 04, 06, 08
- trust_level: official
- why_it_matters: strengthens the post-launch Cursor story from "skills landed" to "agents became a broader multi-environment runtime," which materially changes how to judge Cursor as a host for complex skills
- claims_supported: Cursor 3.0 added an Agents Window for parallel agents across repos and environments; the release improved subagent/runtime coordination with an Await tool and explorer caching; self-hosted cloud agents extended the same agent capabilities into customer infrastructure
- canonical_exception: no

## 关键事实

- `2026-04-02` Cursor `3.0` introduced an `Agents Window` that can run many agents in parallel:
  - across repos
  - locally
  - in worktrees
  - in the cloud
  - on remote SSH
- The same `3.0` release added:
  - `/worktree`
  - `/best-of-n`
  - `Await` for waiting on background shell commands and subagents
  - caching to improve Explorer subagent startup time
  - a fix so multi-root workspaces load hook files from all workspace folders
- `2026-03-25` Cursor added `self-hosted cloud agents`.
- The self-hosted release says those agents keep code, build outputs, and secrets inside customer infrastructure while still offering:
  - isolated VMs
  - full development environments
  - multi-model harnesses
  - plugins

## 与本研究的关系

- Important for Topic `04` because it shows Cursor is no longer just an IDE-bound skill host; it is becoming a broader agent runtime.
- Important for Topic `06` because it changes the cross-host comparison axis from "editor feature set" to "where agents can run and how they are governed."
- Important for Topic `08` because deep research and orchestration skills benefit directly from parallel agents, worktrees, background waits, and cloud execution surfaces.

## 可直接引用的术语 / 概念

- `Agents Window`
- `run many agents in parallel across repos and environments`
- `Await`
- `/best-of-n`
- `self-hosted cloud agents`

## 模型 / 宿主 / 版本相关信息

- This is strong dated product-evolution evidence for Cursor after the initial skills/subagents rollout.
- It also shows Cursor is investing in execution topology and runtime control, not only in packaging or installation.

## 风险与局限

- Changelog evidence is strong for trajectory and official surface area, but it does not prove every workflow is equally mature on every platform.
