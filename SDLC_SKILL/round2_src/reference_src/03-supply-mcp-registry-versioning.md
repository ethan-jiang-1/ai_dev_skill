# MCP Registry: Versioning (Immutable Metadata + SemVer Sorting)

- source_url: https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/versioning.mdx
- source_type: official_docs
- accessed_at: 2026-04-09
- related_topic: supply
- trust_level: official
- why_it_matters: Versioning 规则决定 registry 的“包管理器语义”：metadata 不可变、需要唯一版本、latest 选择与 range 禁止。这些机制直接影响团队如何做升级、回滚、审计与复现。

## Key Facts

- `server.json` 必须包含 `version`；每次 publication 的 version 必须唯一；发布后 version 与其他 metadata 不可更改。（Ref: versioning）
- Registry 推荐 semantic versioning，但接受任意格式；发布时会尝试按 semver 解析并用于排序与 “latest” 标记；若解析失败，version 会始终被标记为 latest。（Ref: versioning）
- 作为错误预防机制，registry 禁止看起来像“版本范围”的 version 字符串（如 `^1.2.3`、`1.x`、`>=1.2.3` 等）。（Ref: versioning）
- Best practices：建议 server version 与底层 package version 对齐；remote servers 的 server version 可与 API 版本对齐；需要仅更新 registry metadata 时可用 prerelease 版本，但 prerelease 在 semver 排序中通常早于对应 release 版本，可能影响 latest。（Ref: versioning）
- Aggregator 建议：尽可能按 semver 比较；latest 优先；无法比较时用发布时间等规则。（Ref: versioning）

## Claims Supported

- “MCP Registry 的发布/更新语义接近包管理器：不可变版本 + latest 规则 + range 禁止，利于可审计与可复现，但也要求发布者有明确版本策略。”（主题 2 dist；治理）

## Captured Excerpts (keep short)

> Once published, the version string (and other metadata) cannot be changed.

## Terms / Concepts

- immutable metadata
- semantic version parsing
- `latest`
- version range prohibition

## Risks / Limits

- “非 semver 版本总是 latest”的规则可能造成误用与排序混乱；消费方与发布方都需要在文档/流程上对 version format 做约束，避免生态噪音。

