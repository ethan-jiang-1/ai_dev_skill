# GitHub Docs: About Agent Skills

- `source_url`: `https://docs.github.com/api/article/body?pathname=/en/copilot/concepts/agents/about-agent-skills`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `official`
- `why_it_matters`: `这是当前最直接的主平台定义之一，用来固定“skill 是什么”和“skill 放在哪里”的基础口径。`
- `claims_supported`:
  - `skill` 是按需加载的 instructions / scripts / resources 文件夹
  - GitHub 明确承认 `skill` 是开放标准生态的一部分，而不是单平台私有格式
  - GitHub 官方明确鼓励使用在线共享的 skills 作为学习与复用入口

## 关键事实

- GitHub 将 agent skills 定义为一组在相关任务发生时被加载的专业化任务资产，而不是总是常驻的仓库说明。
- 文档明确指出，skills 是由 instructions、scripts 和 resources 组成的文件夹。
- GitHub 将 Agent Skills 规范描述为一个 open standard，并说明其已被多种 AI 系统使用。
- GitHub 支持 project skills 与 personal skills 两类安装位置。
- project skills 可存放在 `.github/skills`、`.claude/skills`、`.agents/skills`。
- personal skills 可存放在 `~/.copilot/skills`、`~/.claude/skills`、`~/.agents/skills`。
- GitHub 官方文档直接给出了在线共享来源示例，包括 `anthropics/skills` 与 `github/awesome-copilot`。

## 与本研究的关系

- 对 `01` 而言，这份文档提供了一个强基线：skill 不是一段散落提示词，而是一个可组织、可存放、可按需加载的目录级对象。
- 对 `02` 而言，它给出了 project / personal 两层安装路径，为后续研究 loader、installer、distribution 提供统一出发点。
- 对 `03` 而言，GitHub 官方直接推荐在线共享 skills，这直接支撑“借鉴现成 skill 能显著缩短摸索成本”的研究动机。

## 可直接引用的术语 / 概念

- `Agent skills are folders of instructions, scripts, and resources`
- `open standard`
- `project skills`
- `personal skills`
- `use skills shared online`

## 风险与局限

- 这是 GitHub Copilot 视角下的定义，不等于整个生态已经在所有细节上完成标准统一。
- 文档说明了支持哪些目录位置，但并未独立证明各 agent 对这些路径的实现细节完全一致。
