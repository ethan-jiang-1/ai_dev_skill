# Wave 2 Portability Layers and Breakpoints

- generated_at: 2026-04-12 16:50:00 CST
- status: draft

## Portability layers

### Layer 1: File format portability

- Usually strongest.
- Includes:
  - `SKILL.md`
  - YAML frontmatter
  - `references/`
  - `scripts/`
- Backed by public spec and integration guidance.
- Relevant references:
  - [00-shared-agent-skills-specification.md](../_reference/00-shared-agent-skills-specification.md)
  - [00-shared-agent-skills-integration-guide.md](../_reference/00-shared-agent-skills-integration-guide.md)

### Layer 2: Discovery and install portability

- Moderate portability.
- Includes:
  - `.agents/skills/` convention
  - registry discovery
  - `skills` CLI install/update flows
  - some host path compatibility
  - sometimes, canonical-source plus mirror-sync automation across duplicated native directories
- Relevant references:
  - [00-shared-agent-skills-quickstart-cross-host-paths.md](../_reference/00-shared-agent-skills-quickstart-cross-host-paths.md)
  - [00-shared-skills-cli-management-and-updates.md](../_reference/00-shared-skills-cli-management-and-updates.md)
  - [00-shared-opencode-skills-and-rules-compatibility.md](../_reference/00-shared-opencode-skills-and-rules-compatibility.md)
  - [06-cross-host-sync-skills-normalization-and-path-drift.md](../_reference/06-cross-host-sync-skills-normalization-and-path-drift.md)
  - [06-claude-codex-mirror-sync-hook-and-canonical-source.md](../_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md)

### Layer 3: Workflow-method portability

- Often still portable if the skill mainly encodes:
  - process steps
  - checklists
  - style guides
  - references
- Most writing skills sit here.
- Relevant references:
  - [07-technical-writer-skill-patterns-and-install-flow.md](../_reference/07-technical-writer-skill-patterns-and-install-flow.md)
  - [07-good-prose-human-style-reuse-pattern.md](../_reference/07-good-prose-human-style-reuse-pattern.md)

### Layer 4: Execution-topology portability

- Weak portability.
- Breaks when the same skill assumes the host can run agents in similar places and shapes.
- Breaks once a skill assumes:
  - worktrees
  - cloud execution
  - SSH / remote execution
  - background waits
  - self-hosted agent environments
- Relevant references:
  - [04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md](../_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md)
  - [03-codex-2026-changelog-skills-plugins-and-handoff.md](../_reference/03-codex-2026-changelog-skills-plugins-and-handoff.md)

### Layer 5: Runtime-orchestration portability

- Weak portability.
- Breaks once a skill assumes:
  - host-native subagents
  - hooks
  - plugin bundles
  - AGENTS/rules semantics
  - permissions/sandbox controls
  - host-specific MCP wiring
- Relevant references:
  - [02-claude-code-hooks-subagents-and-skill-composition.md](../_reference/02-claude-code-hooks-subagents-and-skill-composition.md)
  - [03-codex-subagents-runtime-controls-and-cost.md](../_reference/03-codex-subagents-runtime-controls-and-cost.md)
  - [04-cursor-plugin-bundles-and-ecosystem-direction.md](../_reference/04-cursor-plugin-bundles-and-ecosystem-direction.md)
  - [05-opencode-permissions-granularity-and-command-policy.md](../_reference/05-opencode-permissions-granularity-and-command-policy.md)
  - [06-skill-codex-claude-plugin-delegation-and-runtime-contract.md](../_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md)

### Layer 6: Tool-surface and backend-policy portability

- Often breaks before you even get to external APIs.
- Breaks when a skill assumes:
  - `websearch` exists everywhere
  - `task` / subagents are always provisioned
  - subagents get the same tools as primary agents
  - model restrictions or backend routing do not matter
- Relevant references:
  - [02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md](../_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md)
  - [03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md](../_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md)
  - [05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md](../_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md)
  - [04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md](../_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md)

### Layer 6.5: Runtime-assumption portability

- A skill can install cleanly and still drift internally.
- Breaks when the skill text itself assumes:
  - outdated call shapes like `Task(...)`
  - host-specific subagent type names
  - stale date / year markers
  - a model/provider naming scheme that no longer matches the host
- Relevant references:
  - [08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md](../_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md)
  - [06-claude-to-codex-tool-mapping-and-subagent-translation.md](../_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md)

### Layer 7: External dependency portability

- Often weakest.
- Breaks when a skill depends on:
  - API keys
  - environment variables
  - local runtimes
  - provider-specific model behavior
  - shell / webfetch permissions
- Most advanced research skills eventually hit this layer.
- Relevant references:
  - [00-shared-agent-skills-scripts-and-env-requirements.md](../_reference/00-shared-agent-skills-scripts-and-env-requirements.md)
  - [08-valyu-powered-search-skill-requirements.md](../_reference/08-valyu-powered-search-skill-requirements.md)
  - [05-opencode-model-flexibility-and-provider-surface.md](../_reference/05-opencode-model-flexibility-and-provider-surface.md)

## Practical breakpoint rules

- If a skill is mostly `rules + examples + references`, try direct reuse first.
- If you need to satisfy multiple native skill directories, declare a canonical source and automate mirror sync before drift accumulates.
- If a host scans multiple tool directories, verify deduplication and precedence behavior before treating cross-host coexistence as a benefit.
- If a skill depends on `subagents + hooks + plugins`, assume only partial portability.
- If a skill depends on `specific execution topology` such as worktrees, cloud agents, or background waits, test that layer before trusting reuse.
- If a skill depends on `search / task / subagent tools`, verify actual tool availability and backend policy before trusting portability.
- If a skill carries another host’s tool names or subagent labels, treat portability as translation work, not copy work.
- If a skill body itself hardcodes host call shapes, stale years, or model/provider names, treat it as `installable but not yet trustworthy`.
- If a skill depends on `external APIs + env vars + shell permissions`, portability should be treated as an integration project, not a copy operation.
- If a skill seems "portable" only because it orchestrates multiple hosts together, treat it as a handoff pattern rather than host-equivalence proof.
- If interoperability is achieved by wrapping another host’s CLI, treat that as delegated portability, not native portability.
- If a skill declares host compatibility explicitly, treat that as a useful hint, not final proof.

## Strong provisional conclusion

- Most confusion about “can this skill move across hosts?” comes from collapsing all seven layers into one yes/no question.
- The useful answer is almost always: `some layers yes, later layers no or maybe`.
- And some of the strongest 2026 examples do not solve portability by removing host differences; they solve it by synchronizing around them, translating across them, or delegating through them.
