# `vercel-labs/agent-skills` As Sample Library

- `source_url`: `https://raw.githubusercontent.com/vercel-labs/agent-skills/main/README.md`
- `source_type`: `official-repo-readme`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `official`
- `why_it_matters`: `这是“高质量样板库”这类对象的清晰代表，最适合用来和 installer / governance tool 做职责边界切分。`
- `claims_supported`:
  - 该仓库的主职责是提供可直接借鉴的 skill 样板集合
  - skill 目录通常包含 `SKILL.md`、`scripts/`、`references/`
  - 这类仓库负责内容组织和 use-when 样例，不负责安装治理

## 关键事实

- README 直接把它定义为 `A collection of skills for AI coding agents`。
- README 把 skills 描述为 `packaged instructions and scripts`。
- README 展示了多个具体 skill 条目与适用场景。
- README 明确写出 skill 结构:
  - `SKILL.md`
  - `scripts/`（可选）
  - `references/`（可选）
- 安装方式仍然借助 `npx skills add vercel-labs/agent-skills`，说明样板库与 installer 是分离对象。

## 与本研究的关系

- 对 `02` 来说，这类对象应被稳定归类为 `sample library / content library`。
- 它在 lifecycle 里最强的是:
  - 示例
  - 结构参考
  - use-when 粒度
- 它在 lifecycle 里并不负责:
  - 安装兼容
  - 安全审计
  - 发布流水线

## 风险与局限

- 官方样板库能说明“优秀 skill 长什么样”，但不能证明“如何把 skill 变成工程化交付物”。
- 它更适合作为组合工具链中的内容参考层，而不是全链路基座。
