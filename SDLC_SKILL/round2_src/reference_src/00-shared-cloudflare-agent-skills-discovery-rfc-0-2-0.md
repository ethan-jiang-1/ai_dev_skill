# Cloudflare RFC: Agent Skills Discovery via Well-Known URIs (v0.2.0)

- source_url: https://github.com/cloudflare/agent-skills-discovery-rfc
- source_type: official_spec_repo
- accessed_at: 2026-04-09
- published_at: 2026-01-17
- updated_at: 2026-03-12
- related_topic: shared
- trust_level: official
- why_it_matters: 该 RFC 是 `/.well-known/*/index.json` 发现机制的权威一手规范（基于 RFC 8615），并明确 v0.2.0 的关键破坏性变更（`skills` -> `agent-skills` 路径、`$schema`、`type/url/digest`、强制 digest 校验、脚本执行默认禁止、archive 安全要求）。它能解释“为什么 Vercel CLI 会优先 `agent-skills` 路径”和“生态为何会出现新旧格式并存”。

## Key Facts

- 规范定位：使用 RFC 8615 的 `.well-known` 机制在组织域名下发布 skills，解决“example.com 发布了哪些 skills”的可发现性问题。（Ref: RFC README）
- v0.2.0 关键变更（Changelog）：
  - well-known URI 从 `/.well-known/skills/` 重命名为 `/.well-known/agent-skills/`。（Ref: RFC README）
  - index 顶层用 `$schema`（`https://schemas.agentskills.io/discovery/0.2.0/schema.json`）替代旧版 `version` 字段；并引入 flat single-artifact model：每条 entry 用 `type`（`skill-md`/`archive`）、`url`、`digest` 表达。（Ref: RFC README）
  - `digest` 改为 artifact 的 SHA-256（raw bytes），并要求 clients MUST verify downloaded content；同时加强“默认不执行 scripts”要求（clients SHALL NOT execute scripts by default）。（Ref: RFC README）
  - 新增 archive safety 指南：禁止路径穿越、限制解压炸弹、拒绝解包后逃逸的 symlink/hardlink。（Ref: RFC README）
- Index 位置：publishers MUST 提供 `/.well-known/agent-skills/index.json`。（Ref: RFC README）
- Progressive disclosure：明确 Level 1/2/3 的加载分层（index 元数据 -> SKILL.md -> 引用资源按需加载），用于控制 context cost。（Ref: RFC README）
- Integrity/verification：`digest` 格式为 `sha256:{hex}`（64 lowercase hex）；mismatch 必须拒绝使用。（Ref: RFC README）
- Archive distribution：`.tar.gz`/`.zip` 为推荐格式；archive root 必须包含 `SKILL.md`，且不得包含 `..`/绝对路径；客户端需在验证 digest 后再解包，并执行安全检查。（Ref: RFC README）
- Client implementation 明确流程：fetch index -> check `$schema` -> 用 digest 做缓存 -> 下载并校验 -> progressive disclosure -> scripts 执行需要显式允许/权限模型。（Ref: RFC README）
- HTTP considerations：servers MUST 用合适 content-type 并支持 GET/HEAD；clients MUST 处理 redirects。（Ref: RFC README）

## Claims Supported

- “well-known 发现机制存在明确的一手规范，且 v0.2.0 对路径与 schema 做了破坏性升级；生态出现 `agent-skills` vs `skills` 并存是规范演进的直接结果。”（主题 2 dist；主题 1 host）
- “分发层安全要求被写入规范：digest 校验、archive 安全、scripts 默认不执行、origin allowlisting/prompt injection 风险提示。”（安全/治理）

## Captured Excerpts (keep short)

> Clients MUST verify downloaded content against the `digest` in the index.

## Terms / Concepts

- RFC 8615 well-known URI
- `/.well-known/agent-skills/index.json`
- `$schema` (discovery 0.2.0)
- `type` (`skill-md` / `archive`), `url`, `digest`
- archive safety (path traversal / symlinks / decompression bombs)

## Risks / Limits

- 该 RFC 处于 Draft 状态；实现方可能出现“先落地旧格式、逐步迁移新格式”的现实滞后，需要结合具体发布者的 `index.json` 实例与安装器实现做交叉核验。

