# 附录 B：Portability Playbook

> 可移植性分层详解与跨 Host 实战案例。
>
> 核心原则：可移植性不是 yes/no，而是 layered（分层的）。大部分困惑来自把 7 层压缩成一个问题。

---

## 7 层可移植性详解

### Layer 1: File Format Portability（文件格式可移植性）

**可移植性**：最强

**包含内容**：
- `SKILL.md` 文件
- YAML frontmatter（前言元数据）
- `references/` 目录
- `scripts/` 目录

**支撑证据**：公开规范（`agentskills.io`）和集成指南已经标准化了这一层。

**实战建议**：这一层基本不需要担心。只要 skill 遵循标准格式，四个 host 都能识别。

---

### Layer 2: Discovery and Install Portability（发现与安装可移植性）

**可移植性**：中等

**包含内容**：
- `.agents/skills/` 目录约定
- Registry discovery（注册表发现）
- `skills` CLI 的 install/update 流程
- Host path compatibility（宿主路径兼容性）
- Canonical-source + mirror-sync automation（权威源 + 镜像同步自动化）

**常见问题**：
- 不同 host 的 native skill directory 不同（Claude Code 用 `.claude/`，Codex 用 `.codex/`，OpenCode 支持多种路径）
- 多个 native directory 共存时，需要 mirror sync 避免 path drift（路径漂移）

**实战建议**：
- 验证目标 host 的路径约定
- 如果需要多 host 共存，用 `skills-sync` CLI 或 hook 自动化同步
- 在 drift 积累之前就开始 sync

**关键证据**：
- `00-shared-agent-skills-quickstart-cross-host-paths.md`
- `06-cross-host-sync-skills-normalization-and-path-drift.md`
- `06-claude-codex-mirror-sync-hook-and-canonical-source.md`

---

### Layer 3: Workflow-Method Portability（工作流方法可移植性）

**可移植性**：中等（大部分 writing skills 在这层）

**包含内容**：
- 流程步骤（process steps）
- Checklists（检查清单）
- Style guides（风格指南）
- References（参考材料）

**为什么 writing skills 在这层**：
- 它们主要封装方法论，不依赖 host-specific runtime
- 核心价值在 rules、examples、output contracts
- 主要风险是 quality/overconfidence，不是 install failure

**实战建议**：
- Writing skills 是默认的"learn-by-reuse"入口
- 如果 skill 主要是 guidance + examples + references，直接复用
- 只需替换 reference 文件（品牌指南、术语表、样例库）即可适配

**关键证据**：
- `07-technical-writer-skill-patterns-and-install-flow.md`
- `07-good-prose-human-style-reuse-pattern.md`

---

### Layer 4: Execution-Topology Portability（执行拓扑可移植性）

**可移植性**：弱

**Breakpoints**（断点）：当 skill 假设 host 能在类似的地方和形式运行 agents 时就会断裂。具体包括：
- Worktrees（工作树）
- Cloud execution（云端执行）
- SSH / remote execution（远程执行）
- Background waits（后台等待）
- Self-hosted agent environments（自托管代理环境）

**实战建议**：
- 如果 skill 依赖特定 execution topology，先在目标 host 上测试这一层
- Cursor 在这一层扩展最广（local、CLI、worktree、cloud、SSH、self-hosted），但 maturity 不均匀

**关键证据**：
- `04-cursor-3-0-agents-window-await-tool-and-cloud-runtime.md`
- `03-codex-2026-changelog-skills-plugins-and-handoff.md`

---

### Layer 5: Runtime-Orchestration Portability（运行时编排可移植性）

**可移植性**：弱

**Breakpoints**：当 skill 假设以下能力存在时就会断裂：
- Host-native subagents（宿主原生子代理）
- Hooks（钩子）
- Plugin bundles（插件包）
- AGENTS/rules semantics（AGENTS/规则语义）
- Permissions/sandbox controls（权限/沙箱控制）
- Host-specific MCP wiring（宿主特定的 MCP 接线）

**实战建议**：
- 如果 skill 依赖 subagents + hooks + plugins，只假设 partial portability
- 需要 Translate 或 Delegate 模式来跨 host

**关键证据**：
- `02-claude-code-hooks-subagents-and-skill-composition.md`
- `03-codex-subagents-runtime-controls-and-cost.md`
- `05-opencode-permissions-granularity-and-command-policy.md`

---

### Layer 6: Tool-Surface and Backend-Policy Portability（工具表面与后端策略可移植性）

**可移植性**：弱（往往在接触外部 API 之前就断裂）

**Breakpoints**：
- `websearch` 不是到处都有——不同 host 有不同的 permission gates
- `task` / subagents 不一定总是被 provisioned
- Subagents 不一定获得和 primary agents 相同的 tools
- Model restrictions 或 backend routing 可能影响结果

**实战建议**：
- 先验证 tool availability 和 backend policy
- 不要假设 subagent inheritance behavior 在所有 host 上一致

