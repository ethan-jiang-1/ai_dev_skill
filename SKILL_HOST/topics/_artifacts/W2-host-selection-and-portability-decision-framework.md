# Wave 2 Host Selection and Portability Decision Framework

- generated_at: 2026-04-12 11:56:36 CST
- status: draft

## Decision 1: What problem are you actually solving?

- If the goal is `learn by reusing existing skills fast`:
  - start with light skills, especially writing / documentation / review patterns
  - prefer direct reuse before any rewrite
  - portability risk is lowest when the skill mostly packages examples, style rules, checklists, and references [ref](../_reference/07-technical-writer-skill-patterns-and-install-flow.md) [ref](../_reference/07-good-prose-human-style-reuse-pattern.md)
- If the goal is `run ambitious multi-step workflows`:
  - treat host runtime quality as the primary decision variable, not file format
  - this is where subagents, approvals, tool availability, sandbox policy, and execution topology dominate outcomes [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- If the goal is `evaluate deep research skills`:
  - first separate search wrappers from real research orchestration
  - then judge whether the host can actually support the orchestration contract [ref](../_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md) [ref](../_reference/08-deep-research-agent-source-evaluation-pipeline.md)

## Decision 2: Which host should you lean toward?

- Lean toward `Claude Code` when:
  - you want the highest workflow-composition ceiling
  - skills are likely to evolve into `skill + hook + subagent + MCP + plugin` stacks
  - you can tolerate a heavier, more host-shaped operational model [ref](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md) [ref](../_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md)
- Lean toward `Codex` when:
  - you want explicit runtime governance
  - model, reasoning, approval, sandbox, and search controls must stay visible and configurable
  - you are comfortable with a more engineering-oriented CLI posture [ref](../_reference/03-codex-subagents-runtime-controls-and-cost.md) [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
- Lean toward `Cursor` when:
  - you want IDE-native skills plus rapidly expanding multi-environment agents
  - the workflow benefits from in-editor context and asynchronous agent execution
  - you can accept that some critical runtime behavior still needs forum/support triangulation [ref](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md) [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)
- Lean toward `OpenCode` when:
  - compatibility, bridging, provider flexibility, and experimentation matter most
  - you are intentionally testing how far a skill can be adapted across hosts
  - you can manage higher configuration freedom and drift risk [ref](../_reference/05-opencode-agents-permissions-and-subagent-design.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)

## Decision 3: What kind of portability problem is this?

- `Format portability`
  - question: can the same `SKILL.md` shape load at all?
  - default action: try direct reuse first [ref](../_reference/00-shared-agent-skills-specification.md)
- `Discovery/install portability`
  - question: can the skill be discovered and installed in the target host?
  - default action: verify host path conventions, registry flow, and install/update tooling [ref](../_reference/00-shared-skills-cli-management-and-updates.md) [ref](../_reference/06-cross-host-sync-skills-normalization-and-path-drift.md)
- `Mirror-governance portability`
  - question: do multiple native directories need to coexist?
  - default action: choose a canonical source and automate mirror sync before drift starts [ref](../_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md)
- `Translation portability`
  - question: does the skill carry host-shaped tool names, plan semantics, or subagent labels?
  - default action: translate the call shape, not the method [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)
- `Delegation portability`
  - question: would it be cleaner to call the other host directly rather than force native equivalence?
  - default action: consider host-to-host delegation [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md) [ref](../_reference/06-cross-host-codex-claude-loop-example.md)
- `Discovery-failure portability`
  - question: is cross-host coexistence creating duplicate loading or version ambiguity?
  - default action: reduce scanning surface and enforce one authoritative directory [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)

## Decision 4: When should you stop reusing and start adapting?

- Adapt immediately if:
  - the skill hardcodes another host’s tool names
  - the skill assumes plan/subagent semantics the target host does not expose
  - the skill depends on provider-specific search or permissions the target host cannot match [ref](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md) [ref](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
- Keep direct reuse if:
  - the skill is mostly guidance, references, examples, and output structure
  - the host differences are mostly cosmetic rather than runtime-shaping [ref](../_reference/07-technical-writer-skill-patterns-and-install-flow.md)
- Switch to delegation if:
  - the valuable part of the workflow clearly belongs to another host
  - the target host can usefully drive that host as a worker instead of imitating it badly [ref](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)

## Decision 5: What are the strongest warning signs?

- Warning sign: `it installs everywhere`
  - reality: install spread is not proof of semantic portability [ref](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
- Warning sign: `the format is shared, so runtime should be similar`
  - reality: execution topology, permissions, search tools, and backend policy diverge sharply [ref](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md) [ref](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)
- Warning sign: `cross-host scanning will make reuse easier`
  - reality: without dedup / precedence rules, it can create context waste and version confusion [ref](../_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md)
- Warning sign: `research skills are just better search skills`
  - reality: the valuable ones encode decomposition, validation, evidence discipline, and output control [ref](../_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md)

## Working conclusion

- The practical 2026 answer is no longer “pick the host with skills.”
- The better questions are:
  - which host makes its runtime contract explicit enough for your task
  - whether the skill is light enough for direct reuse
  - whether your interoperability move is really `reuse`, `sync`, `translate`, `delegate`, or `reduce discovery scope`
