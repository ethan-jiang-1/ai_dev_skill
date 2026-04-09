# 01-scaffold Question List (Progressive)

目标：持续维护待验证问题清单，确保探索宽度增长但不失控；每个问题最终都应有 `reference_eng/*.md` 回答或标注“缺口”。

## Open Questions

### P0（必须补或必须降级表述）

- “Skill 作为认知脚手架能提升工程师长期能力”是否存在直接实证？
  - 当前状态：暂无直接针对“Skill”体系的长期能力提升实证；目前已有更接近真实工程环境的 Copilot 专业开发者研究（效率/负荷/下游可维护性），但仍不等价于“结构化 Skill 作为脚手架”的学习收益实证。
  - 已有证据：
    - `reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
    - `reference_eng/01-scaffold-qiao-et-al-comprehension-performance-gap-brownfield-arxiv-2511-02922.md`
    - `reference_eng/01-scaffold-vaithilingam-zhang-glassman-expectation-vs-experience-copilot-chi22.md`
    - `reference_eng/01-scaffold-prather-et-al-novice-copilot-interactions-arxiv-2304-02491.md`
    - `reference_eng/03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md`
    - `reference_eng/03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md`
  - 缺口：对“结构化 Skill（强制解释/自检/评审）”相对“自动补全/一键生成”的对照研究；对象最好是专业工程师或至少高阶学生；指标包含理解与迁移，不止速度。
  - 什么证据能关闭：RCT 或准实验 + 明确任务集 + 迁移测验（debug/comprehension/spec quality）+ 延迟后测；或企业内训的可复核 A/B。
  - 下一步去哪找：ICER/TOCE/CHI/CSCW/Empirical SE/ICSE、arXiv cs.SE；关键词 “Copilot learning”, “AI-assisted programming education”, “metacognition”, “agency”, “offloading”.

- “逆向学习（先得结果再反推方法）”在软件工程场景的可验证机制是什么？
  - 当前状态：有邻近机制证据（self-explanation、tutoring moves、ICAP），但缺少对“读/改 Skill 规则”是否触发该机制的直接观测。
  - 已有证据（邻近）：
    - `reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
    - `reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`
    - `reference_eng/01-scaffold-llm-supported-self-explanation-calculus-arxiv-2604-00142.md`
  - 缺口：工程任务中“学习者是否回看规则、是否能解释其因果、是否形成可迁移的检查清单”的证据。
  - 什么证据能关闭：IDE/agent 日志分析（规则打开次数、修改次数、解释质量）；或研究设计把“是否提供可读规则/是否要求解释”作为因素。

### P1（强烈建议补充）

- 如何把“脚手架 vs 卸载”从口号变成可操作的 Skill 设计准则？
  - 当前状态：有理论/分类（minimal guidance、ICAP、offloading、belief offloading、tutoring moves），但尚未形成工程可执行 checklist。
  - 已有证据：
    - `reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
    - `reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
    - `reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
    - `reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
  - 缺口：把这些维度映射到 Skill 交互结构（哪些步骤必须人做，哪些允许自动化；哪些节点必须解释/反证/证据链）。
  - 什么证据能关闭：至少 3-5 个“高质量 Skill/规则仓库”的结构化剖析，抽取共性机制，并结合社区反例校验。

- “总是开着的自动补全会破坏专注”是普遍现象还是少数偏见？
  - 当前状态：仅有社区经验贴，缺乏系统调查或实验。
  - 已有证据：
    - `reference_eng/01-scaffold-community-experienceddevs-copilot-focus-disruption.md`
  - 缺口：更高质量的用户研究（样本、角色分层、任务类型、长期适应）。
  - 什么证据能关闭：问卷 + 日志 + 任务实验，区分新手/资深、任务性质（探索/维护/重构/调试）。

### P2（可延后，但会影响报告深度）

- progressive disclosure 机制对学习/理解是否有净收益？
  - 当前状态：我们有官方机制描述（如何加载），但缺少“对学习的影响”的实证。
  - 已有证据（机制事实）：
    - `reference_eng/01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md`
  - 缺口：对比“全量上下文一次性塞入” vs “按需加载”在输出质量、理解与错误率上的影响。
  - 什么证据能关闭：工具侧 A/B 或开源基准实验（相同任务集，不同加载策略）。
