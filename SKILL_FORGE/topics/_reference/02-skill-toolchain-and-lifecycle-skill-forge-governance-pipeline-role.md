# `skill-forge` As Governance And Publish Pipeline

- `source_url`: `https://raw.githubusercontent.com/motiful/skill-forge/main/README.md`
- `source_type`: `project-readme`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `practitioner`
- `why_it_matters`: `这个对象把 lifecycle 的后半段讲得最清楚: validate、scan、fix、publish。`
- `claims_supported`:
  - `skill-forge` 的主职责在 post-authoring，而不在内容编写
  - 它覆盖 audit、安全扫描、修复、发布等治理环节
  - 它是组合式工具链里最接近 governance / publish 层的对象之一

## 关键事实

- README 明确说 `The gap is not in authoring`，问题主要在 engineering。
- README 把自己定位为 `post-authoring` 方向。
- README 列出的核心职责包括:
  - audits entire projects
  - scans for security issues
  - converts rules into publishable skills
  - publish to GitHub
- README 明确说 `Critical issues block push`。
- README 还强调自己 `does not write skill content or test domain effectiveness`。

## 与本研究的关系

- 对 `02` 来说，这类对象的 lifecycle 位置非常清楚:
  - authoring 之后
  - publish 之前
  - 或 publish 过程本身
- 它不是 loader，也不是目录站，更不是单纯样板库。
- 如果最终 baseline 要强调工程质量与可发布性，治理 / publish pipeline 很可能要单列为独立能力层。

## 风险与局限

- 当前材料主要来自 README，自述色彩较强。
- 它很适合说明职责边界，但还不足以单独证明效果已经被广泛验证。
