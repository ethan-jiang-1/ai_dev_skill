# Vercel Skills Docs: Lock Files (`.skill-lock.json`, `skills-lock.json`)

- source_url: https://www.mintlify.com/vercel-labs/skills/advanced/lock-files
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 该页把 Skills CLI 的“可追溯安装状态”机制落到可检查的制品（global/local lock files），并解释团队协作场景下的设计哲学（最小化 merge conflicts、确定性输出）。这是补齐“版本治理/可控依赖项”机制证据的关键一手来源。

## Key Facts

- Skills CLI 使用两类 lock files 跟踪已安装 skills：
  - global lock file：面向用户级安装（user-wide），位于 `~/.agents/.skill-lock.json`，追踪安装到用户目录（`~/.agents/`）的技能。
  - local lock file：面向项目级安装（project-scoped），位于 `./skills-lock.json`，并明确 “meant to be checked into version control and shared with your team”。
- Global lock file（示例结构）包含：
  - 顶层 `version`（示例为 3）。
  - `skills` 映射（按 skill name），条目字段包括：`source`、`sourceType`、`sourceUrl`、`skillPath`、`skillFolderHash`、`installedAt`、`updatedAt`、`pluginName` 等。
  - `dismissed`（示例包含 `findSkillsPrompt`），用于记录已被用户忽略的提示，避免重复弹出。
- Local lock file（示例结构）包含：
  - 顶层 `version`（示例为 1）。
  - `skills` 映射（按 skill name），条目字段包含 `source`、`sourceType`、`computedHash` 等（不存 timestamps）。
- Design philosophy（文档明确）：
  - local lock file intentionally minimal，用于减少 merge conflicts。
  - skills 按字母序排序、且不存 timestamps，以获得 deterministic output。
  - Git-friendly：不同分支添加不同 skills 时 key 不重叠，易于自动合并。

## Claims Supported

- “分发层的团队治理”可以通过可提交的 local lock file 落地为可追溯依赖项，从而让技能安装与更新进入工程化协作链路。（主题2 dist）
- `skillFolderHash/computedHash` 这类字段为更新检查与供应链验证提供了“可计算状态”的基线。（主题2 dist；与安全/更新治理交叉）

## Captured Excerpts (keep short)

> This file is meant to be checked into version control and shared with your team.

## Terms / Concepts

- global lock file: `~/.agents/.skill-lock.json`
- local lock file: `./skills-lock.json`
- `skillFolderHash` / `computedHash`
- deterministic output / minimize merge conflicts

## Risks / Limits

- lock file 提供的是“状态记录 + 可复现线索”，并不等同于端到端的内容完整性验证（仍需结合来源校验、更新策略与安全扫描机制）。

