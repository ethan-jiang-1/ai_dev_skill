# Wave 2 Final Recommendation And Baseline

- `status`: `ready_for_handoff`
- `purpose`: `给出本轮 research 当前最稳的最终推荐结论与可执行 baseline。`
- `basis`:
  - `W2-formal-comparison-table.md`
  - `W2-combination-baseline-workflow-draft.md`
  - `W2-surface-compatibility-appendix-codex-github-claude.md`
  - `W2-final-recommendation-syntax-draft.md`
  - `W2-cross-topic-synthesis.md`

## 最终总判断

- 当前最稳的结论不是“单一赢家”，而是 `分角色推荐 + baseline 组合`。
- 原因很明确:
  - learning / discovery layer
  - engineering baseline layer
  - governance / trust layer
  在现实里就是不同对象承担的不同职责。
- 因此，本轮最终推荐不采用无语义总榜，而采用:
  - `最值得先学的 3 个入口`
  - `最值得先搭的 baseline 组合`
  - `使用时必须保留的纪律`
  - `只在特定场景下追加的增强层`

## 最值得先学的 3 个入口

### 1. `skills.sh`

- 角色：`discovery / directory`
- 为什么入选：
  - 最强的公开发现入口之一
  - 能显著降低“哪里有现成 skill 可以看”的搜索成本
- 应怎么用：
  - 用来找对象、找模式、找入口
  - 不把目录信号当质量或安全背书

### 2. `github/awesome-copilot`

- 角色：`community learning hub`
- 为什么入选：
  - 极适合扩搜真实写法、教程与社区材料
  - 对“借鉴别人 skill 缩短冷启动摸索期”最有帮助
- 应怎么用：
  - 用来观察生态分层与教学层
  - 不直接当工程基座

### 3. `vercel-labs/agent-skills`

- 角色：`sample-library`
- 为什么入选：
  - 最适合作为高质量结构样板池
  - 既能看 `SKILL.md`，也能看 supporting files 的组织方式
- 应怎么用：
  - 用来学结构、学分层、学 progressive disclosure
  - 不单独承担 install / governance / evaluation

## 最值得先搭的 Baseline 组合

### 组合结论

- `vercel-labs/agent-skills`
- `vercel-labs/skills`
- `skill-forge`

### 组合语义

- `vercel-labs/agent-skills`
  - 负责结构样板与内容参考
- `vercel-labs/skills`
  - 负责 install / distribution / compatibility
- `skill-forge`
  - 负责 governance / publish / trust-oriented quality gate

### 为什么不是单对象

- `agent-skills` 强在样板，不强在治理。
- `skills` 强在安装与分发，不等于 trust / effectiveness。
- `skill-forge` 强在治理方向，但不该被误读成现成 install baseline。

## 使用时必须保留的纪律

### 1. Trust gate before install

- 把 skill 当 code-like asset 看待。
- 先读 `SKILL.md`、`scripts/`、关键 `references/`，再决定是否安装。

### 2. With / without evaluation

- 不能因为:
  - skill 好找
  - 有目录
  - 有下载量
  - 有 validation
  就默认它会改善真实任务。
- 至少保留代表性任务的 A/B 对照。

### 3. Version pinning and rollback

- 不把“最新 skill”默认视为“最好 skill”。
- 记录已验证版本，并保留回退路径。

### 4. Role-based bundling

- 不做“全量 skill 默认激活”。
- 优先按角色或任务包暴露 skills，降低 recall overload。

## 只在特定场景下追加的增强层

### `open-skills`

- 适合：
  - 本地 LLM
  - MCP
  - 自托管 runtime bridge
- 不适合：
  - 作为默认通用分发层替代品

### `Ai-Agent-Skills`

- 适合：
  - 团队 / 个人 curated library 管理
  - provenance-aware internal shelf
- 不适合：
  - 直接替代通用 installer / governance baseline

## Cross-Surface Baseline 结论

- 如果目标是跨 `Codex / GitHub / Claude` 迁移，最稳的写法是:
  - 先写 `portable core`
  - 再写 `surface appendix`
- `portable core` 优先保留:
  - `SKILL.md`
  - `name`
  - `description`
  - 正文核心 procedure
  - supporting files 的导航
- 不应默认当成 portable baseline 的对象包括:
  - `allowed-tools`
  - `agents/openai.yaml`
  - Claude richer frontmatter
  - plugin packaging
  - runtime-specific assumptions

## 最小可执行 Workflow

1. 从现成样板开始，不从空白文档起步。
2. 用 `portable core` 起草自己的 `SKILL.md` skeleton。
3. 为 surface-specific 扩展单独写 compatibility note。
4. 用 installer / manager 放进 project-scoped controlled trial。
5. install 之后立即走 trust gate。
6. 对代表性任务做 with / without evaluation。
7. 记录版本、通过版本与 rollback 路径。
8. 按 role / task bundle 暴露 skills，而不是全量激活。
9. 定期做 clone / quality / retirement 清理。

## 本轮最终交付语法

- 不给无语义总榜。
- 正式采用下面四段式写法：
  - `最值得先学的 3 个入口`
  - `最值得先搭的 baseline 组合`
  - `使用时必须保留的信任与评测纪律`
  - `只在特定场景下追加的增强层`

## 后续可选深化项

- 补 `GitHub / Claude / Codex` 的 field-by-field support matrix。
- 如果需要快速扫描视图，可额外补一份附录式单榜，但不应替代主推荐结构。
