# QuasarByte/feature-driven-flow: README

- source_url: https://github.com/QuasarByte/feature-driven-flow
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: FDF 把 SDLC 治理落到“固定七阶段流程 + 规则矩阵编译 + 显式 gate + 可审计输出”，并同时提供 Codex 与 Claude Code 的实现与 repo-local overlays（`.codex/` 与 `.claude/`），是研究“审计治理派”与“规则系统工程化”的高密度一手样本。

## Key Facts

- 定位：README 将 FDF 定义为 markdown-first 的 AI delivery framework，用于 non-trivial changes；核心机制是固定七阶段工作流、将 policies 编译成 rule matrix，并通过 gates 记录可审计输出。
- 多宿主实现：README 声明该仓库是 source-of-truth，包含 Codex 实现、Claude Code 实现，以及两者共享的 runtime assets；并给出 runtime distribution repos（Codex 与 Claude）。
- 流程契约：README 明确流程顺序固定为 `Scope -> Explore -> Clarify -> Architect -> Implement -> Verify -> Summarize`，并列出 core invariants（不跳阶段；Clarify 不留关键歧义；Implement 必须显式用户批准；关闭前必须 Verify + Summarize）。
- 入口命令与技能：README 列出 Codex prompt entrypoint、Claude Code namespaced slash command，以及两端的 conductor skill 文件位置。
- 规则系统与覆写：README 列出规则优先级（core invariants、`AGENTS.md` policy、settings/packs、用户确认的 Effective Rule Matrix、active rules），并给出 repo-local overlays 的目录约定（Codex 用 `.codex/feature-driven-flow/...`，Claude 用 `.claude/feature-driven-flow/...`）。
- 工程化维护：README 列出 build/deploy/validation/manifest generation 等 maintainer tooling（PowerShell 脚本）与共享 schemas/settings/packs 等结构。

## Claims Supported

- “工程治理”可以被形式化为：固定阶段 + 不变量 + 显式批准 gate + 可复用的规则矩阵（policy compilation），从而提升可审计性与可重复性。（主题4 framework）
- 允许 repo-local overlays 与 `AGENTS.md` policy 进入优先级链路，反映框架在团队落地时必须处理“组织政策/项目差异”与“核心不变量”之间的兼容。（主题4 framework）

## Captured Excerpts (keep short)

> Do not reorder or skip phases.

## Terms / Concepts

- rule matrix / policy compilation
- gates / auditable outputs
- Effective Rule Matrix
- repo-local overlays (`.codex/` / `.claude/`)
- conductor skill

## Risks / Limits

- README 已足够解释结构，但对规则 schema、packs 与 validation 工具如何实际约束 agent 行为，仍需要补抓 `docs/specification.md` 与核心 rules/templates 作为机制细节证据。

