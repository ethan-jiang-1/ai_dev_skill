# OWASP Top 10 for LLM Applications (v1.1)

- source_url: https://owasp.org/www-project-top-10-for-large-language-model-applications/
- source_type: security_research
- accessed_at: 2026-04-08
- published_at:
- related_topic: shared
- trust_level: academic
- why_it_matters: 为“skill 分发与执行的现实风险模型”提供权威安全分类（prompt injection、供应链、插件设计、过度代理等），可作为主题2/主题1 的安全基线。

## Key Facts

- OWASP 给出 LLM 应用的 Top 10 风险清单（页面展示 v1.1 版本条目）。
- 与本研究强相关的条目包括：
  - LLM01 Prompt Injection
  - LLM02 Insecure Output Handling
  - LLM05 Supply Chain Vulnerabilities
  - LLM07 Insecure Plugin Design
  - LLM08 Excessive Agency
- 这些风险可以直接映射到 skill 生态的关键环节：
  - skill 内容作为“可执行指令”时的注入与输出处理风险
  - 通过 registry/marketplace/CLI 分发时的供应链风险
  - skills/plugins/MCP 等扩展点的访问控制与权限边界
  - agent 自主执行能力增强后带来的“过度代理”风险

## Claims Supported

- “skill 分发层必须纳入供应链与注入攻击面评估，不能只看可用性/规模。”（主题2 dist）
- “宿主平台的权限模型与工具调用边界，是缓解 LLM 风险的重要变量。”（主题1 host）

## Captured Excerpts (keep short)

> LLM01: Prompt Injection

> LLM05: Supply Chain Vulnerabilities

## Terms / Concepts

- Prompt Injection
- Supply Chain Vulnerabilities
- Insecure Plugin Design
- Excessive Agency

## Risks / Limits

- 该清单是通用风险分类，并非专门针对 Agent Skills；需要在具体宿主/registry 的实现与真实案例中落地映射。

