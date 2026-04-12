# Wave 2 Cross-Topic Synthesis Draft

- generated_at: 2026-04-12 16:50:00 CST
- status: draft

## Shared foundation

- `skills` now have a real public format and implementation guidance, but runtime behavior still diverges by host.
- The shared layers are:
  - file format and frontmatter
  - progressive-disclosure loading model
  - some directory conventions
  - increasingly, registry / CLI discovery and update flows
- The ecosystem is also now concrete enough to show what skills actually package:
  - writing and documentation workflows
  - style and quality heuristics
  - deterministic retrieval routing
  - evidence-driven deep research orchestration

## Real divergence points

- The biggest differences are no longer in `SKILL.md` syntax.
- They are in:
  - persistent rules / instruction layers
  - plugin / marketplace distribution
  - subagents and runtime orchestration
  - permissions / sandbox controls
  - model choice and context window exposure
  - operational maturity and upgrade stability
  - execution topology: local, worktree, cloud, SSH, self-hosted
  - tool-surface assumptions: what search/fetch/skill/task tools actually exist
  - constraint visibility: whether the critical limits are documented or hidden in backend routing / admin policy

## Host snapshot

- Claude:
  - strongest high-maturity workflow composition story
  - strongest signs that valuable skills are often no longer “pure skill only”
- Codex:
  - strongest engineering clarity around scope, lifecycle, runtime controls, and model transparency
- Cursor:
  - strongest IDE-native layering problem: rules vs skills vs subagents
  - fastest expansion into multi-environment agents
  - also the clearest example that hidden backend constraints can change whether a skill actually runs
- OpenCode:
  - strongest compatibility / bridge / experimentation story
  - also highest risk of behavior drift through configuration freedom
  - but many of its runtime constraints are unusually explicit in docs

## Writing vs research

- Writing skills are generally easier to reuse, judge, and lightly adapt across hosts.
- Deep research skills are where host differences matter most, because runtime quality, permissions, APIs, and delegation behavior all become critical.
- This is now supported by concrete contrast:
  - `technical-writer` style skills can spread across many hosts directly
  - complex multi-agent workflows increasingly become host-specialized or even cross-host handoff patterns
  - research skills can also spread widely at install level while still carrying stale call-shape or date assumptions internally

## Strong provisional conclusions

- The spec matters, but host runtime matters more once a skill becomes ambitious.
- Writing skills are a natural entry point for people learning to leverage existing skills.
- Research skills are the best stress test for comparing host quality.
- `Light skills` and `heavy orchestration skills` now clearly follow different portability paths.
- `Path drift` and `assumption drift` are now concrete ecosystem problems, not theoretical risks.
- The next-generation comparison problem is not only `what features exist`, but `which constraints are explicit, which are hidden, and where the agent can actually run`.
- The next useful synthesis layer is a concrete decision framework:
  - who should use which host
  - what kind of skill is portable
  - what kind of skill is only portable in spirit
