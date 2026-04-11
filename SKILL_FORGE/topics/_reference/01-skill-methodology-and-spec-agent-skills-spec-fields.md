# Agent Skills Specification Fields

- `source_url`: `https://agentskills.io/specification`
- `source_type`: `formal-specification`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这是目前最接近“事实接口定义”的文本，用来固定哪些字段和约束已经进入规格层。`
- `claims_supported`:
  - `SKILL.md` + YAML frontmatter 已进入规格层
  - `name` 与 `description` 是稳定核心字段
  - `compatibility`、`metadata`、`allowed-tools` 已进入可讨论的扩展字段集合

## 关键事实

- 规格页面明确说 `SKILL.md` 必须包含 YAML frontmatter 与 Markdown 正文。
- 规格要求的核心字段至少包括:
  - `name`
  - `description`
- 搜索摘要显示:
  - `name` 必须匹配父目录名
  - `compatibility` 最大 `500` 字符
  - `metadata` 可用于存放额外属性
- 规格页面还专门列出:
  - `compatibility`
  - `metadata`
  - `allowed-tools`
- 页面文本明确把 `allowed-tools` 定义为 `space-separated string of tools`。
- 页面还给出方法约束建议，例如 `Metadata (~100 tokens)`。

## 与本研究的关系

- 对 `01` 来说，这条来源最关键的价值是把“哪些字段已经接近事实标准”从印象层推进到规格层。
- 这也帮助后续区分:
  - 稳定核心接口
  - 扩展字段
  - 尚未完全收敛的客户端支持差异

## 风险与局限

- 即便进入 specification，也不代表所有客户端都已完整支持每个字段。
- 规格定义了字段与约束，但不自动解决触发、权限、装载路径等实现差异。
