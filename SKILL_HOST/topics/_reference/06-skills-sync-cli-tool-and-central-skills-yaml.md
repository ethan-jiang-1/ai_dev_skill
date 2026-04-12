# skills_sync CLI: Central `skills.yaml` for Multi-Repo Skill Sync

- source_url: https://raw.githubusercontent.com/mono0926/skills-sync/main/README.md
- source_type: practitioner_repo_docs
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: repo main updated 2026-04-09 (GitHub commit `2c01398`)
- date_scope: 2026-Q2
- related_topic: 06
- trust_level: practitioner
- why_it_matters: this is a concrete 2026 portability/maintenance pattern: treat skills as packages and manage them with a central config + sync/update commands, rather than manual copying across many tool-specific directories
- claims_supported: cross-project skill governance is happening via config-driven sync; wildcard/exclusion patterns are used to manage duplicates; “clean sync” (delete then install) is used to avoid drift; updates reuse the shared `skills` CLI; multi-agent targeting implies multi-host realities
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- The repo describes `skills_sync` as:
  - “A CLI tool to keep AI Agent Skills (`SKILL.md`) in sync across your projects based on a central `skills.yaml` configuration file.”
- Installation (official in README):
  - `dart pub global activate skills_sync`
- Quick start commands (official in README):
  - `skills_sync init` → generates default global config at `~/.config/skills_sync/skills.yaml`
  - `skills_sync sync` → “thoroughly syncs skills”; by default it deletes existing skills first (clean state)
  - `skills_sync update` → quick version updates; runs `npx skills update` across configured paths
- Config precedence:
  - a project-local `skills.yaml` in the project root can override the global config
- Sync options (official in README):
  - `--clean` / `--no-clean`
  - `--agent <name>` (default `antigravity`; `*` targets all)
- Environment requirements called out in README:
  - Node.js required for `npx`
  - Git required for fetching remote repositories
- The repo bundles skills for agents to manage the configuration:
  - `skills-sync` and `skills-optimizer` SKILL.md entries are linked from the README

## 核心内容摘录

- The README makes an explicit governance tradeoff:
  - “clean sync” deletes extra/untracked skills to ensure a deterministic state
  - `update` is faster but less “drift correcting” (in-place updates)
- This is the “mirror-governance portability” pattern in operational form: one canonical config, repeatable installs, and automated drift cleanup.

## 与本研究的关系

- Topic `06`: supplies a strong practitioner evidence point that real interoperability work is being solved by:
  - centralized source-of-truth configs
  - sync/update automation
  - explicit duplicate avoidance via exclusions
  rather than by expecting a single skill to run identically on every host.

## 可直接引用的术语 / 概念

- `skills.yaml`
- “clean sync” (delete then install)
- `~/.config/skills_sync/skills.yaml`
- `skills_sync sync` vs `skills_sync update`
- `--agent <name>` / `*` target all

## 模型 / 宿主 / 版本相关信息

- This pattern assumes a shared distribution layer (`npx skills update`) and a host ecosystem where multiple “agents/hosts” are in active use (hence `--agent` targeting).

## 风险与局限

- Clean sync is destructive by default; it can delete locally edited skills if they are not represented in config.
- Cross-host portability is still layered: syncing files does not guarantee runtime semantics (permissions, tool names, subagent behavior).

*** Add File: SKILL_HOST/topics/_reference/06-skills-sync-example-skills-yaml-wildcards-and-exclusions.md
# skills_sync Example `skills.yaml`: Wildcards, Exclusions, and Large-Scale Multi-Repo Curation

- source_url: https://raw.githubusercontent.com/mono0926/skills-sync/main/example/mono/skills.yaml
- source_type: practitioner_repo_file
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: repo main updated 2026-04-09 (GitHub commit `2c01398`)
- date_scope: 2026-Q2
- related_topic: 06
- trust_level: practitioner
- why_it_matters: this is a real-world configuration artifact demonstrating how people curate and deduplicate skills across many repos and projects; it turns “portability” into explicit include/exclude and per-project scope decisions
- claims_supported: multi-repo skill curation is happening at scale; wildcard selection (`*`) and exclusion (`!`) are used to manage duplicates and reduce noise; per-path overrides show that “one global skill set” is insufficient
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- The example config uses:
  - a `global:` section that lists many skill sources (GitHub orgs/repos and local sources)
  - `'*'` wildcard patterns to include broad sets of skills
  - `'!<pattern>'` exclusions to avoid duplicates or irrelevant skills (comments explain “avoid duplication” / “already migrated” / “not needed on this machine”)
