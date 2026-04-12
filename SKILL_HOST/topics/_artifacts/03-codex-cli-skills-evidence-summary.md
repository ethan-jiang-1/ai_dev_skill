# Topic 03 Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- topic: `03-codex-cli-skills-deep-dive`
- status: in_progress

## New local evidence gathered

- Codex official skills docs for loading, scope, distribution, disable flows, and openai.yaml metadata
- AGENTS.md instruction-chain layering and precedence
- Subagent runtime controls, cost, max depth, and custom agent schema
- Hooks/Plugins/Feature Maturity guidance
- Official product use cases explicitly including “Save workflows as skills”
- CLI-optimized model tier and snapshot/versioning evidence
- Official config reference exposing granular runtime governance: approvals, sandbox/network, web search modes/tool config, MCP allowlists, and per-skill enable/disable overrides in config.toml
- Official worktrees docs describing parallel thread execution via Git worktrees, background automations, and Handoff between Local and Worktree
- Explicit execution-governance layer:
  - approval presets
  - sandbox/network controls
  - `web_search` modes
  - protected `.git / .agents / .codex`
  - subagent inheritance of `sandbox_mode / mcp_servers / skills.config`

## Provisional direction

- Codex is shaping into a strongly engineered host where skills are first-class, but always in dialogue with AGENTS, plugins, subagents, approvals, and model/runtime configuration.
- Its biggest differentiator is not just file format support but the explicitness of scope, lifecycle, and model/runtime controls.
- Codex now also stands out as a host where many research-skill breakpoints are visible in config and security docs, not only discovered through trial and error.
