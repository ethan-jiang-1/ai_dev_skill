# skills_sync Example `skills.yaml`: Wildcards, Exclusions, and Large-Scale Multi-Repo Curation

- source_url: https://raw.githubusercontent.com/mono0926/skills-sync/main/example/mono/skills.yaml
- source_type: practitioner_repo_file
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: repo main updated 2026-04-09 (GitHub commit `2c01398`)
- date_scope: 2026-Q2
- related_topic: 06
- trust_level: practitioner
- why_it_matters: this is a real-world configuration artifact demonstrating how people curate and deduplicate skills across many repos and projects; it turns “portability” into explicit include/exclude and per-project scope decisions
- claims_supported: multi-repo skill curation is happening at scale; wildcard selection (`*`) and exclusion (`!`) are used to manage duplicates and reduce noise; per-path overrides show that “one global skill set” is insufficient
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- The example config uses:
  - a `global:` section that lists many skill sources (GitHub orgs/repos and local sources)
  - `'*'` wildcard patterns to include broad sets of skills
  - `'!<pattern>'` exclusions to avoid duplicates or irrelevant skills (comments explain “avoid duplication” / “already migrated” / “not needed on this machine”)
- The example also defines per-path sections (e.g., `~/Git/<project>:`) to install additional skills only for specific repos/projects.

## 核心内容摘录

- The file demonstrates three practical interoperability behaviors:
  1. `Select`: install broad skill sets from a source (`*`).
  2. `Deduplicate`: explicitly exclude overlapping or redundant skills (`!pattern`) to avoid wasting context or creating ambiguity.
  3. `Scope`: override per-project needs via path sections, acknowledging that “best global set” is not stable across all repos.

## 与本研究的关系

- Topic `06`: this is direct evidence that the “discovery boundary / dedup / authoritative-source” problems are being managed in practice through configuration, not solved by hosts automatically.

## 可直接引用的术语 / 概念

- `global:` vs `~/Git/<project>:` scoped installs
- `'*'` wildcard selection
- `'!pattern'` exclusions for deduplication

## 模型 / 宿主 / 版本相关信息

- This artifact is host-agnostic by design; it assumes skills can be treated as installable units, then scoped per project to control context cost and ambiguity.

## 风险与局限

- This is an example configuration, not a host/runtime contract; it shows intent and practice patterns rather than guaranteeing behavior.
- Exclusion rules reflect one maintainer’s worldview and may not generalize; still, the pattern is highly reusable.

