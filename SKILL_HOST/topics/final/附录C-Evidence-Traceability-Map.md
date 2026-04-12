# 附录 C：Evidence Traceability Map

> 核心判断到证据的完整回溯地图。
>
> 遵循 30-second recallability 标准：任何关键断言都能在 30 秒内回溯到具体证据。

---

## 使用说明

本附录为主 Playbook 中的每个核心判断提供证据回溯路径。格式为：

- **判断**：主 Playbook 中的关键断言
- **来源**：artifacts 文件（已提炼的综合判断）
- **支撑证据**：reference 文件（原始证据）

所有 reference 文件路径相对于 `/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference/`。

---

## 第 2 章：3-Layer 生态模型

### 判断 2.1：Skills 是 3-layer ecosystem

**来源**：`_artifacts/W2-cross-topic-synthesis-draft.md` 第 1 点

**支撑证据**：
- `00-shared-agent-skills-specification.md` — spec layer 定义
- `00-shared-agent-skills-integration-guide.md` — spec layer 集成指南
- `00-shared-agent-skills-quickstart-cross-host-paths.md` — shared convention layer 路径约定
- `00-shared-skills-cli-management-and-updates.md` — shared convention layer lifecycle
- `02-claude-code-directory-scope-and-persistence.md` — Claude Code runtime layer
- `03-codex-agents-md-layering-and-instruction-chain.md` — Codex runtime layer
- `04-cursor-rules-agents-and-skill-boundary.md` — Cursor runtime layer
- `05-opencode-skills-rules-and-instructions-bridge.md` — OpenCode runtime layer

### 判断 2.2：Progressive Disclosure 是核心设计原则

**来源**：`_artifacts/W2-cross-topic-synthesis-draft.md` 第 1 点

**支撑证据**：
- `00-shared-agent-skills-specification.md` — 规范明确要求 progressive disclosure
- `00-shared-agent-skills-integration-guide.md` — 集成指南说明加载顺序

### 判断 2.3：Format portability 已解决，runtime portability 仍是 host-by-host 问题

**来源**：`_artifacts/W2-cross-topic-synthesis-draft.md` 第 1 点

**支撑证据**：
- `06-claude-to-codex-tool-mapping-and-subagent-translation.md` — tool mapping 需求说明 runtime 差异
- `08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md` — install spread ≠ semantic portability

---

## 第 3 章：四大 Host 的 Runtime Contract

### 判断 3.1：Claude Code 最强 Workflow Composition

**来源**：`_artifacts/W2-host-capability-matrix.md` Claude Code 行

**支撑证据**：
- `02-claude-code-hooks-subagents-and-skill-composition.md` — composition stack 详解
- `00-shared-claude-code-skills-2026-operational-signals.md` — operational complexity 信号
- `02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md` — permission gates
- `02-claude-code-plugin-marketplaces-and-versioning.md` — marketplace 和 versioning

### 判断 3.2：Codex 最强 Engineered Clarity

**来源**：`_artifacts/W2-host-capability-matrix.md` Codex 行

**支撑证据**：
- `03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md` — constraint visibility 详解
- `03-codex-skills-locations-lifecycle-and-policy.md` — lifecycle governance
- `00-shared-codex-model-requirements-and-context-windows.md` — model transparency
- `03-codex-subagents-runtime-controls-and-cost.md` — runtime controls 和 cost

### 判断 3.3：Cursor 最强 IDE-Native Layering

**来源**：`_artifacts/W2-host-capability-matrix.md` Cursor 行

**支撑证据**：
- `04-cursor-rules-agents-and-skill-boundary.md` — IDE-native layering 详解
- `04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md` — execution topology expansion
- `04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md` — server-side routing issue（runtime maturity gap 的证据）
- `06-cursor-cross-tool-skill-duplication-and-dedup-gap.md` — duplicate-loading bug

### 判断 3.4：OpenCode 最强 Compatibility Bridge

**来源**：`_artifacts/W2-host-capability-matrix.md` OpenCode 行

