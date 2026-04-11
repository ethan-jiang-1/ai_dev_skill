# GitHub Skill Interface Facts

- `source_urls`:
  - `https://docs.github.com/api/article/body?pathname=/en/copilot/concepts/agents/about-agent-skills`
  - `https://docs.github.com/en/copilot/how-tos/use-copilot-agents/cloud-agent/create-skills`
- `source_type`: `official-docs`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `GitHub 的文档是当前最具体的客户端级接口事实来源之一，能把 open format 的抽象约定落到实际字段与目录。`
- `claims_supported`:
  - GitHub 已把 skill 视为 instructions / scripts / resources 组成的目录对象
  - `SKILL.md` + YAML frontmatter 已经进入真实产品实现接口
  - `allowed-tools` 等字段说明执行与权限边界已经被纳入接口层

## 关键事实

- GitHub 直接将 skills 定义为由 instructions、scripts、resources 组成的文件夹。
- GitHub 要求 skill 入口文件命名为 `SKILL.md`。
- GitHub 明确说明 `SKILL.md` 为 Markdown + YAML frontmatter。
- GitHub 创建文档列出的关键字段包括:
  - `name`
  - `description`
  - `license`
  - `allowed-tools`
- GitHub 也明确区分:
  - `custom instructions`
  - `skills`
- GitHub 支持 project skills 与 personal skills 两类作用域。

## 与本研究的关系

- 对 `01` 来说，这份材料说明“skill 的最小结构”已经不只是社区习惯，而是有产品级实现支撑。
- 同时，它也说明某些字段已经开始带有执行含义，而不是纯描述元数据。

## 风险与局限

- 这是 GitHub 实现事实，不代表整个生态所有细节完全一致。
- 尤其 `allowed-tools` 的支持范围与行为，不应自动外推到所有客户端。
