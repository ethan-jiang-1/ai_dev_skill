# Claude Code Skills: Authoring, Discovery, and Frontmatter Controls

- source_url: https://code.claude.com/docs/en/skills
- source_type: official_docs
- accessed_at: 2026-04-12 17:35:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12 (page content includes 2026-era feature surface)
- date_scope: current-2026
- related_topic: 02, 06
- trust_level: official
- why_it_matters: this is the most direct official specification of where Claude Code skills live, how they are discovered, and which frontmatter fields control invocation, tools, and model/effort behavior
- claims_supported: skills are SKILL.md-based and load on-demand; skills have a strict location/precedence model; nested directory discovery supports monorepos; `--add-dir` has a skills discovery exception; frontmatter controls include `disable-model-invocation`, `allowed-tools`, `model`, and `effort`
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Skills are defined by a `SKILL.md` file and can be invoked directly as `/skill-name`.
- Where skills live (official table):
  - Personal: `~/.claude/skills/<skill-name>/SKILL.md`
  - Project: `.claude/skills/<skill-name>/SKILL.md`
  - Plugin: `<plugin>/skills/<skill-name>/SKILL.md` (namespaced as `plugin-name:skill-name`)
  - Enterprise: governed via managed settings (organization-wide)
- Precedence when the same skill name exists across levels: `enterprise > personal > project`.
- Automatic nested discovery:
  - Claude Code discovers skills in nested `.claude/skills/` directories (monorepo-friendly), e.g. `packages/frontend/.claude/skills/`.
- Additional directories (`--add-dir`) exception:
  - `--add-dir` primarily grants file access, but `.claude/skills/` inside an added directory is loaded automatically and supports live change detection.
  - Other `.claude/` config (subagents/commands/output styles) is not loaded from `--add-dir` directories.
  - `CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD=1` can enable loading `CLAUDE.md` from added directories.

## 核心内容摘录

- Frontmatter drives runtime behavior and context economics:
  - `disable-model-invocation: true` prevents automatic triggering (manual-only).
  - `allowed-tools` pre-approves listed tools while the skill is active; it does not remove other tools, and unlisted tools still obey global permission settings.
  - `model` and `effort` allow a skill to override the session’s model/effort level when invoked.
  - `context: fork` runs the skill in a forked subagent context.
- Skill arguments:
  - `$ARGUMENTS` placeholder receives the invocation suffix (e.g. `/fix-issue 123`), otherwise arguments are appended as `ARGUMENTS: ...`.

## 与本研究的关系

- Topic `02`: makes Claude’s skill mechanics concrete: directory/precedence model, monorepo discovery behavior, and the frontmatter knobs that turn skills into “governable workflow units” rather than long prompts.
- Topic `06`: provides an official anchor for why cross-host portability breaks at the discovery and runtime-contract layers (namespaces, precedence, add-dir exceptions, permission gates).

## 可直接引用的术语 / 概念

- `~/.claude/skills/<skill-name>/SKILL.md`
- `.claude/skills/<skill-name>/SKILL.md`
- `enterprise > personal > project` precedence
- `plugin-name:skill-name` namespace
- `disable-model-invocation`
- `allowed-tools`
- `effort` (skill-scoped)
- `context: fork`
- `$ARGUMENTS`

## 模型 / 宿主 / 版本相关信息

- This page explicitly couples skills to:
  - permission settings (tool approvals)
  - model selection and effort level
  - subagent execution topology (`fork`)
- This is strong evidence that “high-value skills” in Claude often depend on more than a `SKILL.md` body.

## 风险与局限

- This is an official behavior description, but real-world reliability still depends on the host runtime and organization policy (permissions, network tooling, and plugin governance).
- The `--add-dir` exception can create cross-tool discovery ambiguity if other hosts scan multiple directories without clear precedence/dedup rules.

