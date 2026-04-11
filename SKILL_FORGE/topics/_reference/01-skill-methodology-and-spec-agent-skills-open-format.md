# Agent Skills As An Open Format

- `source_urls`:
  - `https://agentskills.io/home`
  - `https://agentskills.io/clients`
  - `https://agentskills.io/what-are-skills`
- `source_type`: `open-standard-home-and-overview`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这组来源最适合回答“skill 是不是一个可迁移对象”以及“它是否已经越过单平台私有语境”。`
- `claims_supported`:
  - Agent Skills 已经被明确表述为 open format / open standard
  - skill 的最小载体是包含 `SKILL.md` 的文件夹
  - 这套格式正在被多种 coding agent 与工具支持，而不只是一家平台私有语法

## 关键事实

- `what-are-skills` 页面把 Agent Skills 定义为 `a lightweight, open format`。
- 同页明确说，skill 的核心是一个包含 `SKILL.md` 的文件夹，可选附带 `scripts/`、`references/`、`assets/`。
- `home` 页面明确说该格式已 `released as an open standard`，并且 `adopted by a growing number of agent products`。
- `clients` 页面直接写明这是 `Agent products that support the Agent Skills format`，并列出 `OpenAI`、`Codex`、`GitHub Copilot`、`Claude Code`、`Cursor` 等对象。

## 与本研究的关系

- 对 `01` 来说，这组材料给出的最重要结论是: skill 不是一套孤立 prompt 写法，而是在向跨工具可迁移格式收敛。
- 这也解释了为什么后续研究不能只看单仓库习惯，而要关注哪些结构约定已经越过平台边界。

## 风险与局限

- “open standard” 说明的是格式目标与生态方向，不等于所有实现细节已经完全一致。
- 客户端支持列表证明采用面在扩大，但不自动说明每个客户端都支持全部字段与行为。
