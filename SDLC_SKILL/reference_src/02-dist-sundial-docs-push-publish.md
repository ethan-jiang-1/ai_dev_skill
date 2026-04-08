# Sundial Docs: CLI Push & publish

- source_url: https://sundialhub.com/docs/cli/push-pull
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 这页把“发布、版本不可变性、自动 bump、安全落盘范围、可见性与分类”具体化，是 skill 供应链治理的核心一手证据。

## Key Facts

- 发布：`npx sundial-hub push` 读取本地目录，找到 `SKILL.md` 并发布到 Sundial Hub；支持指定路径与 `--team`。
- 上传范围：目录内文件会与 `SKILL.md` 一起上传；hidden files、`node_modules`、`__pycache__` 自动跳过。
- `SKILL.md` frontmatter：需要 `name` 与 `description`；`version` 推荐填写，缺失时默认 `1`。
- Push 选项（文档列出）：`--skill-version`、`--changelog`、`--visibility (public/private)`、`--team`、`--categories`。
- Versioning：文档明确 “Every push creates an immutable version snapshot”；版本来自 frontmatter 的 `version` 字段。
- Auto-bump：如果请求的版本与已发布版本相同或更低，CLI 会自动 bump 到下一个版本（支持整数与 semver）。
- Find：`npx sundial-hub find`（交互/搜索）、`npx sundial-hub mine`（查看自有与团队共享）；鉴权后包含私有技能。

## Claims Supported

- “分发层开始引入不可变版本快照与自动 bump，强调可追溯与防静默更新。”（主题2 dist）
- “发布流程会把 skill 目录作为制品上传，并明确跳过常见噪音目录，属于制品化治理。”（主题2 dist）

## Captured Excerpts (keep short)

> Every push creates an immutable version snapshot.

## Terms / Concepts

- immutable snapshot
- auto-bump
- visibility (public/private)
- categories

## Risks / Limits

- 仍需补齐“验证标记/审核策略”的可观察证据（例如 UI 的安全报告样例或 API 输出），以闭环验证治理效果。

