# Topic 02 Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- topic: `02-claude-code-skills-deep-dive`
- status: in_progress

## New local evidence gathered

- Claude runtime loading model for skills vs CLAUDE.md vs MCP vs subagents vs hooks
- Official skills docs covering where skills live, precedence, nested discovery, add-dir exception, and frontmatter controls (`disable-model-invocation`, `allowed-tools`, `model`, `effort`, `context: fork`, `$ARGUMENTS`)
- Directory and persistence model for `.claude`, including plugin storage and orphan cleanup
- Official memory docs covering CLAUDE.md concatenation rules, import strategy for `AGENTS.md`, `.claude/rules/` organization, and auto-memory storage/limits
- Plugin packaging, namespacing, semver, local override, and reload flows
- Governance controls for marketplaces and managed settings
- Official permission-modes docs covering `default/acceptEdits/plan/auto/dontAsk/bypassPermissions` and protected-path guarantees
- Hooks, subagents, preloaded skills, persistent subagent memory, and security warnings
- Official changelog evidence (2026-dated) showing plugin marketplace/versioning evolution and skill-adjacent controls like `effort` frontmatter support
- Explicit research-tool/runtime contract:
  - permission-gated `WebSearch` / `WebFetch`
  - background subagent approval envelope
  - default tool/MCP inheritance with optional narrowing
  - `Task -> Agent` evolution with alias compatibility

## Provisional direction

- Claude is not just “good at skills”; it has one of the thickest surrounding stacks for packaging, distributing, governing, and composing them.
- That is also why Claude skill workflows quickly stop being “pure skill only” and become `skill + plugin + hook + subagent + MCP`.
- Claude’s runtime constraints are comparatively explicit, which makes it easier to reason about research-skill breakpoints even when the workflow itself is host-specific.
