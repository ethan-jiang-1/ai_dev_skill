# OpenAI: Introducing Codex (Cloud Agent, AGENTS.md Guidance, Secure Execution, Early Enterprise Use Cases)

- source_url: https://openai.com/index/introducing-codex/
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 该文是 Codex（云端并行软件工程 agent）的官方一手说明，包含：AGENTS.md 作为 repo-level 指令工件的定位、可追溯证据（terminal logs/test outputs citations）、以及“安全执行（云容器隔离、默认无互联网）”的边界。还给出外部企业早期用例（Cisco/Temporal/Superhuman/Kodiak），为“能力单元迁移价值/企业采纳形态”提供官方证据。
- claims_supported:
  - Codex cloud 每个任务在独立云端 sandbox 环境中运行，并在完成后提交更改
  - Codex 用 citations 指向 terminal logs 与 test outputs，作为可复核证据链
  - Codex 可被 repo 内的 AGENTS.md 指导（类似 README.md 的项目指引工件）
  - Secure execution：任务执行期间默认禁用互联网访问，仅能访问 GitHub repo 内容与预装依赖（后续更新可能变化）
  - 有外部企业在探索 Codex 的真实用例与反馈路径（早期测试者名单）
- date_scope: page date 2025-05-16; update 2025-06-03 (internet access enabling); accessed 2026-04-09
- related_frameworks: Codex (Cloud), AGENTS.md
- related_tools: cloud sandbox container, terminal log citations, test outputs, GitHub repo preload

## 关键事实

- Codex 是 cloud-based software engineering agent，可并行处理任务；每个任务在“独立、隔离”的 cloud sandbox 环境中运行并预加载 repo。完成后会在其环境里 commit changes。`source_url`
- Codex 提供“可追溯证据”：通过引用 terminal logs 与 test outputs，让用户可回溯每一步。`source_url`
- Codex 可被 repo 内的 `AGENTS.md` 文件指导：用来告知代码结构、测试命令、项目惯例等（定位接近 README.md）。`source_url`
- Secure execution 边界（文中“Secure execution”小节）：任务执行期间互联网访问被禁用；agent 不能访问外部网站/API/service，仅能与 repo 与预装依赖交互。`source_url`
- 页面列出早期外部测试/设计伙伴的具体用例（Cisco/Temporal/Superhuman/Kodiak 等），覆盖 feature 开发、debug、tests、refactor、on-call triage 等场景。`source_url`

## 与本研究的关系

- 为 `digested_cap/04` 提供“迁移价值判断”的官方样本：AGENTS.md 作为 repo-level 指令工件已经在主流 agent 产品中被明确支持，并且与“可复核证据链（logs/tests citations）”绑定。
- 为能力单元架构提供边界事实：云端隔离 +（当时）默认无互联网，决定了哪些“能力单元”必须通过 repo 内工件、测试与可观测性来闭环，而不是依赖外部实时资源。

## 可直接引用的术语 / 概念

- “secure, isolated container”
- “internet access is disabled” (secure execution boundary; note update may change)
- “verifiable evidence … citations of terminal logs and test outputs”
- “guided by AGENTS.md”

## captured_excerpt

摘录（来自“How Codex works / Secure execution”相关段落，保持简短）：

> “Codex can be guided by AGENTS.md files placed within your repository.”

## 风险与局限

- 这是官方产品介绍文，包含产品定位与案例举例；对“质量/正确性/净收益”的结论需要结合独立实证与失败复盘。
- 页面明确存在 2025-06-03 更新（允许互联网访问），说明安全边界会随版本演化；落地时必须以当期官方 docs/配置为准。