**关键证据**：
- `02-claude-code-tool-permissions-web-controls-and-subagent-inheritance.md`
- `03-codex-approvals-sandbox-web-search-and-subagent-inheritance.md`
- `04-cursor-subagent-routing-server-side-issue-2-6-22-through-3-0-4.md`

---

### Layer 6.5: Runtime-Assumption Portability（运行时假设可移植性）

**可移植性**：弱（skill 能 install 但内部 drift）

**Breakpoints**：skill 文本本身假设了：
- 过时的 call shapes（如 `Task(...)`）
- Host-specific subagent type names
- Stale date / year markers
- 不再匹配 host 的 model/provider naming scheme

**实战建议**：
- 如果 skill 携带另一个 host 的 tool names 或 subagent labels，这是 translation work
- 如果 skill 硬编码了 host call shapes、stale years、model names，它是 installable but not yet trustworthy

**关键证据**：
- `08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md`
- `06-claude-to-codex-tool-mapping-and-subagent-translation.md`

---

### Layer 7: External Dependency Portability（外部依赖可移植性）

**可移植性**：最弱

**Breakpoints**：
- API keys
- Environment variables
- Local runtimes
- Provider-specific model behavior
- Shell / webfetch permissions

**实战建议**：
- 如果 skill 依赖 external APIs + env vars + shell permissions，这是 integration project，不是 copy operation
- 大部分 advanced research skills 最终会碰到这一层

**关键证据**：
- `00-shared-agent-skills-scripts-and-env-requirements.md`
- `08-valyu-powered-search-skill-requirements.md`

---

## 三大跨 Host 模式详解

### Sync 模式

**适用场景**：多个 host 需要使用同一个 skill，各自有不同的 native directory。

**核心机制**：
1. 选择一个 canonical source（权威源）——通常是 `.agents/skills/` 或你最常用的 host 的 native directory
2. 用 `skills-sync` CLI 或 hook 自动化 mirror sync
3. 用 `skills.yaml` 配置 wildcards 和 exclusions 控制同步范围
4. 在 drift 积累之前就开始 sync

**关键证据**：
- `06-claude-codex-mirror-sync-hook-and-canonical-source.md` — canonical source + sync hook 实现
- `06-skills-sync-cli-tool-and-central-skills-yaml.md` — skills sync CLI 工具
- `06-skills-sync-example-skills-yaml-wildcards-and-exclusions.md` — skills.yaml 配置示例

**注意事项**：
- 如果 host 扫描多个 tool directories，先验证 deduplication 和 precedence 行为
- 没有 dedup rules 的跨 host scanning 会导致 duplicate-loading 和 version confusion

---

### Translate 模式

**适用场景**：skill 的方法论可以复用，但 call shape 需要适配目标 host。

**核心机制**：
1. 保留方法论（research discipline、workflow steps、quality rules）
2. 翻译 tool names（例如 Claude Code 的工具名 → Codex 的对应工具名）
3. 翻译 subagent labels 和 plan semantics
4. 重写 host-specific shell，保留 method

**关键证据**：
- `06-claude-to-codex-tool-mapping-and-subagent-translation.md` — tool mapping 和 subagent translation 的具体案例

**关键原则**：翻译 call shape，不是翻译 method。方法论是可移植的，调用形式是 host-specific 的。

---

### Delegate 模式

**适用场景**：skill 的核心价值明确属于某个 host，强行在另一个 host 模拟不如直接调用。

**核心机制**：
1. 将另一个 host 的 CLI 作为 worker 调用
2. 用 plugin delegation 包装跨 host 调用
3. 不强求 native equivalence——承认 host 差异，通过委托绕过

**关键证据**：
- `06-skill-codex-claude-plugin-delegation-and-runtime-contract.md` — delegation 和 runtime contract
- `06-cross-host-codex-claude-loop-example.md` — Codex-Claude delegation loop 示例

**关键原则**：这是 delegated portability，不是 native portability。如果 valuable part of the workflow 明确属于另一个 host，delegate 比 imitate 更可靠。

---

## 快速判断流程图

```
拿到一个 skill，想跨 host 用？
│
├─ 1. 检查 format（Layer 1）
│  └─ 有标准 SKILL.md + frontmatter？→ 继续
│
├─ 2. 检查 discovery（Layer 2）
│  └─ 目标 host 能发现和安装？→ 继续
│  └─ 需要多 host 共存？→ 用 Sync 模式
│
├─ 3. 检查 method（Layer 3）
│  └─ 主要是 guidance + examples？→ 直接复用
│  └─ 依赖 host-specific runtime？→ 继续评估
│
├─ 4. 检查 runtime dependencies（Layer 4-6）
│  ├─ 依赖 subagents/hooks/plugins？→ Translate 或 Delegate
│  ├─ 依赖特定 execution topology？→ 先测试目标 host
│  └─ 依赖特定 tools/backend policy？→ 先验证 availability
│
├─ 5. 检查 assumptions（Layer 6.5）
│  └─ 有 stale call shapes / year markers？→ 需要 translation
│
└─ 6. 检查 external deps（Layer 7）
   └─ 依赖 API keys / env vars？→ 这是 integration project
```
