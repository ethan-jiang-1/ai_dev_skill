# get-shit-done skill 独立评估报告（第二部分）

> 接续 `gsd-独立评估报告.md`（Agents层）
> 本文覆盖：Command层 + Workflow层

---

## 二、Command 层评估（核心6个生命周期入口）

路径：`commands/gsd/*.md`

Command 层是整个系统的用户入口，职责是：声明工具权限、路由到 workflow、声明 argument-hint。它本身不包含流程逻辑（逻辑在 workflow），所以评估的重点是**入口设计的合理性**，而非流程密度。

---

### 1. `new-project.md`（`/gsd-new-project`）

**定位：** 项目初始化入口，从 idea → PROJECT.md → REQUIREMENTS.md → ROADMAP.md

**关键设计：**
- front matter 声明 `allowed-tools`，明确工具边界（Read/Bash/Write/Task/AskUserQuestion）
- `execution_context` 用 `@` 引用 workflow + references + templates，命令本身只做路由，不重复逻辑
- `--auto` flag：有文档输入时跳过交互，直接走自动流程
- Copilot 兼容注释：`vscode_askquestions` 等价于 `AskUserQuestion`，显示出跨 runtime 适配意识

**独立判断：**  
command 本身极薄，把"做什么"和"怎么做"彻底分离——command 只管入口声明，workflow 管流程。这是良好的关注点分离，但也意味着单看 command 无法理解系统深度。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 4 | command 本身只是路由，逻辑在 workflow |
| 认知增量 | 5 | --auto flag 和 runtime 兼容注释是有价值的设计细节 |
| 失败模式覆盖 | 3 | command 层基本不做失败处理，交给 workflow |
| 独立可执行性 | 7 | front matter 格式通用，迁移容易 |
| AI Agent特异性 | 5 | tool 边界声明是 agent 特有，但不深 |
| 使用频率期望 | 6 | 项目初始化，低频但关键 |
| **总分** | **30/60** | |

---

### 2. `discuss-phase.md`（`/gsd-discuss-phase`）

**定位：** Phase 开始前的决策提取入口，收集用户对实现方式的选择，生成 CONTEXT.md 供下游 agent 使用

**关键设计：**
- `allowed-tools` 比其他 command 多（包含 mcp__context7__*），因为需要做实时代码库侦察
- `--power` 模式：批量生成问题到文件，让用户按自己节奏回答——这是异步交互的设计
- `--chain` flag：discuss 完自动触发 plan+execute
- 明确区分 `downstream_awareness`：CONTEXT.md 的消费者是 researcher 和 planner，command 在 describe 里就说清楚了

**独立判断：**  
discuss-phase 的 description 字段写得最好——清楚说明了这个 command 的目的（提取决策，而不是做实现）。多 flag 的设计（--auto/--chain/--power/--text）说明这个入口经历了真实用户的使用迭代。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 5 | mode routing 逻辑在 command 里有简短说明 |
| 认知增量 | 6 | --power 异步交互模式是有新意的设计 |
| 失败模式覆盖 | 4 | 基本不在 command 层做 |
| 独立可执行性 | 7 | front matter 通用 |
| AI Agent特异性 | 6 | downstream_awareness 的描述显示 agent 协作意识 |
| 使用频率期望 | 7 | 每个 phase 前可触发，中高频 |
| **总分** | **35/60** | |

---

### 3. `plan-phase.md`（`/gsd-plan-phase`）

**定位：** Phase 规划入口，orchestrate researcher + planner + plan-checker 的完整闭环

**关键设计：**
- `agent: gsd-planner` 字段：这是系统里少数在 front matter 里直接声明默认 agent 的 command
- `allowed-tools` 最丰富：包含 mcp__context7__*，因为规划过程需要查文档
- 最多 flag 的 command：`--auto/--research/--skip-research/--gaps/--skip-verify/--prd/--reviews/--text`，覆盖了所有使用场景变体
- `--prd <file>` flag：从 PRD 文件自动解析 requirements，跳过 discuss-phase，显示出对多种工作流入口的支持

**独立判断：**  
flag 数量是这个 command 成熟度的标志——每个 flag 对应一个真实的使用场景（有了 PRD 就不需要 discuss，已经有 research 就不需要重跑，验证失败后只做 gap 修复等）。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 6 | flag 文档详细，mode routing 有说明 |
| 认知增量 | 7 | --prd 和 --reviews 集成是实用的新设计 |
| 失败模式覆盖 | 5 | --gaps 模式是针对验证失败的显式处理路径 |
| 独立可执行性 | 7 | front matter 通用，flag 设计可借鉴 |
| AI Agent特异性 | 6 | agent orchestration 意识强 |
| 使用频率期望 | 9 | 每个 phase 必经，最高频 command 之一 |
| **总分** | **40/60** | |

