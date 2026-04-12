# Claude Code Permission Modes and Protected Paths

- source_url: https://code.claude.com/docs/en/permission-modes
- source_type: official_docs
- accessed_at: 2026-04-12 17:35:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 02, 06, 08
- trust_level: official
- why_it_matters: permission modes are part of Claude Code’s execution contract; they determine how skills/hook/subagent workflows behave in practice, especially for research-heavy or automation-heavy skills
- claims_supported: Claude exposes multiple permission modes with explicit tradeoffs; protected paths are never auto-approved; permission rules can layer on top of modes; mode switching is UI-controlled (not prompt-controlled)
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Claude pauses for approval when it wants to:
  - edit files
  - run shell commands
  - make network requests
- Permission modes control how often that approval happens, and can be switched in:
  - CLI (cycle with `Shift+Tab`)
  - VS Code / Desktop / claude.ai mode selector
- Official mode table includes (non-exhaustive):
  - `default`: reads only
  - `acceptEdits`: reads + file edits + common FS commands
  - `plan`: reads only (analyze before edit)
  - `auto`: everything (with background safety checks)
  - `dontAsk`: only pre-approved tools
  - `bypassPermissions`: everything except protected paths (containers/VMs only)
- Protected paths:
  - writes to protected paths are never auto-approved (guards repo state and Claude’s configuration).
- Permission rules:
  - can pre-approve or block specific tools in any mode except `bypassPermissions` (which skips the permission layer entirely).

## 核心内容摘录

- The mode model makes “runtime stability” a governance problem:
  - a skill that assumes uninterrupted execution behaves very differently under `default/plan` vs `auto/dontAsk`.
  - “locked-down” patterns exist (`dontAsk`) but require explicit pre-approval lists.

## 与本研究的关系

- Topic `02`: explains why advanced Claude skills increasingly rely on permission-aware design (e.g., `allowed-tools` in skill frontmatter, or carefully scoped automation).
- Topic `06`: provides an explicit cross-host comparison axis: some hosts surface approvals/modes clearly, others hide constraints behind backend policy or routing.
- Topic `08`: research skills are permission-sensitive; web tools and delegated execution can be “installed” but unusable without mode/policy alignment.

## 可直接引用的术语 / 概念

- `default`, `acceptEdits`, `plan`, `auto`, `dontAsk`, `bypassPermissions`
- `protected paths`
- `permission rules`
- `Shift+Tab` (CLI mode cycle)

## 模型 / 宿主 / 版本相关信息

- Permission modes are part of the host runtime contract; they are not “promptable” (the docs note mode is set via UI controls, not by asking Claude in chat).

## 风险与局限

- “Auto mode” convenience depends on the safety classifier and policy behavior; behavior can differ by deployment and org-managed settings.
- Even with permissive modes, protected paths and tool restrictions still shape what a skill can actually do.

