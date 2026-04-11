# npm `skills` CLI Adoption Signal

- `source_urls`:
  - `https://registry.npmjs.org/skills/latest`
  - `https://api.npmjs.org/downloads/point/last-month/skills`
- `source_type`: `registry-and-download-metric`
- `accessed_at`: `2026-04-11`
- `related_topic`: `03-ecosystem-signals-and-adoption`
- `trust_level`: `platform-data`
- `why_it_matters`: `这条材料把生态热度从 README 和 star 进一步推进到“真实安装分发通道是否被大量调用”的层面。`
- `claims_supported`:
  - `skills` 确实是当前 open agent skills 生态使用的 npm CLI 包
  - 该 CLI 明确绑定 `vercel-labs/skills` 仓库
  - 分发层已经表现出显著调用量

## 关键事实

- npm registry 的 `latest` 元数据表明:
  - 包名为 `skills`
  - 当前版本为 `1.4.9`
  - 描述为 `The open agent skills ecosystem`
  - `bin` 同时提供 `skills` 与 `add-skill`
  - `repository` 指向 `https://github.com/vercel-labs/skills.git`
- 包关键词同时覆盖 `codex`、`claude-code`、`cursor`、`github-copilot` 等多 agent 生态对象。
- npm downloads API 显示，这个包在 `2026-03-11` 到 `2026-04-09` 的最近一个月下载量为 `2879420`。

## 与本研究的关系

- 这说明生态不只是“有站点可看”，而是真的有一个被频繁调用的安装 / 分发入口。
- 对 `03` 来说，这是一条非常有力的采用信号，因为它比 star 更接近实际工具触达。
- 这也进一步支持用户关心的成长命题: 找现成 skill、拉下来装、继续实验，已经是现实工作流，而不是概念演示。

## 风险与局限

- 下载量是包级信号，不等于独立活跃用户数，也不等于每次下载都导向成功采用。
- 包级下载量也不自动说明每个被安装的 skill 都值得信任。
