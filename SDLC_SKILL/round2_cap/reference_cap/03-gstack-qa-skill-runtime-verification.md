# gstack: qa/SKILL.md (Runtime QA via Browse Daemon, Evidence-first Issue Reports, Regression Baselines)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/qa/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: `/qa` 把“上线前/发布后 QA”从代码文本推进到真实运行时：用 headless browser（browse daemon）做页面访问、交互验证、console error 抽取、性能采样、截图证据；并用模板化报告、issue taxonomy、health score 与 baseline/regression 模式，把 QA 结果变成可复用资产。
- claims_supported:
  - QA 能力单元必须穿透到运行时，用“截图/console/perf”做证据，而不是只看 diff
  - 把 QA 过程结构化（phase + rubric + template）能降低遗漏并提高可复核性
  - baseline/regression 把一次性 QA 变成可持续回归资产
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: browse daemon, screenshots, console error capture, perf sampling

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: qa/SKILL.md

## 关键事实

- 明确了 QA “模式”与“证据等级”：interactive bugs 需要 before/after 截图与 `snapshot -D`；静态问题可用单次 annotated snapshot。
- 给出了完整 workflow（Phase 1-6 baseline + triage + fix loop + final QA + report），并要求每个 issue 立即落盘到报告模板中（避免“口头记忆”丢失）。
- 把 console errors、页面导航链接发现、框架识别（Next.js 等）都纳入 QA 过程，使 QA 不只是“点点看”。
- 提供 health score rubric（按 console/links/visual/functional/UX/perf/accessibility 等维度加权），让 QA 结论可比较。
- 通过 baseline.json 支持 regression mode：对比“新问题/已修复问题/score delta”，形成回归视角。

## 与本研究的关系

- 为 `round2_cap/03` 的“Ship/Operate 需要运行时验证闭环”提供一手证据：能力单元通过 browse daemon 将验证资产化（report + baseline）。
- 也为“质量门禁”提供可迁移样本：health rubric + evidence-first issue report 的组合。

## 可直接引用的术语 / 概念

- “Regression mode”
- “Health Score Rubric”
- “Evidence tiers”
- “Per-page exploration checklist”

## captured_excerpt

摘录（来自 `qa/SKILL.md`）：

> “Document each issue immediately when found — don't batch them.”
>
> “Regression mode … compare: Health score delta; Issues fixed; New issues.”

## 风险与局限

- headless browser 验证依赖可访问环境（local/staging/prod）与认证流程；企业环境需处理 SSO/2FA/CAPTCHA 等不可自动化环节。
- “健康分”是经验权重模型；应与 CI 测试、监控指标共同使用，避免单一分数驱动错误决策。

