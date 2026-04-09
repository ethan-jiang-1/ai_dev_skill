# OWASP Top 10 for LLM Applications (v1.1)

- source_url: https://owasp.org/www-project-top-10-for-large-language-model-applications/
- source_type: practitioner
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: practitioner
- why_it_matters: Provides a widely used security risk taxonomy that can be mapped onto team skill governance (especially when skills are distributed, executed, or connected to tools). This is a safety/quality baseline for eng adoption at team scale.
- claims_supported:
  - Prompt injection and supply chain vulnerabilities are first-class risks for LLM applications; teams need explicit governance, not ad-hoc prompting.
  - Insecure plugin design / excessive agency risks map to tool-calling skills, which can impact both safety and developer trust (and thus learning/adoption).
- date_scope: OWASP page as of access date (2026-04-09)
- related_tools: LLM apps; plugin/tool integrations; skill distribution (general)

## 关键事实

- OWASP 提供 LLM 应用 Top 10 风险清单（页面展示 v1.1 条目）。
- 与“团队级 Skill/Agent 使用”直接相关的风险类别包括：
  - Prompt Injection
  - Supply Chain Vulnerabilities
  - Insecure Plugin Design
  - Excessive Agency

## 与本研究的关系

- 对 04-path（团队采纳与治理）：
  - 如果团队把 Skills 当作可共享资产（甚至来自外部来源），治理必须纳入供应链与注入攻击面，而不仅是“是否好用”。
  - 这会反向影响 eng 的学习路径：没有安全/权限边界与审计，团队往往会限制工具使用，进而压缩“Skill 训练体系”的落地空间。

## 可直接引用的术语 / 概念

- prompt injection
- supply chain vulnerabilities
- insecure plugin design
- excessive agency

## captured_excerpt

> LLM01: Prompt Injection

> LLM05: Supply Chain Vulnerabilities

## 风险与局限

- OWASP 是通用风险分类，不是“AI Skill”专用实证；它用于提供风险词表与映射框架，具体落地仍需结合某个宿主/分发生态的机制证据与真实事故案例。

