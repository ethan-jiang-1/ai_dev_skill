# Agent Skills: Specification

- source_url: https://agentskills.io/specification
- source_type: spec
- accessed_at: 2026-04-08
- published_at:
- related_topic: shared
- trust_level: official
- why_it_matters: 给出 `SKILL.md` 与目录结构的硬约束，是后续比较“宿主兼容 vs 专有封装”的基线。

## Key Facts

- 一个 skill 至少是一个目录，最小必含 `SKILL.md`；可选包含 `scripts/`、`references/`、`assets/` 等。
- `SKILL.md` 必须是 “YAML frontmatter + Markdown body” 的结构。
- Frontmatter 必填字段：
  - `name`：1-64 字符；仅允许小写字母/数字/连字符；不能以连字符开头/结尾；不能出现连续 `--`；必须与父目录名一致。
  - `description`：1-1024 字符；非空；描述“做什么+何时用”，建议包含帮助 agent 识别任务的关键词。
- Frontmatter 可选字段：
  - `license`：许可证名称或指向捆绑 license 文件。
  - `compatibility`：环境要求说明（产品、系统包、网络等），如无必要不建议写。
  - `metadata`：任意 key/value 额外元数据。
  - `allowed-tools`：空格分隔的预批准工具列表（标注为 Experimental）。
- Body content（frontmatter 之后的 Markdown）没有格式限制，推荐写“可执行的分步指令”等能提升任务表现的内容。

## Claims Supported

- “`SKILL.md` 的硬事实标准：目录结构 + YAML frontmatter 约束 + 可选字段语义。”（主题1 host 的标准基线）
- “allowed-tools 体现了权限/治理正在进入规范层讨论（但兼容性可能不一致）。”（主题1/2 的权限与治理交叉点）

## Captured Excerpts (keep short)

> A skill is a directory containing, at minimum, a SKILL.md file.

> The SKILL.md file must contain YAML frontmatter followed by Markdown content.

## Terms / Concepts

- YAML frontmatter
- allowed-tools (experimental)
- compatibility field

## Risks / Limits

- 该规范描述“格式”，不等同于所有宿主的“运行语义”；宿主加载/权限/触发仍需各自官方文档验证。

