# Anthropic Skills Repo and Distribution

- source_url: https://github.com/anthropics/skills
- source_type: official_repository
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current repository snapshot accessed 2026-04-12
- date_scope: current-repo-snapshot
- related_topic: 02, 06, 07, 08
- trust_level: official
- why_it_matters: this repo is both a distribution channel and a reference implementation for the broader skills ecosystem
- claims_supported: official public skills catalog exists; repo includes skills/spec/template; Claude Code marketplace installation path exists; Anthropic treats skills as distributable bundles
- canonical_exception: no

## 关键事实

- `anthropics/skills` is a public official repository for Agent Skills.
- The repository includes:
  - `skills/`
  - `spec/`
  - `template/`
- As accessed on `2026-04-12`, the repo showed very large adoption signals on GitHub and substantial repository activity.
- Claude Code can register this repository as a plugin marketplace via `/plugin marketplace add anthropics/skills`.
- The repo documents plugin-based installation paths such as `document-skills` and `example-skills`.

## 与本研究的关系

- Important for Topic `02` because it shows Claude’s ecosystem is not only file-based but also marketplace/distribution-based.
- Important for Topics `07` and `08` because the repo acts as a starting point for discovering reusable skills rather than building from zero.

## 可直接引用的术语 / 概念

- `plugin marketplace`
- `document-skills`
- `example-skills`
- `spec`
- `template`

## 模型 / 宿主 / 版本相关信息

- This repo is Anthropic-specific in distribution mechanics, even though it references the open standard.
- It is evidence of ecosystem maturity, not proof that all listed skills behave identically across Claude surfaces.

## 风险与局限

- Repository examples are not identical to every production skill behavior inside Claude.
- GitHub popularity is only a weak proxy for quality or maintenance.

