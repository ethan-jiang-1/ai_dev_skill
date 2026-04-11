# `open-skills` As Local Runtime Bridge

- `source_urls`:
  - `https://raw.githubusercontent.com/instavm/open-skills/main/README.md`
  - `https://api.github.com/repos/instavm/open-skills`
- `source_type`: `repo-readme-and-metadata`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `practitioner`
- `why_it_matters`: `这个对象代表了另一类常被混淆的能力: 它不是 installer，而是把既有 skills 运行到本地 / MCP 环境里的 runtime bridge。`
- `claims_supported`:
  - `open-skills` 的主职责是本地执行与 runtime bridge
  - 它强调 Claude skills 可在本地沙箱与任意 LLM 场景运行
  - 它更接近 execution adapter，而不是目录或治理工具

## 关键事实

- README 的第一句直接说明: `Run Claude Skills Locally using any LLM`。
- README 强调所有执行都发生在本地沙箱环境中。
- README 把自己描述为一个 MCP server，并说明可与任何 MCP-compatible 工具配合。
- README 直接提供了导入 Anthropic 官方 skills 的路径。
- GitHub API 显示该仓库描述为 `OpenSkills: Run Claude Skills Locally using any LLM`，并且:
  - `created_at`: `2025-10-26T18:09:49Z`
  - `stargazers_count`: `397`
  - `forks_count`: `34`
  - `updated_at`: `2026-04-10T03:08:33Z`

## 与本研究的关系

- 对 `02` 来说，这类对象应该被归类为:
  - local runtime bridge
  - execution adapter
  - MCP-facing compatibility layer
- 它解决的是“怎么跑”和“怎么把现有 skill 接到本地代理环境”，而不是“怎么治理 skill 仓库”。
- 这进一步证明 lifecycle 里至少还存在一层 `execution/runtime`，不能简单并入 installer。

## 风险与局限

- 这类对象的适用前提是本地运行或 MCP 场景，对通用分发与治理问题覆盖有限。
- 它能复用已有 skill 资产，但不自动替代 installer、目录或审计层。
