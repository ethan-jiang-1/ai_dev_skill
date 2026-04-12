# OpenCode Skills and Rules Compatibility

- source_url: https://opencode.ai/docs/skills
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: skills page published about 2026-02; rules page updated 2026-04-06
- date_scope: 2026-Q1 to 2026-Q2
- related_topic: 05, 06, 07, 08
- trust_level: official
- why_it_matters: OpenCode is the clearest host showing how skill compatibility, rule precedence, and external instruction reuse can coexist
- claims_supported: OpenCode scans multiple skill paths including `.claude` and `.agents`; recognized frontmatter fields are constrained; AGENTS.md and CLAUDE.md have explicit precedence; opencode.json can load instruction files including `.cursor/rules`
- canonical_exception: no

## 关键事实

- OpenCode scans:
  - `.opencode/skills/*/SKILL.md`
  - `~/.config/opencode/skills/*/SKILL.md`
  - `.claude/skills/*/SKILL.md`
  - `~/.claude/skills/*/SKILL.md`
  - `.agents/skills/*/SKILL.md`
  - `~/.agents/skills/*/SKILL.md`
- OpenCode recognizes `name`, `description`, `license`, `compatibility`, and `metadata` in skill frontmatter.
- Unknown frontmatter fields are ignored.
- OpenCode rules precedence is explicit:
  - local `AGENTS.md` / `CLAUDE.md`
  - global `~/.config/opencode/AGENTS.md`
  - fallback Claude global file
- `opencode.json` can load reusable instruction files, including `.cursor/rules/*.md` or even remote URLs.

## 与本研究的关系

- Core evidence for Topic `05`.
- Strong evidence for Topic `06` because it shows a host explicitly bridging multiple ecosystems.
- Useful for Topic `07` because writing-related rule sets can be reused without copying everything into a single skill.

## 可直接引用的术语 / 概念

- `Claude-compatible`
- `agent-compatible`
- `unknown frontmatter fields are ignored`
- `AGENTS.md precedence`
- `instructions array`

## 模型 / 宿主 / 版本相关信息

- OpenCode is using compatibility as an architectural choice, not just a marketing claim.
- This source shows format compatibility and instruction compatibility are separate but composable layers.

## 风险与局限

- Compatibility in discovery does not automatically imply behavioral equivalence at runtime.
- Rules precedence and skill loading still depend on OpenCode’s own tool, permission, and agent model.

