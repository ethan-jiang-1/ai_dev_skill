# reference_src 说明

`reference_src` 用于沉淀本轮 Deep Research 的可复用 ground truth（证据地基），目标是让后续写正式报告时：

- 任意关键判断都能回指到本地证据文件
- 新人接手只看 `round2_src + reference_src` 也能继续研究
- 证据与结论之间的映射清晰、可检查、可复用

这里不追求全文镜像，也不做“链接堆积”。每个文件必须回答：**为什么值得保存**，以及**它能支撑哪些判断**。

## 命名规范

文件名统一使用小写 ASCII + `-` 连接（便于跨平台、便于搜索）。建议：

- Wave 0 共享地基：`00-shared-<source-slug>.md`
- 主题 1（host）：`01-host-<source-slug>.md`
- 主题 2（dist）：`02-dist-<source-slug>.md`
- 主题 3（supply）：`03-supply-<source-slug>.md`
- 主题 4（framework）：`04-framework-<source-slug>.md`

如同一来源需要二次更新，优先通过元数据字段 `accessed_at` / `date_scope` 记录差异；只有在确实需要并存两份不同时间快照时才追加后缀：`-YYYYMMDD`。

## 文件结构（强制最小集合）

每个 `reference_src/*.md` 至少包含以下字段（空值也要留出位置，方便后续补齐）：

- source_url:
- source_type:
- accessed_at: (YYYY-MM-DD)
- related_topic: (shared / host / dist / supply / framework)
- trust_level: (official / academic / practitioner / community)
- why_it_matters:

建议字段：

- published_at:
- claims_supported:
- captured_excerpt:
- date_scope:
- related_entities:

## 摘录与版权边界

- 只保留必要的短摘录用于“可追溯性”，其余用自己的话概括。
- 不要把整篇文章复制进来（不做全文镜像）。
- 每段摘录尽量控制在 25 个英文词以内（中文同理，保持短句）。

## 回指约定（round2_src -> reference_src）

在 `round2_src` 的二轮新增内容里，每条关键判断都要附带本地回指，推荐写在句末：

- `（Ref: ../reference_src/00-shared-agentskills-overview.md）`

目标是做到“30 秒内可定位支撑证据”。如发现某条 `reference_src` 文档无法回答“它支撑哪个判断”，那它就不该留在库里。

## 索引（可选但推荐）

`_INDEX.md` 用于列出每份证据文件支持的主要 claims，作为快速检索入口。它不是权威来源本身，只是导航页。

