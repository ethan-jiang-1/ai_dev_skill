# 02-tier Evidence Summary (Wave 1/2)

目标：把“Skill 难度分层与能力训练矩阵”的关键判断，压缩成可复用的 evidence map（每条都有 `reference_eng/*.md` 回指）。

## Key Claims → Evidence Pointers

### A. 为什么“分层”不是拍脑袋：专家能力的可观察差异

- 专家/新手在调试中的差异可被过程性指标刻画（chunking 能力、系统视角、breadth-first vs depth-first 策略），而不只是“写得更快”。
  - `reference_eng/02-tier-vessey-1985-expertise-in-debugging-process-analysis.md`
- 在 OO 程序理解中，expert 更偏 top-down、inference-driven，并使用 multiple guidance；novice 更偏 execution-based guidance，且对 OO 静态关系（继承/组合）利用差。
  - `reference_eng/02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md`
- 仅用“年限/经验”评估开发者能力不可靠；SE expertise 更接近一个受情境影响的多维构念，且自我评估可能偏差。
  - `reference_eng/02-tier-baltes-diehl-theory-software-development-expertise-2018.md`

### B. 能力阶段与训练逻辑：从“规则驱动”到“情境判断”

- Dreyfus 五阶段模型提供了“从新手到专家”的机制框架：新手依赖规则与上下文无关的指令；熟练者逐渐形成情境化的优先级选择与直觉判断。
  - `reference_eng/02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md`
- Shu-Ha-Ri 作为实践语言可以帮助把阶段跃迁落到“先遵循型、后破形、再创新”的训练节奏（但属类比/实践框架）。
  - `reference_eng/02-tier-shu-ha-ri-agile-leadership-dreyfus-model.md`

### C. 为什么“第二层”往往是成长主战场：学习 vs 表现的分离

- “desirable difficulties”指出：短期表现更好不等于学得更好；适度难度与延迟收益是学习设计的核心矛盾。
  - `reference_eng/02-tier-bjork-bjork-2020-desirable-difficulties.md`
- “deliberate practice”理论强调：专家来自长期、有明确目标的练习与反馈循环，而非仅靠经验堆叠。
  - `reference_eng/02-tier-ericsson-1993-deliberate-practice-expert-performance.md`
- 编程教育中存在显著实践障碍（任务设计、反馈、动机与误解等），导致“想练但练不起来”；因此需要软脚手架与可执行反馈机制。
  - `reference_eng/02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md`

### D. 让“分层与训练矩阵”可度量：技能 proxy 与过程性指标

- 编程 skill 的测量不应停留在“年限/职级/自评”；可以用一组代表性小任务，把 time + quality 合并成 ordinal performance，再跨任务聚合为 skill 近似指标（用于研究控制或训练前后对照）。
  - `reference_eng/02-tier-bergersen-et-al-inferring-programming-skill-time-quality-esem-2011.md`
- 在 program comprehension 任务中，token-level eye movement 指标能区分 novice vs experienced；novices 在学习过程中逐步获得 frequency effect，且可用 ML 仅基于眼动特征做 skill-level 分类（≈72% accuracy，作为可行性信号）。
  - `reference_eng/02-tier-al-madi-et-al-longitudinal-eye-tracking-token-effects-icpc-2021.md`

### E. “注意力与路径”是可训练对象：从机制框架到实验信号

- 机制框架：可把 expert gaze-fixation 视为状态-动作序列，用 imitation learning 训练“如何看代码”的 attention model/agent（但属机制路线，不是收益实证）。
  - `reference_eng/02-tier-ikutani-et-al-imitating-visual-attention-experts-arxiv-1903-06320.md`
- 实证信号：可视化 expert gaze（GazePrinter）会显著改变 novices 的 codebase 导航路径，使其更接近专家路径；但 time/performance/cognitive load 指标未必显著改善（弱迹象），提示“过程变好”与“短期表现”可能分离。
  - `reference_eng/02-tier-kuang-et-al-gazeprinter-expert-gaze-guide-novices-arxiv-2603-19855.md`

## 由证据推到的“分层口径”（二轮可用版本）

- 分层不应以 Skill 的“长度/复杂度”定义，而应以使用者必须具备的心智动作定义：
  - Tier 1：按规则调用与基本审查（更多是 adoption 信心与基本规范）
  - Tier 2：理解与约束协作（上下文管理、推断、评审、调试证据链）
  - Tier 3：方法学/治理与资产化（把经验写成可复用规范，并能用 evals 维护）
- Tier 2 的训练目标应显式包含：
  - chunking 与系统视角（debug/comprehension）
  - top-down inference 与 multiple guidance
  - “学习收益与效率收益”拆开评估（desirable difficulties）
