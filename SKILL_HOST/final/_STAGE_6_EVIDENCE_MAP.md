# Phase 2: Stage 6 证据映射表

## 核心判断与证据回溯

### 1. 3-Layer 生态模型

**判断**：Skills 在 2026 年是一个 3-layer 生态：spec layer / shared convention layer / host runtime layer

**证据来源**：
- `_artifacts/W2-cross-topic-synthesis-draft.md` 第 1 点
- `_reference/00-shared-agent-skills-specification.md` — spec layer 定义
- `_reference/00-shared-agent-skills-integration-guide.md` — spec layer 集成指南
- `_reference/00-shared-agent-skills-quickstart-cross-host-paths.md` — shared convention layer 路径约定
- `_reference/00-shared-skills-cli-management-and-updates.md` — shared convention layer lifecycle
- `_reference/02-claude-code-directory-scope-and-persistence.md` — Claude Code runtime layer
- `_reference/03-codex-agents-md-layering-and-instruction-chain.md` — Codex runtime layer
- `_reference/04-cursor-rules-agents-and-skill-boundary.md` — Cursor runtime layer
- `_reference/05-opencode-skills-rules-and-instructions-bridge.md` — OpenCode runtime layer

---

### 2. 2026 年核心转变

**判断**：问题不再是"哪个 host 有 skills"，而是"哪个 host 的 runtime contract 足够明确"

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "The most important 2026 shift"
- `_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md` — Codex 明确的 constraint visibility
- `_reference/02-claude-code-permission-modes-and-protected-paths.md` — Claude Code 的 permission modes
- `_reference/05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md` — OpenCode 的 provider-gated websearch
- `_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md` — Cursor 的 hidden backend constraints

---

### 3. 7 层可移植性框架

**判断**：可移植性不是 yes/no，而是分 7 层，从 format（最强）到 external dependency（最弱）

**证据来源**：
- `_artifacts/W2-portability-layers-and-breakpoints.md` 完整框架
- Layer 1 (Format): `_reference/00-shared-agent-skills-specification.md`
- Layer 2 (Discovery): `_reference/00-shared-skills-cli-management-and-updates.md`, `_reference/06-cross-host-sync-skills-normalization-and-path-drift.md`
- Layer 3 (Workflow-method): `_reference/07-technical-writer-skill-patterns-and-install-flow.md`
- Layer 4 (Execution-topology): `_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md`
- Layer 5 (Runtime-orchestration): `_reference/02-claude-code-hooks-subagents-and-skill-composition.md`, `_reference/03-codex-subagents-runtime-controls-and-cost.md`
- Layer 6 (Tool-surface): `_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md`
- Layer 7 (External dependency): `_reference/08-valyu-powered-search-skill-requirements.md`

---

### 4. Claude Code: 最强 Workflow Composition

**判断**：Claude Code 有最强的 workflow composition 能力（skill + hook + subagent + MCP + plugin），但 operationally heavier

**证据来源**：
- `_artifacts/W2-host-capability-matrix.md` Claude Code 行
- `_reference/02-claude-code-hooks-subagents-and-skill-composition.md` — composition 能力
- `_reference/00-shared-claude-code-skills-2026-operational-signals.md` — operational complexity
- `_reference/02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md` — permission gates

---

### 5. Codex: 最强 Engineered Clarity

**判断**：Codex 有最强的 engineered clarity，constraints 明确可见（approvals/sandbox/search modes），但 cost-sensitive

**证据来源**：
- `_artifacts/W2-host-capability-matrix.md` Codex 行
- `_reference/03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md` — 明确的 constraint visibility
- `_reference/03-codex-skills-locations-lifecycle-and-policy.md` — lifecycle governance
- `_reference/00-shared-codex-model-requirements-and-context-windows.md` — model transparency
- `_reference/03-codex-subagents-runtime-controls-and-cost.md` — cost controls

---

### 6. Cursor: 最强 IDE-Native Layering

**判断**：Cursor 有最强的 IDE-native layering 和最快的 multi-environment expansion，但 runtime maturity uneven

**证据来源**：
- `_artifacts/W2-host-capability-matrix.md` Cursor 行
- `_reference/04-cursor-rules-agents-and-skill-boundary.md` — IDE-native layering
- `_reference/04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md` — execution topology expansion
- `_reference/04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md` — server-side routing issue (runtime maturity gap)
- `_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md` — duplicate-loading bug

---

### 7. OpenCode: 最强 Compatibility Bridge

**判断**：OpenCode 有最强的 compatibility/bridge 能力和 provider flexibility，但 drift risk high

