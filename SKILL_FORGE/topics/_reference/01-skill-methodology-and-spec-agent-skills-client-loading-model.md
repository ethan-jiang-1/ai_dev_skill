# Agent Skills Client Loading Model

- `source_url`: `https://agentskills.io/client-implementation/adding-skills-support`
- `source_type`: `implementation-guide`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这份 guide 说明 skill 不只是文件格式，还隐含了一套 discovery / activation / resource loading 的方法论。`
- `claims_supported`:
  - progressive disclosure 已经有明确的三层加载模型
  - discovery 阶段与 activation 阶段是不同机制
  - 客户端实现差异更多体现在加载方式，而不是 skill 目录本体

## 关键事实

- guide 直接写明 skill 支持的 `full lifecycle: discovering skills, telling the model about them, loading their content into context, and keeping that content effective over time`。
- 搜索摘要明确给出了三层加载模型:
  - `Catalog`: `name + description`
  - `Instructions`: full `SKILL.md` body when activated
  - `Resources`: scripts / references / assets on demand
- guide 说明客户端在 session startup 应 `find all available skills and load their metadata`。
- guide 还明确给出两种 activation 模式:
  - file-read activation
  - dedicated tool activation
- guide 特别提醒，如果 agent 有权限系统，应 allowlist 技能目录，避免技能内资源访问频繁触发确认。

## 与本研究的关系

- 对 `01` 来说，这份材料非常关键，因为它说明“skill 方法论”不只在作者怎么写，还在客户端怎么披露和激活。
- 这也解释了为什么 `description` 会变成核心字段: discovery 阶段就是靠它进行路由。

## 风险与局限

- 这是实现指南，不是强制标准。
- 它体现的是当前最佳实践方向，不能直接等价为所有客户端都照此执行。
