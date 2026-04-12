# Topic 05 Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- topic: `05-opencode-skills-deep-dive`
- status: in_progress

## New local evidence gathered

- Rules/instructions bridge behavior
- Agents/subagents/memory coupling
- Fine-grained permissions
- 75+ provider / local model surface
- Explicit skills discovery rules and cross-host compatibility paths across `.opencode/skills`, `.claude/skills`, and `.agents/skills`
- Provider onboarding and credential storage details (`/connect`, `~/.local/share/opencode/auth.json`, baseURL overrides)
- 2026 changelog signals on token cost, plugin version pinning, compatibility, and provider stability
- Plugin load order, Bun install behavior, compaction hooks, and safety defaults

## Provisional direction

- OpenCode’s strongest differentiator is not just path compatibility; it is how explicitly it exposes compatibility, permissions, providers, and runtime seams.
- That makes it a strong bridge and experimentation host, but also a more configuration-heavy one.
