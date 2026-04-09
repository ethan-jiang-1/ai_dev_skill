# 04-path Question List (Progressive)

目标：持续维护待验证问题清单；每个问题最终都应有 `reference_eng/*.md` 回答或标注“缺口”。

## Open Questions

### P0（团队采纳落地必须回答）

- “四阶段跃迁路径”有没有真实的工程师成长案例可复核？
  - 当前状态：我们已有治理控制面与工具机制事实，但缺少“个人成长路径”的一手案例（例如半年到一年维度的日志/复盘）。
  - 已有证据（工具事实，非成长案例）：
    - `reference_eng/04-path-github-copilot-cloud-agent-about.md`
    - `reference_eng/04-path-github-copilot-cloud-agent-pilot-guide.md`
  - 缺口：公开的个人成长叙事往往偏主观；需要可复核的行为证据（规则资产变化、review 质量、事故率、迁移能力）。
  - 什么证据能关闭：内部 pilot 的量化+质化复盘（PR review 数据、缺陷回归、MTTR、产出质量）或研究论文。

- 团队如何把 Skill 当成“数字资产”治理到可审计？
  - 当前状态：我们有 repo instructions、权限模型、组织策略等“控制面事实”，但还缺“资产治理流程”（版本策略、审计、回滚、责任边界）案例。
  - 已有证据（控制面）：
    - `reference_eng/04-path-github-copilot-repo-custom-instructions.md`
    - `reference_eng/04-path-github-copilot-cli-tool-permissions.md`
    - `reference_eng/04-path-github-copilot-policies-concepts.md`
  - 缺口：企业如何把这些控制面组合成治理 SOP（例如：谁能改指令、如何 code review、如何灰度、如何回滚）。

### P1（风险与失败模式）

- “content exclusions 不生效”等平台限制在企业里如何补救？
  - 当前状态：GitHub docs 明确指出 cloud agent limitations（含 content exclusions 不被 account），但缺少 best practice 对策落盘。
  - 已有证据（限制事实）：
    - `reference_eng/04-path-github-copilot-cloud-agent-about.md`
  - 缺口：补救手段（额外规则、仓库分区、敏感文件隔离、运行时拦截、审计与 DLP）以及真实误用案例。

- 供应链与“过度代理（excessive agency）”风险的治理基线是什么？
  - 当前状态：OWASP LLM Top 10 给出风险分类，但缺少“在 Skill/插件/agent 生态下的落地 checklist”。
  - 已有证据（风险分类）：
    - `reference_eng/04-path-owasp-top-10-llm-apps-v1-1.md`
  - 缺口：工程化对策（扫描、签名、权限最小化、隔离执行、审计日志、红队演练）与企业案例。

### P2（趋势验证）

- “私有 marketplace + 团队集中治理”是否是普遍趋势还是少数工具路线？
  - 当前状态：Cursor 有官方信号，但缺少多生态对照与采纳数据。
  - 已有证据：
    - `reference_eng/04-path-cursor-plugins-marketplace-team-governance-2026-02-17.md`
  - 缺口：其他平台的同类机制（GitHub Marketplace/VSCode extensions policies 等）及其 adoption 数据。
