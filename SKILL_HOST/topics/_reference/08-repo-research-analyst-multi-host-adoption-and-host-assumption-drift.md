# Repo Research Analyst: Multi-Host Adoption and Host-Assumption Drift

- source_url: https://skills.sh/parcadei/continuous-claude-v3/repo-research-analyst
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:02:00 CST
- published_or_updated_at: first seen 2026-01-24
- date_scope: 2026-Q1
- related_topic: 06, 08
- trust_level: practitioner
- why_it_matters: provides a concrete research-oriented skill that spread across many hosts, while also showing how portable-looking research skills can still carry stale date assumptions and host-specific invocation conventions
- claims_supported: research skills can achieve real multi-host distribution; repository research is a common reusable skill shape; portability at install level can coexist with stale runtime assumptions inside the skill itself
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- The skill packages a structured repository-research workflow:
  - architecture and structure analysis
  - documentation review
  - code pattern search
  - technology stack detection
  - creation of a formal research handoff document
- It includes a host-shaped invocation example using:
  - `Task(...)`
  - `subagent_type="general-purpose"`
  - `model="sonnet"`
- The page still contains a stale instruction:
  - `The current year is 2025`
- The listing reports:
  - first seen `Jan 24, 2026`
  - weekly installs `269`
  - installs on `opencode`, `codex`, `gemini-cli`, `cursor`, `github-copilot`, and `amp`

## 核心内容摘录

- This skill is a useful stress case because it combines three normally separate things:
  - a real repository-research workflow
  - broad cross-host installation
  - visible assumption drift inside the skill body
- The workflow itself is substantial rather than cosmetic:
  - structure review
  - documentation reading
  - code-pattern search
  - stack identification
  - formal research handoff generation
- But the invocation layer reveals portability seams:
  - it still encodes `Task(...)`
  - it assumes a `subagent_type="general-purpose"` shape
  - it carries a stale year marker, `The current year is 2025`
- That combination makes the main lesson very sharp:
  - install portability can be real
  - workflow-method portability can also be real
  - runtime-semantic portability can still drift at the same time

## 与本研究的关系

- Important for Topic `08` because it is a real research-style skill with strong adoption signals.
- Important for Topic `06` because it shows the difference between `install portability` and `runtime-semantic portability`.
- It demonstrates that a research skill can spread broadly while still embedding host-specific or stale assumptions.

## 可直接引用的术语 / 概念

- `repository research handoff`
- `Task(...)`
- `subagent_type="general-purpose"`
- `The current year is 2025`

## 模型 / 宿主 / 版本相关信息

- This source is useful precisely because it mixes portability success with assumption drift.
- It helps explain why advanced research skills often need adaptation even when installation is easy.

## 风险与局限

- Registry adoption is not proof that the skill runs equally well on every host.
- The invocation example reflects one skill author’s assumptions, not a universal runtime contract.
