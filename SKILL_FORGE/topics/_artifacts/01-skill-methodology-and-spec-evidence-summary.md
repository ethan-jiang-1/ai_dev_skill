# 01 / Skill 方法论与规范接口 / Evidence Summary

- `status`: `in_progress`
- `wave`: `Wave 2 / limitation and difference slice in progress`
- `doc_count`: `9`
- `current_focus`: `在最小共同层之上，继续补 portable baseline 与 client-specific extensions 的边界。`

## 本轮新增证据栈

- `01-skill-methodology-and-spec-agent-skills-open-format.md`
  - 固定了 open format 与跨平台支持语境。
- `01-skill-methodology-and-spec-agent-skills-spec-fields.md`
  - 固定了 `SKILL.md` frontmatter 的核心字段与扩展字段。
- `01-skill-methodology-and-spec-agent-skills-client-loading-model.md`
  - 固定了 discovery / activation / resources 的三层加载模型。
- `01-skill-methodology-and-spec-agent-skills-triggering-and-description.md`
  - 确认 `description` 是 routing 级字段，而不是普通摘要。
- `01-skill-methodology-and-spec-agent-skills-best-practices-and-scripts.md`
  - 确认 progressive disclosure 与脚本边界已经进入写作方法论。
- `01-skill-methodology-and-spec-github-skill-interface-facts.md`
  - 用 GitHub 产品级文档补强字段与接口事实。
- `01-skill-methodology-and-spec-vercel-guide-portable-methodology.md`
  - 用实践 guide 补强 portable fields、skill package 与 `AGENTS.md` 边界。
- `01-skill-methodology-and-spec-methodology-convergence-draft.md`
  - 形成第一版“已收敛 / 未收敛”判断。
- `01-skill-methodology-and-spec-claude-surface-differences.md`
  - 补上 Claude Code CLI、SDK 与 API runtime 的 surface difference，固定 portable core 与运行边界的区别。

## 当前最稳的判断

- skill 的最小单位已经可以稳定理解为目录级能力包，而不是散落提示词。
- `SKILL.md + frontmatter + optional supporting files` 已经是高频事实结构。
- `description` 的地位已经接近 routing rule，这使 skill engineering 明显不同于普通文档写作。
- 方法论上最关键的不是“写长一点”，而是把 metadata、instructions、resources、scripts 做分层组织。
- 现在还可以更进一步地说:
  - 最稳的 authoring baseline 不是“采用所有平台都支持的全部字段”
  - 而是先围绕 portable core 写，再把 surface-specific 扩展视为兼容性附加层

## 当前机制理解

- 当前共识不是“所有客户端都完全一样”，而是“有一组越来越稳定的共同接口层”。
- 这个共同接口层至少包括:
  - `SKILL.md`
  - `name`
  - `description`
  - progressive disclosure
  - supporting files on demand
- 第二轮新增的关键机制判断是:
  - `portable core`
  - `surface-specific frontmatter`
  - `runtime constraints`
  这三层不能再混写成同一个“规范层”
- 因此，skill engineering 已经是一套接口设计 + 触发设计 + 内容分层设计，而不只是 prompt 写作。

## 当前缺口

- 还缺更多非 Claude 生态的客户端差异，来判断哪些扩展字段真能跨平台稳定工作。
- 还需要把 portable baseline 进一步收束成可直接执行的 authoring checklist。
- 还没有形成一份明确的“哪些字段默认可迁移，哪些字段必须加兼容性注释”的支持矩阵。