---

### 4. `execute-phase.md`（`/gsd-execute-phase`）

**定位：** Phase 执行入口，wave-based 并行执行所有 plans

**关键设计：**
- **flag 激活语义**：明确写"A flag is active ONLY when its literal token appears in $ARGUMENTS"，防止 agent 把文档里描述的 flag 误认为已激活
- `--interactive` 模式：顺序内联执行，不用 subagent，适合小 phase 和调试场景
- `--wave N` 精细控制：只执行特定 wave，用于分阶段推进或 quota 管理
- **context budget 声明**：`~15% orchestrator, 100% fresh per subagent`，显式把 context 分配写进设计

**独立判断：**  
flag 激活语义的明确声明是这个 command 最有价值的部分——它直接解决了 agent 读到 flag 文档就以为 flag 激活的常见误解。context budget 的显式分配也是成熟设计。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 7 | flag 激活语义、context budget 都有明确规则 |
| 认知增量 | 7 | flag 激活语义的明确声明是有价值的设计 |
| 失败模式覆盖 | 6 | --interactive fallback 处理了 subagent 不可用的场景 |
| 独立可执行性 | 7 | 设计可迁移 |
| AI Agent特异性 | 8 | context budget 分配是 agent 特有设计 |
| 使用频率期望 | 9 | 每个 phase 必经，最高频之一 |
| **总分** | **44/60** | |

---

### 5. `verify-work.md`（`/gsd-verify-work`）

**定位：** UAT 入口，对话式逐项测试，持久化测试状态到 UAT.md，发现问题时自动诊断并准备 gap plan

**关键设计：**
- **philosophy 精准**：`No Pass/Fail buttons. No severity questions. Just: "Here's what should happen. Does it?"`——把 UAT 做成最低摩擦的对话
- `"yes"/"y"/"next"/empty → pass`：接受最自然的确认方式，不强迫用户输入特定格式
- 持久化 UAT.md：会话中断（/clear）后可以恢复，状态不丢失
- active session 检测：启动时先检查有没有进行中的 UAT，避免重复开始

**独立判断：**  
philosophy 块是这个 command 最有价值的部分——把"如何做 UAT"的核心原则浓缩成两句话。`"Anything else → logged as issue, severity inferred"` 说明不要求用户判断严重程度，Claude 自己推断，减少了用户的认知负担。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 6 | philosophy 和 session management 有明确规则 |
| 认知增量 | 7 | "show expected, ask if matches" 的最小摩擦 UAT 设计是新颖的 |
| 失败模式覆盖 | 6 | 持久化解决了 /clear 中断问题 |
| 独立可执行性 | 8 | 核心逻辑清晰，依赖较少 |
| AI Agent特异性 | 7 | severity 自动推断、session 持久化都是 agent 特有设计 |
| 使用频率期望 | 8 | 每个 phase 后触发 |
| **总分** | **42/60** | |

---

### 6. `ship.md`（`/gsd-ship`）

**定位：** 发布入口，push branch + 创建 PR + 可选触发 review，关闭 plan→execute→verify→ship 循环

**关键设计：**
- 最简的 command：正文只有一行 `Execute the ship workflow from @...`
- 职责清晰：只做 git 相关操作，不做任何代码相关判断
- 关闭生命周期的语义价值大于内容价值

**独立判断：**  
ship.md 体现了好的 command 设计原则：薄入口，厚 workflow。它的价值在于"存在"本身——把 ship 行为编码成一个命令，而不是让开发者自己 git push 和填 PR 描述。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 3 | command 本身极简 |
| 认知增量 | 4 | 概念清晰但无新设计 |
| 失败模式覆盖 | 3 | 在 workflow 处理 |
| 独立可执行性 | 8 | 极简，易迁移 |
| AI Agent特异性 | 5 | PR 自动创建是 agent 辅助场景 |
| 使用频率期望 | 7 | 每个 phase 完成后触发 |
| **总分** | **30/60** | |

---

### Command 层总结

Command 层是**注册层+路由层**，不是逻辑层。评分偏低是结构上的合理结果，不代表价值低。核心 6 个 command 共同构成了一个标准工程节奏（new→discuss→plan→execute→verify→ship），这个节奏本身是 command 层最大的贡献。

| Command | 总分 | 最强设计 |
|---------|------|---------|
| execute-phase | 44 | flag 激活语义明确声明 |
| plan-phase | 40 | --prd/--reviews 多入口集成 |
| verify-work | 42 | 最小摩擦 UAT + session 持久化 |
| discuss-phase | 35 | --power 异步模式 |
| new-project | 30 | --auto 自动流程 |
| ship | 30 | 关闭生命周期的语义价值 |

