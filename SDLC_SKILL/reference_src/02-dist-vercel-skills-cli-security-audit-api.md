# vercel-labs/skills: Security advisory via Audit API (`add-skill.vercel.sh/audit`)

- source_url: https://github.com/vercel-labs/skills/blob/main/src/telemetry.ts
- source_type: official_repo
- accessed_at: 2026-04-09
- related_topic: dist
- trust_level: official
- why_it_matters: 之前对 Vercel `skills` CLI 的分发治理证据主要覆盖 lock files 与 hash-based 更新检查，但“安全/信任”链路证据不足。官方 CLI 代码实现包含一个非阻塞的 audit API 调用，并在安装前展示 Security Risk Assessments（来自多个审计源），这是分发层安全治理进入默认 UX 的实证。

## Key Facts

- CLI 内置 audit API endpoint：`AUDIT_URL = "https://add-skill.vercel.sh/audit"`，并提供 `fetchAuditData(source, skillSlugs, timeoutMs)` 拉取审计结果。（Ref: `src/telemetry.ts`）
- `fetchAuditData` 的设计目标是“advisory only”：任何错误/超时返回 `null`，并在注释中明确 “never blocks installation”。（Ref: `src/telemetry.ts`）
- 审计数据结构包含 `risk`（`safe/low/medium/high/critical/unknown`）与 `alerts/score/analyzedAt` 等字段；并按 skill 维度聚合。（Ref: `src/telemetry.ts`）
- 安装流程中会“提前并行”启动 audit 拉取（与 agent/scope/mode 的交互并行），并在安装摘要后渲染 `Security Risk Assessments` 表格；随后用户仍需确认 `Proceed with installation?`（非 `--yes` 场景）。（Ref: `src/add.ts`）
- `Security Risk Assessments` 的展示逻辑会读取多个审计源字段（如 `ath/socket/snyk`）并分别渲染风险/告警摘要。（Ref: `src/add.ts`）

## Claims Supported

- “Vercel Skills CLI 已出现安全治理 UX：在安装前展示第三方审计结果（advisory），把 supply-chain 风险信息前置到分发入口。”（主题 2 dist；趋势/难点）

## Captured Excerpts (keep short)

> Returns null on any error or timeout — never blocks installation.

## Terms / Concepts

- audit API (`https://add-skill.vercel.sh/audit`)
- Security Risk Assessments (advisory)
- risk levels (`safe/low/medium/high/critical`)

## Risks / Limits

- 该机制提供的是“风险提示/情报”而非加密级完整性保证；其覆盖面、误报/漏报与审计来源的可信度需要独立评估，且 audit API 本身是远端依赖。

