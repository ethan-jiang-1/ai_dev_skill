# Local Example Teardown: `agent-skills`

- `source_path`:
  - `/Users/bowhead/ai_dev_skill/addyosmani-agent-skills-analysis/eval_skills/01-总览.md`
  - `/Users/bowhead/ai_dev_skill/addyosmani-agent-skills-analysis/eval_skills/02-Define与Plan阶段.md`
- `source_type`: `local-analysis-derived-note`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `internal-derived`
- `why_it_matters`: `这是本地最适合承担“先读后编”拆解例子的样本之一，因为它把生命周期、命令入口和 skill 组合关系都拆得很清楚。`
- `claims_supported`:
  - 高质量 skill 仓库不只是若干零散提示词，而是可按工程生命周期组织的能力系统
  - 好的样本适合先学结构、节奏和边界，再进入自己的编制
  - “Use when / 分阶段入口 / 验证纪律”是很值得优先借鉴的 authoring 线索

## 关键事实

- 本地拆解把这套仓库概括为一套按软件工程生命周期模块化的技能系统，而不是提示词合集。
- 拆解里明确列出：
  - `Define`
  - `Plan`
  - `Build`
  - `Verify`
  - `Review`
  - `Ship`
- 本地拆解还把它收束成 `7` 个命令入口和 `20` 个 skill 的功能地图，说明这类仓库的阅读重点不是单个 skill 文本，而是整体链路设计。
- `Define / Plan` 段的分析尤其说明：好的 skill 不只是告诉 agent “做什么”，还会把问题定义、成功标准、边界和 checkpoint 一起固定下来。

## 与本研究的关系

- 这组本地拆解特别适合用来教读者“怎样读一个高质量 skill 样板库”。
- 它不是为了证明某个平台标准，而是为了证明：先读现成样本，确实能更快看见生命周期组织、入口设计和流程纪律。
- 它也很适合当“learning-first example”，用来区分：
  - 什么叫结构样板库
  - 什么叫工程基座
  - 什么叫验证纪律

## 风险与局限

- 这是一份本地二次拆解，不是原始仓库 README。
- 它适合用作阅读视角和教学例子，不应替代对原始仓库的逐文件核对。
