# P0 Gap Search Log (eng)

目的：满足 `eng-二轮Deep-Research-progressive-plan.md` 的 Hard Gates 要求之一：对每个 P0 缺口留下“已尽力搜过”的可复核记录（包括检索路径、命中/未命中的结果），避免缺口只是“懒得找”。

更新时间：2026-04-09（Asia/Shanghai）

## P0-1： “Skill 作为脚手架带来长期能力提升”的直接 SE 实证

### 想要的证据形态（关闭缺口的标准）

- 直接针对“结构化 Skill/规则/协议”介入的对照研究（RCT 或准实验），指标包含理解/迁移/延迟后测，而非只看速度或自评。
- 或企业内训/长期试点的可复核数据：使用模式（Skill 协议、是否强制解释/审查/测试）与能力指标变化（comprehension/debugging/review rubrics）之间的关联。

### 检索路径（可复核）

检索关键词（示例，均已实际使用过组合检索）：

- `GitHub Copilot programming education learning outcomes controlled study`
- `LLM programming tutor study learning outcomes randomized controlled trial`
- `Copilot learning comprehension study brownfield`
- `AI-assisted programming education metacognition offloading`

优先渠道：

- arXiv `cs.SE` / `cs.HC`
- Empirical SE / ICPC / ICSE / CHI / CSCW / ICER（以标题/摘要为先筛）

### 命中并已落库的“最接近”证据（仍不足以关闭缺口）

- brownfield 场景对照实验（学生）：效率/过程改变 + 理解担忧信号，但没有把“长期能力提升”测成因果结论。
  - `../reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
- brownfield 复现实验：Copilot 显著提升 performance（时间/测试通过数），但 comprehension scores 无显著提升，出现 comprehension–performance gap（强边界证据）。
  - `../reference_eng/01-scaffold-qiao-et-al-comprehension-performance-gap-brownfield-arxiv-2511-02922.md`
- 可用性研究：偏好与效果可能分离；理解/编辑/调试困难显著（学习收益不能用“喜欢/省搜索”替代）。
  - `../reference_eng/01-scaffold-vaithilingam-zhang-glassman-expectation-vs-experience-copilot-chi22.md`
- 专业开发者 field study：交互类型/强度影响效率、准确率与负荷（对“参与方式会被塑形”提供过程证据，但不等价学习收益）。
  - `../reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
- 两阶段实验（Phase 2 RCT）：实现阶段提速，但下游 maintainability proxy 未见显著差异（提示“短期更快 ≠ 长期更好/更差”）。
  - `../reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`

### 当前结论（缺口状态）

- 目前找到的 SE 直接实证主要回答“效率/体验/负荷/可维护性 proxy”，并且出现了明确的 negative/limit 结果（comprehension–performance gap）。
- 仍缺少能把核心主张从“邻近证据/类比”升级到“研究显示 Skill 作为脚手架能提升长期能力”的直接因果实证。
- 因此在 `round2_eng` 与 `W2-cross-topic-synthesis` 中已将相关表述稳定化为“机制上可设计为脚手架，但净学习收益缺直接验证”的条件性结论（并列呈现负结果/边界）。

## P0-2： “从 Skill 使用者到 Skill 作者/治理者”的跃迁证据链

### 想要的证据形态（关闭缺口的标准）

- 至少 1-2 条可复核的“个人/团队跃迁”案例链条：
  - 有版本化的指令/Skill/prompt 资产演进痕迹（repo/版本/变更记录）。
  - 有治理 SOP（权限、review、灰度、回滚、审计）与度量口径（质量/风险/成本）。
  - 有失败模式复盘（而非只写收益）。

### 检索路径（可复核）

检索关键词（示例，均已实际使用过组合检索）：

- `prompt library governance versioning case study`
- `prompt management GitHub repositories best practices`
- `prompt registry prompt versioning evaluation governance`
- `team prompt library maintainability duplication`

优先渠道：

- arXiv `cs.SE`
- 企业工程博客（作为补充，只采纳可复核细节，不采纳纯营销）
- 工具官方文档（作为“控制面事实”，但不等价跃迁案例）

### 命中并已落库的“最接近”证据（仍不足以关闭缺口）

- 官方治理控制面（可执行事实）：repo instructions、权限模型、组织策略、pilot playbook、cloud agent workflow（说明“能怎么治理”，但不是“谁如何跃迁”的案例）。
  - `../reference_eng/04-path-github-copilot-repo-custom-instructions.md`
  - `../reference_eng/04-path-github-copilot-cli-tool-permissions.md`
  - `../reference_eng/04-path-github-copilot-policies-concepts.md`
  - `../reference_eng/04-path-github-copilot-cloud-agent-about.md`
  - `../reference_eng/04-path-github-copilot-cloud-agent-pilot-guide.md`
- prompt 资产治理的“问题面”实证（大规模）：GitHub 上 prompt 管理存在格式不一致、重复、可读性/拼写问题，并指出 prompts 与 GitHub 管理范式存在阻抗不匹配与 gatekeeping 缺失（说明“为什么治理会很难”，但不提供跃迁案例链条）。
  - `../reference_eng/04-path-li-et-al-understanding-prompt-management-github-repos-arxiv-2509-12421.md`
- 组织采纳与度量研究/案例：可回答“采纳如何试点与测量”，但仍不等价“从使用者到作者/治理者”的个人成长证据链。
  - `../reference_eng/04-path-stray-brandtzaeg-wivestad-et-al-copilot-longitudinal-case-study-arxiv-2509-20353.md`
  - `../reference_eng/04-path-zoominfo-copilot-deployment-productivity-arxiv-2501-13282.md`

### 当前结论（缺口状态）

- 证据已经足以支撑“团队治理控制面存在”与“prompt/Skill 资产维护确实很难，需要 QA/gatekeeping”的结论。
- 但“个人成长跃迁路径”的公开、一手、可复核案例链条仍不足，因此在 `round2_eng/04` 与 `W2-cross-topic-synthesis` 中已把该部分降级为“建议性框架/待验证”，并保留后续追踪清单。

