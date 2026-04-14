# gstack: canary/SKILL.md (Post-Deploy Visual Monitor, Baselines, Alerting on Changes)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/canary/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/canary` 把“发布后监控”降级成可执行技能：用 browse daemon 对生产 URL 做 1-30 分钟持续巡检，捕捉“CI 过了但 prod 坏了”的早期异常（console errors、性能退化、加载失败），以 baseline 为对照只对“变化”报警，并把报告与 JSONL 结果落盘。
- claims_supported:
  - operate/monitor 能力单元可以以 baseline+周期巡检的形式实现（尤其是前 10 分钟）
  - “对变化报警而非绝对值”是降低噪声与误报的关键策略
  - 落盘报告 + baseline 更新让 canary 从一次性操作变成持续资产
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: browse daemon (snapshot/console/perf/text), AskUserQuestion, JSONL logging

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: canary/SKILL.md

## 关键事实

- 支持 `--baseline`：部署前抓取每个页面的 screenshot/console/perf/text，并写入 `.gstack/canary-reports/baseline.json`。
- 支持页面发现与自定义页面清单；默认监控 10 分钟、每 60 秒检查一次。
- 报警规则基于 baseline 的“变化”：
  - load failure、new console errors、load time >2x baseline、new 404 等
  - 仅对连续 2 次以上的模式报警（transient tolerance）
- 输出落盘：`.gstack/canary-reports/{date}-canary.md/.json`，并写 JSONL 结果用于 review dashboard。
- 如果部署健康，提供 baseline 更新选项（把最新截图变成新 baseline）。

## 与本研究的关系

- 为 `round2_cap/03` 的“Ship/Operate 需要可观测、可回归能力单元”提供一手机制证据：baseline + loop + report + JSONL log。
- 支撑“运行时 QA/监控不应只在 PR 内发生”，而应延伸到 prod 早期窗口。

## 可直接引用的术语 / 概念

- “Post-Deploy Visual Monitor”
- “Alert on changes, not absolutes”
- “Transient tolerance”

## captured_excerpt

摘录（来自 `canary/SKILL.md`）：

> “Alert on changes, not absolutes.”

## 风险与局限

- 该机制偏“前端可视化巡检 + console/perf”，对后端指标（error rate、DB latency）需要与 APM/日志系统集成才能覆盖。
- baseline 的代表性与环境一致性很关键；多 region、多 tenant 的系统需要分层 baseline 策略。

