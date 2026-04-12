# OpenCode Agent Skills: Discovery Rules and Cross-Host Compatibility Paths

- source_url: https://opencode.ai/docs/skills/
- source_type: official_docs
- accessed_at: 2026-04-12 17:55:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 05, 06
- trust_level: official
- why_it_matters: this page is an explicit cross-host compatibility contract; it documents OpenCode’s skill discovery algorithm and the exact supported skill directories across `.opencode`, `.claude`, and `.agents`
- claims_supported: OpenCode loads skills on-demand via a built-in `skill` tool; it searches multiple host-compatible paths; discovery walks up to the git worktree; it enforces a strict frontmatter schema and name validation
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Skills are defined via `SKILL.md` and are loaded on-demand via the native `skill` tool.
- OpenCode searches these skill locations (official list):
  - Project: `.opencode/skills/<name>/SKILL.md`
  - Global: `~/.config/opencode/skills/<name>/SKILL.md`
  - Project Claude-compatible: `.claude/skills/<name>/SKILL.md`
  - Global Claude-compatible: `~/.claude/skills/<name>/SKILL.md`
  - Project agent-compatible: `.agents/skills/<name>/SKILL.md`
  - Global agent-compatible: `~/.agents/skills/<name>/SKILL.md`
- Project-local discovery:
  - OpenCode walks up from the current working directory until it reaches the git worktree and loads matching `skills/*/SKILL.md` along the way.
- Frontmatter contract (official):
  - `SKILL.md` must start with YAML frontmatter.
  - Recognized fields: `name` (required), `description` (required), `license` (optional), `compatibility` (optional), `metadata` (optional string map).
  - Unknown fields are ignored.
- Name validation:
  - 1–64 characters, lowercase alphanumeric with single hyphens, no leading/trailing hyphen, no consecutive `--`.
  - Equivalent regex is documented as: `^[a-z0-9]+(-[a-z0-9]+)*$`.
- Description length rule:
  - `description` must be 1–1024 characters.

## 核心内容摘录

- This is a rare host doc that explicitly embraces cross-host directory compatibility:
  - OpenCode is designed to discover skills from both `.claude/skills` and `.agents/skills` paths, not only its own `.opencode/skills`.
- At the same time, OpenCode defines a strict “input contract” (frontmatter schema + name regex), which reduces ambiguity but increases the need to translate/normalize skills authored for looser hosts.

## 与本研究的关系

- Topic `05`: strengthens the claim that OpenCode is a “bridge host”: it explicitly supports multiple native skill directory conventions and makes discovery rules concrete.
- Topic `06`: directly supports the portability-layer framing:
  - discovery/install portability can be strong (multiple paths)
  - but runtime semantics can still diverge (tools, permissions, providers, subagents)

## 可直接引用的术语 / 概念

- `.opencode/skills/<name>/SKILL.md`
- `.claude/skills/<name>/SKILL.md`
- `.agents/skills/<name>/SKILL.md`
- `walks up ... until it reaches the git worktree`
- frontmatter recognized fields: `name`, `description`, `license`, `compatibility`, `metadata`
- `^[a-z0-9]+(-[a-z0-9]+)*$`

## 模型 / 宿主 / 版本相关信息

- This page documents discovery and parsing behavior; it does not by itself guarantee runtime equivalence across hosts.
- The strict frontmatter rules imply that “format portability” may still require normalization when migrating skills from other ecosystems.

## 风险与局限

- Scanning multiple host-compatible directories can increase duplicate-loading risk if users mirror the same skill into multiple paths without an authoritative-source rule.
- The doc does not define a universal cross-host precedence/dedup contract; it specifies OpenCode’s discovery behavior.

