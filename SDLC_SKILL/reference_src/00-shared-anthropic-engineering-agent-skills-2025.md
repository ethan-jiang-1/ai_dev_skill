# Anthropic Engineering: Equipping agents for the real world with Agent Skills (2025-10-16)

- source_url: https://claude.com/blog/equipping-agents-for-the-real-world-with-agent-skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at: 2025-10-16
- related_topic: shared
- trust_level: official
- why_it_matters: 这是关于 Agent Skills 的一手“机制解释”文章，明确 progressive disclosure 的分层加载模型（metadata 预加载、SKILL.md body 按需加载、额外文件作为更深层按需加载）。

## Key Facts

- 文章把 Agent Skills 描述为：由 instructions、scripts、resources 组成的“有组织的文件夹”，agent 可以发现并动态加载，以提升特定任务表现。
- 文章用 Claude 文档编辑（PDF skill）作为例子，说明 skills 用于把“程序化知识与可执行能力”打包给 agent。
- progressive disclosure 的分层机制（文中明确）：
  - 第一层：`SKILL.md` 的 YAML frontmatter 元数据（至少 `name` 与 `description`）。在 startup 时，agent 会将所有已安装 skills 的 `name/description` 预加载进 system prompt。
  - 第二层：`SKILL.md` 的正文内容（当判断相关时才读取并载入上下文）。
  - 第三层及更深：skill 目录内的额外文件（可在 `SKILL.md` 中引用文件名，Claude 按需再读取）。
- 文章强调：把特定场景指令拆到独立文件，可以让核心 `SKILL.md` 保持精简，依赖按需加载来避免上下文膨胀。
- 文中包含更新说明：Agent Skills 后续作为 open standard 发布以支持 cross-platform portability（更新日期为 2025-12-18）。

## Claims Supported

- “progressive disclosure 不只是口号，而是明确的多层加载策略：metadata 预加载 + 指令按需加载 + 参考/脚本进一步按需加载。”（主题1 机制）
- “skill 的结构化目录与‘引用额外文件’是控制上下文体积与场景化指令的关键工程手段。”（主题1/主题4 机制）

## Captured Excerpts (keep short)

> At startup, the agent pre-loads the name and description of every installed skill into its system prompt.

## Terms / Concepts

- progressive disclosure (multi-level)
- metadata preloading
- linked files as deeper context levels

## Risks / Limits

- 文章描述的是 Anthropic/Claude 侧的设计与最佳实践；其他宿主是否同样“预加载 metadata”与“按需读取额外文件”需要逐一核验。

