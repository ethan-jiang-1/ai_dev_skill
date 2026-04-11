# GitHub Loader Paths And Scope Model

- `source_url`: `https://docs.github.com/api/article/body?pathname=/en/copilot/concepts/agents/about-agent-skills`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `official`
- `why_it_matters`: `这份文档为 lifecycle 提供了最基础的“skill 放在哪里、按什么范围生效”的装载层事实。`
- `claims_supported`:
  - skill 已经有 project scope 与 personal scope 两类装载语义
  - 目录位置本身就是 lifecycle 的一部分，而不是纯实现细节
  - GitHub 已经在接受多 agent 兼容目录，而不只是 GitHub 自己的私有路径

## 关键事实

- GitHub 把 agent skills 定义为按需加载的目录级对象，而不是 always-on 的仓库说明。
- project skills 的支持目录包括:
  - `.github/skills`
  - `.claude/skills`
  - `.agents/skills`
- personal skills 的支持目录包括:
  - `~/.copilot/skills`
  - `~/.claude/skills`
  - `~/.agents/skills`
- 这说明 loader / placement 层已经在向共享目录约定收敛。

## 与本研究的关系

- 对 `02` 而言，这个来源最重要的价值是把 lifecycle 的起点固定下来:
  - 写完 skill 之后要放到哪里
  - 它是项目级共享资产，还是个人级复用资产
- 这也意味着，任何 installer / manager 类工具都必须对这些 scope 与目录语义负责。

## 风险与局限

- 这是 GitHub 视角下的装载模型，不等于所有 agent 在细节上都已完全一致。
- 它能固定 placement 语义，但不覆盖审计、发布、目录发现等后续工程环节。