- The example also defines per-path sections (e.g., `~/Git/<project>:`) to install additional skills only for specific repos/projects.

## 核心内容摘录

- The file demonstrates three practical interoperability behaviors:
  1. `Select`: install broad skill sets from a source (`*`).
  2. `Deduplicate`: explicitly exclude overlapping or redundant skills (`!pattern`) to avoid wasting context or creating ambiguity.
  3. `Scope`: override per-project needs via path sections, acknowledging that “best global set” is not stable across all repos.

## 与本研究的关系

- Topic `06`: this is direct evidence that the “discovery boundary / dedup / authoritative-source” problems are being managed in practice through configuration, not solved by hosts automatically.

## 可直接引用的术语 / 概念

- `global:` vs `~/Git/<project>:` scoped installs
- `'*'` wildcard selection
- `'!pattern'` exclusions for deduplication

## 模型 / 宿主 / 版本相关信息

- This artifact is host-agnostic by design; it assumes skills can be treated as installable units, then scoped per project to control context cost and ambiguity.

## 风险与局限

- This is an example configuration, not a host/runtime contract; it shows intent and practice patterns rather than guaranteeing behavior.
- Exclusion rules reflect one maintainer’s worldview and may not generalize; still, the pattern is highly reusable.

*** Add File: SKILL_HOST/topics/_reference/06-optimize-skills-skill-definition-and-quality-heuristics.md
# optimize-skills SKILL.md: Trigger Quality, Progressive Disclosure, and Skill Hygiene

- source_url: https://raw.githubusercontent.com/ahgraber/skills/main/skills/optimize-skills/SKILL.md
- source_type: practitioner_skill_definition
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: last commit touching file 2026-04-09 (GitHub commit `fa281fb`)
- date_scope: 2026-Q2
- related_topic: 06, 01
- trust_level: practitioner
- why_it_matters: this is a meta-skill that directly encodes what “good skills” look like in 2026 (triggering, context economy, progressive disclosure); it is valuable cross-host because it focuses on portable authoring principles rather than host-specific runtime
- claims_supported: trigger quality is a first-class design goal; progressive disclosure is operationalized with token/line targets; skills should move deep detail into references/scripts/assets; skill directories follow a canonical structure; workflow authoring can be validated against trigger/non-trigger scenarios
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The skill explicitly instructs the agent to announce invocation: `optimize-skills`.
- It frames a “skill” as reusable procedural knowledge (not one-off narratives).
- It defines a 3-phase workflow:
  - Preparation: define execution steps + trigger/non-trigger scenarios; optionally decide on a flowchart
  - Draft: keep frontmatter minimal; encode trigger scenarios in description + When-to-Use sections; move deep detail into resources
  - Review/Optimize: scenario checks, resource fit, tighten triggers, remove redundancy, re-check progressive disclosure
- It operationalizes progressive disclosure with concrete targets:
  - metadata (`name` + `description`): ~100 tokens
  - `SKILL.md`: target \<5000 tokens and \<500 lines
  - `scripts/` / `references/` / `assets/`: narrow files, loaded only when needed
- It defines a canonical skill directory structure and rules:
  - `SKILL.md` must be named exactly `SKILL.md`
  - folder name kebab-case matching `name` in frontmatter
  - frontmatter must include `name` and `description`

## 核心内容摘录

- “Optimize for triggering”: descriptions should emphasize when to use the skill; under/over-triggering is treated as a design bug.
- “Prefer reusable resources over repeated prose”: offload verbose material to `references/` or executable helpers to `scripts/`.
- “Choose the right degree of freedom”: text vs pseudocode vs scripts depending on fragility.

## 与本研究的关系