---

## 三、Workflow 层评估（核心5个）

路径：`get-shit-done/workflows/*.md`

Workflow 层是整个系统**逻辑密度最高**的一层。Command 做路由，agents 做专项，workflow 才是真正的编排脑——它决定何时问问题、何时调用哪个 agent、何时更新状态、何时进入下一步。

---

### 1. `new-project.md` workflow

**定位：** 项目初始化编排，从 idea → 完整 .planning/ 目录结构

**关键设计：**
- **runtime 检测**：第一步通过路径解析推断运行时（claude/codex/gemini/opencode），据此调整行为——跨 runtime 适配意识强
- **MANDATORY FIRST STEP**：所有 user interaction 前必须先跑 init bash 命令，防止 agent 直接开口问问题
- brownfield 判断：检测到已有代码时，引导做 codebase map 而不是从零开始
- 质量问题框架：提问阶段引用 `questioning.md`，不让 orchestrator 自己发明问题
- 分层 agent 调度：researcher → synthesizer → roadmapper 的 3-agent 管道，每个有独立 context

**独立判断：**  
"MANDATORY FIRST STEP" 的模式是 workflow 层最通用的设计原则——在任何用户交互前先检查系统状态，防止 agent 在错误前提下开始对话。runtime 检测的精细程度显示这个系统在真实的多 IDE/runtime 环境下运行过。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | init→brownfield→questioning→agents 每步有明确规则 |
| 认知增量 | 7 | runtime 检测、brownfield 判断、MANDATORY FIRST STEP 是实质设计 |
| 失败模式覆盖 | 7 | brownfield 判断防止对已有项目用错流程 |
| 独立可执行性 | 6 | 依赖 gsd-tools 和多个 reference/template |
| AI Agent特异性 | 8 | agent 调度管道、context 分配、runtime 适配都是 agent 特有 |
| 使用频率期望 | 5 | 每个项目只触发一次，低频高价值 |
| **总分** | **41/60** | |

---

### 2. `discuss-phase.md` workflow

**定位：** Phase 决策提取编排，识别"灰区"→让用户选择要讨论哪些→深入直到用户满意→生成 CONTEXT.md

**关键设计：**
- **downstream_awareness 块**：明确说明 CONTEXT.md 被谁消费、用于什么（researcher 知道查什么，planner 知道什么是锁定决策）
- **scope_guardrail**：区分"澄清实现"（允许）vs"添加新能力"（禁止），有明确的判断启发式
- **gray_area_identification**：给出识别灰区的方法——不是问所有问题，而是只问"实现方式的多种可能"
- "User=founder/visionary, Claude=builder" 角色分工：明确不问用户技术实现细节
- Deferred Ideas 机制：scope creep 建议不丢掉，记录到 Deferred Ideas 等待未来 phase

**独立判断：**  
scope_guardrail 是这个 workflow 最成熟的设计——"Does this clarify HOW or does it add new capability?" 这个判断标准既简单又可操作。downstream_awareness 把 CONTEXT.md 的消费者明确建模，是少见的 agent 协作数据流设计。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | scope_guardrail/gray_area/deferred_ideas 每块有规则 |
| 认知增量 | 8 | scope_guardrail 的判断标准和 deferred_ideas 机制是实质设计 |
| 失败模式覆盖 | 8 | 覆盖：scope creep、问错人（问用户技术实现）、灰区遗漏 |
| 独立可执行性 | 7 | 核心方法论可迁移 |
| AI Agent特异性 | 8 | downstream_awareness 把 agent 间数据流显式建模 |
| 使用频率期望 | 7 | 每个 phase 前触发 |
| **总分** | **46/60** | |

---

### 3. `plan-phase.md` workflow

**定位：** Plan 生成编排，Research→Plan→Checker→Revision loop（最多3次）

**关键设计：**
- **revision loop**：planner→checker→如果 issues_found→回 planner 修→再过 checker，最多3次循环，防止无限迭代
- **大 context 模式**：当 `CONTEXT_WINDOW >= 500000` 时，把跨 phase 的 CONTEXT.md 都喂给 planner，让规划有历史决策一致性
- **text mode**：远程会话（/rc）里 TUI 菜单不可用时自动切换为纯文本选项列表
- **2.5 validate --reviews prerequisite**：在开始流程前检查前置条件是否满足，防止中途失败

