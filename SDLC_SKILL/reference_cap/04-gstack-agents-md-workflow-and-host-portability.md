# gstack: AGENTS.md (Skill Pack Manifest + Generated SKILL.md Convention + Host-specific Regeneration)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/AGENTS.md
- source_type: official
- accessed_at: 2026-04-09 11:33:06 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 这份 AGENTS.md 展示了 gstack 的“可迁移形态”：skills 作为一组可分发的 SKILL.md 工件（manifest + 约定目录），并明确 SKILL.md 由模板生成、可按 host（如 Codex）再生成。这为“能力单元如何跨宿主迁移/如何维护单一事实源”提供一手证据。
- claims_supported:
  - skill pack 可以通过固定目录与命令约定（`.agents/skills/` + `/skillname`）形成可迁移分发单元
  - “模板→生成物”的链路允许对不同宿主输出做差异化，同时保持同一机制语义
  - host-specific regeneration（例如 `--host codex`）是迁移成本治理的一种工程手段
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: bun, generated SKILL.md, browse binary

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: AGENTS.md

## 关键事实

- 明确 gstack 的构成：一组 SKILL.md 文件，为软件开发提供结构化角色（CEO reviewer/eng manager/designer/QA/release engineer/debugger 等）。
- 指出技能目录约定：skills live in `.agents/skills/`，以 `/office-hours` 等命令名调用。
- “generated artifacts”约定：
  - SKILL.md 是生成产物（generated），应编辑模板而非输出
  - `bun run gen:skill-docs --host codex` 可生成 Codex-specific 输出
- 明确 build commands（bun install/test/build 等）与 browse binary 的作用（headless browser access）。

## 与本研究的关系

- 为 `digested_cap/04` 的“迁移价值评估”提供一手证据：能力单元的迁移不只是复制 prompt，而是维护“模板→生成物→分发目录→调用约定”的工程链路。
- 也为“哪些抽象更可迁移”提供样本：目录约定与生成链路比语气包装更可复用。

## 可直接引用的术语 / 概念

- “Skills live in `.agents/skills/`”
- “SKILL.md files are generated”
- “Regenerate … `--host codex`”

## captured_excerpt

摘录（来自 `AGENTS.md`）：

> “SKILL.md files are generated … Edit the template, not the output.”

## 风险与局限

- “host-specific generation”需要持续维护映射层（不同宿主的 tools/权限/调用协议差异），否则会产生多宿主漂移。
- `.agents/skills/` 约定并非行业统一标准；迁移到其他宿主仍可能需要重映射目录与加载方式。

