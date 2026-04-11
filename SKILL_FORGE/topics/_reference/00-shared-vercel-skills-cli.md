# Vercel Labs `skills` CLI README

- `source_url`: `https://raw.githubusercontent.com/vercel-labs/skills/main/README.md`
- `source_type`: `official-repo-readme`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `official`
- `why_it_matters`: `这份 README 是当前最清楚的“安装、分发、更新、跨 agent 兼容层”样本之一。`
- `claims_supported`:
  - 生态里已经出现专门的 skills installer / manager，而不是只有内容仓库
  - skills 已经被工程化成 project-scope 与 global-scope 两类安装模型
  - 单一事实源 + symlink 是一个重要治理思路

## 关键事实

- `skills` CLI 将自己定义为 `The CLI for the open agent skills ecosystem`。
- README 显示它支持 `OpenCode`、`Claude Code`、`Codex`、`Cursor` 等多类 agent。
- 安装入口统一为 `npx skills add <owner/repo>`。
- 支持多种 source formats，包括 GitHub shorthand、完整 URL、单个 skill 子路径、GitLab、任意 git URL、本地路径。
- 支持 project scope 与 global scope：
  - project：安装到项目目录，适合团队共享
  - global：安装到用户目录，适合跨项目复用
- 交互安装时推荐 `Symlink` 方法，以维持 single source of truth；`Copy` 仅在不支持 symlink 时使用。
- CLI 不只安装，还提供 `list`、`find`、`remove`、`check`、`update`、`init` 等管理动作。
- README 明确给出了多 agent 的目标目录映射，说明 skill engineering 已经进入“适配层与分发层”阶段。
- README 将 `skills.sh` 作为 discover 入口。

## 与本研究的关系

- 对 `02` 而言，这是当前最直接的 runtime / installer / distribution 层证据。
- 对 `01` 而言，它间接说明 skill 已不再只是内容文本，而是可安装、可更新、可寻址的工件。
- 对 `03` 而言，CLI 把发现、安装和更新统一起来，说明生态正在形成可复用入口，而不是完全依赖手工复制。

## 可直接引用的术语 / 概念

- `open agent skills ecosystem`
- `project scope`
- `global scope`
- `single source of truth`
- `symlink`

## 风险与局限

- 这是项目自述，适合用于理解职责边界，但不应把所有兼容声明直接当作独立验证后的事实。
- README 对“是否真的降低长期维护成本”给出了强主张，但这仍需要 Wave 1 的使用与限制证据补强。
