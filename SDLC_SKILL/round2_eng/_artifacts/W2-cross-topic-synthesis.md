# Wave 2 Cross-Topic Synthesis (eng)

目标：把 4 条研究线收回来做横向综合，明确哪些是硬事实、哪些是分析判断、哪些是趋势推测，并且每条都能回指 `../reference_eng/*.md`。

## Shared Vocabulary (Must Be Consistent)

为了让最终报告跨章节不打架，本轮统一采用以下术语口径（并标注“最接近的 ground truth 定义/机制来源”）：

- Skill（在 eng 语境）：一种可版本化、可触发、可治理的“上下文与过程资产”，其目标是稳定复现某类工程决策与执行路径（不仅是单次 prompt）。
  - 工具侧机制事实（skills 作为工件/按需加载/治理）：`../reference_eng/03-devlife-claude-what-are-skills.md`, `../reference_eng/03-devlife-windsurf-cascade-skills-docs.md`
- 认知脚手架（scaffolding）：在学习者仍不熟练时，外部结构（步骤、检查点、提示、反馈）帮助其完成任务并逐步内化；与“最小指导”相对。
  - 邻近机制证据：`../reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
- 认知卸载（cognitive offloading）：把认知负担（记忆/计算/检索等）转移到环境中（工具/外部线索/记录），从而改变认知过程。
  - 定义与综述：`../reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
- belief offloading：LLM 场景下更进一步的卸载风险，不仅卸载计算，还卸载“信念形成/判断”。
  - 分类与边界：`../reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 参与方式（engagement）：学习效果与“学习者做了什么心智动作”强相关；ICAP 把参与方式分层（P/A/C/I）。
  - 框架：`../reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
- tutoring moves：把“如何引导学习者外显推理”拆成可操作的对话/教学动作（提问、要求解释、提示、反馈等）。
  - 分类：`../reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`
- drifting / shepherding：新手在使用 Copilot 时的交互模式（被建议带偏/围绕建议来回修补），可作为“脚手架缺失/元认知困难”的可观测失败模式术语。
  - 一手来源：`../reference_eng/01-scaffold-prather-et-al-novice-copilot-interactions-arxiv-2304-02491.md`
- progressive disclosure（渐进式加载）：先加载轻量 metadata，再按需加载 skill body/附件，避免一次性全量注入导致的信息过载。
  - 工程机制事实：`../reference_eng/01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md`
- Tier（难度分层，在 eng 语境）：不是按文本复杂度，而是按“使用者必须具备的心智动作与治理责任”分层。
  - 专家差异维度与阶段框架：`../reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`, `../reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`, `../reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
  - 可测 proxy（用于训练/试点评估的可行路线）：`../reference_eng/02-tier-bergersen-et-al-inferring-programming-skill-time-quality-esem-2011.md`, `../reference_eng/02-tier-al-madi-et-al-longitudinal-eye-tracking-token-effects-icpc-2021.md`
- deliberate practice / desirable difficulties：专家来自长期、目标明确、带反馈的练习；短期表现与长期学习可能相悖，学习需要“恰当摩擦”。
  - 机制证据：`../reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`, `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
- 治理控制面（governance control surface）：组织可执行的机制集合（指令资产、权限、策略、试点流程、审计入口）。
  - GitHub Copilot 治理原语：`../reference_eng/04-path-github-copilot-repo-custom-instructions.md`, `../reference_eng/04-path-github-copilot-cli-tool-permissions.md`, `../reference_eng/04-path-github-copilot-policies-concepts.md`
- acceptance rate / persistence / completion funnel：用于度量 AI code completion 工具贡献的 telemetry 语言（shown→accepted→persisted 等），但指标含义与误用风险需要显式标注。
  - 一手来源：`../reference_eng/04-path-ziegler-kalliamvakou-et-al-productivity-assessment-neural-code-completion-arxiv-2205-06537.md`
