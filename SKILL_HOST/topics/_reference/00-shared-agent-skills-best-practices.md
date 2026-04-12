# Agent Skills Best Practices

- source_url: https://agentskills.io/skill-creation/best-practices
- source_type: official_best_practices
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current best-practices page accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 01, 07, 08
- trust_level: official
- why_it_matters: gives practical constraints on token economy, skill size, and what should or should not live inside a skill
- claims_supported: activated skills compete for context; include what the agent lacks; keep core instructions lean; move detail to references; inspect execution traces during iteration
- canonical_exception: no

## 关键事实

- Once activated, the full `SKILL.md` competes with conversation history and other active skills for context budget.
- Authors should include what the agent would not otherwise know: project-specific conventions, domain procedures, edge cases, and exact tools or APIs to use.
- Authors should avoid teaching the model generic background knowledge it already has.
- The spec-aligned guidance recommends keeping the main file short and moving bulky material into `references/`.
- The page recommends reading execution traces, not just final outputs, when evaluating a skill.

## 与本研究的关系

- Supports Topic `01` on why progressive disclosure matters.
- Supports Topic `07` on how to judge whether an existing skill is well-shaped.
- Supports Topic `08` because deep-research skills are especially sensitive to token pressure and poor instructions.

## 可直接引用的术语 / 概念

- `spending context wisely`
- `add what the agent lacks, omit what it knows`
- `execution traces`
- `references/`

## 模型 / 宿主 / 版本相关信息

- This guidance is host-agnostic but directly affects how well a host can scale to many installed skills.

## 风险与局限

- Best practices are not guarantees; hosts may still load, truncate, or expose skills differently.
- This source is strongest for authoring judgment, not host-specific implementation facts.

