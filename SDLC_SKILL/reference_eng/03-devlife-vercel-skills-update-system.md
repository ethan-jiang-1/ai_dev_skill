# Vercel Skills (Mintlify Docs): Update System (`skills check`, `skills update`)

- source_url: https://www.mintlify.com/vercel-labs/skills/advanced/update-system
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: “Update governance” is the difference between a one-off prompt library and a maintained engineering asset. This doc gives an explicit mechanism (hash-based update checks + API) that maps to the skill lifecycle steady-state operations.
- claims_supported:
  - Skills CLI supports update checking and updating via `skills check` / `skills update`.
  - Update detection is implemented as a hash comparison between locally recorded folder hash and a remotely computed hash via an update API.
  - Introduces an explicit update pipeline that can be integrated into team workflows.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: Vercel Labs `skills` CLI; update API

## 关键事实

- 文档描述 `skills check` / `skills update` 的更新治理能力：基于 lock file 里的 hash（如 `skillFolderHash`）与远端最新内容 hash 比对判断是否有更新。
- 文档给出一个 update API（`https://add-skill.vercel.sh/check-updates`）用于计算并返回“哪些 skills 有更新”。

## 与本研究的关系

- 对 03-devlife（steady state）：
  - 支撑“skill 开发不是一次写完，而是持续迭代 + 回归验证”的工程化路径。
- 对 04-path（团队采纳）：
  - 团队可以把更新检查纳入例行流程（例如 release/周更），并对更新做 review（结合 lockfile diff）。

## 可直接引用的术语 / 概念

- `skills check` / `skills update`
- `skillFolderHash`
- update API (`/check-updates`)
- hash comparison

## captured_excerpt

> ...POST ... to the update API at https://add-skill.vercel.sh/check-updates ...

## 风险与局限

- 文档描述的是“更新检测”机制；它不等价回答“内容完整性验证/签名/信任根”问题。用于安全结论必须继续补齐实现与安全策略证据。