- Evals：把 agent/skill 输出质量变成可回归的工程指标与测试资产，使其进入稳态可维护状态。
  - 工具侧事实：`../reference_eng/03-devlife-openai-evals-readme.md`

## Cross-Topic Claims → Evidence Pointers

### 1) “认知脚手架”主张的当前实证强度评估（必须诚实分级）

- 硬事实：GenAI 编码助手会改变参与方式（更快、更少手写/检索），并可能带来“不理解为何有效”的风险信号；在新手研究中还观察到 drifting/shepherding 等交互模式与元认知困难；在专业开发者研究中也能观察到交互类型/强度对效率、准确率与工作负荷的影响。
  - `../reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
  - `../reference_eng/01-scaffold-prather-et-al-novice-copilot-interactions-arxiv-2304-02491.md`
  - `../reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
- 负结果/边界（直接 SE 实证）：在 brownfield 复现实验中，Copilot 能显著提升 performance（时间/测试通过数），但 comprehension scores 无显著提升，揭示 comprehension–performance gap（“更能完成”不等于“更理解”）。
  - `../reference_eng/01-scaffold-qiao-et-al-comprehension-performance-gap-brownfield-arxiv-2511-02922.md`
- 机制支持（邻近证据）：对新手而言，“明确指导/结构化步骤”通常比“最小指导”更有利于学习；学习收益与 Constructive/Interactive 参与方式相关。
  - `../reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
  - `../reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
  - `../reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`
- 风险机制（可强说）：offloading/belief offloading 提供了“为何更自动化可能降低理解/判断参与”的理论框架。
  - `../reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
  - `../reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 工具可用性摩擦（直接证据）：即便用户偏好 Copilot（减少搜索、提供起点），理解/编辑/调试生成代码的困难仍可能显著削弱有效性，提示“脚手架缺失”主要发生在 verification/repair 环节。
  - `../reference_eng/01-scaffold-vaithilingam-zhang-glassman-expectation-vs-experience-copilot-chi22.md`
- 工程后果（直接 SE 实证）：大样本两阶段实验在下游可维护性 proxy 上未检测到系统性差异，但明确提出需要关注 code bloat 与 cognitive debt（作为未来风险方向），提醒“速度提升”不应被等价成“长期更好/更差”。
  - `../reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`
- 结论形态（按 Claim Strength Policy）：目前更可靠的表述是
  - “Skill 可以被设计为脚手架”（可解释机制、可给出设计语言与风险边界）
  - “Skill 必然提升长期能力”仍缺直接 SE 实证，需降级为条件性判断并标注缺口

### 2) “难度分层”与“脚手架设计”在机制上是同一件事：控制摩擦与心智动作

- 专家差异在 SE 任务中可观察（调试 chunking/system view、理解 top-down inference/multiple guidance），这为 Tier 2 的训练目标提供了具体靶点。
  - `../reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`
  - `../reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
- 学习理论提醒：短期效率提升不等于长期学习（desirable difficulties），因此“更自动化”不等于“更利于成长”。
  - `../reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
- 推论（需要在报告中标注为分析判断）：Skill 的“好坏”应按 tier 匹配：
  - Tier 1 允许更多自动化（降低门槛）
  - Tier 2 必须保留关键心智动作（解释/反证/审查/证据链），否则更可能退化为 offloading

### 3) 生命周期与治理的交叉：没有 Evals 与分发机制，就没有团队级 Skill

- 工具侧硬事实：evals-as-code（可管理、可运行）与 skills 分发/锁定/更新机制（lockfile、update check）在生态中已经出现。
  - `../reference_eng/03-devlife-openai-evals-readme.md`
  - `../reference_eng/03-devlife-vercel-skills-lock-files.md`
  - `../reference_eng/03-devlife-vercel-skills-update-system.md`
