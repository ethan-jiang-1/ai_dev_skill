# 04-map-migration Evidence Summary (Wave 1/2)

目标：把“能力地图与迁移价值判断”的关键判断，压缩成可复用的 evidence map（每条都有 `reference_cap/*.md` 回指）。

## Key Claims → Evidence Pointers

“迁移价值判断需要先落到配置机制与工件形态：Context Files 主导，AGENTS.md 出现互操作趋势；而 Skills/Subagents 等高级机制采用整体偏浅”：
- `reference_cap/04-arxiv-2602.14690-configuring-agentic-ai-coding-tools.md`

“AGENTS.md 不只是口径：在可控实验中与更低运行时间与更低 token 消耗相关（但 correctness 不在结论范围）”：
- `reference_cap/04-arxiv-2601.20404-impact-of-agents-md-efficiency.md`

“跨宿主迁移不是复制 prompt，而是 installer + 目录契约 + 转换器 + 回归测试 的工程链路；差异点包括路径、frontmatter、命令命名、tool 名称与已知宿主 bug”：
- `reference_cap/04-gsd-multi-runtime-installer-and-format-conversion.md`
- `reference_cap/04-gsd-windsurf-conversion-regression-tests.md`

“宿主适配/转换层的 maintenance overhead 有可复核切片：gstack host registry 明确 8 hosts 且映射层有数百行规模；GSD 的 installer+converter 在单文件上达到千行级，并需要 conversion regression tests 固化 contract”：
- `reference_cap/04-gstack-host-portability-surface-area-metrics.md`
- `reference_cap/04-gsd-multi-runtime-conversion-surface-area-metrics.md`
- `reference_cap/04-gsd-installer-converter-churn-commit-history.md`
- `reference_cap/04-gsd-windsurf-conversion-regression-tests.md`

“多宿主可移植需要显式映射层（HostConfig）与语义级 adapter；单纯字符串替换无法覆盖宿主语义差异”：
- `reference_cap/04-gstack-host-config-system-multi-host-portability.md`

“可迁移的 skill pack 需要‘模板→生成物’链路与 host-specific regeneration，才能同时保持单一事实源与多宿主差异化输出”：
- `reference_cap/04-gstack-agents-md-workflow-and-host-portability.md`

“AGENTS.md 已被主流宿主写成契约：scope/override/fallback/32KiB cap 与逐级聚合规则，决定互操作与漂移治理策略”：
- `reference_cap/04-openai-codex-agents-md-scopes-override-fallback.md`
- `reference_cap/04-openai-unrolling-codex-agent-loop-instruction-aggregation-mcp-sandbox.md`

“企业治理控制面也是能力单元：requirements/prefix_rules/approval/sandbox/MCP allowlist 可把安全与合规约束落到可执行 policy（否则迁移难以通过门禁）”：
- `reference_cap/04-openai-codex-managed-configuration-requirements-toml.md`
- `reference_cap/04-openai-codex-rules-prefix-rule-smart-approvals.md`
- `reference_cap/03-openai-codex-agent-approvals-security-sandbox.md`

“跨宿主互操作不仅发生在 Codex：Claude Code 官方 memory/rules 支持 imports（可导入 AGENTS.md），说明 AGENTS.md 可作为跨工具指令中间层”：
- `reference_cap/04-anthropic-claude-code-memory-claude-md-imports.md`

“MCP/外部工具链进入供应链风险域：confused deputy/SSRF/session hijacking/tool poisoning/rug pulls/多 server 放大，需要 scopes/allowlist/signing/vetting/guardrails”：
- `reference_cap/03-mcp-security-best-practices.md`
- `reference_cap/03-arxiv-2512.06556-securing-mcp-tool-poisoning.md`
- `reference_cap/03-arxiv-2601.17549-breaking-the-protocol-mcp-security.md`

“rules/context files 可以承载 workflow-only guardrail 与工程/安全标准，但天然是宿主特定工件，迁移需要映射与降级策略”：
- `reference_cap/04-gsd-clinerules-workflow-guardrails.md`

“社区层面的真实迁移摩擦：目录结构/语言依赖/原生命令替代，以及对外部 MCP/插件供应链的信任顾虑”：
- `reference_cap/04-community-gsd-copilot-integration-reddit.md`

“社区失败模式线索库（负面证据）：GSD 的 bug report 从大量 issues 中整理 confirmed bugs，并按 install/update/planning/execution/migration 等分类，可用于校准 adoption risk 与治理成本”：
- `reference_cap/04-community-gsd-bug-report-33-confirmed-bugs-llm-as-judge.md`

“失败模式与安全约束：技能生态属于供应链风险域，仅看 SKILL.md 文本扫描会高误报；引入仓库上下文可显著降假阳性并揭示弃置仓库劫持攻击面”：
- `reference_cap/03-arxiv-2603.16572-repo-context-skill-security.md`

## Notes

- 迁移价值必须能回指到证据；没有证据的评级只能标注“待验证”。