- Topic `06`: strengthens portability guidance by providing a concrete, reusable authoring rubric that applies across hosts even when runtime semantics differ.
- Topic `01`: reinforces the layered model (metadata → `SKILL.md` → references/scripts/assets) as a practical design discipline, not just a spec slogan.

## 可直接引用的术语 / 概念

- `under-triggering / over-triggering`
- “progressive disclosure targets”
- `metadata -> SKILL.md -> references/scripts/assets`
- `SKILL.md under 500 lines`
- canonical `skills/<skill-name>/SKILL.md` structure

## 模型 / 宿主 / 版本相关信息

- This is explicitly host-agnostic guidance; it is intended to survive host churn by focusing on skill quality mechanics.

## 风险与局限

- It is a practitioner artifact, not an official spec; some hosts may have stricter/different frontmatter fields and discovery rules.
- Targets like “\<500 lines” are heuristics; very complex orchestration skills may legitimately exceed them (but should then rely more on scripts/resources).

*** Add File: SKILL_HOST/topics/_reference/06-mcp-research-skill-definition-tool-selection-and-quality-rules.md
# mcp-research SKILL.md: Tool Selection, Evidence Discipline, and “Don’t Trust Memory”

- source_url: https://raw.githubusercontent.com/ahgraber/skills/main/skills/mcp-research/SKILL.md
- source_type: practitioner_skill_definition
- accessed_at: 2026-04-12 18:05:00 CST
- published_or_updated_at: last commit touching file 2026-04-09 (GitHub commit `fa281fb`)
- date_scope: 2026-Q2
- related_topic: 06, 08
- trust_level: practitioner
- why_it_matters: this is a concrete 2026 “research discipline” skill that encodes tool-routing and quality rules; it supports the claim that valuable research skills package governance steps (source selection, conflict handling, fact/inference separation) rather than only search calls
- claims_supported: research workflows should prefer primary docs; tool routing should be explicit; dependency/version decisions require current verification; conflicts should be reported with safe recommendations; outputs should separate sourced facts from inferences
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The skill instructs the agent to announce invocation: `mcp-research`.
- It states its core intent explicitly:
  - use MCP-provided tools to retrieve current, verifiable information instead of relying on memory for fast-changing ecosystems.
- It provides explicit tool-routing guidance:
  - `mcp__context7__resolve-library-id` + `mcp__context7__query-docs` for official docs/API usage
  - `mcp__exa__get_code_context_exa` for code-centric examples across docs/GitHub/Stack Overflow
  - `mcp__exa__web_search_exa` for broader current web context (announcements/release notes)
  - `mcp__jina__search_web` + `mcp__jina__read_url` for discovery + clean extraction
  - arXiv/PDF tools only for paper-level work
- Default workflow is explicit:
  - classify request type, start narrow (official docs first), resolve library id before querying, keep queries specific, synthesize and separate facts from inferences.
- Quality rules include:
  - prefer primary docs for API signatures/behavior
  - verify current versions before recommending
  - cite concrete tool findings; report conflicts and recommend safe paths (pin/test/release notes)
  - state limits explicitly when coverage is weak

## 核心内容摘录

- The skill encodes “research governance” as operational steps:
  - source hierarchy (official → examples → broad web)
  - explicit conflict handling
  - explicit epistemic labeling (facts vs inferences)

## 与本研究的关系

- Topic `06`: supports the portability framing that “useful interoperability” often depends on translating tool surfaces while preserving the research method and evidence discipline.
- Topic `08`: provides a concrete example of a research skill that is not just a search wrapper; it is a routing + validation + synthesis contract.

## 可直接引用的术语 / 概念

- “don’t rely on memory for fast-changing libraries”
- “prefer primary/official documentation”
- “separate sourced facts from inferences”
- explicit MCP tool routing (`context7` / `exa` / `jina`)

## 模型 / 宿主 / 版本相关信息

- This skill assumes the host provides MCP tool wiring with those tool names; cross-host reuse may require translating tool labels and permission envelopes.

## 风险与局限

- Tool availability is host- and policy-dependent; a host without MCP support (or with restricted MCP allowlists) cannot execute this workflow as written.
- Even when tools exist, provider/network/approval constraints can force fallbacks; the skill’s value depends on the runtime contract being satisfiable.

