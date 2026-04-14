# 03-devlife Evidence Summary (Wave 1/2)

目标：把“Skill 开发生命周期与工具生态支持”的关键判断，压缩成可复用的 evidence map（每条都有 `../reference_eng/*.md` 回指）。

## Key Claims → Evidence Pointers

### A. “Skill 是工程对象”不是口号：生态里已存在可执行的工件与机制

- Skills 被定义为可治理的“能力资产”，并且支持按需加载、动态启用、范围/权限治理（Claude Skills 官方口径）。
  - `../reference_eng/03-devlife-claude-what-are-skills.md`
- Windsurf 对技能（skills）给出官方机制：invocation、scopes、渐进式加载与存储位置等，体现“可管理的上下文资产”。
  - `../reference_eng/03-devlife-windsurf-cascade-skills-docs.md`
- Windsurf 明确区分 workflows，并强制 workflows 只能手动触发（manual-only）。这是一条重要的治理边界：哪些自动化必须由人显式授权。
  - `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`

### B. 生命周期里最“硬”的环节是 Evals（持续迭代的闭环）

- OpenAI Evals 的官方仓库提供了 evals-as-code 的工程形态：可编写自定义 eval、在 registry 中管理、并通过 dashboard 运行。
  - `../reference_eng/03-devlife-openai-evals-readme.md`
- 这支撑一个强判断：Skill/agent 能否进入稳态，不靠“写得好”，而靠“能否被持续评测与回归”（否则只能一次性玩具）。
  - `../reference_eng/03-devlife-openai-evals-readme.md`

### C. 分发与稳态维护：lockfile 与 update 机制是关键“基础设施”

- Vercel 的 skills 机制展示了“可复现安装态”的 lock file（团队共享、确定性输出）。
  - `../reference_eng/03-devlife-vercel-skills-lock-files.md`
- Vercel 的 update system 体现了“版本/内容变化检测”的工程化手段：hash-based checks + remote update API。
  - `../reference_eng/03-devlife-vercel-skills-update-system.md`
- Vercel 的 source formats 与解析顺序属于底层事实：技能来源可以多样，但必须可确定解析与过滤。
  - `../reference_eng/03-devlife-vercel-skills-source-formats.md`

### D. 工具生态差异会塑造“学 Skill 的方式”（显式控制 vs 隐式自动化）

- 第三方对比（Cursor vs Windsurf）可作为弱证据提示：显式上下文控制与隐式自动索引会导致不同的用户心智负担与控制感。
  - `../reference_eng/03-devlife-cursor-vs-windsurf-blott-2025.md`
- 该条需要在最终报告中标注证据强度（practitioner/观点性），并优先用官方 docs 做机制事实兜底。
  - `../reference_eng/03-devlife-windsurf-cascade-skills-docs.md`

### E. 工具生态对“长期工程结果”的影响需要被评测：不仅是快

- 大样本、preregistered 的两阶段实验（Phase 2 RCT）显示：AI assistants 可显著加速 Phase 1 的实现，但在后续他人演进（completion time / code quality proxy）上未检测到显著差异；同时论文明确提出未来风险方向（code bloat、cognitive debt）。
  - `../reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`
- 企业自然工作环境的 mixed-method field study 表明：同一工具的不同交互类型/强度（in-code vs chat vs combined）会显著影响效率、准确率与工作负荷；“更强/更全程”的使用不一定更好。
  - `../reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
- 行业实践型证据（Cisco）提供了“任务分类 + 日志对照”的评估模板，并给出 underperforming 场景（multi-file、proprietary context、复杂任务、C/C++），适合支撑“落地难点与失败模式”章节（需标注证据强度）。
  - `../reference_eng/03-devlife-pandey-singh-wei-shankar-copilot-real-world-projects-arxiv-2406-17910.md`
- controlled experiment（Upwork 招募专业开发者，随机分组）显示：Copilot treatment 组在 JS HTTP server 任务上完成时间快 55.8%，且 control 组允许使用搜索/Stack Overflow；论文同时提供了可复用的评测工程脚手架（GitHub Classroom + test suite + 时间戳定义）。
  - `../reference_eng/03-devlife-peng-et-al-impact-ai-developer-productivity-copilot-arxiv-2302-06590.md`

### F. 开发者体验中的“信任校准”是硬约束：需要验证能力支撑

- 研究显示 trust 会随时间演化（1h vs 10 days 的对比），平均信任上升，但学习者仍认为工具需要 competent programmer 才能完成部分任务；并提出教学/管理建议强调 comprehension/debugging/testing（验证能力）来避免 over-trust 风险。
  - `../reference_eng/03-devlife-shah-et-al-evolution-programmers-trust-genai-assistants-arxiv-2509-13253.md`
