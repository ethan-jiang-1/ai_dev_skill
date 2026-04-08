# github/spec-kit: README

- source_url: https://github.com/github/spec-kit
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: Spec Kit 把 Spec-Driven Development（规约驱动）落成一套可执行的分阶段命令与工件链路（constitution/spec/plan/tasks/implement + clarify/analyze/checklist），并显式处理“多宿主命令暴露方式差异”和“社区扩展不审计”的治理边界，是研究“契约驱动派”框架的权威样本。

## Key Facts

- 定位：README 将 Spec-Driven Development 描述为让规格说明“变成可执行（executable）”，用于替代 vibe coding 的一次性聊天式开发。
- CLI 与初始化：README 提供 `specify` CLI 的安装与 `specify init` 初始化入口，并强调可 pin 到特定 release tag 以获得稳定性（对照 Releases）。
- 核心命令链路（README 列出）：`/speckit.constitution`（项目原则/治理）→ `/speckit.specify`（需求与用户故事）→ `/speckit.plan`（技术实现计划）→ `/speckit.tasks`（任务拆解）→ `/speckit.implement`（执行实现）。
- 扩展命令：README 列出 `/speckit.clarify`（消歧）、`/speckit.analyze`（跨工件一致性/覆盖分析）、`/speckit.checklist`（质量检查清单）等，体现“漏验证/歧义”作为一等风险对象被显式处理。
- 多宿主差异：README 明确多数 agents 以 `/speckit.*` slash commands 暴露；Codex CLI 在 skills mode 下使用 `$speckit-*` 形式。
- 社区扩展边界：README 对 community extensions 明确声明“不审计、不背书、不支持 extension code”，并提示用户在安装使用前审查源码。

## Claims Supported

- “规约先行”的框架会把项目原则/需求/计划/任务/实现拆成强制阶段与工件，从机制上降低歧义与跑偏风险。（主题4 framework）
- “框架扩展生态”会带来 supply chain 风险与责任边界问题，因此官方往往会显式声明 extension code 不被审计/背书。（主题4 framework；与主题2 dist/安全交叉）

## Captured Excerpts (keep short)

> Most agents expose spec-kit as `/speckit.*` slash commands; Codex CLI ... uses `$speckit-*` instead.

## Terms / Concepts

- Spec-Driven Development (SDD)
- constitution / specs / plan / tasks
- clarify / analyze / checklist
- community extensions (not audited)

## Risks / Limits

- README 覆盖命令与理念，但对“工件具体格式/强制门禁/失败模式”的细节需要进一步下钻到 docs（GitHub Pages）与项目模板文件。

