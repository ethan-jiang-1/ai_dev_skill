# Vercel Skills (Mintlify Docs): Lock Files (`.skill-lock.json`, `skills-lock.json`)

- source_url: https://www.mintlify.com/vercel-labs/skills/advanced/lock-files
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: Lock files are the “deployment/steady state” backbone for skills as an engineering artifact: reproducibility, team sharing, and deterministic diffs. This supports eng’s claim that skill lifecycle needs versioned, inspectable state, not just prompts.
- claims_supported:
  - There are global (user-wide) and local (project-scoped, version-controllable) lock files tracking installed skills and their sources/hashes.
  - The local lock file is explicitly intended to be checked into version control and shared with a team.
  - Hash fields (e.g., folder/computed hashes) enable update checks and (partially) supply-chain governance.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: Vercel Labs `skills` CLI; skills installation governance

## 关键事实

- Skills CLI 使用两类 lock files 跟踪已安装 skills：
  - global lock file: `~/.agents/.skill-lock.json`（用户级）
  - local lock file: `./skills-lock.json`（项目级，文档明确“应该提交到版本控制并与团队共享”）
- 文档给出设计哲学：local lock file 刻意最小化，按字母序排序，不存 timestamps，以减少 merge conflicts 并提供 deterministic output。
- lock file 字段包含来源信息与 hash（如 `skillFolderHash` / `computedHash`），为更新检查与治理提供基线。

## 与本研究的关系

- 对 03-devlife（Deployment & Steady State）：
  - 把 “skill 安装状态”变成可审查的 repo 资产，允许团队像治理依赖一样治理 skills（引入 PR/代码审查/回滚）。
- 对 04-path（团队采纳）：
  - 让“直接用/改着用/自建”的策略更可操作：团队可以锁定版本、批量升级、差异审阅。

## 可直接引用的术语 / 概念

- global lock file (`~/.agents/.skill-lock.json`)
- local lock file (`./skills-lock.json`)
- deterministic output / minimize merge conflicts
- `skillFolderHash` / `computedHash`

## captured_excerpt

> This file is meant to be checked into version control and shared with your team.

## 风险与局限

- lock file 提供“状态记录 + 可复现线索”，但不等价于端到端内容完整性与信任根（签名/证明/审计）。用于安全结论时必须降级表述并继续补证据。

