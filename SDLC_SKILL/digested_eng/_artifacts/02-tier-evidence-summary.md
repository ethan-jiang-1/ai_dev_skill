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

## 由证据推到的“分层口径”（二轮可用版本）

- 分层不应以 Skill 的“长度/复杂度”定义，而应以使用者必须具备的心智动作定义：
  - Tier 1：按规则调用与基本审查（更多是 adoption 信心与基本规范）
  - Tier 2：理解与约束协作（上下文管理、推断、评审、调试证据链）
  - Tier 3：方法学/治理与资产化（把经验写成可复用规范，并能用 evals 维护）
- Tier 2 的训练目标应显式包含：
  - chunking 与系统视角（debug/comprehension）
  - top-down inference 与 multiple guidance
  - “学习收益与效率收益”拆开评估（desirable difficulties）
