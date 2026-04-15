# W2 Field Support Matrix: Codex / GitHub / Claude

- `status`: `draft`
- `purpose`: `把 Codex / GitHub / Claude 三个 surface 的 skill 字段与运行语义拆成 field-level 支持矩阵，避免把某一家扩展误写成 portable baseline。`
- `basis`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/01-skill-methodology-and-spec-codex-surface-interface-facts.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/01-skill-methodology-and-spec-github-skill-interface-facts.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/01-skill-methodology-and-spec-claude-surface-differences.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-surface-compatibility-appendix-codex-github-claude.md`

## Legend

- `core`: safe to use in portable baseline
- `supported`: documented by that surface
- `surface-specific`: documented but should not be assumed portable
- `unclear`: not enough local evidence yet
- `not-baseline`: should stay out of portable baseline

## Field Matrix

| Field / Concept | Portable baseline | Codex | GitHub | Claude | Recommendation |
| --- | --- | --- | --- | --- | --- |
| Directory-level skill package | `core` | `supported` | `supported` | `supported` | Safe baseline. Treat skill as directory artifact, not single prompt. |
| `SKILL.md` entrypoint | `core` | `supported` | `supported` | `supported` | Safe baseline. |
| YAML frontmatter | `core-light` | `supported` | `supported` | `supported` | Use only shared fields in portable core. |
| `name` | `core` | `supported` | `supported` | `supported` | Safe baseline. |
| `description` | `core` | `supported` | `supported` | `supported` | Safe baseline and trigger / routing optimization target. |
| Markdown instruction body | `core` | `supported` | `supported` | `supported` | Safe baseline. |
| `scripts/` | `core-optional` | `supported` | `supported` | `supported` | Portable as concept, but tool/runtime semantics differ. |
| `references/` / resources | `core-optional` | `supported` | `supported` | `supported` | Portable as supporting-file pattern. |
| `assets/` | `optional` | `supported` | `unclear` | `unclear` | Keep outside minimal portable core unless target surface confirms. |
| `allowed-tools` | `not-baseline` | `unclear / via dependencies` | `supported` | `surface-specific` | Use only in surface appendix; support differs. |
| `license` | `not-baseline` | `unclear` | `supported` | `unclear` | GitHub-specific authoring field unless cross-surface confirmed. |
| explicit invocation | `optional` | `/skills` / `$skill` | `unclear` | `/skill-name` | Do not rely on one invocation syntax cross-surface. |
| implicit invocation by description | `core-behavior` | `supported` | `supported` | `supported unless disabled` | Safe as concept, but matching behavior is host-specific. |
| `agents/openai.yaml` | `not-baseline` | `surface-specific` | `not-baseline` | `not-baseline` | Codex-only extension. |
| plugins as distribution unit | `not-baseline` | `surface-specific` | `not-baseline` | `surface-specific equivalent exists` | Treat distribution separately from authoring format. |
| `[[skills.config]]` enable / disable | `not-baseline` | `surface-specific` | `not-baseline` | `not-baseline` | Codex-specific local config. |
| layered `AGENTS.md` | `repo-guidance-not-skill` | `supported` | `unclear / custom instructions differ` | `CLAUDE.md` comparable but distinct | Keep repo guidance separate from skill package. |
| `argument-hint` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific extension. |
| `disable-model-invocation` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific invocation control. |
| `user-invocable` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific invocation control. |
| `model` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific routing / execution hint. |
| `effort` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific execution hint. |
| `context` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific context control. |
| `agent` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Claude-specific subagent integration. |
| `hooks` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Keep out of portable core. |
| `paths` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | Keep out of portable core. |
| `shell` | `not-baseline` | `unclear` | `unclear` | `surface-specific` | High-risk execution field; surface appendix only. |
| API / runtime limits | `not-baseline` | `surface-specific` | `unclear` | `surface-specific` | Document per target surface, do not assume portable. |
| version pinning / fallback | `methodology-baseline` | `recommended by lifecycle logic` | `unclear` | `supported / recommended in Claude docs` | Treat as workflow discipline, not necessarily field-level support. |

## Portable Core Recommendation

The authoring baseline should include only:

- directory package
- `SKILL.md`
- `name`
- `description`
- Markdown procedure
- optional `scripts/`
- optional `references/`
- explicit notes for any surface-specific fields

## Surface Appendix Recommendation

Use a separate appendix for:

- GitHub `allowed-tools` / `license`
- Codex `agents/openai.yaml`, plugins, `[[skills.config]]`
- Claude invocation controls, richer frontmatter, hooks, paths, shell, agent fields

## Remaining Uncertainty

- This is based on local reference docs gathered in round-1, not exhaustive live product testing.
- `unclear` should not be read as unsupported; it means this round has not captured enough local evidence to claim support.
- Future rounds should convert this into a tested matrix by running real skills across surfaces.
