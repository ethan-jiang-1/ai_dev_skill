# Vercel Skills Docs: Update System (`skills check`, `skills update`)

- source_url: https://www.mintlify.com/vercel-labs/skills/advanced/update-system
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 该页把 Skills CLI 的“更新检测与差异判断”机制讲成可实现事实：基于 lock file 的 `skillFolderHash`，通过远端 API 获取最新 hash 并比对，从而决定是否有更新。它直接支撑“分发层向包管理器化演进”的更新治理证据。

## Key Facts

- Skills CLI 提供自动更新检查：通过 `skills check` 与 `skills update` 命令检测已安装 skills 的变更。
- 更新机制基于 hash 对比：将 lock file 中记录的 `skillFolderHash` 与远端 source（如 GitHub）最新内容计算出的 folder hash 比对。
- 文档给出 update system 的工作步骤（overview）：
  1. 读取 `~/.agents/.skill-lock.json`，获取已安装 skills 的 `skillFolderHash`。
  2. 向 update API 发送 POST 请求：`https://add-skill.vercel.sh/check-updates`，并包含 `forceRefresh: true`。
  3. API 拉取远端内容并计算最新 folder hash，与请求中提供的 hash 比对。
  4. API 返回 hash 不同的 skills 列表（即 updates available）。
- `skills check`：仅检查是否有更新，不执行安装更新。
- 文档包含 API request/response 示例与 response schema（用于表述“哪些 skills 有更新”）。

## Claims Supported

- “更新治理”已经进入分发层默认能力面：通过 lock file hash + 远端差异检测接口，实现可批量 check/update。（主题2 dist）
- 更新系统引入新的信任链路（远端 API + hash 计算），为后续研究“供应链风险缓解/签名/审计”提供落点。（主题2 dist；安全交叉）

## Captured Excerpts (keep short)

> ...POST ... to the update API at https://add-skill.vercel.sh/check-updates ...

## Terms / Concepts

- `skills check` / `skills update`
- `skillFolderHash`
- update API (`/check-updates`)
- `forceRefresh`

## Risks / Limits

- 文档描述的是更新检测机制；并未等价回答“内容完整性/签名验证/信任根”问题，仍需结合实现代码与安全策略进一步核验。

