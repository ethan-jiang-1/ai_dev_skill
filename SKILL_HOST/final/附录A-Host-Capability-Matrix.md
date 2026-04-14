# 附录 A：Host Capability Matrix

> 四大 Host 能力对比详表，基于 2026 年 4 月的 evidence-backed 观察。
>
> 这些是 evidence-backed tendencies（有证据支持的倾向），不是 immutable truths（不变的真理）。

---

## 场景决策矩阵

**在看完整对比表之前，先用这张矩阵快速找到你的场景。**

| 你的场景 | 关键需求 | 推荐倾向 | 主要理由 |
|---------|---------|---------|---------|
| 快速复用现有 writing/docs skills | 低风险上手，方法论复用 | **任意 host** | Writing skills 主要在 Layer 3，四个 host 都能跑 |
| 运行复杂多步骤 workflow（subagents + hooks） | 最高 composition ceiling | **Claude Code** | 最成熟的 `skill + hook + subagent + MCP + plugin` 组合栈 |
| 需要 CI/合规/审计环境下的 skill 执行 | Explicit runtime governance | **Codex** | approval/sandbox/search controls 最透明，可配置 |
| 主要在 IDE 里工作，需要编辑器上下文感知 | IDE-native + async agents | **Cursor** | in-editor context 最强，execution topology 最广 |
| 测试 skill 跨 host 兼容性，或多 provider 环境 | Compatibility bridge | **OpenCode** | 支持最多路径格式，provider flexibility 最高 |
| 团队多人用不同 host，需要 skill 统一同步 | Mirror sync + canonical source | **OpenCode 或 Claude Code** | OpenCode 兼容性最广；Claude Code 组合能力最强 |
| 评估 deep research skill，比较 host 能力 | Orchestration + tool availability | **Claude Code**（初选）/ **Codex**（治理需求） | 两者的 orchestration contract 最明确 |
| 新手快速上手，不想踩太多坑 | 上手摩擦最低 | **Claude Code 或 Codex** | 文档和社区案例最多，runtime 行为最可预测 |

---

## 综合对比矩阵

| 维度 | Claude Code | Codex | Cursor | OpenCode |
|------|------------|-------|--------|----------|
| **Persistent Guidance** | `CLAUDE.md`、settings、rules、plugin governance | `AGENTS.md` chain、overrides、size caps | Project Rules、User Rules、`AGENTS.md`、deprecated `.cursorrules` | `AGENTS.md`、`CLAUDE.md`、`instructions` array、bridgeable rules |
| **Skill Discovery / Loading** | names + descriptions at start，full content on use，manual-only mode possible | progressive disclosure，repo/user/admin/system scopes，explicit disable controls | skills 和 subagents 是较新的 first-class features；dynamic layer 与 persistent rules 并存 | path compatibility across `.opencode`、`.claude`、`.agents`；permissive frontmatter parsing |
| **Distribution / Lifecycle** | marketplace plugins，semver，local override，reload，orphan cleanup | curated installs，bundled system skills，plugins for reusable distribution，feature maturity labels | 正在向 marketplace plugin bundles 方向发展（skills/subagents/MCP/hooks/rules 打包） | plugin pinning，compatibility toggles，explicit permission policy，provider/runtime fixes |
| **Runtime Composition** | 最强：`skill + hook + subagent + MCP + plugin` | 强：`skill + subagent + sandbox + MCP + plugin` engineering model | 强潜力：IDE-native layering of rules + skills + subagents + plugins | 最强 explicit bridge：skills + rules + agents + permissions + providers |
| **Execution Topology** | mostly explicit：permission-gated web tools，background subagent approval，Task → Agent evolution | worktrees，handoff，custom agents；constraints through config and security docs | 最广：local、CLI、worktree、cloud、SSH、self-hosted；但部分 subagent 行为隐藏在 server-side | highly explicit constraint model：provider-gated websearch，documented tool defaults，plugin load order |
| **Model / Context Exposure** | model choice and tools exposed through subagents；context cost management explicit | 最强 model transparency：reasoning effort、context windows、snapshots、custom agent model config | broad model menu and Max Mode，但 context/cost tradeoffs pronounced | widest provider / local-model flexibility |
| **Main Strength** | highest workflow maturity and compositional power | engineered clarity around scope and runtime controls | best IDE-native dynamic layering and fastest platform expansion | best bridge / experimentation / compatibility host |
| **Main Risk** | complex, host-specific, operationally heavier at scale | advanced workflows quickly become costlier and more runtime-dependent | runtime maturity and hidden backend constraints still visibly uneven | high configuration freedom increases drift and debugging complexity |

