# OpenAI Codex Docs: Rules (prefix_rule, Smart Approvals, Command Policy, Tree-sitter Parsing for bash -lc)

- source_url: https://developers.openai.com/codex/rules
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 该文把“执行权限治理”落到可执行配置：通过 `prefix_rule` 对命令进行 allow/prompt/forbidden 判定，并提供可测试的 policy（match/not_match），还披露了对 `bash -lc` 的 tree-sitter 解析以避免命令走私。这是把 agent 权限从“口头规范”升级为“可审计、可回归的确定性门禁”的一手证据。
- claims_supported:
  - Codex 可通过 rules 将某些命令从 sandbox 外受控执行（只允许特定前缀）
  - `prefix_rule` 支持 allow/prompt/forbidden，并可声明 require_approval
  - 支持规则测试用例（match/not_match），把治理策略变成可回归资产
  - Smart approvals：对部分命令尝试解析与拆分，以阻止 `bash -lc` 等把危险命令隐藏在字符串里
  - 对 `bash -lc` 使用 tree-sitter（Bash grammar）解析内部脚本以做规则匹配，防止 policy 绕过
- date_scope: accessed 2026-04-09
- related_frameworks: Codex, governance-by-policy
- related_tools: prefix_rule, approvals, sandbox escape control, tree-sitter

## 关键事实

- Codex rules 的目的：在不放开全局执行权限的情况下，允许某些命令在 sandbox 外执行，并通过前缀约束把风险控制在可审计范围内。`source_url`
- `prefix_rule` 的结构包含：
  - `match`: 命令前缀（例如 `brew install`）
  - `decision`: `allow` / `prompt` / `forbidden`
  - 可选 `require_approval`: 进一步约束审批策略
  - `tests`: `match` / `not_match` 用例，作为回归。`source_url`
- Smart approvals：文档明确指出存在“命令走私”风险（例如把危险命令藏在 `bash -lc` 字符串中），因此会尝试解析与拆分命令以执行规则判断。`source_url`
- 对 `bash -lc` 的特殊处理：使用 tree-sitter 的 Bash grammar 解析脚本内容，从而能把 `bash -lc "rm -rf ~"` 这类内部命令暴露给 policy 匹配与拦截。`source_url`

## 与本研究的关系

- 为 `digested_cap/04` 的“治理负担/迁移价值”提供硬证据：企业落地 agentic SDLC 时，最关键的不只是“写规范”，而是把权限与审批落到可执行 policy 并具备回归测试。
- 也为“能力单元架构”的可迁移形态提供样本：prefix_rule/approvals 属于宿主专有实现，但其抽象（命令级 allow/prompt/deny + 回归测试）是跨宿主可迁移的治理模式。

## 可直接引用的术语 / 概念

- `prefix_rule`
- `decision: allow|prompt|forbidden`
- “Smart approvals”
- “tree-sitter Bash grammar”
- “match / not_match tests”

## captured_excerpt

摘录（来自文中 `bash -lc` 解析描述，保持简短）：

> “To mitigate these risks … we use tree-sitter's Bash grammar to parse the script …”

## 风险与局限

- 该文描述的是 Codex 的具体实现；其他宿主可能没有等价机制或语义不同，迁移时需要映射/降级策略。
- “允许 sandbox 外执行”本身会引入风险面，必须配套最小权限、审批链、审计与隔离（尤其在企业环境）。

