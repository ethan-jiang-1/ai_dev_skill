# Wave 2 Cross-Topic Synthesis (eng)

目标：把 4 条研究线收回来做横向综合，明确哪些是硬事实、哪些是分析判断、哪些是趋势推测，并且每条都能回指 `reference_eng/*.md`。

## Shared Vocabulary (Must Be Consistent)

为了让最终报告跨章节不打架，本轮统一采用以下术语口径（并标注“最接近的 ground truth 定义/机制来源”）：

- Skill（在 eng 语境）：一种可版本化、可触发、可治理的“上下文与过程资产”，其目标是稳定复现某类工程决策与执行路径（不仅是单次 prompt）。
  - 工具侧机制事实（skills 作为工件/按需加载/治理）：`reference_eng/03-devlife-claude-what-are-skills.md`, `reference_eng/03-devlife-windsurf-cascade-skills-docs.md`
- 认知脚手架（scaffolding）：在学习者仍不熟练时，外部结构（步骤、检查点、提示、反馈）帮助其完成任务并逐步内化；与“最小指导”相对。
  - 邻近机制证据：`reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
- 认知卸载（cognitive offloading）：把认知负担（记忆/计算/检索等）转移到环境中（工具/外部线索/记录），从而改变认知过程。
  - 定义与综述：`reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
- belief offloading：LLM 场景下更进一步的卸载风险，不仅卸载计算，还卸载“信念形成/判断”。
  - 分类与边界：`reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 参与方式（engagement）：学习效果与“学习者做了什么心智动作”强相关；ICAP 把参与方式分层（P/A/C/I）。
  - 框架：`reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
- tutoring moves：把“如何引导学习者外显推理”拆成可操作的对话/教学动作（提问、要求解释、提示、反馈等）。
  - 分类：`reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`
- progressive disclosure（渐进式加载）：先加载轻量 metadata，再按需加载 skill body/附件，避免一次性全量注入导致的信息过载。
  - 工程机制事实：`reference_eng/01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md`
- Tier（难度分层，在 eng 语境）：不是按文本复杂度，而是按“使用者必须具备的心智动作与治理责任”分层。
  - 专家差异维度与阶段框架：`reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`, `reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`, `reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
- deliberate practice / desirable difficulties：专家来自长期、目标明确、带反馈的练习；短期表现与长期学习可能相悖，学习需要“恰当摩擦”。
  - 机制证据：`reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`, `reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
- 治理控制面（governance control surface）：组织可执行的机制集合（指令资产、权限、策略、试点流程、审计入口）。
  - GitHub Copilot 治理原语：`reference_eng/04-path-github-copilot-repo-custom-instructions.md`, `reference_eng/04-path-github-copilot-cli-tool-permissions.md`, `reference_eng/04-path-github-copilot-policies-concepts.md`
- Evals：把 agent/skill 输出质量变成可回归的工程指标与测试资产，使其进入稳态可维护状态。
  - 工具侧事实：`reference_eng/03-devlife-openai-evals-readme.md`

## Cross-Topic Claims → Evidence Pointers

### 1) “认知脚手架”主张的当前实证强度评估（必须诚实分级）

- 硬事实：GenAI 编码助手会改变参与方式（更快、更少手写/检索），并可能带来“不理解为何有效”的风险信号。
  - `reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
- 机制支持（邻近证据）：对新手而言，“明确指导/结构化步骤”通常比“最小指导”更有利于学习；学习收益与 Constructive/Interactive 参与方式相关。
  - `reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
  - `reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
  - `reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`
- 风险机制（可强说）：offloading/belief offloading 提供了“为何更自动化可能降低理解/判断参与”的理论框架。
  - `reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
  - `reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 结论形态（按 Claim Strength Policy）：目前更可靠的表述是
  - “Skill 可以被设计为脚手架”（可解释机制、可给出设计语言与风险边界）
  - “Skill 必然提升长期能力”仍缺直接 SE 实证，需降级为条件性判断并标注缺口

### 2) “难度分层”与“脚手架设计”在机制上是同一件事：控制摩擦与心智动作

- 专家差异在 SE 任务中可观察（调试 chunking/system view、理解 top-down inference/multiple guidance），这为 Tier 2 的训练目标提供了具体靶点。
  - `reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`
  - `reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
