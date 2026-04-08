# Sundial Docs: Security

- source_url: https://sundialhub.com/docs/security
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: dist
- trust_level: official
- why_it_matters: 明确 Sundial 的技能验证与扫描链路（Cisco AI Skill Scanner、Semgrep、模型审查、手工 review），是“安全扫描会不会成为标配”的一手证据。

## Key Facts

- 文档说明 Sundial 在展示技能结果前会做多重自动化验证检查。
- 文档点名使用的检查组件：Cisco AI Skill Scanner、Semgrep、model-based review。
- 对模糊案例：文档说明会加入 manual review，避免用户只依赖自动化。
- UI 反馈：若 skill 被 flag，UI 会展示简短安全报告（severity + 触发原因概述），帮助用户快速评估风险与决策。

## Claims Supported

- “skill 分发平台正在把安全扫描、分级报告、手工复核引入默认链路。”（主题2 dist）
- “安全治理不仅是扫描工具本身，还包括用户可理解的风险呈现（severity/解释）。”（主题2 dist）

## Captured Excerpts (keep short)

> We use the Cisco AI Skill Scanner, Semgrep, and model-based review...

## Terms / Concepts

- skill scanning
- Semgrep
- model-based review
- manual review

## Risks / Limits

- 文档是机制描述；还需要补抓“扫描规则覆盖面/误报漏报/可复现样例”作为实证层支撑。