**支撑证据**：
- `00-shared-opencode-skills-and-rules-compatibility.md` — compatibility bridge 详解
- `05-opencode-skills-rules-and-instructions-bridge.md` — explicit bridge 机制
- `05-opencode-permissions-granularity-and-command-policy.md` — explicit constraint model
- `05-opencode-model-flexibility-and-provider-surface.md` — provider flexibility 和 drift risk

---

## 第 4 章：可移植性分层

### 判断 4.1：7 层可移植性框架

**来源**：`_artifacts/W2-portability-layers-and-breakpoints.md` 完整框架

**支撑证据**（按层）：
- Layer 1 (Format): `00-shared-agent-skills-specification.md`
- Layer 2 (Discovery): `00-shared-skills-cli-management-and-updates.md`, `06-cross-host-sync-skills-normalization-and-path-drift.md`
- Layer 3 (Workflow-method): `07-technical-writer-skill-patterns-and-install-flow.md`
- Layer 4 (Execution-topology): `04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md`
- Layer 5 (Runtime-orchestration): `02-claude-code-hooks-subagents-and-skill-composition.md`, `03-codex-subagents-runtime-controls-and-cost.md`
- Layer 6 (Tool-surface): `06-claude-to-codex-tool-mapping-and-subagent-translation.md`
- Layer 7 (External dependency): `08-valyu-powered-search-skill-requirements.md`

### 判断 4.2：大部分困惑来自把 7 层压缩成一个 yes/no 问题

**来源**：`_artifacts/W2-portability-layers-and-breakpoints.md` "Strong provisional conclusion"

**支撑证据**：
- `08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md` — install spread ≠ semantic portability 的实例

---

## 第 5 章：两大应用线

### 判断 5.1：Writing skills 高可移植性（workflow-method layer）

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Writing vs deep research"

**支撑证据**：
- `07-technical-writer-skill-patterns-and-install-flow.md` — technical writing patterns
- `07-good-prose-human-style-reuse-pattern.md` — style reuse pattern
- `07-document-writer-writing-skill-registry-signal.md` — registry signal

### 判断 5.2：Deep research skills 是可移植性压力测试

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Writing vs deep research"

**支撑证据**：
- `08-deep-research-skill-evidence-mapping-and-parallel-drafting.md` — evidence mapping 和 parallel drafting 需求
- `08-deep-research-agent-source-evaluation-pipeline.md` — source evaluation pipeline
- `08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md` — multi-host adoption 和 drift
- `06-mcp-research-skill-definition-tool-selection-and-quality-rules.md` — tool selection 需求

### 判断 5.3："能搜"≠"能做 deep research"

**来源**：Topic 08 核心问题

**支撑证据**：
- `08-deep-research-skill-basic-systematic-pattern.md` — basic pattern（只是流程）
- `08-deep-research-skill-evidence-mapping-and-parallel-drafting.md` — orchestration 型（真正的 research）
- `08-research-lookup-deterministic-routing-skill.md` — deterministic routing（backend selection）

---

## 第 6 章：Baseline 工作流

### 判断 6.1：Sync 模式（canonical source + mirror sync）

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Key 2026 portability moves"

**支撑证据**：
- `06-claude-codex-mirror-sync-hook-and-canonical-source.md` — canonical source + sync hook 实现
- `06-skills-sync-cli-tool-and-central-skills-yaml.md` — skills sync CLI tool
- `06-cross-host-sync-skills-normalization-and-path-drift.md` — path drift 问题

### 判断 6.2：Translate 模式（tool names、subagent labels、plan semantics）

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Key 2026 portability moves"

**支撑证据**：
- `06-claude-to-codex-tool-mapping-and-subagent-translation.md` — tool mapping 和 subagent translation 详解

### 判断 6.3：Delegate 模式（wrap another host as worker）

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Key 2026 portability moves"

**支撑证据**：
- `06-skill-codex-claude-plugin-delegation-and-runtime-contract.md` — delegation 和 runtime contract
- `06-cross-host-codex-claude-loop-example.md` — delegation 实例

