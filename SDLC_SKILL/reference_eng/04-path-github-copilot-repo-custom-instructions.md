# GitHub Copilot: Repository Custom Instructions (`.github/copilot-instructions.md`, `.github/instructions/*`, `AGENTS.md`)

- source_url: https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: official
- why_it_matters: Provides an official, version-controlled mechanism for team-level instruction governance (repo-wide + path-specific + agent instructions). This is direct “team skill governance” ground truth for eng.
- claims_supported:
  - Copilot supports repo-wide, path-specific, and agent instructions as files committed in the repository with defined locations and precedence.
  - “Nearest `AGENTS.md` wins” is a concrete precedence rule that teams can standardize on.
  - Instructions can be audited/reviewed like code (PR workflow), enabling governance rather than personal prompt folklore.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: GitHub Copilot (repo instructions)

## 关键事实

- Copilot repository custom instructions 包含三类文件资产：
  - Repository-wide instructions: `.github/copilot-instructions.md`
  - Path-specific instructions: `.github/instructions/NAME.instructions.md`
  - Agent instructions: `AGENTS.md`（可在仓库内任意位置放置一个或多个）
- 优先级规则（agent instructions）：当 Copilot 工作时，目录树中“最近的 `AGENTS.md`”优先。
- 当 path-specific 与 repo-wide 同时存在且匹配时，两者会同时生效。
- 文档提供验证方式：在 Copilot Chat 的 response references 中可看到 instruction 文件被引用。

## 与本研究的关系

- 对 eng 的“团队如何把 Skill 当成数字资产而不是个人玩具”：
  - 这是典型的“可版本化、可审查、可回滚”的团队指令资产载体（更像工程资产管理，而非个人 prompt）。
- 对 eng 的“样本矩阵/教学样本”：
  - 可以把 `AGENTS.md` + path-specific instructions 作为可教学、可复用的规范资产样本，研究其对新手上手/认知负担的影响。

## 可直接引用的术语 / 概念

- repository-wide instructions
- path-specific instructions
- agent instructions (`AGENTS.md`)
- precedence: nearest `AGENTS.md` takes precedence

## captured_excerpt

> When Copilot is working, the nearest `AGENTS.md` file in the directory tree will take precedence.

## 风险与局限

- 不同 IDE/运行形态（GitHub.com / VS Code / JetBrains 等）支持面可能不同；在“工具对学习路径的影响”章节要避免把这一规则外推到所有宿主。

