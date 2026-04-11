# Trust Boundaries For Shared Skills

- `source_urls`:
  - `https://docs.github.com/en/copilot/how-tos/use-copilot-agents/cloud-agent/create-skills`
  - `https://vercel.com/kb/guide/agent-skills-creating-installing-and-sharing-reusable-agent-context`
  - `https://api.github.com/repos/vercel-labs/skills/commits?per_page=5`
- `source_type`: `cross-source-synthesis`
- `accessed_at`: `2026-04-11`
- `related_topic`: `03-ecosystem-signals-and-adoption`
- `trust_level`: `mixed-high`
- `why_it_matters`: `这份文档负责给 `03` 补上最重要的反身性判断: 现成 skill 的发现成本下降是真事，但安全边界同样是真事。`
- `claims_supported`:
  - 容易发现并不等于可以直接信任
  - skill 应按代码资产而不是按普通文本资源对待
  - 恶意 / 重复 / 权限越界问题已经有现实证据，不是抽象担忧

## 关键事实

- GitHub 官方文档明确警告: 只有在完全信任来源时，才应为第三方 skill 预批准 `shell` 或 `bash`，否则 prompt injection 或恶意 skill 可能触发任意命令执行。
- Vercel KB 明确建议:
  - `Treat skills like code`
  - `Read them before installing`
- `vercel-labs/skills` 在 `2026-04-06` 的提交 `Warn on openclaw due to number of duplicate and malicious skills (#865)`，说明目录与安装生态里已经出现需要主动防范的污染问题。

## 与本研究的关系

- 这份材料把用户最想要的高杠杆成长路径补完整了:
  - 借鉴别人 skill 非常有价值
  - 但价值来自样板、实验和迭代
  - 不是来自无审查地相信陌生脚本
- 对 `03` 来说，这意味着最终推荐不能只给“哪里好找”，还必须给“哪里可以放心先学、哪里只能拆开看、哪里不该直接装”。

## 风险与局限

- 当前证据足够证明风险真实存在，但还没有形成一份更系统的失败案例清单。
- 后续仍需要补更多独立事故样本，才能把信任分级做得更细。
