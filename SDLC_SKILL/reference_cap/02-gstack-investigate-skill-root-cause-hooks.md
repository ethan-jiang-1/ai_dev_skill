# gstack: /investigate (Systematic Debugging, Root-Cause-First, Edit/Write Scope Boundary Hooks)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/investigate/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: /investigate 把“系统化调试”做成可调用 skill，并通过 PreToolUse hooks 在 Edit/Write 前执行 scope boundary 检查（debug 期间限制写入范围），属于把调试纪律落到机制层的例子。
- claims_supported:
  - 调试应先 root cause investigation 再修复（四阶段流程）
  - debug 期间可通过 hooks 对写入/编辑进行边界约束，减少误改与范围漂移
  - skill routing（遇到 bug 不直接修，先 invoke investigate）可降低盲修
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: PreToolUse hooks, freeze/check-freeze.sh, AskUserQuestion

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: investigate/SKILL.md

## 关键事实

- description 明确：四阶段 systematic debugging（investigate/analyze/hypothesize/implement）与 iron law（no fixes without root cause）。
- hooks 部分为 Edit/Write 工具挂载 PreToolUse：
  - 在 Edit/Write 前运行 `freeze/bin/check-freeze.sh` 做 scope boundary 检查（“Checking debug scope boundary...”）。
- 该 skill 也继承 gstack 的治理 preamble（update check、telemetry、routing、vendoring 迁移提示等）。

## 与本研究的关系

- 对 round2_cap/02：它提供“调试纪律如何从文字变成机制”的例子（hooks + boundary check）。
- 对企业迁移：展示了在 agent lifecycle 点插入确定性脚本检查的方式（hook/gate 的工程落点）。

## 可直接引用的术语 / 概念

- “Iron Law: no fixes without root cause.”
- “PreToolUse”
- “scope boundary”

## captured_excerpt

摘录（来自 `investigate/SKILL.md`）：

> “Systematic debugging with root cause investigation.”

## 风险与局限

- hook 机制的效果依赖宿主对 hooks 的强制执行与不可绕过性；企业迁移需要把 boundary policy 与审计日志纳入统一治理。

