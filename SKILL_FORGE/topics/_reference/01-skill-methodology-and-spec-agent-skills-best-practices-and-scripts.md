# Best Practices, Progressive Disclosure, And Scripts

- `source_urls`:
  - `https://agentskills.io/skill-creation/best-practices`
  - `https://agentskills.io/skill-creation/using-scripts`
- `source_type`: `authoring-guides`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这组材料把“好 skill 应该长什么样”从抽象原则落到可执行的写法与结构决策。`
- `claims_supported`:
  - 好的 skill 应该沉淀 project-specific conventions 与 domain-specific procedures
  - `SKILL.md` 不应无限膨胀，而应通过 progressive disclosure 把细节移到 supporting files
  - scripts 的存在是 skill 设计的一部分，但运行前提与输出边界必须被明确处理

## 关键事实

- `best-practices` 页面明确强调 skill 应覆盖:
  - `project-specific conventions`
  - `domain-specific procedures`
- 同页搜索摘要指出，规格建议将 `SKILL.md` 控制在 `500` 行、`5000` tokens 以内，把更细的内容拆到 `references/`。
- `using-scripts` 页面说明技能可以附带命令与脚本，并特别提醒:
  - runtime-level requirements 应放进 `compatibility` frontmatter
  - 很多 harness 会在一定阈值后截断 tool output

## 与本研究的关系

- 对 `01` 来说，这组材料非常适合回答“为什么 discoverability / executability 也是质量维度”。
- 这意味着 method 不是单纯多写步骤，而是要决定:
  - 什么必须进 `SKILL.md`
  - 什么应该延迟到 `references/`
  - 什么应该交给 `scripts/`

## 风险与局限

- 这些来源是 best practice，不是硬性强制标准。
- `scripts` 的可用性仍受客户端权限与工具环境约束，无法仅靠作者端定义完全保证。
