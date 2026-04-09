# 03-devlife Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_eng/*.md` 回答或标注“缺口”。

## Open Questions

### P0（决定生命周期是否可复用为“工程方法学”）

- “Skill 开发生命周期（Discovery→Build→Evals→Deploy）”有没有足够多的真实案例可复核？
  - 当前状态：我们有官方机制与工具原语（skills、lockfile、update、evals），但缺少“从 0 到稳态”的公开复盘案例。
  - 已有证据（工具原语）：
    - `reference_eng/03-devlife-openai-evals-readme.md`
    - `reference_eng/03-devlife-vercel-skills-lock-files.md`
    - `reference_eng/03-devlife-vercel-skills-update-system.md`
  - 缺口：至少 2-3 个“连续迭代半年以上”的 skill/agent 项目复盘（失败模式、回归机制、版本策略）。
  - 什么证据能关闭：企业工程博客/开源仓库的 release notes + eval 历史 + 事故/回归记录；或 conference talk 的细节纪要。

- Evals 设计为什么难？常见失败模式是什么？
  - 当前状态：有 evals-as-code 框架，但“什么叫好 eval”仍缺经验性归纳。
  - 已有证据（框架事实）：
    - `reference_eng/03-devlife-openai-evals-readme.md`
  - 缺口：实践侧 failure modes（过拟合、指标漂移、数据泄漏、prompt leakage、评测成本爆炸、不可复现）。
  - 什么证据能关闭：至少 5 个公开的 eval 设计复盘或论文（含方法、局限、迭代过程）。

### P1（决定生态支持强度）

- “Skills 的分发与更新”在不同生态是否存在共同抽象？
  - 当前状态：Vercel 给出 lockfile + update check 的硬机制，但是否是行业通用还未知。
  - 已有证据：
    - `reference_eng/03-devlife-vercel-skills-lock-files.md`
    - `reference_eng/03-devlife-vercel-skills-update-system.md`
    - `reference_eng/03-devlife-vercel-skills-source-formats.md`
  - 缺口：其他生态（例如 Cursor/Windsurf/Claude）在版本 pinning、依赖、回滚、兼容性方面的等价机制。
  - 什么证据能关闭：官方 docs 或仓库层面的版本策略说明（最好是 schema/lockfile/manifest 级别）。

- “Workflows 必须手动触发”这类边界在其他工具是否也存在？
  - 当前状态：Windsurf 官方明确 workflows manual-only，但它是否代表行业趋势（显式授权、降低误触发）需要更多对照。
  - 已有证据：
    - `reference_eng/03-devlife-windsurf-workflows-manual-only.md`
  - 缺口：其他工具的同类机制（例如哪些动作必须 explicit consent、哪些可自动化）。

### P2（影响“工具选择如何塑造学习路径”的证据强度）

- Cursor（显式控制）vs Windsurf（隐式自动化）对学习收益的净影响有无实证？
  - 当前状态：目前只有第三方观点与官方机制描述，缺少用户研究/实验。
  - 已有证据（弱）：
    - `reference_eng/03-devlife-cursor-vs-windsurf-blott-2025.md`
  - 缺口：真实使用数据（任务类型分层、错误率、理解/迁移测验），或对照实验。
