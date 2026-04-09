# Anthropic Engineering: Equipping Agents for the Real World with Agent Skills (2025-10-16)

- source_url: https://claude.com/blog/equipping-agents-for-the-real-world-with-agent-skills
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 01-scaffold
- trust_level: official
- why_it_matters: This is an official “mechanism explanation” for progressive disclosure in Agent Skills (metadata preloading + on-demand loading of SKILL.md body + deeper referenced files). It lets eng arguments about scaffolding move from metaphor to implementation detail.
- claims_supported:
  - Progressive disclosure is implemented as multi-level loading: metadata preload, SKILL.md body on-demand, extra files as deeper on-demand context.
  - Preloading name/description for all installed skills provides a discoverability layer without context explosion.
  - Skills package procedural knowledge + executable capabilities, enabling “learn by using” (reverse learning) when the Skill’s structure is readable/auditable.
- date_scope: 2025-10-16 (post); includes update note 2025-12-18 about open standard
- related_tools: Claude Agent Skills; SKILL.md; progressive disclosure

## 关键事实

- 文章把 Agent Skills 描述为由 instructions/scripts/resources 组成的结构化文件夹，agent 可发现并动态加载以提升特定任务表现。
- 明确给出 progressive disclosure 的分层加载模型：
  - 第一层：`SKILL.md` YAML frontmatter（`name`/`description` 等元数据）在 startup 时预加载到 system prompt
  - 第二层：`SKILL.md` 正文按需加载
  - 第三层及更深：skill 目录内额外文件按需读取（可在 `SKILL.md` 中引用）

## 与本研究的关系

- 对 01-scaffold（脚手架机制）：
  - 这是“为什么 Skill 能当脚手架”的工程实现线索：让方法/资源按需曝光，既避免一开始信息过载，又在需要时提供可解释的过程结构。
- 对“逆向学习（reverse learning）”：
  - 预加载的元数据使 skill 可发现；按需加载正文与引用文件使工程师能在任务过程中逐步看到方法学细节，从而更容易拆解学习。

## 可直接引用的术语 / 概念

- progressive disclosure (multi-level)
- metadata preloading
- on-demand loading
- linked files as deeper context levels

## captured_excerpt

> At startup, the agent pre-loads the name and description of every installed skill into its system prompt.

## 风险与局限

- 这是 Anthropic/Claude 侧的设计与最佳实践；其他宿主是否同样“预加载 metadata”与“按需读取额外文件”需要逐宿主核验，避免外推成通用事实。

