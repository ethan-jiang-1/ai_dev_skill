# Document Writer Writing Skill Registry Signal

- source_url: https://skills.sh/404kidwiz/claude-supercode-skills/document-writer
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:15:00 CST
- published_or_updated_at: First Seen Jan 24, 2026 (skills.sh listing)
- date_scope: 2026-Q1
- related_topic: 07
- trust_level: practitioner
- why_it_matters: adds a 2026 writing-skill example for structured engineering docs (ADRs/RFCs/design docs), reinforcing “writing skills package artifact types and workflows”
- claims_supported: writing skills are not only style prompts; they encode doc types and process; registry-first discovery/install is mainstream; install portability is common
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Installation command:
  - `npx skills add https://github.com/404kidwiz/claude-supercode-skills --skill document-writer`
- Repository: `https://github.com/404kidwiz/claude-supercode-skills`
- Weekly installs (listing): `98`
- First seen (listing): `Jan 24, 2026`
- Installs-across signal (listing UI): `opencode`, `gemini-cli`, `codex`, `cursor`, `github-copilot`, `claude-code`
- Skill positioning (listing description): structured technical documentation, explicitly naming `architectural decision records`, `RFCs`, `design documents`, and `knowledge base articles`

## 核心内容摘录

- The listing presents “document writing” as an engineering workflow: produce structured artifacts (ADR/RFC/design-doc) rather than generic prose.
- This supports the idea that many useful writing skills are “type + structure + checklist” packages, which tends to be portable across hosts.

## 与本研究的关系

- Strengthens Topic `07` with a concrete artifact-focused writing skill pattern (ADR/RFC/design-doc).
- Provides another 2026-first-seen example showing registry-first distribution and cross-host install signals.

## 可直接引用的术语 / 概念

- `ADR` (architectural decision record)
- `RFC`
- `design document`
- `knowledge base article`

## 模型 / 宿主 / 版本相关信息

- The listing emphasizes doc artifact types, which are usually host-agnostic.
- If extended with scripts (doc generation, repo scans), this category can cross into host/tool permissions and maintenance complexity.

## 风险与局限

- Host install signals do not prove the same doc-structure outputs are stable across models and hosts.
- “Structured doc” skills can create overconfidence if users treat the template as correctness.

