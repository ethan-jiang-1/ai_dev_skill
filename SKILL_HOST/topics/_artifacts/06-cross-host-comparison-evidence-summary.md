# Topic 06 Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- topic: `06-cross-host-comparison-and-interoperability`
- status: in_progress

## New local evidence gathered

- Shared spec / integration / registry layers
- Claude plugin-composition and operational signals
- Codex scope / runtime / model transparency
- Cursor rules-vs-skills boundary and bundle trend
- OpenCode compatibility / permissions / provider flexibility
- Claude explicit research-tool constraints: permission-gated `WebSearch / WebFetch`, background subagent approval envelope, `Task -> Agent` evolution
- Codex explicit execution-governance constraints: approval modes, sandbox/network controls, `web_search` modes, protected paths, and subagent inheritance
- Community `sync-skills` artifact showing real multi-host sync demand plus directory-path drift risk
- Claude -> Codex translation artifact showing portability often requires rewriting tool references, planning semantics, and subagent-role labels
- Mirror-sync hook artifact showing multi-host maintenance can require a canonical source plus pre-commit drift enforcement between `.agents/skills` and `.claude/skills`
- `skill-codex` repository showing host-to-host delegation as an interoperability pattern, with explicit model, reasoning, sandbox, and context-hygiene controls
- Cursor forum failure case showing broad cross-tool directory scanning can duplicate skills, waste context, and force a one-directory workaround
- Research-skill registry example (`repo-research-analyst`) showing strong install spread with stale host/runtime assumptions inside the skill
- `skills_sync` practitioner CLI + example config showing cross-project, multi-repo skill governance via central `skills.yaml`, clean sync, update via shared `skills` CLI, and explicit wildcard/exclusion dedup patterns
- `optimize-skills` meta-skill definition encoding portable skill-quality heuristics (triggering discipline + progressive disclosure targets)
- `mcp-research` skill definition encoding tool-routing and evidence/quality rules (prefer primary docs, cite tool findings, separate facts vs inferences)

## Provisional direction

- The right comparison frame is no longer “which host has skills,” but “which layer each host supports best and at what operational cost.”
- `Install portability`, `runtime-semantic portability`, and `execution portability` are now clearly separate layers.
- Even the install layer carries maintenance cost once community path maps drift away from current host docs.
- Host comparison is now also about `constraint visibility`: Claude, Codex, and OpenCode expose more of the runtime contract directly, while Cursor still requires more forum/support triangulation for some critical behaviors.
- Cross-host interoperability in practice is now visible in at least four forms:
  - direct reuse
  - mirror sync
  - vocabulary translation
  - host-to-host delegation
- And one important failure mode is now explicit too:
  - uncontrolled cross-tool discovery without dedup or precedence rules