- 治理硬事实：组织可执行的控制面存在（repo instructions、权限模型、策略、pilot playbook）。
  - `../reference_eng/04-path-github-copilot-repo-custom-instructions.md`
  - `../reference_eng/04-path-github-copilot-cli-tool-permissions.md`
  - `../reference_eng/04-path-github-copilot-cloud-agent-pilot-guide.md`
- 推论（分析判断）：团队级 Skill 资产化的最低闭环应是：
  - 版本化与分发（可复现安装态）
  - Evals 回归（防止 drift）
  - 权限与指令治理（最小权限 + 审计）

### 4) 工具选择对学习路径的影响：目前证据多为“机制事实 + 弱实证信号”

- 弱实证信号：自动化/建议生成可能带来理解担忧与参与方式变化（学生实验 + 社区反馈）。
  - `../reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
  - `../reference_eng/01-scaffold-community-experienceddevs-copilot-focus-disruption.md`
- 新手研究进一步给出交互层失败模式（drifting/shepherding），提示“工具建议”会塑形问题解决路径，且可能放大元认知困难（不等价学习收益结论）。
  - `../reference_eng/01-scaffold-prather-et-al-novice-copilot-interactions-arxiv-2304-02491.md`
- 可用性研究表明“偏好”与“效果”可能分离：Copilot 常被视为起点与省搜索，但理解/编辑/调试困难会阻碍任务解决，强调需要把修复/验证脚手架设计进技能协议。
  - `../reference_eng/01-scaffold-vaithilingam-zhang-glassman-expectation-vs-experience-copilot-chi22.md`
- 过程性脚手架可能先改变“路径/注意力”，而不一定立刻显著改善“时间/得分/负荷”：GazePrinter 的 controlled experiment 显示 expert gaze 可视化能显著塑形 novices 在新 codebase 中的阅读路径，但 time/performance/NASA-TLX 指标未见显著差异（弱迹象）。这强化了“学习/能力变化与短期表现可分离”的边界描述。
  - `../reference_eng/02-tier-kuang-et-al-gazeprinter-expert-gaze-guide-novices-arxiv-2603-19855.md`
- 更强的过程证据（专业开发者研究）：交互类型与使用强度会改变效率/准确率/工作负荷，“combined/excessive use”不一定更好，提示工具与交互形态确实会塑造参与方式（但仍不等价“学习收益”结论）。
  - `../reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
- 机制事实：不同工具对 skills/workflows 的触发边界不同（例如 workflows manual-only），属于“显式授权”路线的硬证据。
  - `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`
- 结论形态：在缺少更强对照研究前，应把“工具选择影响学习收益”表述为
  - “机制上存在差异，且存在风险信号”
  - “净影响取决于场景与 Skill 设计（尤其是是否强制 Constructive/Interactive 参与）”

### 5) 采纳与治理的“硬骨头”是度量与归因：指标会诱导行为

- 纵向组织研究显示：Copilot users 在采用前就更活跃（选择偏差风险），且 adoption 后 commit-based activity 指标未必显著变化，提示“用单一活动指标评估采纳成效”会误判。
  - `../reference_eng/04-path-stray-brandtzaeg-wivestad-et-al-copilot-longitudinal-case-study-arxiv-2509-20353.md`
- GitHub case study 显示：acceptance rate 更能驱动 perceived productivity，并定义了 completion funnel 等 telemetry 语言；这解释了为什么行业容易把 acceptance 当 KPI，但也必须明确它的边界与误用风险。
  - `../reference_eng/04-path-ziegler-kalliamvakou-et-al-productivity-assessment-neural-code-completion-arxiv-2205-06537.md`
- 企业 rollout 案例（Zoominfo）表明：采纳路径正在走向工程化（四阶段 rollout、acceptance+满意度等组合指标）；但这些指标仍需与质量/风险/维护性对齐，否则 KPI 可能诱导“更多接受而非更好结果”。
  - `../reference_eng/04-path-zoominfo-copilot-deployment-productivity-arxiv-2501-13282.md`
