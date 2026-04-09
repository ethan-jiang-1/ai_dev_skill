# OpenAI Evals (GitHub README)

- source_url: https://github.com/openai/evals
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: Evals are the missing “engineering muscle” for the skill development lifecycle. This repo provides official guidance and tooling for running and authoring evals, including a registry and custom eval support, which maps directly to the “Evals & Iterative Refinement” phase in eng.
- claims_supported:
  - Evals provide a framework to evaluate LLMs or LLM-based systems; includes a registry and the ability to write custom/private evals.
  - Without evals, it is difficult and time-intensive to understand how model/version changes affect a workflow.
  - Evals are now runnable/configurable via OpenAI Dashboard (implies a shift from “local scripts only” to productized eval infrastructure).
- date_scope: README as of access date (2026-04-09)
- related_tools: OpenAI Evals; eval registry; custom eval authoring

## 关键事实

- README 明确 Evals 的定位：评估 LLM 或基于 LLM 的系统的框架；提供现成的 eval registry，也支持为具体用例编写自定义 eval。
- README 强调“如果在做 LLM 系统，写高质量 eval 是最有杠杆的事之一”；否则很难系统化理解不同模型版本对实际工作流的影响。
- README 提到：可以直接在 OpenAI Dashboard 配置和运行 Evals（并给出 docs 指引）。

## 与本研究的关系

- 对 03-devlife：直接对应 skill dev lifecycle 的 “Evaluations & Iterative Refinement” 阶段。
  - 关键推论：如果团队希望“Skill 不是一次性 prompt”，而是可长期维护的工程资产，那么 evals 是把失败经验系统化回写的核心机制。
- 对 04-path：团队采纳 Skill 体系时，evals 可以作为治理工具（准入门槛、回归测试、版本升级验证）。

## 可直接引用的术语 / 概念

- evals registry
- custom evals / private evals
- model version impact
- dashboard-run evals

## captured_excerpt

From README:

> "Evals provide a framework for evaluating large language models (LLMs) or systems built using LLMs."

## 风险与局限

- README 是框架级说明；“怎么为 Skill 写 eval”仍需要进一步落到具体样例（数据集、评分器、阈值、回归策略），并结合工具生态（IDE/CLI）差异制定执行路径。

