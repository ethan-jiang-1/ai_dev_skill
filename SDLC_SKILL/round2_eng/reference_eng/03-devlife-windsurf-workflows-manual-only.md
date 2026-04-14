# Windsurf Docs: Cascade Workflows (Manual-Only, Slash Command Invocation)

- source_url: https://docs.windsurf.com/windsurf/cascade/workflows
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: Clarifies a hard contract boundary between “workflow” and “skill” in one major host: workflows are manual-only and never auto-invoked. This is strong evidence that tool abstractions shape learning and safety (explicit invocation reduces surprise).
- claims_supported:
  - Workflows are invoked via slash command and are manual-only (never auto-invoked).
  - Workflows can be stored at workspace/global/system scopes, enabling team-level distribution similar to skills.
  - Distinguishing auto-invoked skills vs manual-only workflows is critical for understanding cognitive load and governance.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: Windsurf (Cascade workflows); slash-command automation

## 关键事实

- Workflows 是用 Markdown 文件定义的可复用流程，通过 `/<workflow-name>` 触发。
- 文档给出关键约束：Workflows 是 manual-only，Cascade 不会自动触发 workflow；如果需要自动拾取流程，应使用 Skill。
- 提供多种存储范围与路径（workspace/global/system enterprise），并给出 discovery 规则与文件大小限制。

## 与本研究的关系

- 对 03-devlife：
  - 同一宿主内就存在“自动触发 vs 手动触发”的抽象边界，这会显著影响工程师的学习路径与信任感（surprise cost）。
- 对 01-scaffold：
  - manual-only 可以被视为一种“强制显式参与”的脚手架设计：用户明确选择进入某个流程，而非被动被自动化带走。

## 可直接引用的术语 / 概念

- workflow (manual-only)
- slash command invocation
- workspace/global/system scopes

## captured_excerpt

> Workflows are manual-only — Cascade will never invoke a workflow automatically.

## 风险与局限

- 该页描述的是 Workflows，不覆盖 Skills 的权限/安全边界；做“工具对比”时需避免混用概念。