**独立判断：**  
revision loop（3次上限）是 workflow 层最有工程价值的设计——它在"反复迭代"和"无限循环"之间设了一道硬限制。大 context 模式的跨 phase 决策一致性是难得的系统性设计，大多数 workflow 不会考虑跨 session 的状态传递。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | revision loop/context budget/text mode 每个都有精确规则 |
| 认知增量 | 8 | 大 context 跨 phase 一致性和 revision loop 上限是新颖设计 |
| 失败模式覆盖 | 8 | 覆盖：无限迭代、跨 phase 决策漂移、远程 session 不兼容 |
| 独立可执行性 | 6 | 依赖多个 agent 和 gsd-tools |
| AI Agent特异性 | 9 | 全程 agent orchestration，revision loop 是 agent 特有 |
| 使用频率期望 | 9 | 每个 phase 必经 |
| **总分** | **49/60** | |

---

### 4. `execute-phase.md` workflow

**定位：** Phase 执行编排，wave-based 并行调度 gsd-executor subagents

**关键设计：**
- **runtime_compatibility 块**：Claude Code 用 Task 并行，Copilot 用顺序内联（因为没有可靠的 completion signal），其他 runtime 也有 fallback——跨平台适配最完整
- **fallback rule**：如果 subagent 完成了但没有收到信号，通过 filesystem+git 状态验证（SUMMARY.md存在 + commit可见），不会无限等待
- **wave 分析**：扫描 depends_on，分组成并行 wave，Wave 1 完成后再 Wave 2
- **context budget 分配**：orchestrator 用 ~15%，每个 subagent 有 100% fresh context

**独立判断：**  
runtime_compatibility 块是这套系统里跨环境工程成熟度最高的证明——它把 Claude Code/Copilot/其他 runtime 的差异显式建模并给出 fallback。基于 filesystem/git 状态的完成检测（而不是等待信号）是可靠分布式系统的经典做法。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | runtime compat/fallback rule/wave分析/context分配都有明确规则 |
| 认知增量 | 8 | 基于 filesystem/git 的 completion 检测和 runtime fallback 是实质设计 |
| 失败模式覆盖 | 9 | 覆盖：completion signal 丢失、runtime 不兼容、context 超限 |
| 独立可执行性 | 6 | 依赖 gsd-executor agent 和 gsd-tools |
| AI Agent特异性 | 9 | wave 并行调度、context budget 分配都是 agent 特有 |
| 使用频率期望 | 9 | 每个 phase 必经 |
| **总分** | **50/60** | |

---

### 5. `verify-work.md` workflow

**定位：** UAT 编排，对话式逐项测试 → 持久化状态 → 自动诊断 → 准备 gap plans

**关键设计：**
- **最低摩擦原则**：`"yes"/"y"/"next"/empty → pass`，`anything else → logged as issue`——不要求用户判断严重程度
- **session 持久化**：UAT.md 跨 /clear 保留，启动时自动检测已有 session 并提供恢复
- **从平行角色接收**：结束时如果发现 issues，自动 spawn gsd-planner 做 gap closure plan，形成闭环
- **"show expected, ask if matches"**：Claude 呈现预期行为，用户只需确认或描述差异

**独立判断：**  
UAT 的最低摩擦设计是这个 workflow 最有实用价值的部分——传统 UAT 要求用户记录 pass/fail/severity，这套设计把认知负担压到最低，让用户只做"是否符合预期"这一个判断。session 持久化解决了长 UAT 过程中 context reset 导致进度丢失的问题。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | session管理/测试格式/自动诊断都有规则 |
| 认知增量 | 8 | 最低摩擦 UAT 设计和 session 持久化是实质设计 |
| 失败模式覆盖 | 8 | 覆盖：/clear 中断、用户无法判断 severity、gap 无闭环 |
| 独立可执行性 | 7 | 核心方法可迁移 |
| AI Agent特异性 | 8 | severity 自动推断、session 恢复都是 agent 特有 |
| 使用频率期望 | 8 | 每个 phase 后触发 |
| **总分** | **47/60** | |

---

### Workflow 层总结

Workflow 层是全仓库价值密度最高的一层，以下汇总：

| Workflow | 总分 | 最强设计 |
|----------|------|---------|
| execute-phase | 50 | runtime compat + filesystem completion 检测 |
| plan-phase | 49 | revision loop 上限 + 大 context 跨 phase 一致性 |
| verify-work | 47 | 最低摩擦 UAT + session 持久化 |
| discuss-phase | 46 | scope_guardrail + downstream_awareness |
| new-project | 41 | MANDATORY FIRST STEP + brownfield 判断 |

**整体结论：** execute-phase 和 plan-phase workflow 是全仓库最有工程价值的文件，仅次于 gsd-verifier 和 gsd-plan-checker agents。

---

_接续见 `gsd-独立评估报告_3.md`（Reference层 + Template层 + 综合结论）_
