# Aider Docs: Specifying Coding Conventions

- source_url: https://aider.chat/docs/usage/conventions.html
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这份官方文档把 conventions 的落地机制讲清楚（用小型 Markdown 文件作为约束；用 `/read` 或 `--read` 标记为只读；结合 prompt caching），为“轻规则集如何在工程上生效”提供可引用的权威细节。

## Key Facts

- 官方建议：用一个小型 Markdown 文件（例如 `CONVENTIONS.md`）写明 coding guidelines（库偏好、类型提示、测试规范等），并把该文件加入聊天上下文。
- 建议以只读方式加载：文档建议用 `/read CONVENTIONS.md` 或 `aider --read CONVENTIONS.md` 加载，使其被标记为 read-only。
- 与缓存结合：文档明确“以 read-only 加载”的好处之一是当启用 prompt caching 时可被缓存。
- 持久化加载：文档给出在 `.aider.conf.yml` 中配置 read 文件列表的方式，使 conventions 每次会话自动加载。
- 官方同时指向 conventions 仓库作为 community contributed conventions 的入口。

## Claims Supported

- “轻规则集”的有效性依赖工程化细节：只读标记、固定加载入口、以及与 prompt caching 的结合，能显著降低规则在长对话中被稀释的概率。（主题4 framework）

## Captured Excerpts (keep short)

> It’s best to load the conventions file with /read CONVENTIONS.md ...

## Terms / Concepts

- `/read`
- `--read`
- prompt caching
- `.aider.conf.yml`

## Risks / Limits

- 页面包含大量导航与示例内容；如需进一步讨论“缓存命中条件/不同模型支持差异”，需要补抓 prompt caching 的专门文档页作为补充证据。