- 学习理论提醒：短期效率提升不等于长期学习（desirable difficulties），因此“更自动化”不等于“更利于成长”。
  - `reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
- 推论（需要在报告中标注为分析判断）：Skill 的“好坏”应按 tier 匹配：
  - Tier 1 允许更多自动化（降低门槛）
  - Tier 2 必须保留关键心智动作（解释/反证/审查/证据链），否则更可能退化为 offloading

### 3) 生命周期与治理的交叉：没有 Evals 与分发机制，就没有团队级 Skill

- 工具侧硬事实：evals-as-code（可管理、可运行）与 skills 分发/锁定/更新机制（lockfile、update check）在生态中已经出现。
  - `reference_eng/03-devlife-openai-evals-readme.md`
  - `reference_eng/03-devlife-vercel-skills-lock-files.md`
  - `reference_eng/03-devlife-vercel-skills-update-system.md`
- 治理硬事实：组织可执行的控制面存在（repo instructions、权限模型、策略、pilot playbook）。
  - `reference_eng/04-path-github-copilot-repo-custom-instructions.md`
  - `reference_eng/04-path-github-copilot-cli-tool-permissions.md`
  - `reference_eng/04-path-github-copilot-cloud-agent-pilot-guide.md`
- 推论（分析判断）：团队级 Skill 资产化的最低闭环应是：
  - 版本化与分发（可复现安装态）
  - Evals 回归（防止 drift）
  - 权限与指令治理（最小权限 + 审计）

### 4) 工具选择对学习路径的影响：目前证据多为“机制事实 + 弱实证信号”

- 弱实证信号：自动化/建议生成可能带来理解担忧与参与方式变化（学生实验 + 社区反馈）。
  - `reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
  - `reference_eng/01-scaffold-community-experienceddevs-copilot-focus-disruption.md`
- 机制事实：不同工具对 skills/workflows 的触发边界不同（例如 workflows manual-only），属于“显式授权”路线的硬证据。
  - `reference_eng/03-devlife-windsurf-workflows-manual-only.md`
- 结论形态：在缺少更强对照研究前，应把“工具选择影响学习收益”表述为
  - “机制上存在差异，且存在风险信号”
  - “净影响取决于场景与 Skill 设计（尤其是是否强制 Constructive/Interactive 参与）”

## Open Gaps (Blockers to Report Readiness)

### 最高优先级缺口（不补就必须在报告里降级）

- “Skill 作为脚手架带来长期能力提升”的直接 SE 实证（对照实验/纵向跟踪）仍不足。
  - 目前可用的直接 SE 邻近实验主要是 Copilot 对学生 brownfield 任务影响。
  - `reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
- “四阶段跃迁路径”的真实案例与样本矩阵仍缺少一手复盘（企业工程博客/开源项目的长期迭代证据）。

### 次优先级缺口（补了会显著增强报告说服力）

- “工具选择（显式控制 vs 隐式自动化）对学习与长期能力”的对照研究或高质量用户研究。
- “Evals 失败模式”与“稳态维护成本模型”的公开实践总结（从框架到方法论）。

## Report Readiness Check (Self-Audit)

> 目标不是“宣称都解决了”，而是可检查地回答：哪些已满足、哪些只能降级表述、哪些需要下一轮补证。

1. 任意抽取一个核心判断，30 秒内能找到 `reference_eng` 支撑文档
   - 当前状态：基本满足。`digested_eng/*.md` 的二轮新增内容以 `ref:` 回指 `reference_eng/*.md`；入口索引在 `reference_eng/_INDEX.md`。
2. 对 4 个主题各自能写出“主张 + 证据 + 局限”的连贯段落，不需要临时补搜
   - 当前状态：满足到“可写”水平，但仍存在必须降级的主张（例如“长期能力提升”的直接实证不足）。
3. 能写出“工程师 Skill 掌握路径整体图景”的综合判断，不只是平行描述
   - 当前状态：基本满足。横向综合落盘在本文件的 Cross-Topic Claims，且每条带回指。
4. 没有参与调研的专业人士，只看 `digested_eng + reference_eng`，能理解结论并继续深入
   - 当前状态：部分满足。机制与控制面较清晰；但“真实企业案例/长期学习实证”类缺口仍会影响读者信心，需要在报告里显式标注证据强度与缺口，并给出后续追踪清单。
