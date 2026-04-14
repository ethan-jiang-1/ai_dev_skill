# superpowers: Systematic Debugging Skill (Root-Cause-First Protocol)

- source_url: https://github.com/obra/superpowers/blob/917e5f53b16b115b70a3a355ed5f4993b9f8b73d/skills/systematic-debugging/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: 该技能把“调试”定义成严格的四阶段科学流程，并明确禁止“未找根因先修复”。这类协议能显著降低 agent 的随机尝试与越修越坏。
- claims_supported:
  - “先根因后修复”的执行权限重排可抑制 LLM 盲改倾向
  - “证据收集→模式对比→单一假设→最小验证”是可迁移的 debug 闭环
  - “3 次修复失败→质疑架构”提供了自动化熔断与升级路径
- date_scope: as of git commit 917e5f53b16b115b70a3a355ed5f4993b9f8b73d (2026-04-06)
- related_frameworks: superpowers
- related_tools: (varies by host; skill is instruction-level)

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/superpowers
- commit: 917e5f53b16b115b70a3a355ed5f4993b9f8b73d
- file_path: skills/systematic-debugging/SKILL.md

## 关键事实

- Iron Law：完成 Phase 1（Root Cause Investigation）前，不允许提出修复方案。
- 四阶段流程：
  - Phase 1 Root Cause Investigation：阅读错误、稳定复现、检查近期变更、多组件边界打点、追踪数据流。
  - Phase 2 Pattern Analysis：找 working examples、读参考实现、列出差异、理解依赖。
  - Phase 3 Hypothesis and Testing：单一假设、最小实验、验证后再继续。
  - Phase 4 Implementation：写失败用例（可自动化）、单一修复、回归验证；失败后回到 Phase 1。
- 明确规定：尝试修复次数达到 3 次以上仍失败，则停止继续修补，转为“质疑架构并与人类讨论”。

## 与本研究的关系

- 这是“系统化调试闭环”能力单元的官方一手流程协议，可作为企业版 debug skill 的基线。
- 它与 Nyquist/验证前置互补：Nyquist 提供“验证信号”，systematic debugging 提供“如何用信号找到根因并防止盲修”。

## 可直接引用的术语 / 概念

- “NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST”
- “The Four Phases”
- “If 3+ Fixes Failed: Question Architecture”

## captured_excerpt

摘录（来自 `skills/systematic-debugging/SKILL.md`）：

> “NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST”
>
> “If you haven't completed Phase 1, you cannot propose fixes.”

## 风险与局限

- 该协议依赖宿主能提供足够的观测与复现能力（日志、测试、可运行环境）；在不可复现或缺少 telemetry 的系统上，需要先补“观测能力单元”。
- 对“快修上线”的组织文化有冲突，迁移时需要制度支持（允许先调查、再修复）。

