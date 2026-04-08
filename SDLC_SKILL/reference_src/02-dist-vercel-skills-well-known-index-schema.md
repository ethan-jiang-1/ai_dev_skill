# vercel-labs/skills: Well-Known Provider + `index.json` Schema (RFC 8615)

- source_url: https://github.com/vercel-labs/skills/blob/main/src/providers/wellknown.ts
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 这是 Skills CLI 对 well-known endpoint 的“真实解析与校验逻辑”一手来源，给出 `index.json` 结构、`/.well-known/agent-skills` vs `/.well-known/skills` 的兼容策略，以及对文件列表的安全校验（path traversal 防护）。用于补齐 `/.well-known/*/index.json` 的 schema 与采用机制证据缺口。

## Key Facts

- `index.json` 结构在代码中被类型化为：
  - `WellKnownIndex`: `{ skills: WellKnownSkillEntry[] }`
  - `WellKnownSkillEntry`: `name`（skill identifier）、`description`、`files: string[]`（skill 目录内所有文件的相对路径列表）
- Well-known 路径策略：
  - 优先路径：`/.well-known/agent-skills/`（preferred）
  - 兼容回退：`/.well-known/skills/`（legacy fallback）
  - `fetchIndex()` 会先尝试 `/.well-known/agent-skills/index.json`，再回退到 `/.well-known/skills/index.json`，并且对带 path 的 base URL 先尝试 path-relative（例如 `https://example.com/docs/.well-known/agent-skills/index.json`）再尝试根路径。
- `index.json` entry 校验要点（`isValidSkillEntry()`）：
  - 必须包含 `name`、`description`、`files` 且 `files` 非空。
  - `name` 必须匹配小写字母/数字/连字符格式（与 Agent Skills 命名约束对齐）。
  - `files` 中的每个 file 必须是字符串，且不得以 `/` 或 `\\` 开头，也不得包含 `..`（path traversal prevention）。
  - `files` 列表必须包含 `SKILL.md`（大小写不敏感匹配）。
- Provider 匹配策略：Well-known provider 作为 URL fallback，会匹配任意 HTTP(S) URL，但排除 `github.com`、`gitlab.com`、`huggingface.co` 等有专用 provider 的 host。
- 同仓测试文件（`tests/wellknown-provider.test.ts`）验证 `toRawUrl()` 的行为：任意 base URL 会被规范化到 `/.well-known/agent-skills/index.json`；并将 legacy `/.well-known/skills/<skill>` 路径转换到 `/.well-known/agent-skills/<skill>/SKILL.md`。

## Claims Supported

- “`/.well-known/*/index.json` 的 schema 与校验规则在官方 CLI 代码中被明确实现”，可作为 registry/目录标准化的工程 ground truth。（主题2 dist）
- “`agent-skills` 是 preferred 路径、`skills` 是 legacy fallback”反映出 well-known endpoint 可能正在发生迁移，需要在文档与生态采用中跟踪一致性。（主题2 dist 趋势）

## Captured Excerpts (keep short)

> The provider first checks /.well-known/agent-skills/index.json, then falls back to /.well-known/skills/index.json.

## Terms / Concepts

- well-known endpoint (RFC 8615)
- `/.well-known/agent-skills/index.json` (preferred)
- `/.well-known/skills/index.json` (legacy)
- `WellKnownIndex` / `WellKnownSkillEntry`
- path traversal prevention (`..`, leading `/`)

## Risks / Limits

- 这份证据是 CLI 的实现口径，可能领先或滞后于 docs；需要与官方文档页（source formats）做一致性对照，并观察生态实际采用的端点路径。

