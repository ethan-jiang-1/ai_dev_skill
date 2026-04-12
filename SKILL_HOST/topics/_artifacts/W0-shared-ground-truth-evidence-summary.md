# Wave 0 Shared Ground Truth Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- scope: shared ground truth for `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics`
- status: in_progress

## What is already grounded

- The `Agent Skills` layer now has four separate shared references:
  - overview
  - specification
  - integration guide
  - best practices
- We also now have shared docs for:
  - quickstart portability and `.agents/skills/`
  - scripts and environment prerequisites
  - description optimization and activation quality
  - registry safety / telemetry
  - CLI lifecycle management
  - ecosystem usage signals
- Claude, Codex, Cursor, and OpenCode each now have at least one official shared-host reference in `_reference`.
- We now have enough shared evidence to treat distribution and lifecycle as first-class research themes, not side notes.
- We now have explicit shared evidence that advanced workflows frequently combine:
  - `skills`
  - `AGENTS.md` or host rules
  - `MCP`
  - `subagents`
  - permission controls

## Strongest new shared conclusions so far

- `skills` in 2026 are no longer just a loose convention; there is a real public specification plus explicit integration guidance.
- The ecosystem is no longer just file-sharing on GitHub; there is now a visible registry / CLI / telemetry layer around discovery and updates.
- The spec mainly standardizes `what is inside a skill`, not the entire runtime surface.
- Cross-host interoperability is therefore layered:
  - stronger at format and metadata level
  - weaker at runtime behavior level
- Claude, Cursor, Codex, and OpenCode all treat `skills` as part of a bigger extensibility stack rather than as a standalone feature.
- Operational realities already matter:
  - context cost
  - compaction
  - large skill directories
  - plugin bundling
  - subagent reliability
  - permission gating

## Gaps before Wave 0 can be called complete

- Need more dated 2026 evidence for:
  - version management / release maturity
  - Codex-specific release evolution
- Need at least a few more shared sources focused on:
  - host-native release maturity
  - upgrade / downgrade / compatibility drift inside individual agents
  - model / plan / environment constraints outside OpenAI model docs

## Best next moves

1. Add more 2026+ official release / feature-maturity evidence for Codex and possibly Cursor.
2. Add one or two stronger shared sources on host-native versioning and compatibility drift.
3. Then begin Topic `01` and Topic `06` first, because they can absorb the shared layer immediately.