---

## 按场景的 Host 选择指南

### 场景 1：快速复用现有 Skills

**推荐**：从 light skills 开始，特别是 writing / documentation / review patterns。

- 优先直接复用，不要急着改写
- 可移植性风险最低的 skill 类型：主要封装 examples、style rules、checklists、references
- 四个 host 都能胜任这个场景

### 场景 2：运行复杂多步骤 Workflow

**推荐**：把 host runtime quality 作为首要决策变量，不是 file format。

- 这个场景下，subagents、approvals、tool availability、sandbox policy、execution topology 决定结果
- **Claude Code** 的 composition ceiling 最高
- **Codex** 的 constraint visibility 最明确
- 先确认目标 host 能支撑你的 orchestration contract 再动手

### 场景 3：评估 Deep Research Skills

**推荐**：先区分 search wrappers 和 real research orchestration。

- 然后判断 host 能否支撑 orchestration contract
- **Claude Code** 有最丰富的现成案例（Valyu、递归子代理、授权闸门）
- **Codex** 的 Smart Search 和原生 subagent workflow 提供工程化视角
- **Cursor** 的异步子代理让研究线程并行化更自然
- **OpenCode** 最适合做研究 skill 的桥接与实验

### 场景 4：跨 Host 协作

**推荐**：根据可移植性层级选择策略。

- Format + Discovery 层：四个 host 基本兼容
- Workflow-Method 层：大部分 writing skills 可以跨 host
- Runtime-Orchestration 层及以上：需要 Sync / Translate / Delegate

---

## 各 Host 的 Evidence 来源

### Claude Code
- `02-claude-code-hooks-subagents-and-skill-composition.md` — composition 能力
- `02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md` — permission model
- `02-claude-code-plugin-marketplaces-and-versioning.md` — distribution lifecycle
- `02-claude-code-directory-scope-and-persistence.md` — persistence model
- `00-shared-claude-code-skills-2026-operational-signals.md` — operational complexity signals

### Codex
- `03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md` — constraint visibility
- `03-codex-skills-locations-lifecycle-and-policy.md` — lifecycle governance
- `03-codex-subagents-runtime-controls-and-cost.md` — runtime controls
- `00-shared-codex-model-requirements-and-context-windows.md` — model transparency
- `03-codex-agents-md-layering-and-instruction-chain.md` — instruction chain

### Cursor
- `04-cursor-rules-agents-and-skill-boundary.md` — IDE-native layering
- `04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md` — execution topology
- `04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md` — hidden backend constraints
- `06-cursor-cross-tool-skill-duplication-and-dedup-gap.md` — duplicate-loading issue
- `04-cursor-plugin-bundles-and-ecosystem-direction.md` — ecosystem direction

### OpenCode
- `00-shared-opencode-skills-and-rules-compatibility.md` — compatibility bridge
- `05-opencode-skills-rules-and-instructions-bridge.md` — explicit bridge
- `05-opencode-permissions-granularity-and-command-policy.md` — constraint model
- `05-opencode-model-flexibility-and-provider-surface.md` — provider flexibility
- `05-opencode-tools-websearch-provider-gating-and-subagent-defaults.md` — tool gating

---

> 注意：同一个 skill 可以在 format 层兼容，但在 runtime 层失败或降级。对于 advanced skills，execution topology 和 constraint visibility 现在和 file-format compatibility 一样重要。

