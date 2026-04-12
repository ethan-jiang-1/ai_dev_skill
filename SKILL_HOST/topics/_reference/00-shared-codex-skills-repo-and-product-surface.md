# Codex Skills Repo and Product Surface

- source_url: https://github.com/openai/skills
- source_type: official_repository
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current repository snapshot accessed 2026-04-12
- date_scope: current-repo-snapshot
- related_topic: 03, 06, 07, 08
- trust_level: official
- why_it_matters: confirms that Codex treats skills as a first-class product surface, not just a hidden file convention
- claims_supported: Codex has an official skills catalog; some skills are system-installed; curated and experimental skills are installable via `$skill-installer`; skills are part of current Codex docs and product messaging
- canonical_exception: no

## 关键事实

- OpenAI maintains an official `openai/skills` repository described as a skills catalog for Codex.
- The repo states that Agent Skills are folders of instructions, scripts, and resources that agents can discover and use for specific tasks.
- It explicitly says Codex uses skills to package repeatable capabilities for teams and individuals.
- Skills in `.system` are automatically installed in the latest version of Codex.
- Curated and experimental skills can be installed with `$skill-installer`.
- Current Codex docs navigation also exposes `Skills`, `AGENTS.md`, `MCP`, `Plugins`, and `Subagents` as sibling configuration concepts.
- OpenAI’s current Codex product page describes Skills as helping Codex contribute to code understanding, prototyping, and documentation aligned with team standards.

## 与本研究的关系

- Central to Topic `03`.
- Also central to Topic `06` because Codex is clearly positioning skills as part of a larger configurable agent stack.

## 可直接引用的术语 / 概念

- `$skill-installer`
- `.system`
- `curated`
- `experimental`
- `aligned with your team's standards`

## 模型 / 宿主 / 版本相关信息

- This source covers both distribution mechanics and product framing, but not full runtime semantics.
- It indicates Codex now expects skills to coexist with AGENTS, MCP, plugins, and subagents.

## 风险与局限

- Repository docs show the intended surface, not necessarily all edge cases in the CLI or app.
- The docs tree proves feature surface area, but not by itself the quality of every path.

