# Topic 02 Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- topic: `02-claude-code-skills-deep-dive`
- status: in_progress

## New local evidence gathered

- Claude runtime loading model for skills vs CLAUDE.md vs MCP vs subagents vs hooks
- Directory and persistence model for `.claude`, including plugin storage and orphan cleanup
- Plugin packaging, namespacing, semver, local override, and reload flows
- Governance controls for marketplaces and managed settings
- Hooks, subagents, preloaded skills, persistent subagent memory, and security warnings
- Explicit research-tool/runtime contract:
  - permission-gated `WebSearch` / `WebFetch`
  - background subagent approval envelope
  - default tool/MCP inheritance with optional narrowing
  - `Task -> Agent` evolution with alias compatibility

## Provisional direction

- Claude is not just “good at skills”; it has one of the thickest surrounding stacks for packaging, distributing, governing, and composing them.
- That is also why Claude skill workflows quickly stop being “pure skill only” and become `skill + plugin + hook + subagent + MCP`.
- Claude’s runtime constraints are comparatively explicit, which makes it easier to reason about research-skill breakpoints even when the workflow itself is host-specific.
