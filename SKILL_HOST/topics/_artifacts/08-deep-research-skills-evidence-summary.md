# Topic 08 Evidence Summary

- generated_at: 2026-04-12 01:44:09 CST
- topic: `08-deep-research-skills-discovery-adaptation-and-host-support`
- status: in_progress

## New local evidence gathered

- Baseline structured deep-research workflow pattern
- Evidence tables, parallel subagents, and citation verification pattern
- Staged autonomous research-agent pattern
- Intelligent backend routing pattern
- Valyu-powered deterministic domain retrieval pattern
- Academic literature synthesis skill signal (ArXiv conversational research)
- Market-intelligence research skill signal (ad-library extraction + analysis)
- Prospect/lead investigation research skill signal (ICP → qualification → outreach)
- Knowledge-base research ops skill signal (Notion workspace retrieval + synthesis)
- Claude runtime contract for research work: permission-gated web tools, subagent inheritance limits, Task-to-Agent evolution
- Codex runtime contract for research work: approval modes, network/search separation, cloud internet defaults, and inherited execution policy
- Cursor hidden backend constraints for delegated execution across `2.6.22 -> 3.0.4`
- OpenCode provider-gated `websearch`, split `webfetch / websearch`, and subagent tool-default caveats
- `repo-research-analyst` as a real example of broad install spread plus stale runtime assumptions
- Claude -> Codex translation artifact showing research-skill portability often fails at tool names, planning semantics, and subagent-role labels before it fails at method

## Provisional direction

- “Deep research skill” now clearly spans multiple subtypes:
  - workflow/checklist style
  - orchestration-heavy/report-building style
  - backend-routing style
  - deterministic domain search style
  - academic literature synthesis style
  - market/prospect investigation style
  - knowledge-base research ops style (external dependency)
- The more advanced the pattern, the more it depends on host runtime quality, external tools, and permission/model support.
- A new practical distinction is now visible:
  - some research skills are easy to install widely
  - but still require adaptation because host call shapes, permissions, provider surfaces, or even date assumptions drift
- A stronger adaptation rule is now visible:
  - preserve research method and evidence discipline
  - rewrite host-shaped tool vocabulary and delegation semantics when moving across runtimes
- The host-by-host picture is now clearer:
  - Claude, Codex, and OpenCode make more of the execution contract explicit
  - Cursor currently contributes the strongest evidence for hidden backend/runtime coupling
