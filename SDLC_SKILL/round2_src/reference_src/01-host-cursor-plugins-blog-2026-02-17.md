# Cursor Blog: Extend Cursor with plugins (2026-02-17)

- source_url: https://cursor.com/blog/marketplace
- source_type: official_blog
- accessed_at: 2026-04-08
- published_at: 2026-02-17
- related_topic: host
- trust_level: official
- why_it_matters: Cursor 对“插件/能力包”的官方抽象定义（skills/subagents/MCP/hooks/rules）集中在这一篇，且明确了后续“team marketplaces + governance/security controls”的演化方向。

## Key Facts

- Cursor 宣布支持 plugins，用于让 agents 连接外部工具与学习新知识。
- Plugins 作为能力打包单位：可包含 MCP servers、skills、subagents、rules、hooks 等 primitives。
- 初期策略：高度 curated，来源包含 Amplitude/AWS/Figma/Linear/Stripe 等合作伙伴（覆盖设计、支付、测试、部署等全生命周期工作流）。
- Plugin primitives 的官方定义（文中列出）：
  - Skills：domain-specific prompts and code，agents 可以 discover 并运行。
  - Subagents：specialized agents，支持并行完成任务。
  - MCP servers：连接外部工具或数据源的服务。
  - Hooks：自定义脚本，用于观测与控制 agent 行为。
  - Rules：系统级指令，用于保持编码标准与偏好一致。
- 分发入口：可在 Cursor Marketplace 发现/安装预构建 plugins；也支持社区提交与分享。
- 趋势信号：文中明确“正在做 private team marketplaces”，以便组织内部分享插件，并提供 central governance 与 security controls。

## Claims Supported

- “Cursor 的宿主抽象不是单一 skills 标准，而是用 plugin 把多种 primitives（含 MCP/hook/rule/subagent）统一打包。”（主题1 host）
- “宿主平台开始把团队级治理与安全控制纳入分发/共享机制（team marketplace）。这是生态演化方向之一。”（趋势证据）

## Captured Excerpts (keep short)

> Plugins bundle capabilities like MCP servers, skills, subagents, rules, and hooks...

## Terms / Concepts

- plugin primitives (skills/subagents/MCP/hooks/rules)
- curated marketplace
- private team marketplaces (governance/security controls)

## Risks / Limits

- 该文档定义的是 Cursor 的概念模型；具体落盘路径、触发语义与权限边界仍需 Cursor docs/实现细节进一步核验。

