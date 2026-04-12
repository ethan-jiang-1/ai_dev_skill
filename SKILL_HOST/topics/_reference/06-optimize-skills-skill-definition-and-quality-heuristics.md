# optimize-skills SKILL.md: Trigger Quality, Progressive Disclosure, and Skill Hygiene

- source_url: https://raw.githubusercontent.com/ahgraber/skills/main/skills/optimize-skills/SKILL.md
- source_type: practitioner_skill_definition
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: last commit touching file 2026-04-09 (GitHub commit `fa281fb`)
- date_scope: 2026-Q2
- related_topic: 06, 01
- trust_level: practitioner
- why_it_matters: this is a meta-skill that directly encodes what “good skills” look like in 2026 (triggering, context economy, progressive disclosure); it is valuable cross-host because it focuses on portable authoring principles rather than host-specific runtime
- claims_supported: trigger quality is a first-class design goal; progressive disclosure is operationalized with token/line targets; skills should move deep detail into references/scripts/assets; skill directories follow a canonical structure; workflow authoring can be validated against trigger/non-trigger scenarios
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The skill explicitly instructs the agent to announce invocation: `optimize-skills`.
- It frames a “skill” as reusable procedural knowledge (not one-off narratives).
- It defines a 3-phase workflow:
  - Preparation: define execution steps + trigger/non-trigger scenarios; optionally decide on a flowchart
  - Draft: keep frontmatter minimal; encode trigger scenarios in description + When-to-Use sections; move deep detail into resources
  - Review/Optimize: scenario checks, resource fit, tighten triggers, remove redundancy, re-check progressive disclosure
- It operationalizes progressive disclosure with concrete targets:
  - metadata (`name` + `description`): ~100 tokens
  - `SKILL.md`: target \<5000 tokens and \<500 lines
  - `scripts/` / `references/` / `assets/`: narrow files, loaded only when needed
- It defines a canonical skill directory structure and rules:
  - `SKILL.md` must be named exactly `SKILL.md`
  - folder name kebab-case matching `name` in frontmatter
  - frontmatter must include `name` and `description`

## 核心内容摘录

- “Optimize for triggering”: descriptions should emphasize when to use the skill; under/over-triggering is treated as a design bug.
- “Prefer reusable resources over repeated prose”: offload verbose material to `references/` or executable helpers to `scripts/`.
- “Choose the right degree of freedom”: text vs pseudocode vs scripts depending on fragility.

## 与本研究的关系

- Topic `06`: strengthens portability guidance by providing a concrete, reusable authoring rubric that applies across hosts even when runtime semantics differ.
- Topic `01`: reinforces the layered model (metadata → `SKILL.md` → references/scripts/assets) as a practical design discipline, not just a spec slogan.

## 可直接引用的术语 / 概念

- `under-triggering / over-triggering`
- “progressive disclosure targets”
- `metadata -> SKILL.md -> references/scripts/assets`
- `SKILL.md under 500 lines`
- canonical `skills/<skill-name>/SKILL.md` structure

## 模型 / 宿主 / 版本相关信息

- This is explicitly host-agnostic guidance; it is intended to survive host churn by focusing on skill quality mechanics.

## 风险与局限

- It is a practitioner artifact, not an official spec; some hosts may have stricter/different frontmatter fields and discovery rules.
- Targets like “\<500 lines” are heuristics; very complex orchestration skills may legitimately exceed them (but should then rely more on scripts/resources).

