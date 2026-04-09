# Expertise in Debugging Computer Programs: A Process Analysis (Vessey, 1985)

- source_url: https://doi.org/10.1016/S0020-7373(85)80054-7
- source_type: academic
- accessed_at: 2026-04-09T05:26:53+08:00
- related_topic: 02-tier
- trust_level: academic
- why_it_matters: A classic empirical expert-vs-novice study in *debugging* (a core engineering activity). It provides concrete, observable strategy differences (chunking ability, breadth-first vs depth-first, system view) that can ground “difficulty tiers” and “training matrix” claims in software engineering rather than only in generic learning theory.
- claims_supported:
  - In debugging, expert-vs-novice differences can be operationalized via chunking ability and are strongly associated with different debugging strategies.
  - Experts more often use breadth-first approaches and adopt a system-level view; novices may alternate breadth-first without system thinking and depth-first behaviors.
  - A useful “tier” proxy is whether the developer can maintain a coherent system view and chunk code effectively under uncertainty (debugging), not merely produce code.
- date_scope: 1985 (study context; COBOL debugging in one organization)
- related_tools: debugging; program comprehension; chunking; cognitive strategies; think-aloud protocols

## 关键事实

- 研究对象与方法：
  - 探索性研究（exploratory study），使用 verbal protocol analysis（口述思维过程记录与分析）。
  - 16 名同一组织雇员（专业程序员）debug 一段 COBOL 程序；通过转录与分析其调试过程来刻画策略差异。
- 专家/新手划分方式：
  - 先基于“能否有效 chunk（分块）被调试程序”的过程性指标做 expert-novice 分类（而非仅靠管理者评价）。
  - 随后比较不同调试策略，并发现 chunking 能力与策略高度相关。
- 主要发现（作者给出的可检验命题）：
  - Experts：更常用 breadth-first approaches，同时采用 system view；chunking 更熟练，调试过程更“smooth-flowing”。
  - Novices：可能出现 breadth-first 但缺乏 system terms；也会出现 depth-first；chunking 较弱，过程更“erratic”。
- 复核信息（便于获取全文）：
  - 该文为 *International Journal of Man-Machine Studies* (1985) 23:459-494。
  - 该条 DOI 可能对应付费页面，但可在公开网络上找到同名 PDF 副本（用于内部研究时需注意版权与来源可信度）。

## 与本研究的关系

- 对 02-tier（难度分层与能力训练矩阵）：
  - 直接提供“工程任务层”的 expert-novice 机制差异样本：不仅是“知道更多”，而是策略不同（system view、chunking、搜索策略）。
  - 可以把“中等层 Skill 的训练目标”更具体化为：让工程师在真实调试中保持系统视角，减少无结构的深挖与来回跳跃，并形成可复用 chunk（例如通过评审清单、故障定位步骤、证据记录格式等）。
- 对 01-scaffold（认知脚手架）有间接启发：
  - 如果 Skill 只给“答案”，可能绕过 chunking 训练；如果 Skill 逼迫人显式建立系统 view 与证据链，则更像脚手架而不是替代。

## 可直接引用的术语 / 概念

- verbal protocol analysis
- expert-novice classification
- chunking (program chunking ability)
- breadth-first vs depth-first approaches
- system view / system terms
- debugging functions

## captured_excerpt

From the paper abstract (PDF text extraction):

> "Data was collected from 16 programmers employed by the same organization."  
> "the criterion of expertise was the subjects' ability to chunk effectively the program they were required to debug."

## 风险与局限

- 样本量小（n=16）且来自同一组织；任务是调试 COBOL 程序，外推到现代多语言、分布式系统、IDE/AI 辅助情境需要谨慎。
- 研究是探索性过程分析，结论形式是“命题用于后续检验”，不能当作大规模因果实证。

