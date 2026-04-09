# The Effects of GitHub Copilot on Computing Students’ Programming Effectiveness, Efficiency, and Processes in Brownfield Programming Tasks (Shihab et al., 2025; arXiv:2506.10051)

- source_url: https://arxiv.org/abs/2506.10051
- source_type: academic
- accessed_at: 2026-04-09T05:29:18+08:00
- related_topic: 01-scaffold
- trust_level: academic
- why_it_matters: This is direct, software-engineering-context empirical evidence about how an AI coding assistant changes *process* and *understanding*, not just output quality. It supports (and bounds) “scaffolding vs offloading” claims with observed shifts: faster completion and more progress, less manual coding and less web search, plus reported concerns about understanding Copilot’s suggestions.
- claims_supported:
  - In a controlled brownfield setting (legacy/unfamiliar codebase), students using Copilot completed tasks faster and made more solution progress than without Copilot.
  - Copilot use shifted activity: less manual code writing time and less web search time, implying a different engagement pattern (potentially more offloading).
  - Students reported concerns about not understanding how/why Copilot’s suggestions worked, which is a direct risk signal for “reverse learning” and long-term capability growth.
- date_scope: arXiv v1 2025-06-11; ICER 2025 (per PDF front matter)
- related_tools: GitHub Copilot; GenAI coding assistants; brownfield/legacy codebase tasks; software engineering education

## 关键事实

- 研究对象与场景（摘要）：
  - 受试者：10 名本科 CS 学生。
  - 任务：在不熟悉的 legacy web application 上做 highly similar 的 brownfield development tasks（向既有代码库添加新代码）。
  - 设计：controlled experiment，对比 with Copilot vs without Copilot。
  - 方法：mixed-methods（performance analysis + behavioral analysis + exit interviews）。
- 核心结果（摘要数值）：
  - 完成速度：使用 Copilot 时任务完成速度提升约 35%（p < 0.05）。
  - 进展：使用 Copilot 时 solution progress 增加约 50%（p < 0.05）。
  - 行为变化：使用 Copilot 时
    - 手写代码时间减少约 11%（p < 0.05）
    - web search 时间减少约 12%（p < 0.05）
- 理解与信任风险（摘要 + 文中叙述）：
  - exit interviews 中，学生表达了对“不理解 Copilot 建议为何有效/如何工作”的担忧。

## 与本研究的关系

- 对 01-scaffold（认知脚手架 vs 认知卸载）：
  - 这是“AI 辅助编程改变参与方式”的直接实证：效率与进展提升并存，但伴随手写与检索减少，提示可能出现认知卸载与理解缺口。
  - 反推 Skill 设计要求：若目标是“逆向学习/方法学训练”，Skill 需要设计成促使理解与审查，而不是只追求更快产出（例如要求解释、对照、反证、记录决策与证据链）。
- 对 Claim Strength Policy：
  - 这份研究直接研究的是 Copilot（而非“Skill”），因此能支持的强度是“同类工具邻近实证”；用于“Skill 有学习收益”时仍需明确边界。

## 可直接引用的术语 / 概念

- brownfield software development
- legacy / unfamiliar code base
- mixed-methods controlled experiment
- programming effectiveness / efficiency / processes
- AI-assisted programming / GenAI coding assistants

## captured_excerpt

From the abstract (PDF text extraction):

> "we found that students completed tasks 35% faster (p < 0.05) and made 50% more solution progress (p < 0.05) when using Copilot."  
> "In exit interviews, students reported concerns about not understanding how and why Copilot’s suggestions worked."

## 风险与局限

- 样本量小（n=10），且对象是学生；外推到专业工程师与企业真实项目需谨慎。
- 研究对象是 Copilot（代码助手）而不是“Skill 系统”；不同交互形态（自动补全 vs 显式脚手架步骤）可能导致不同学习结果。
- 主要报告的是效率/过程变化与主观感受；对长期学习收益与能力提升的因果证据仍有限。

