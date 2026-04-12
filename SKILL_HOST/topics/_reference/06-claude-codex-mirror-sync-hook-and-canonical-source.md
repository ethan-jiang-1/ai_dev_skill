# Claude-Codex Mirror Sync Hook and Canonical Source

- source_url: https://gist.github.com/jbn/1dea43d292c3cbc300f298a1d7e8ba6d
- source_type: practitioner_gist
- accessed_at: 2026-04-12 11:49:29 CST
- published_or_updated_at: created 2026-03-06
- date_scope: 2026-Q1
- related_topic: 06
- trust_level: practitioner
- why_it_matters: this is a concrete 2026 maintenance artifact showing that cross-host skill portability can become a repository-governance problem; it formalizes how to keep `.agents/skills` and `.claude/skills` synchronized, which side is canonical, and how drift is blocked before commit
- claims_supported: multi-host reuse often requires duplicated native directories; portability therefore needs canonical-source decisions and sync automation; maintenance cost persists even after file-format alignment
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The gist is explicitly framed as a script to keep `.agents/skills/` and `.claude/skills/` in mirror sync.
- It explains the problem in host-native terms:
  - `.agents/skills/` is treated as the directory read by Pi and Codex CLI
  - `.claude/skills/` is treated as the directory read by Claude Code
  - if the two drift, one tool silently stops seeing skills the other still has
- The script is designed for two modes:
  - `check` mode for pre-commit enforcement
  - `--fix` mode for auto-mirroring
- The fix logic is explicit:
  - if only one side has staged changes, mirror that side to the other
  - if both sides changed differently, abort and force manual resolution
  - if neither side is clearly authoritative, default to `.agents/skills/` as canonical
- The script also stages the mirrored directory after copying, making sync part of normal repo hygiene rather than an ad hoc manual step.

## 核心内容摘录

- This artifact matters because it turns cross-host portability into a concrete maintenance contract:
  - two native directories
  - one declared canonical source
  - an automated drift detector
  - a conflict rule when both sides diverge
- That is more informative than a generic “supports multiple hosts” claim because it shows the operational burden once a team decides to satisfy multiple native host layouts at once.
- It also sharpens a useful distinction for this research:
  - open-format compatibility reduces rewriting pressure
  - but duplicated native directory expectations still create governance work
- In other words, install portability is not the end of the problem; repository discipline is part of the portability story.

## 与本研究的关系

- Important for Topic `06` because it is a concrete maintenance pattern for cross-host skill reuse.
- It provides direct evidence that practitioners are already formalizing canonical-source and mirror-sync policies.
- It strengthens the claim that portability has a maintenance layer in addition to format and runtime layers.

## 可直接引用的术语 / 概念

- `mirror sync`
- `canonical source`
- `pre-commit hook`
- `silently loses access`
- `out of sync`

## 模型 / 宿主 / 版本相关信息

- This is not an official host contract.
- Its value is that it documents a real 2026 operating pattern for maintaining the same skill corpus across Claude-native and `.agents`-native layouts.

## 风险与局限

- The directory assumptions are practitioner-authored and should not override official docs when they conflict.
- This source is strongest as evidence of maintenance burden and synchronization strategy, not as authoritative path specification.
