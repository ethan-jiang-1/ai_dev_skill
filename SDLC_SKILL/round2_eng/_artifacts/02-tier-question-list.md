# 02-tier Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_eng/*.md` 回答或标注“缺口”。

## Open Questions

### P0（决定分层口径是否可落地）

- “如何判断一个 Skill 属于哪一层”有没有可执行判定标准？
  - 当前状态：第一轮更多是逻辑推演；二轮已有“以心智动作定义分层”的方向，但仍缺可操作 checklist。
  - 参考证据（能力差异维度）：
    - `reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`
    - `reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
    - `reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`
    - `reference_eng/02-tier-al-madi-et-al-longitudinal-eye-tracking-token-effects-icpc-2021.md`（comprehension 的过程性 proxy：token-level eye movement）
  - 缺口：把“需要的心智动作”映射到 Skill 设计特征（是否要求解释/反证/测试/上下文选择/风险评估/治理与版本）。
  - 什么证据能关闭：从 20-50 个真实 Skill/规则仓库抽取特征，做聚类并与“使用门槛/失败模式”对照；或形成企业内部分级标准并在 pilot 中验证。

- “哪些能力是前置条件，哪些能力会被 Skill 反向训练出来”有无实证？
  - 当前状态：目前更多基于学习理论与专家差异推断；缺少直接跟踪“用 Skill 一段时间后哪些能力提升”的证据。
  - 参考证据（训练逻辑）：
    - `reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`
    - `reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
    - `reference_eng/02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md`
    - `reference_eng/02-tier-bergersen-et-al-inferring-programming-skill-time-quality-esem-2011.md`（提供“能力变化如何测”的任务化思路，但不等于已验证“Skill 训练有效”）
  - 缺口：纵向研究或企业内训数据，能把“使用模式”与“能力指标变化”关联起来。

### P1（影响训练矩阵的可测性）

- Tier 2 的训练指标如何定义才不会落回“写得更快/生成更多”？
  - 现有证据提示应关注：system view、chunking、top-down inference、multiple guidance、调试证据链。
    - `reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`
    - `reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
    - `reference_eng/02-tier-kuang-et-al-gazeprinter-expert-gaze-guide-novices-arxiv-2603-19855.md`（阅读路径/注意力分配的可测指标：DTW distance 等）
  - 缺口：把这些能力转成可测 rubrics（例如：问题定位路径质量、证据记录质量、误用 AI 后的纠错速度、审查缺陷发现率）。

- “desirable difficulties” 在企业场景如何落地？
  - 当前状态：学习收益需要一定难度与延迟反馈，但企业又要求效率；二者冲突怎么解？
  - 参考证据：
    - `reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
  - 缺口：需要一个可操作的“摩擦预算”概念：哪些步骤必须保留（解释/评审/测试），哪些可以自动化。

### P2（对报告深度有帮助但可延后）

- “经验 ≠ 专业度”在 Skill 体系里如何应对？
  - 当前状态：已有 SE expertise 理论提醒（自评偏差、情境差异），但缺少工程治理层的对策。
  - 参考证据：
    - `reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`
  - 缺口：把 evals/代码评审/事故复盘等反馈机制与 Skill 训练矩阵系统性绑定的案例或研究。
