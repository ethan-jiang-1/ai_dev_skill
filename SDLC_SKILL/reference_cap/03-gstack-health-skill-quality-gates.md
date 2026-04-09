# gstack: health/SKILL.md (Project Health Stack Detection, Scored Quality Gates, Persisted Trend History)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/health/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/health` 把“质量检查”从一次性命令变成可持续的 gate：先从 CLAUDE.md 读取或自动探测项目健康栈（typecheck/lint/test/deadcode/shellcheck），再运行并按 rubric 打分，落盘到 health-history.jsonl，并做趋势分析与回归定位。
- claims_supported:
  - “质量门禁”可以被标准化为 health stack + rubric + 可持久化历史
  - 把检测到的工具写回 CLAUDE.md 相当于显式配置面，降低跨会话漂移
  - trend analysis 把健康检查从 snapshot 升级为 time-series 资产
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: typecheck/lint/test runners, knip, shellcheck, CLAUDE.md

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: health/SKILL.md

## 关键事实

- 优先从 CLAUDE.md 的 `## Health Stack` 读取工具列表，否则自动检测（tsc/biome/eslint/pytest/cargo/go test/knip/shellcheck 等）。
- 通过 AskUserQuestion 让用户确认检测到的 health stack，并可选择把 health stack 持久化写回 CLAUDE.md（作为项目配置面）。
- 运行工具后按 rubric 给每类 0-10 分，并计算 composite score；低于阈值的类别输出具体错误片段。
- 把结果追加写入 `~/.gstack/projects/$SLUG/health-history.jsonl`（JSONL），并读取 last 10 runs 做趋势分析与回归定位。

## 与本研究的关系

- 为 `digested_cap/03` 的“运维/质量闭环必须可观测、可回归”提供一手证据：health-history + trend 让质量门禁可持续。
- 也为“迁移价值判断”提供可迁移机制：把健康栈显式化 + 评分与趋势追踪属于跨组织通用的治理抽象。

## 可直接引用的术语 / 概念

- “Health Stack”
- “Persist to Health History”
- “Trend Analysis”

## captured_excerpt

摘录（来自 `health/SKILL.md`）：

> “Append one JSONL line to … health-history.jsonl”

## 风险与局限

- rubric 与阈值需要按组织/仓库类型调整（库 vs 应用、语言与测试基础设施差异），否则会产生噪声告警。
- 默认落盘在本地 home 目录；团队共享与审计需要额外集成（例如写入 repo 或内部可观测平台）。

