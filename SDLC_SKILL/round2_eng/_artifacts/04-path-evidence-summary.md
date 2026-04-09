# 04-path Evidence Summary (Wave 1/2)

目标：把“工程师跃迁路径、团队采纳与样本矩阵”的关键判断，压缩成可复用的 evidence map（每条都有 `reference_eng/*.md` 回指）。

## Key Claims → Evidence Pointers

### A. 团队治理需要“可执行的控制面”，而不是口号

- Repo 级“自定义指令资产”是可落地的治理原语：支持 repo-wide 与 path-specific instructions，并存在明确优先级（包含 `AGENTS.md` 等）。
  - `reference_eng/04-path-github-copilot-repo-custom-instructions.md`
- Copilot CLI 给出工具调用的权限模型（allow/deny/approval/yolo），以及 trusted folders/config 的治理入口。
  - `reference_eng/04-path-github-copilot-cli-tool-permissions.md`
  - `reference_eng/04-path-github-copilot-cli-trusted-folders-config.md`
- Copilot 在组织/企业维度有可配置的策略概念（feature/privacy/models 等），支持从个人偏好升级到组织政策。
  - `reference_eng/04-path-github-copilot-policies-concepts.md`
- 大规模 prompt 管理实证显示：prompt 资产在 GitHub 上会出现格式不一致、重复、可读性与拼写问题等，并指出 prompts 与 Git 的管理范式存在阻抗不匹配且缺少 prompt QA gatekeeping；这强化了“指令资产必须像代码一样治理”的必要性。
  - `reference_eng/04-path-li-et-al-understanding-prompt-management-github-repos-arxiv-2509-12421.md`

### B. “Agentic SDLC”在企业产品里已具备形态，但自带限制与风险面

- Copilot cloud agent 的官方定义展示了一个可审计的异步工作流：在 GitHub 上研究 repo、制定计划、在分支上修改并可开 PR；运行于 GitHub Actions 的 ephemeral 环境，并列出多项限制（含 rulesets、content exclusions 等）。
  - `reference_eng/04-path-github-copilot-cloud-agent-about.md`
- 官方 pilot guide 给出 rollout playbook（如何试点、需要哪些权限与配置），可作为“团队采纳路线”的硬证据。
  - `reference_eng/04-path-github-copilot-cloud-agent-pilot-guide.md`

### C. 风险分类与治理趋势

- OWASP LLM Top 10 提供了可复用的风险分类语言（prompt injection、supply chain、plugin risk、excessive agency 等），可作为团队治理章节的“风险地基”。
  - `reference_eng/04-path-owasp-top-10-llm-apps-v1-1.md`
- Cursor 的 team marketplace/插件治理趋势显示：技能/插件生态正在向“私有化分发 + 团队集中治理”演化（可视作行业信号）。
  - `reference_eng/04-path-cursor-plugins-marketplace-team-governance-2026-02-17.md`

### D. 真实采纳与度量：别把“感觉更快”当作“可证的提升”

- 纵向混合方法企业案例（NAV IT）显示：Copilot users 在采用前就更活跃（选择偏差风险）；采用后 commit-based activity 指标并无统计显著变化，但主观生产力体验可能提升，提示必须采用多维度度量而非单一活动指标。
  - `reference_eng/04-path-stray-brandtzaeg-wivestad-et-al-copilot-longitudinal-case-study-arxiv-2509-20353.md`
- GitHub 的 case study 把“感知生产力”与 telemetry 关联起来，指出 acceptance rate 更能驱动 perceived productivity，而更细的 persistence 指标未必更能解释主观收益；同时给出 completion funnel（shown→accepted→persistence）作为可复用的 pilot 度量语言。
  - `reference_eng/04-path-ziegler-kalliamvakou-et-al-productivity-assessment-neural-code-completion-arxiv-2205-06537.md`
- Zoominfo 的企业部署案例（400+ 开发者）给出系统化四阶段 rollout，并使用 acceptance + developer satisfaction 作为核心评估组合，且讨论语言差异与限制，属于“可复用 rollout 模板”证据（需标注 practitioner 强度）。
  - `reference_eng/04-path-zoominfo-copilot-deployment-productivity-arxiv-2501-13282.md`
- “Sea Change” 报告（n≈934k）强调 acceptance-rate-as-impact 的行业口径，并声称“效应随时间增长/对经验更少者更大”；适合作为趋势信号与“度量误用风险”的对照材料，而不是单独作为严肃因果证据。
  - `reference_eng/04-path-sea-change-ai-powered-developer-lifecycle-arxiv-2306-15033.md`

## 二轮可用的判断（证据强度说明）

- 强事实：存在可执行的治理控制面（指令资产、权限、策略、试点流程、Actions 环境限制）。
  - 以上均来自 GitHub 官方 docs。
- 趋势判断：团队级 marketplace/私有分发是一个可能上升的方向，但需要更多生态对照与采纳数据支持（目前偏“信号”）。
  - `reference_eng/04-path-cursor-plugins-marketplace-team-governance-2026-02-17.md`