**证据来源**：
- `_artifacts/W2-host-capability-matrix.md` OpenCode 行
- `_reference/00-shared-opencode-skills-and-rules-compatibility.md` — compatibility bridge
- `_reference/05-opencode-skills-rules-and-instructions-bridge.md` — explicit bridge across skills/rules/agents
- `_reference/05-opencode-permissions-granularity-and-command-policy.md` — explicit constraint model
- `_reference/05-opencode-model-flexibility-and-provider-surface.md` — provider flexibility & drift risk

---

### 8. Sync 模式

**判断**：Sync 模式通过 canonical source + mirror sync 解决多 native directory 共存问题

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Key 2026 portability moves"
- `_reference/06-claude-codex-mirror-sync-hook-and-canonical-source.md` — canonical source + sync hook
- `_reference/06-skills-sync-cli-tool-and-central-skills-yaml.md` — skills sync CLI tool
- `_reference/06-cross-host-sync-skills-normalization-and-path-drift.md` — path drift problem

---

### 9. Translate 模式

**判断**：Translate 模式通过翻译 tool names、subagent labels、plan semantics 解决 host-shaped call shape 问题

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Key 2026 portability moves"
- `_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md` — tool mapping & subagent translation

---

### 10. Delegate 模式

**判断**：Delegate 模式通过将另一个 host 作为 worker 解决 native equivalence 难题

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Key 2026 portability moves"
- `_reference/06-skill-codex-claude-plugin-delegation-and-runtime-contract.md` — delegation & runtime contract
- `_reference/06-cross-host-codex-claude-loop-example.md` — delegation example

---

### 11. Writing Skills: 高可移植性

**判断**：Writing skills 在 workflow-method layer 高度可移植（rules、checklists、examples、style contracts）

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Writing vs deep research"
- `_reference/07-technical-writer-skill-patterns-and-install-flow.md` — writing skill patterns
- `_reference/07-document-writer-writing-skill-registry-signal.md` — registry signal
- `_reference/07-good-prose-human-style-reuse-pattern.md` — reuse pattern

---

### 12. Deep Research Skills: 可移植性压力测试

**判断**：Deep research skills 是可移植性压力测试，依赖 tool availability、permissions、parallel execution、evidence discipline

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Writing vs deep research"
- `_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md` — multi-host adoption & drift
- `_reference/08-deep-research-skill-evidence-mapping-and-parallel-drafting.md` — evidence mapping
- `_reference/08-deep-research-agent-source-evaluation-pipeline.md` — source evaluation pipeline
- `_reference/06-mcp-research-skill-definition-tool-selection-and-quality-rules.md` — MCP research skill

---

### 13. Authoring Hygiene

**判断**：跨 host authoring hygiene 的核心是：保持 format portability 容易，将 fragile steps 推入 scripts，将 runtime assumptions 视为 host-specific shells

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Skill authoring hygiene"
- `_reference/06-optimize-skills-skill-definition-and-quality-heuristics.md` — quality heuristics
- `_reference/00-shared-agent-skills-best-practices.md` — best practices

---

### 14. Duplicate-Loading 陷阱

**判断**：跨 host 扫描可能导致 duplicate-loading 和 version ambiguity，需要 dedup/precedence rules

**证据来源**：
- `_artifacts/W2-portability-layers-and-breakpoints.md` "Practical breakpoint rules"
- `_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md` — Cursor duplicate-loading bug
- `_reference/06-skills-sync-example-skills-yaml-wildcards-and-exclusions.md` — exclusions for dedup

---

### 15. Install Spread ≠ Semantic Portability

**判断**：一个 skill 能在多个 host install 不代表它能正确运行（runtime-assumption drift）

**证据来源**：
- `_artifacts/W2-host-selection-and-portability-decision-framework.md` "Warning sign: it installs everywhere"
- `_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md` — adoption vs drift

---

### 16. Suspended Branches

**判断**：官方 host-sanctioned migration contracts 仍然稀缺，当前互操作主要依赖 sync/translate/delegate 实践证据

**证据来源**：
- `_artifacts/W2-round1-closeout-summary.md` "Remaining gaps"
- `_artifacts/W2-round1-readiness-check.md` "Suspended branches"
- `_reference/_INDEX.md` 中没有官方迁移契约相关的 reference

---

## 映射完整性检查

- ✅ 所有核心判断都有 artifacts 来源
- ✅ 关键断言都有 reference 文件支撑
- ✅ 每个 Host 的特征都有多个 reference 交叉验证
- ✅ 3 大跨 host 模式都有具体 reference 支持
- ✅ 2 大应用线都有 registry signals 和 pattern 文件
- ✅ Suspended branches 明确标注证据缺失

**Stage 6 完成**：证据映射表已建立，可以进入 Stage 7 组装主 Playbook。
