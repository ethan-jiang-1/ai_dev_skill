# Claude Support: Creating custom skills

- source_url: https://support.claude.com/en/articles/12512198-creating-custom-skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 给出 Claude 侧“自定义 skills 的结构与元数据语义”，并明确把 metadata 描述为 progressive disclosure 的第一层；同时暴露与 Agent Skills 规范在字段/约束上的潜在差异。

## Key Facts

- 自定义 skills 可以从“少量指令”到“多文件 + 可执行代码包”不等。
- 结构：每个 skill 是一个目录，至少包含 Skill.md；Skill.md 以 YAML frontmatter 开头，包含 `name` 与 `description`（必填元数据）。
- 文中对必填字段给出约束/语义：
  - `name`：human-friendly name（最大 64 字符）。
  - `description`：描述“做什么 + 何时用”，文中强调其对 Claude 判断何时调用技能很关键，并给出 200 characters maximum 的约束描述。
- 可选字段示例：`dependencies`（技能所需软件包）。
- progressive disclosure：文中明确把 Skill.md 的 metadata 描述为 progressive disclosure 的第一层（让 Claude 知道何时用，而不必加载全部内容）。
- 扩展方式：
  - 可在 skill 目录中加入额外资源文件（例如 REFERENCE.md）作为补充信息。
  - 可附带可执行脚本/代码以支持更高级工作流。

## Claims Supported

- “Claude 侧把 metadata 作为 progressive disclosure 第一层，并强调 description 是触发匹配的关键信号。”（主题1 机制）
- “不同宿主/产品对 `SKILL.md`/Skill.md 的字段与约束可能不一致（例如 name/description 的约束与字段集合）。”（主题1 兼容边界）

## Captured Excerpts (keep short)

> The metadata ... serves as the first level of a progressive disclosure system...

## Terms / Concepts

- progressive disclosure (metadata as level 1)
- dependencies (optional metadata)

## Risks / Limits

- 文档中的字段/约束（如 name 的人类可读形式、description 长度、dependencies 字段）可能是 Claude 产品内自定义技能的实现细节；与 agentskills.io 的 open spec 需要做差异对齐与互操作验证。

