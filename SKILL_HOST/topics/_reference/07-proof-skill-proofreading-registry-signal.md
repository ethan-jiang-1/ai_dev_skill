# Proof Skill Proofreading Registry Signal

- source_url: https://skills.sh/ahgraber/skills/proof
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:15:00 CST
- published_or_updated_at: First Seen Feb 28, 2026 (skills.sh listing)
- date_scope: 2026-Q1
- related_topic: 07
- trust_level: practitioner
- why_it_matters: adds a minimal, high-portability proofreading skill that represents “light writing skills” as reusable workflow helpers across hosts
- claims_supported: lightweight writing skills can spread widely; the “preserve tone/meaning” constraint is a common packaging pattern; registry-first distribution enables easy reuse
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Installation command:
  - `npx skills add https://github.com/ahgraber/skills --skill proof`
- Repository: `https://github.com/ahgraber/skills`
- Weekly installs (listing): `5`
- First seen (listing): `Feb 28, 2026`
- Installs-across signal (listing UI): `gemini-cli`, `codex`, `cursor`, `github-copilot`
- Skill positioning (listing description): “Proofread and lightly copy edit text while preserving wording, order, tone, and meaning.”

## 核心内容摘录

- This is a representative “light writing skill” pattern: a narrow transformation contract (“proofread lightly”) plus strict preservation constraints (tone/meaning/order).
- Such skills are typically portable because they depend more on instruction clarity than on host runtime features.

## 与本研究的关系

- Strengthens Topic `07` by adding a minimal, reusable writing helper that contrasts with heavier doc-system roles.
- Supports the Wave 2 framing that “light skills” often have higher portability than orchestration-heavy skills.

## 可直接引用的术语 / 概念

- `proofread`
- `light copy edit`
- `preserve tone`
- `preserve meaning`

## 模型 / 宿主 / 版本相关信息

- Portability is primarily model-dependent (language proficiency and style sensitivity) rather than host-dependent.
- The listing’s cross-host signal suggests a low-friction reuse path, but output quality still varies by model and context budget.

## 风险与局限

- Even “light” skills can fail if the model is weak in the target language or if context is truncated.
- The skill’s contract depends on subjective criteria (“tone”), so results should be validated with human review for critical docs.

