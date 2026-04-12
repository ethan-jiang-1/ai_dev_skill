# Phase 1: Stage 0-3 基础建设产出

## Stage 0: Workspace Inventory

### 材料清单
- **8 个 Topic 文档**：01-08，涵盖 Skill 基础、4 个 Host 深潜、跨主机对比、2 个应用线
- **91 个 reference 文件**：原始证据，已通过 `_reference/_INDEX.md` 索引
- **24 个 artifacts 文件**：
  - 8 个 evidence summary（每个 topic 一个）
  - 8 个 question list
  - 1 个 shared ground truth evidence summary
  - 5 个 Wave 2 综合文件（cross-topic synthesis、host capability matrix、portability layers、decision framework、closeout summary）
  - 2 个 readiness check
- **证据与综合比**：约 10:1，材料质量高

### High-Value Skeleton List（按优先级）
1. **W2-round1-closeout-summary.md** — 最高优先级，Round 1 核心判断提炼
2. **W2-cross-topic-synthesis-draft.md** — 8 点完整综合分析
3. **W2-host-capability-matrix.md** — 4 host 对比矩阵
4. **W2-portability-layers-and-breakpoints.md** — 7 层可移植性框架
5. **W2-host-selection-and-portability-decision-framework.md** — 5 个决策问题
6. **00-topic-registry.md** — 导航和边界定义

### 关键发现
- **状态**：Round 1 已 closeout-ready，所有 topic 都是 `near_evidence_complete`
- **30-second traceability**：通过，大部分判断都能回溯到 reference
- **Cross-topic synthesis**：通过，Wave 2 artifacts 已覆盖分层、可移植性、host 对比、决策框架
- **Handoff readiness**：基本通过，新维护者可以跟随 references 和 artifacts

---

## Stage 1: Reader Outcome

### Package Object Statement
这份 Playbook 研究 **2026 年 AI Coding Skills 生态的实战工程指南**，聚焦 4 大主流 Host（Claude Code、Codex、Cursor、OpenCode）的 runtime contract 差异、可移植性分层、以及跨 host 工作的实战模式。

### Reader Job Statement
帮助 AI Coding Engineer **从"看到 skills 到处都是但不知道怎么选、怎么用"，到"能根据工作流选择合适的 host、评估 skill 可移植性、跨 host 工作时避开陷阱"**。

### Reader Stuck Point
读者原本卡在：
1. **Host 选择困惑**：Claude Code、Cursor、Codex、OpenCode 都支持 skills，不知道选哪个
2. **可移植性误解**：以为 SKILL.md 格式通用就能直接复用，忽略了 runtime contract 差异
3. **复用风险盲区**：GitHub 上有很多 skill 仓库，但不知道哪些能直接用、哪些有 stale assumptions
4. **跨 host 工作无方法**：不知道什么时候该 sync、translate、delegate，什么时候该写新 skill

### Scope Card

**In Scope**：
- 2026 年 4 大 Host 的 runtime contract 对比
- Skills 的 3-layer 生态模型（spec / shared convention / host runtime）
- 7 层可移植性框架及其 breakpoints
- Sync / Translate / Delegate 三大跨 host 模式
- Writing skills 和 Deep research skills 两大应用线
- Authoring hygiene 和护栏

**Out of Scope**：
- 具体 skill 的完整代码实现（只提供代表性样本拆解）
- 历史演进（只聚焦 2026 年现状）
- 非主流 Host 或实验性工具
- Skill 开发的编程语言细节

### Final Question
**2026 年，当我需要使用或编写 AI Coding Skills 时，应该选择哪个 Host、如何评估 skill 的可移植性、以及如何在多 host 环境中高效工作？**

---

## Stage 2: Material Audit

### 材料分层

#### Registry Layer
- `00-topic-registry.md` — 用于理解 topic 拆分逻辑和边界，不直接进入 final 正文

#### Topic Research Layer
- 8 个 topic 文档 — 用于补充机制细节和趋势分析，选择性引用关键部分

#### Reference Evidence Layer
- 91 个 reference 文件 — 用于证据回溯和验证关键断言，不全文搬运

#### Shared Synthesis Layer（最高价值）
- **W2-cross-topic-synthesis-draft.md** — 主 Playbook 骨架的核心来源
- **W2-host-capability-matrix.md** — 附录 A 的直接来源
- **W2-portability-layers-and-breakpoints.md** — 附录 B 的核心框架
- **W2-host-selection-and-portability-decision-framework.md** — 主 Playbook 第 6 章（Baseline 工作流）的决策树来源
- **W2-round1-closeout-summary.md** — 核心判断的最终提炼

#### Status / Readiness Layer
- `W2-round1-readiness-check.md` — 用于确认材料稳定性，不进入 final

### Material Quality Matrix

