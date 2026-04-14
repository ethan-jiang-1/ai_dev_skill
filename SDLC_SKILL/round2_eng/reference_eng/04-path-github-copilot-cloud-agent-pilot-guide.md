# Pilot GitHub Copilot Cloud Agent in Your Organization (GitHub Docs)

- source_url: https://docs.github.com/en/copilot/tutorials/cloud-agent/pilot-cloud-agent
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 04-path
- trust_level: official
- why_it_matters: Provides an explicit “team rollout playbook” for an agentic workflow: selecting repos, setting up instructions, adding setup steps, constraining permissions, and measuring outcomes. This is directly reusable for eng’s team adoption and governance chapter.
- claims_supported:
  - Piloting cloud agent is treated as a governance exercise (not only enable a feature): evaluate tasks, choose repos, set permissions, provide instructions, configure automation steps.
  - Uses repo files to guide agent behavior (`.github/copilot-instructions.md`, `copilot-setup-steps.yml`) and stresses safe defaults (e.g., PR approvals, limited repos).
  - Highlights risk areas (permissions, third-party MCP servers) and recommends controlled adoption.
- date_scope: docs page as of access date (2026-04-09)
- related_tools: GitHub Copilot cloud agent; repo instruction files; setup steps; MCP servers

## 关键事实

- 文档把 pilot 拆成多个治理导向步骤（页面目录呈现）：
  - evaluate tasks
  - select repositories
  - set up permissions
  - set up custom instructions and environment setup steps
  - enable copilot cloud agent
  - run the pilot and monitor progress
  - evaluate the pilot
- 文档强调用 repo 资产指导 agent：
  - `.github/copilot-instructions.md` 作为仓库级指令
  - `copilot-setup-steps.yml`（由 GitHub Actions 执行）用于设置额外环境依赖（例如安装依赖、数据库、运行命令等）
- 文档也强调 safe adoption：先小范围试点、对 PR 做审批、逐步扩展。

## 与本研究的关系

- 对 04-path（团队采纳）：
  - 这是“团队落地”一手操作模型：如何把 agent 的行为纳入 repo 资产与权限系统，并以 pilot 方式逐步扩大。
- 对 03-devlife（生命周期）：
  - setup steps + instructions 文件使 agent 的运行条件可复现，有助于把“会话技巧”转成可维护资产（类似 skill 的部署/稳态要求）。

## 可直接引用的术语 / 概念

- pilot / rollout
- `.github/copilot-instructions.md`
- `copilot-setup-steps.yml`
- permissions / repositories selection

## captured_excerpt

> "...set up custom instructions and environment setup steps..."

## 风险与局限

- 文档是“推荐流程”；真实企业环境下的合规/权限/审计要求可能更严格，且不同仓库类型（monorepo、microservices）会显著影响 setup steps 的复杂度。

