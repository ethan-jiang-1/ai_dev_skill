# Cross-Host Sync Skill: Normalization Demand and Path Drift

- source_url: https://skills.sh/chujianyun/skills/sync-skills
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:02:00 CST
- published_or_updated_at: first seen 2026-01-22
- date_scope: 2026-Q1
- related_topic: 06, 07
- trust_level: practitioner
- why_it_matters: this is strong ecosystem evidence that users actively need to distribute the same skill across many hosts, while also revealing that community-maintained portability maps can drift from current official host docs
- claims_supported: cross-host sync is now a real user need; `.agents/skills` is treated as a universal anchor by practitioners; path normalization across hosts is fragile and can become stale
- canonical_exception: no

## 关键事实

- The skill exists specifically to sync one skill into multiple AI coding tool directories.
- It treats `~/.agents/skills` as a mandatory sync target and auto-creates it if missing.
- It contains an explicit host-directory map for many tools, including:
  - `~/.claude/skills`
  - `~/.cursor/skills`
  - `~/.codex/skills`
  - `~/.config/opencode/skill`
- The listing reports:
  - first seen `Jan 22, 2026`
  - weekly installs `42`
  - installs on `gemini-cli`, `codex`, `cursor`, `opencode`, `github-copilot`, `antigravity`
- Compared with current official OpenCode docs used elsewhere in this research, this skill’s `~/.config/opencode/skill` path appears stale against the current `skills` directory convention.

## 与本研究的关系

- Important for Topic `06` because it is a real portability artifact, not a theory piece.
- It shows that users are already solving cross-host sync operationally.
- It also shows that community portability metadata can drift from current host contracts.

## 可直接引用的术语 / 概念

- `mandatory sync target`
- `universal skill directory`
- `sync to multiple AI tools`
- `path drift`

## 模型 / 宿主 / 版本相关信息

- This is not an official contract.
- Its value is precisely that it captures how practitioners operationalize portability and where those maps can go stale.

## 风险与局限

- Because this is practitioner-maintained, any directory map inside it should be treated as ecosystem evidence, not authoritative host documentation.
