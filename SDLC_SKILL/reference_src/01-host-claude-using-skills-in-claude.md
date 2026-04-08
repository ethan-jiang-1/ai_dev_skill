# Claude Support: Using skills in Claude

- source_url: https://support.claude.com/en/articles/12512180-using-skills-in-claude
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 给出 Claude 产品内启用/上传/组织预置/分享 skills 的“治理与分发路径”，是“官方说法 vs 实际落地流程”的一手证据。

## Key Facts

- 前置条件：需要启用 “Code execution and file creation”（文中作为 Skills 前提条件之一）。
- 组织级开关：
  - Enterprise：Owners 需在 Organization settings 中启用相关能力（含 Skills），并可上传技能做组织预置。
  - Team：文中说明该特性在组织层默认启用；个人在 Customize > Skills 管理。
  - Max/Pro/Free：个人在 Customize > Skills 管理示例技能与上传。
- Anthropic Skills：文中列举 Excel/Word/PowerPoint/PDF 等内置技能，并说明在能力开启时会由 Claude 自动使用，无需显式调用。
- 自定义技能上传流程：创建 skill -> 将 skill folder 打包成 ZIP -> 在 Customize > Skills 中上传 -> 技能出现在列表可 toggle。
- 共享/分发：Team/Enterprise 支持分享技能给特定同事或整个组织；文中强调组织 Owner 需要先在组织设置里打开分享相关开关；被分享的技能为 view-only，接收者需手动启用。

## Claims Supported

- “宿主平台的分发与治理不仅是文件格式，还包含 UI/组织开关/权限与共享策略。”（主题2/主题1 交叉）
- “Anthropic Skills 的调用策略是‘自动调用’，与 Windsurf Workflows 的 manual-only 形成可对比机制边界。”（主题1 对比）

## Captured Excerpts (keep short)

> With Code execution and file creation on, Claude will automatically use these tools when relevant.

## Terms / Concepts

- code execution and file creation
- provision skills organization-wide
- view-only shared skills

## Risks / Limits

- 文档描述 Claude 产品内流程；Claude Code / API 等其它运行时可能存在不同路径与目录机制，需要分别核验。
