# Wave 2 Surface Compatibility Appendix

- `status`: `in_progress`
- `purpose`: `把 `Codex / GitHub / Claude` 三个主要 surface 的 skill 承载方式、扩展能力与可迁移边界明确拆开，避免把某一家的实现语义误写成通用标准。`
- `basis`:
  - `01-skill-methodology-and-spec-github-skill-interface-facts.md`
  - `01-skill-methodology-and-spec-claude-surface-differences.md`
  - `01-skill-methodology-and-spec-codex-surface-interface-facts.md`
  - `00-shared-agents-md-home.md`
  - `00-shared-github-create-agent-skills.md`
- `warning`: `这份 appendix 的目标是帮助 authoring baseline 与最终推荐口径收口，不是替代完整 field-by-field 支持矩阵。`

## 三家 surface 对照表

| Surface | Core skill container | Repo / project discovery | User / global scope | Invocation model | Surface-specific extensions | Distribution stance | Primary portability risk |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Codex` | 目录 + `SKILL.md` + optional `scripts/`, `references/`, `assets/`, `agents/openai.yaml` | 从当前目录向上扫到 repo root 的 `.agents/skills` | `$HOME/.agents/skills`, `/etc/codex/skills`, built-in system skills | explicit `/skills` 或 `$skill`; implicit by `description` | `agents/openai.yaml`, plugins, `[[skills.config]]`, layered `AGENTS.md` | skills 是 authoring format，plugins 是 distribution unit | `openai.yaml`、plugin packaging、`.agents/skills` upward scan 都不是通用生态默认语义 |
| `GitHub` | 目录 + `SKILL.md` + optional scripts / examples / resources | project 支持 `.github/skills`, `.claude/skills`, `.agents/skills` | `~/.copilot/skills`, `~/.claude/skills`, `~/.agents/skills` | 以任务相关性与 skill loading 为主，当前官方文档更强调 automatic relevance than slash-style invocation | `license`, `allowed-tools` | 官方鼓励 use skills shared online，但没有像 Codex plugins 那样把 skill distribution 单独抽成一个同层单元 | `.github/skills` / `.copilot/skills` 路径语义与 `allowed-tools` 的行为不应外推为全平台标准 |
| `Claude` | 目录 + `SKILL.md` + supporting files；旧 `.claude/commands/` 已并入 skills 语义 | `.claude/skills`, nested `.claude/skills` automatic discovery, plugin skills | `~/.claude/skills`, enterprise managed settings | explicit `/skill-name`; implicit by `description` unless `disable-model-invocation: true` | `argument-hint`, `disable-model-invocation`, `user-invocable`, `allowed-tools`, `model`, `effort`, `context`, `agent`, `hooks`, `paths`, `shell` | open standard + Claude-specific extensions；plugin / enterprise / personal / project 多层并存 | 功能最丰富，也最容易把 Claude-specific frontmatter 误当成 portable baseline |

## 当前最稳的共同层

- 三家 surface 都支持的最低共同层已经相当明确:
  - 目录级 skill 对象
  - `SKILL.md`
  - `name`
  - `description`
  - progressive disclosure
  - 按需 supporting files

## 当前最不稳的层

- 下面这些对象不应再被默认视为 portable baseline:
  - `allowed-tools`
  - surface-specific invocation policy
  - plugin packaging
  - `agents/openai.yaml`
  - runtime / container assumptions
  - Claude-specific hooks / paths / shell / subagent frontmatter

## Repo guidance 的分离方式

- `Codex`
  - 官方明确支持 layered `AGENTS.md`
  - global + project + nested override 都有清晰规则
- `GitHub`
  - 官方文档更明确区分的是 `custom instructions` 与 `skills`
  - 因此 GitHub 的官方 repo-guidance 语义，当前更接近 always-on custom instructions 而不是 Codex 风格的 layered AGENTS
- `Claude`
  - 官方技能文档明确拿 `CLAUDE.md` 对比 skills
  - 也就是说，Claude 官方同样清楚区分 always-on repo context 与 on-demand skill body

## 对 authoring baseline 的直接含义

- 如果目标是跨 surface 迁移，最稳的策略不是写满功能，而是分两层:
  - `portable core`
  - `surface appendix`
- `portable core` 里优先保留:
  - `SKILL.md`
  - `name`
  - `description`
  - 正文中的核心 procedure
  - references / scripts / assets 的导航
- `surface appendix` 里再写:
  - GitHub 的 `allowed-tools` / `license`
  - Claude 的 richer frontmatter
  - Codex 的 `agents/openai.yaml`、plugins、`skills.config`

## 对最终推荐语法的影响

- 这份 appendix 进一步说明，最终推荐不该只是“哪个项目最好”。
- 它还必须回答:
  - 如果你优先考虑跨 surface，可迁移 baseline 应该怎么写
  - 如果你优先考虑某一宿主，要接受哪些宿主特有能力和锁定

## 当前仍未完全解决的点

- 这份 appendix 还不是完整 field-by-field matrix。
- 还没有把:
  - GitHub
  - Claude
  - Codex
  的每个具体 frontmatter 字段做逐项支持矩阵。
- 但它已经足够支撑当前 round 的最终推荐语法，不会再把三家的实现语义混成一个“统一标准幻觉”。
