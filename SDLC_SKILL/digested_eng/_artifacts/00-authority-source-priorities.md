# eng Wave Step 1: 权威来源优先级清单（可复用）

目标：按主题给出“先抓什么、后抓什么”的来源优先级，避免后续探索靠感觉扩张而失控；并记录当前已经落库的权威来源覆盖情况。

> 说明：这不是“来源清单越长越好”，而是一个**停止无意义扩张**的控制面。后续发现更高质量来源时可增补，但必须说明“为什么它替代/增强了现有来源”。

## 01-scaffold（认知脚手架与逆向学习）

优先级（从高到低）：

- 学术研究（认知科学/教育技术/HCI/CS education/Empirical SE）：直接定义脚手架、参与方式、offloading、信任与理解风险，并提供可检验的机制与实验范式。
- 工具官方机制文档：skills 的载体与交互机制（progressive disclosure、invocation、manual-only 等），用于把机制落到可验证实现。
- 高质量企业研究/白皮书/工程复盘（非营销）：真实工程场景里“理解/审查/负荷/返工”的证据。
- 社区反馈：用于捕捉争议、失败模式与反例信号（证据强度较低，必须与更高层证据并列）。

已落库的代表性来源（示例）：

- 学术：`reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`, `reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`, `reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`, `reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 直接 SE 场景实验：`reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`, `reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`
- 直接 SE 场景负结果/边界：`reference_eng/01-scaffold-qiao-et-al-comprehension-performance-gap-brownfield-arxiv-2511-02922.md`
- 企业 field study（体验/负荷）：`reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
- 官方机制：`reference_eng/01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md`
- 社区反例信号：`reference_eng/01-scaffold-community-experienceddevs-copilot-focus-disruption.md`

## 02-tier（难度分层与能力训练矩阵）

优先级（从高到低）：

- 软件工程/编程认知的专家差异实证（debugging/comprehension/review）：直接支撑“Tier 2 训练靶点”。
- 学习科学理论（deliberate practice、desirable difficulties）与编程教育落地障碍：用于把训练矩阵做成“可持续反馈闭环”，而不是能力名词表。
- 组织/团队层的能力评估理论与指标：用于避免“经验 = 专业度”的误判。

已落库的代表性来源（示例）：

- 专家差异实证：`reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`, `reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
- 可测 proxy / 注意力路线：`reference_eng/02-tier-bergersen-et-al-inferring-programming-skill-time-quality-esem-2011.md`, `reference_eng/02-tier-al-madi-et-al-longitudinal-eye-tracking-token-effects-icpc-2021.md`, `reference_eng/02-tier-kuang-et-al-gazeprinter-expert-gaze-guide-novices-arxiv-2603-19855.md`
- 学习机制：`reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`, `reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
- SE expertise 理论：`reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`

## 03-devlife（开发生命周期与工具生态）

优先级（从高到低）：

- 官方文档/官方仓库：skills 的格式、触发边界、存储、分发、版本、更新机制（可验证实现）。
- 官方评测框架与工程原语（evals/registry/CI）：把“稳态维护”工程化。
- 独立学术研究与企业 field study：验证工具对效率、负荷、可维护性等工程结果的影响；用于纠正“只看快”的偏差。
- 行业实践复盘：任务分类、underperforming 场景、迁移成本与失败模式（必须标注证据强度）。

已落库的代表性来源（示例）：

- 官方机制：`reference_eng/03-devlife-windsurf-cascade-skills-docs.md`, `reference_eng/03-devlife-windsurf-workflows-manual-only.md`, `reference_eng/03-devlife-vercel-skills-lock-files.md`, `reference_eng/03-devlife-vercel-skills-update-system.md`
- eval 原语：`reference_eng/03-devlife-openai-evals-readme.md`
- 学术/企业研究：`reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`, `reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
- 行业实践：`reference_eng/03-devlife-pandey-singh-wei-shankar-copilot-real-world-projects-arxiv-2406-17910.md`

## 04-path（跃迁路径、团队采纳与治理）

优先级（从高到低）：

- 平台/工具官方治理控制面：指令资产、权限模型、策略、pilot playbook、限制清单（可执行）。
- 安全/质量工程框架：风险分类与治理基线（供给链、注入、过度代理、审计等）。
- 真实组织的采纳与度量研究（纵向/混合方法）：用于识别选择偏差、指标失真与采纳阻力。
- 企业工程博客/开源组织实践：把控制面组合成 SOP（版本、审计、回滚、责任边界）。

已落库的代表性来源（示例）：

- 官方治理：`reference_eng/04-path-github-copilot-repo-custom-instructions.md`, `reference_eng/04-path-github-copilot-cli-tool-permissions.md`, `reference_eng/04-path-github-copilot-cloud-agent-pilot-guide.md`
- prompt 资产治理实证（大规模）：`reference_eng/04-path-li-et-al-understanding-prompt-management-github-repos-arxiv-2509-12421.md`
- 风险框架：`reference_eng/04-path-owasp-top-10-llm-apps-v1-1.md`
- 组织采纳纵向：`reference_eng/04-path-stray-brandtzaeg-wivestad-et-al-copilot-longitudinal-case-study-arxiv-2509-20353.md`