| Topic | 证据强度 | 判断稳定性 | 用途 |
|-------|---------|-----------|------|
| 01 Skill Foundations | A | 高 | 主 Playbook 第 2 章（3-layer 模型） |
| 02 Claude Code | A | 高 | 主 Playbook 第 3 章 + 附录 A |
| 03 Codex | A | 高 | 主 Playbook 第 3 章 + 附录 A |
| 04 Cursor | A | 中高 | 主 Playbook 第 3 章 + 附录 A（注意 runtime maturity uneven） |
| 05 OpenCode | A | 高 | 主 Playbook 第 3 章 + 附录 A |
| 06 Cross-Host | A | 高 | 主 Playbook 第 4 章（可移植性）+ 附录 B |
| 07 Writing Skills | A | 高 | 主 Playbook 第 5 章（应用线 1） |
| 08 Deep Research | A | 高 | 主 Playbook 第 5 章（应用线 2） |

**结论**：所有 topic 都达到 A 级，可以直接从 artifacts 提取判断。

---

## Stage 3: Stable Judgments Extraction

### Hard Facts（硬事实）

1. **3-layer 生态模型**（来自 W2-cross-topic-synthesis 第 1 点）
   - Spec layer：SKILL.md + frontmatter + progressive disclosure
   - Shared convention layer：目录约定 + registry/CLI lifecycle
   - Host runtime layer：persistent rules + plugins + subagents + hooks + MCP + approvals/sandbox + tool availability + model/context exposure

2. **2026 年核心转变**（来自 W2-round1-closeout-summary）
   - 问题不再是"哪个 host 有 skills"
   - 而是"哪个 host 的 runtime contract 足够明确"

3. **7 层可移植性框架**（来自 W2-portability-layers）
   - Layer 1: File format portability（最强）
   - Layer 2: Discovery and install portability（中等）
   - Layer 3: Workflow-method portability（中等）
   - Layer 4: Execution-topology portability（弱）
   - Layer 5: Runtime-orchestration portability（弱）
   - Layer 6: Tool-surface and backend-policy portability（弱）
   - Layer 7: External dependency portability（最弱）

### Classifications（分类）

1. **4 Host 能力矩阵**（来自 W2-host-capability-matrix）
   - Claude Code：最强 workflow composition，但 operationally heavier
   - Codex：最强 engineered clarity，但 cost-sensitive
   - Cursor：最强 IDE-native layering，但 runtime maturity uneven
   - OpenCode：最强 compatibility bridge，但 drift risk high

2. **跨 host 工作的 5 种模式**（来自 W2-host-selection-and-portability-decision-framework）
   - Format portability：直接复用
   - Discovery/install portability：验证路径约定
   - Mirror-governance portability：canonical source + sync
   - Translation portability：翻译 call shape
   - Delegation portability：host-to-host 委托

### Practice Paths（实践路径）

1. **Sync 模式**（来自 W2-round1-closeout-summary）
   - 选择 canonical source
   - 自动化 mirror sync
   - 避免 path drift

2. **Translate 模式**
   - 翻译 tool names
   - 翻译 subagent labels
   - 翻译 plan semantics

3. **Delegate 模式**
   - 将另一个 host 作为 worker
   - 不强求 native equivalence

4. **Authoring Hygiene**（来自 W2-round1-closeout-summary）
   - 保持 format portability 容易（minimal metadata、clear description）
   - 将 fragile/deterministic steps 推入 scripts/resources
   - 将 runtime assumptions 视为 host-specific shells

### Guardrails（护栏）

1. **不要假设 tool 可用性**
   - WebSearch / WebFetch 在不同 host 有不同 permission gates
   - Subagent 可用性差异大

2. **不要忽略 approval/sandbox/permission 差异**
   - Codex 的 approval modes 很明确
   - Cursor 的 server-side routing 部分隐藏
   - OpenCode 的 provider-gated websearch

3. **不要盲目复制 GitHub skill**
   - Install spread ≠ semantic portability
   - 可能有 stale assumptions（year、tool names、model names）

4. **不要假设 cross-host scanning 是好事**
   - 没有 dedup/precedence rules 会导致 duplicate-loading
   - Version ambiguity

### Open Issues（未解决问题）

1. **官方迁移契约缺失**（Suspended branch）
   - 2026 年官方 host-sanctioned cross-host migration contracts 仍然稀缺
   - 当前互操作主要依赖 sync/translate/delegate 实践证据

2. **Repair-oriented failure cases 不足**
   - 已有 duplicate-loading 故障和 drift/constraint 故障
   - 缺少更多 before/after remediation steps 的案例

---

## 验证标准检查

- [x] 能回答"有几个 topic"：8 个
- [x] 能回答"为什么这样拆"：按 Skill 基础 + 4 Host + 跨主机 + 2 应用线
- [x] 能回答"证据在哪"：91 个 reference，通过 _INDEX.md 索引
- [x] 能回答"哪些草稿最接近 final"：5 个 Wave 2 artifacts
- [x] 能回答"研究什么"：2026 年 AI Coding Skills 生态的实战工程指南
- [x] 能回答"帮读者做什么"：从困惑到能选 host、评估可移植性、跨 host 工作
- [x] 能回答"从什么困惑到什么能力"：从"不知道怎么选、怎么用"到"能根据工作流做决策、避开陷阱"

**Stage 0-3 完成，可以进入 Stage 4-5。**
