# gstack: benchmark/SKILL.md (Performance Regression Detection, Resource Breakdown, Budgets and Trends)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/benchmark/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/benchmark` 把“性能回归检测”落到可执行协议：用 browse daemon 的 `perf` 与 `performance.getEntries*` 采集真实页面指标与资源分解，写 baseline、对比 delta、按阈值分类 regression/warning，并支持 trend 分析与 performance budget 检查，把性能治理从主观感受变成可回归资产。
- claims_supported:
  - operate 阶段能力单元可通过 baseline + delta + 阈值把性能回归机制化
  - 资源分解（transfer size / bundle size / slow resources）是可行动的诊断入口
  - trend 与 budget 让性能治理具备长期视角
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: browse daemon perf/eval, baseline JSON, report md/json

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: benchmark/SKILL.md

## 关键事实

- 明确采集指标：TTFB/FCP/LCP/DOM interactive/DOM complete/full load，以及 resource entries（transfer size、duration、bundle sizes）。
- baseline capture：写入 `.gstack/benchmark-reports/baselines/baseline.json`。
- comparison：把 baseline vs current 的 delta 表格化，并定义 regression thresholds（例如 timing >50% 或 >500ms；bundle >25% 等）。
- 输出 slowest resources 列表与建议，以及 performance budget check；支持 `--trend` 基于历史基线展示趋势。
- 报告落盘：`.gstack/benchmark-reports/{date}-benchmark.md/.json`。

## 与本研究的关系

- 为 `digested_cap/03` 的“benchmark/性能回归属于 ops 能力单元”提供一手工作流证据。
- 也为“迁移价值评估”提供证据：baseline+trend 的结构化资产更容易跨团队复用与审计。

## 可直接引用的术语 / 概念

- “Performance Regression Detection”
- “Baseline is essential”
- “Regression thresholds”
- “Performance budget”
- “Trend analysis”

## captured_excerpt

摘录（来自 `benchmark/SKILL.md`）：

> “Measure, baseline, compare, and alert.”

## 风险与局限

- 主要覆盖浏览器侧性能；对后端吞吐/延迟、队列、数据库层仍需配套基准与可观测工具。
- 绝对 budget 需结合产品与页面类型调整；更稳的是“相对 baseline + 趋势”策略。

