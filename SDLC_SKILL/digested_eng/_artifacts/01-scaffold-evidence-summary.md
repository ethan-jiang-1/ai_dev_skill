# 01-scaffold Evidence Summary (Wave 1/2)

目标：把“Skill 作为认知脚手架与逆向学习”的关键判断，压缩成可复用的 evidence map（每条都有 `reference_eng/*.md` 回指）。

## Key Claims → Evidence Pointers

### A. “脚手架”机制的邻近证据（教育学/认知科学，可类比）

- Novice 学习者通常更受益于明确指导而非“最小指导”；worked examples 与认知负荷框架解释了为何指导不仅提升表现，也更可能提升学习效率。
  - `reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
- 学习收益与“参与方式”强相关：ICAP 框架将参与分为 Passive/Active/Constructive/Interactive，并指出 Constructive/Interactive 往往对应更高学习产出（需要产生新推断/解释，而非仅操作）。
  - `reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
- tutoring moves 的分类为“如何逼迫学习者外显推理”提供可操作的设计语言：例如 prompting、eliciting、requesting explanation 相比直接给答案更可能触发学习者建模。
  - `reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`

### B. “卸载/不理解”风险的机制与直接 SE 邻近实证

- cognitive offloading（认知卸载）是一个可被严肃定义的现象：人在面对努力成本、时间压力等，会把记忆/计算负担转移到环境中；这会改变后续认知过程（并非必然好或坏）。
  - `reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
- belief offloading 是 LLM 语境下对 offloading 的扩展：不仅卸载计算，也可能卸载“信念形成/判断”，需要用边界与分类讨论风险面，而不是只用“懒惰/依赖”泛化。
  - `reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 在 brownfield（不熟悉 legacy codebase）任务中，Copilot 使学生更快完成、推进更多，但也让其减少手写与 web search，并在访谈中表达“不理解建议为何有效”的担忧。
  - 这条是目前最接近“AI 编码助手改变参与方式”的直接 SE 场景实证（但对象是 Copilot，不等价于 Skill）。
  - `reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
- 社区经验（高争议但有价值）：部分资深开发者报告“总是开着的自动补全”会带来注意力打断与决策疲劳，提示“更自动化”可能以认知代价换取速度。
  - `reference_eng/01-scaffold-community-experienceddevs-copilot-focus-disruption.md`

### C. “Skill 作为脚手架”在工具设计上的可验证机制（偏官方/工程事实）

- progressive disclosure（渐进式加载）是一种可操作的“脚手架载体机制”：先加载轻量 metadata，再按需加载 SKILL.md 内容与额外文件，避免一次性把所有信息压给模型/人。
  - `reference_eng/01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md`

### D. “逆向学习”可行性：目前最接近的直接证据（但跨域）

- 在固定时间内，LLM 支持的开放式 self-explanation 能提升学习者在 transfer tasks 上的解释质量（研究在微积分语境）。
  - 可作为“把 LLM 设计成解释/反思教练可能更利于学习”的直接证据，但不是软件工程场景。
  - `reference_eng/01-scaffold-llm-supported-self-explanation-calculus-arxiv-2604-00142.md`

## 目前可得的“二轮结论形态”（按 Claim Strength Policy 降级）

- 可强说的是：工具的交互形态能显著改变参与方式与信任/理解风险（有 SE 场景实验 + offloading 理论支撑）。
  - `reference_eng/01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md`
  - `reference_eng/01-scaffold-risko-gilbert-cognitive-offloading-2016.md`
  - `reference_eng/01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md`
- 可“邻近证据支持/类比推断”的是：把专家策略结构化为可执行步骤（并强制解释/反证/自检）更可能成为脚手架；纯给答案或过度自动化更可能引发卸载与不理解。
  - `reference_eng/01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md`
  - `reference_eng/01-scaffold-chi-wylie-icap-framework-2014.md`
  - `reference_eng/01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md`