### 判断 6.4：Authoring Hygiene

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Skill authoring hygiene"

**支撑证据**：
- `06-optimize-skills-skill-definition-and-quality-heuristics.md` — quality heuristics（triggering discipline + progressive disclosure targets）

---

## 第 7 章：护栏与陷阱

### 判断 7.1：不要假设 tool 可用性

**来源**：`_artifacts/W2-host-selection-and-portability-decision-framework.md` Decision 5 "Warning signs"

**支撑证据**：
- `02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md` — Claude Code 的 permission gates
- `03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md` — Codex 的 approval/sandbox/search modes
- `05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md` — OpenCode 的 provider-gated websearch
- `04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md` — Cursor 的 server-side routing issue

### 判断 7.2：Install spread ≠ semantic portability

**来源**：`_artifacts/W2-host-selection-and-portability-decision-framework.md` Decision 5 "Warning signs"

**支撑证据**：
- `08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md` — multi-host adoption 但有 runtime-assumption drift

### 判断 7.3：Cross-host scanning 可能导致 duplicate-loading

**来源**：`_artifacts/W2-host-selection-and-portability-decision-framework.md` Decision 5 "Warning signs"

**支撑证据**：
- `06-cursor-cross-tool-skill-duplication-and-dedup-gap.md` — Cursor 的 duplicate-loading bug
- `06-skills-sync-example-skills-yaml-wildcards-and-exclusions.md` — 需要 exclusions 控制

### 判断 7.4：Research skills ≠ better search skills

**来源**：`_artifacts/W2-host-selection-and-portability-decision-framework.md` Decision 5 "Warning signs"

**支撑证据**：
- `08-deep-research-skill-evidence-mapping-and-parallel-drafting.md` — 真正的 research 包含 decomposition、validation、evidence discipline、output control

---

## 第 8 章：下一步与 Open Issues

### 判断 8.1：官方迁移契约缺失

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Remaining gaps"

**支撑证据**：
- `_artifacts/W2-round1-readiness-check.md` "Suspended branches" — official host-sanctioned migration guidance remains scarce

### 判断 8.2：Interoperability 主要依赖 sync/translate/delegate 实践证据

**来源**：`_artifacts/W2-round1-closeout-summary.md` "Remaining gaps"

**支撑证据**：
- `06-claude-codex-mirror-sync-hook-and-canonical-source.md`
- `06-claude-to-codex-tool-mapping-and-subagent-translation.md`
- `06-skill-codex-claude-plugin-delegation-and-runtime-contract.md`

---

## 核心综合判断的来源

### 2026 年最重要的转变

**判断**：问题不再是"哪个 host 有 skills"，而是"哪个 host 的 runtime contract 足够明确"

**来源**：`_artifacts/W2-round1-closeout-summary.md` "The most important 2026 shift"

**支撑证据**：
- `03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md` — Codex 明确的 constraints
- `02-claude-code-permission-modes-and-protected-paths.md` — Claude Code 的 permission modes
- `05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md` — OpenCode 的 provider gates
- `04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md` — Cursor 的 hidden constraints

---

## Reference Index 入口

完整的 reference 文件索引位于：`/Users/bowhead/ai_dev_skill/SKILL_HOST/topics/_reference/_INDEX.md`

该索引按 topic 组织，包含：
- Shared Ground Truth（22 个文件）
- Topic 02 Claude Code（10 个文件）
- Topic 03 Codex（10 个文件）
- Topic 04 Cursor（10 个文件）
- Topic 05 OpenCode（10 个文件）
- Topic 06 Cross-Host（13 个文件）
- Topic 07 Writing Skills（16 个文件）
- Topic 08 Deep Research Skills（10 个文件）

总计 91 个 reference 文件。

---

> 注意：本附录遵循 30-second recallability 标准。如果你对主 Playbook 中的任何断言有疑问，应该能在 30 秒内通过本附录找到支撑证据的具体文件路径。