- 行业报告（Sea Change）强化了 acceptance-rate-as-impact 的叙事惯性，可用来提醒读者：趋势信号与因果实证是两种不同证据，不应混用。
  - `../reference_eng/04-path-sea-change-ai-powered-developer-lifecycle-arxiv-2306-15033.md`
- 指令/Prompt 资产治理的现实约束：大规模 prompt 管理研究显示在 GitHub 仓库中普遍存在格式不一致、重复与可读性问题，并指出 prompts 与 Git 的管理范式存在阻抗不匹配且缺少 prompt QA gatekeeping。这意味着治理不仅是“权限/政策”，还需要“资产质量工程”（规范、lint、去重、review、eval/回归）。
  - `../reference_eng/04-path-li-et-al-understanding-prompt-management-github-repos-arxiv-2509-12421.md`

## Open Gaps (Blockers to Report Readiness)

补充：P0 缺口的检索记录与命中/未命中的可复核路径见 `round2_eng/_artifacts/P0-gap-search-log.md`。

### 最高优先级缺口（不补就必须在报告里降级）

- “Skill 作为脚手架带来长期能力提升”的直接 SE 实证（对照实验/纵向跟踪）仍不足。
  - 目前已有 Copilot 的学生实验与专业开发者研究、以及下游可维护性实验，但它们仍然主要回答“效率/体验/可维护性 proxy”，而不是“结构化 Skill 脚手架导致能力内化”的长期学习因果。
  - `../reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
  - `../reference_eng/01-scaffold-qiao-et-al-comprehension-performance-gap-brownfield-arxiv-2511-02922.md`
  - `../reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
  - `../reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`
- “四阶段跃迁路径”的真实案例与样本矩阵仍缺少一手复盘（企业工程博客/开源项目的长期迭代证据）。
  - 目前已有“组织采纳/体验/效率”的真实案例与研究（NAV IT 纵向、SAP field study、Cisco 实践评估），但它们并未直接给出“从 Skill 使用者到 Skill 作者/治理者”的跃迁证据链。
  - `../reference_eng/04-path-stray-brandtzaeg-wivestad-et-al-copilot-longitudinal-case-study-arxiv-2509-20353.md`
  - `../reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
  - `../reference_eng/03-devlife-pandey-singh-wei-shankar-copilot-real-world-projects-arxiv-2406-17910.md`

### 次优先级缺口（补了会显著增强报告说服力）

- “工具选择（显式控制 vs 隐式自动化）对学习与长期能力”的对照研究或高质量用户研究。
- “Evals 失败模式”与“稳态维护成本模型”的公开实践总结（从框架到方法论）。

## Report Readiness Check (Self-Audit)

> 目标不是“宣称都解决了”，而是可检查地回答：哪些已满足、哪些只能降级表述、哪些需要下一轮补证。

1. 任意抽取一个核心判断，30 秒内能找到 `reference_eng` 支撑文档
   - 当前状态：基本满足。`round2_eng/*.md` 的二轮新增内容以 `ref:` 回指 `../reference_eng/*.md`；入口索引在 `../reference_eng/_INDEX.md`。
2. 对 4 个主题各自能写出“主张 + 证据 + 局限”的连贯段落，不需要临时补搜
   - 当前状态：满足到“可写”水平，但仍存在必须降级的主张（例如“长期能力提升”的直接实证不足）。
3. 能写出“工程师 Skill 掌握路径整体图景”的综合判断，不只是平行描述
   - 当前状态：基本满足。横向综合落盘在本文件的 Cross-Topic Claims，且每条带回指。
4. 没有参与调研的专业人士，只看 `round2_eng + reference_eng`，能理解结论并继续深入
   - 当前状态：部分满足。机制与控制面较清晰；但“真实企业案例/长期学习实证”类缺口仍会影响读者信心，需要在报告里显式标注证据强度与缺口，并给出后续追踪清单。
