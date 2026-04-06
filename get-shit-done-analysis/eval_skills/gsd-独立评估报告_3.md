# get-shit-done skill 独立评估报告（第三部分）

> 接续 `gsd-独立评估报告_2.md`（Command层 + Workflow层）
> 本文覆盖：Reference层 + Template层 + 综合结论

---

## 四、Reference 层评估（精选）

路径：`get-shit-done/references/*.md`

Reference 层是整套系统的**共享规则库**。workflow 和 agent 通过 `@` 引用加载这些文件，防止各处各说各话。评估重点是规则的**可操作性**和**共享价值**。

---

### 1. `verification-patterns.md`

**定位：** 共享验证规则，"how to verify artifacts are real implementations, not stubs"

**关键设计：**
- **4层验证模型**：Exists → Substantive → Wired → Functional，可独立于任何 agent 使用
- **stub_detection 附录**：通用 stub 模式（comment/placeholder/empty return/hardcoded）的 grep 命令集
- **框架特定验证**：React/Next.js/API Routes/Prisma/Config 等各有专属验证模式，不是泛化的"检查代码"
- 与 gsd-verifier 的关系：verifier 引用了这个文件的核心模式，但这个文件可以独立被任何场景使用

**独立判断：**  
这是 reference 层价值最高的文件，因为它把"如何判断真实实现 vs stub"这个问题系统化了。任何 agent 在验证阶段都可以直接引用，不需要重新发明。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | 4层模型 + 框架特定 grep 命令，非常具体 |
| 认知增量 | 9 | 把"存在≠实现"的洞见变成可执行的检查程序 |
| 失败模式覆盖 | 10 | 专门针对 stub/placeholder 假完成 |
| 独立可执行性 | 10 | 几乎不依赖任何其他文件，可直接迁移 |
| AI Agent特异性 | 9 | 完全针对 agent 的常见交付骗局 |
| 使用频率期望 | 8 | 任何验证步骤都可使用 |
| **总分** | **55/60** | |

**结论：** reference 层最强文件，全仓库第二高分（与 gsd-plan-checker 并列）。

---

### 2. `context-budget.md`

**定位：** Context 预算管理规则，定义 orchestrator 和 subagent 各自的读取深度

**关键设计：**
- **4个 degradation tier**：PEAK(0-30%) / GOOD(30-50%) / DEGRADING(50-70%) / POOR(70%+)，每档有具体行为规则
- **context window 分档读取**：< 500k tokens 只读 frontmatter，>= 500k tokens 可读全文——把硬件能力做进了规则
- **Context Degradation Warning Signs**：给出 3 个早期信号（silent partial completion / increasing vagueness / skipped steps），帮助 orchestrator 识别 agent 已在压力下降级
- **Universal Rules 7条**：从"不读 agents/*.md"到"委托重工作给 subagent"，可直接引用

**独立判断：**  
把 context window 大小显式建模进读取深度规则是这个文件最成熟的设计。"increasing vagueness（agent 开始用 'appropriate handling' 而不是具体代码）"这个早期信号描述非常精准——它抓住了 context 压力下 agent 行为退化的特征。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | 4个tier + 7条 universal rules + 读取深度表 |
| 认知增量 | 8 | context window 分档规则和 degradation warning signs 是实质设计 |
| 失败模式覆盖 | 8 | 覆盖：context 超限、agent 降级、orchestrator 误读大文件 |
| 独立可执行性 | 9 | 独立文件，可直接迁移到任何 agent 系统 |
| AI Agent特异性 | 10 | 完全为 agent context 管理而设计 |
| 使用频率期望 | 8 | 每个 workflow 和 orchestrator 都应引用 |
| **总分** | **52/60** | |

**结论：** 全仓库对 context budget 建模最完整的文件，warning signs 部分尤其值得独立借鉴。

---

### 3. `questioning.md`

**定位：** 提问技巧指南，"project initialization is dream extraction, not requirements gathering"

**关键设计：**
- **philosophy 精准**："You are a thinking partner, not an interviewer. Don't follow a script. Follow the thread."
- **the_goal 块**：明确提问结束时需要得到什么，供哪些下游阶段（research/requirements/roadmap/plan/execute）使用
- **反模式清单**：Corporate speak / Checklist walking / Premature constraints / Closing questions / Double-barreled / Leading questions——每条都有反制方法
- 区分"用户知道什么" vs "用户不知道什么"：不问技术实现，只问愿景和体验

**独立判断：**  
"Checklist walking is the #1 anti-pattern"——这句话道出了一个真实问题：大多数 agent 的提问就是把需求清单逐条问一遍，而不是真正地帮用户思考。这个文件把"好问题 vs 坏问题"的区别写成了可操作的指南。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | 反模式清单+提问类型+the_goal 都有具体说明 |
| 认知增量 | 8 | "dream extraction vs requirements gathering" 的重新定位是实质设计 |
| 失败模式覆盖 | 8 | 覆盖：checklist walking、corporate speak、premature constraints |
| 独立可执行性 | 10 | 纯方法论，零依赖 |
| AI Agent特异性 | 7 | 针对 agent 提问行为的设计，但原则通用 |
| 使用频率期望 | 7 | 任何需要用户输入的阶段都可引用 |
| **总分** | **48/60** | |

---

### 4. `tdd.md`

**定位：** TDD 方法论，何时用/何时不用/如何做 RED→GREEN→REFACTOR

**关键设计：**
- **明确的 TDD 适用判断标准**：`expect(fn(input)).toBe(output)` 这个 heuristic 比任何解释都直接
- **TDD 独立计划原则**：TDD 消耗 40-50% context，嵌入普通计划会导致质量下降，因此强制独立为 TDD plan
- **task-level TDD**：对不需要整个 TDD plan 的小功能，用 `tdd="true"` + `<behavior>` 块做轻量 TDD
- **明确不用 TDD 的场景**：UI layout/styling、配置、glue code——防止 TDD 被滥用到不合适的场景

**独立判断：**  
这个文件做了一件很重要的事：它不只说"应该 TDD"，而是说"什么时候 TDD 改善质量，什么时候不改善"。把 TDD plan 独立化的原因（context 消耗大）是实用的工程决策，不是方法论教条。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | 适用判断/plan结构/执行流程都有明确规则 |
| 认知增量 | 7 | TDD plan 独立化和 heuristic 判断标准是实质设计 |
| 失败模式覆盖 | 7 | 覆盖：TDD 滥用、context 耗尽导致 TDD 质量下降 |
| 独立可执行性 | 9 | 方法论为主，可直接迁移 |
| AI Agent特异性 | 7 | context 消耗考虑是 agent 特有 |
| 使用频率期望 | 7 | 有业务逻辑的功能都应引用 |
| **总分** | **45/60** | |

---

### 5. `universal-anti-patterns.md`

**定位：** 全局反模式集合，所有 workflow 和 agent 都应遵守的规则汇总

**关键设计：**
- **27条规则**：覆盖 context budget / file reading / subagent / questioning / state management / behavioral / error recovery / GSD-specific 8个类别
- **Rule 10（重要）**：明确禁止使用非 GSD agent types（`general-purpose`, `Explore`等），必须用 `gsd-{agent}`——这说明系统真的被不同 agent runtime 误用过
- **Rule 21（实战价值）**：git lock 检测前不删 lock file，建议用户自己删——对真实 CI/CD 环境的理解
- **State mutation 规则**：直接用 Write/Edit 改 STATE.md 是不安全的，必须通过 gsd-tools CLI

**独立判断：**  
这个文件是全系统的"shared memory"——把各处发现的坏模式集中到一个地方。Rule 10 禁止用通用 agent 的这个规则说明系统有真实的"乱用 agent"历史，每条规则背后都像是一次真实事故。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | 27条规则，分类清晰，每条可直接执行 |
| 认知增量 | 7 | git lock 检测、state mutation 规则是有价值的设计 |
| 失败模式覆盖 | 9 | 覆盖最广的单个文件，横跨8个失败类别 |
| 独立可执行性 | 8 | 大部分规则可迁移，GSD-specific 部分除外 |
| AI Agent特异性 | 9 | 大多数规则是 agent 特有的 |
| 使用频率期望 | 9 | 每个 agent 和 workflow 都应引用 |
| **总分** | **51/60** | |

---

### 其余 references（省略详评）

| Reference | 简述 | 省略理由 |
|-----------|------|----------|
| `planning-config.md` | 配置选项文档 | 配置说明，无独立评估价值 |
| `thinking-models-*.md` | 各阶段的结构化推理提示 | 支撑工具，依附于对应 agent |
| `revision-loop.md` | 迭代修订流程 | 在 plan-phase workflow 里已覆盖 |
| `gate-prompts.md` | 决策门提示模板 | 工具性文件 |
| `domain-probes.md` | 领域探针问题 | 辅助提问，不独立评估 |
| `agent-contracts.md` | Agent 间契约定义 | 系统胶水，无独立评估价值 |
| `continuation-format.md` | 续接格式定义 | 格式规范 |
| `checkpoints.md` | Checkpoint 协议 | 在 executor 里已覆盖 |

---

## 五、Template 层评估（精选）

路径：`get-shit-done/templates/*.md`

Template 层的职责是**固定产物形状**，让每次 agent 产出的文件有一致的结构，便于其他 agent 解析和人工审阅。

---

### 1. `phase-prompt.md`（PLAN.md 模板）

**定位：** PLAN.md 的权威格式定义，包含 frontmatter schema + 任务结构 + must_haves 格式

**关键设计：**
- **must_haves 结构内嵌**：truths/artifacts/key_links 三元素直接在 frontmatter 里，让验证者有机器可读的输入
- **requirements 字段 REQUIRED**：不能为空——这强制了计划与需求的可追踪性
- **`<context>` 块的 @ 引用**：告诉 agent 应该引用哪些文件，而不是让 agent 自己决定
- 区分 `type: execute` / `type: tdd`：不同类型的计划有不同模板

**独立判断：**  
PLAN.md 模板是整个系统的数据契约核心——planner 生成它，checker 验证它，executor 执行它，verifier 用它的 must_haves 来验证结果。格式设计的好坏直接影响整个管道的质量。`requirements` 字段不能为空的硬约束是关键的系统性保证。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | frontmatter schema、字段解释、类型分支都有详细说明 |
| 认知增量 | 7 | must_haves 结构和 requirements 必填是关键设计 |
| 失败模式覆盖 | 6 | 通过格式约束防止遗漏，但不直接描述失败场景 |
| 独立可执行性 | 9 | 格式规范可迁移 |
| AI Agent特异性 | 8 | 机器可读的 must_haves 专为 agent 验证管道设计 |
| 使用频率期望 | 10 | 每个 plan 都用，最高频 template |
| **总分** | **48/60** | |

---

### 2. `project.md`（PROJECT.md 模板）

**定位：** 项目全局上下文文档模板，"living project context document"

**关键设计：**
- **Core Value 字段**：一句话定义最重要的那件事，"当所有其他失败时，这个必须成功"
- **Requirements 三分类**：Validated（已验证）/ Active（当前）/ Out of Scope（明确排除+理由）
- **Out of Scope 的 Why 字段**：不只记录排除什么，还记录为什么——防止未来 agent 重新添加
- **Key Decisions 表**：用来记录贯穿项目的关键技术决策，给每个 phase 的 planner 参考

**独立判断：**  
Out of Scope 必须写 reason 这个设计防止了一类常见问题：feature 被排除后，下一个 agent 重新把它加进来。Core Value 字段强制用一句话定义最重要的事，有利于在 scope creep 时做取舍。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 7 | 字段含义和维护规则都有说明 |
| 认知增量 | 7 | Core Value + Out of Scope with reason 是实质设计 |
| 失败模式覆盖 | 6 | 通过格式防止漂移，但不直接描述失败 |
| 独立可执行性 | 10 | 纯格式模板，零依赖 |
| AI Agent特异性 | 6 | 设计为跨 session 持久化 agent 上下文 |
| 使用频率期望 | 7 | 每个项目一个，低频但高价值 |
| **总分** | **43/60** | |

---

### 3. `VALIDATION.md`（相位验证策略模板）

**定位：** 每个 phase 的测试验证策略文档，包含 test infrastructure / sampling rate / per-task verification map

**关键设计：**
- **Per-Task Verification Map 表**：每个 task 有对应的自动化测试命令、需求追踪、威胁模型引用
- **Sampling Rate 明确**：每次 task commit 后跑 quick run，每次 wave 后跑 full suite——把测试频率写进文档
- **Nyquist compliant 字段**：在 frontmatter 里标记这个 phase 是否满足 Nyquist 验证要求
- **Manual-Only Verifications 表**：把"无法自动化的验证"显式分类，不让它们消失

**独立判断：**  
per-task verification map 是这个模板最有价值的部分——它把"每个 task 需要什么测试"结构化成一张表，让 plan-checker 和 verifier 都有依据可查。把 manual-only 验证显式记录防止了"扔给用户自己试"的模糊做法。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | per-task map、sampling rate、nyquist 字段都有明确规则 |
| 认知增量 | 8 | per-task verification map 把测试责任结构化是新颖设计 |
| 失败模式覆盖 | 7 | 覆盖：测试遗漏、自动/手动混淆、nyquist 不达标 |
| 独立可执行性 | 8 | 格式可迁移，但 nyquist 概念需要配合 |
| AI Agent特异性 | 8 | 整个模板为 agent 执行验证管道设计 |
| 使用频率期望 | 7 | 每个 phase 一个 |
| **总分** | **46/60** | |

---

### 4. `state.md`（STATE.md 模板）

**定位：** 项目状态追踪文档，记录当前 phase/plan 位置、性能指标、决策历史

**关键设计：**
- **Progress bar**：`[░░░░░░░░░░] 0%`，视觉化进度
- **Performance Metrics 表**：记录每个 phase 的 plan 数量、总时长、平均时长
- **Accumulated Context / Decisions**：决策随 phase 推进积累，让下一个 phase 的 planner 看到历史决策
- **mutation 通过 gsd-tools**：STATE.md 不允许直接 Write，只能通过 CLI 命令改——防止并发写入破坏状态

**独立判断：**  
STATE.md 是 GSD 系统"项目记忆"的核心——它让每次新 session 的 agent 不需要从头探索现在在哪里。但它的价值高度依赖持续更新，如果 agent 不更新它，它就失真了。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 7 | 字段定义清晰，mutation 规则明确 |
| 认知增量 | 6 | performance metrics 积累是有价值的设计 |
| 失败模式覆盖 | 6 | mutation 规则防止并发写入，但其他失败不在 template 里 |
| 独立可执行性 | 8 | 格式可迁移 |
| AI Agent特异性 | 7 | 专为多 session agent 的状态持久化设计 |
| 使用频率期望 | 9 | 每个 plan 执行后更新，高频 |
| **总分** | **43/60** | |

---

### 其余 templates（省略详评）

| Template | 简述 | 省略理由 |
|----------|------|----------|
| `requirements.md` | REQUIREMENTS.md 格式 | 标准格式，无特殊设计 |
| `roadmap.md` | ROADMAP.md 格式 | 标准格式 |
| `UAT.md` | UAT 测试记录格式 | 在 verify-work workflow 里已覆盖 |
| `summary.md` | SUMMARY.md 格式 | 在 executor 里已覆盖 |
| `context.md` | CONTEXT.md 格式 | 在 discuss-phase 里已覆盖 |
| `discovery.md` | 研究发现格式 | 偏研究，不直接评 |
| `user-profile.md` | 用户画像格式 | 与编码关系弱 |

---

## 六、综合结论

### 6.1 全部被评估 skill 的评分汇总

#### Agent 层

| Skill | 总分(/60) | 最强维度 |
|-------|-----------|---------|
| `gsd-verifier` | **54** | 规则密度10 + 失败模式10 + AI特异性10 |
| `gsd-plan-checker` | **53** | 规则密度10 + 失败模式10 |
| `gsd-debugger` | **48** | 认知增量9（认知偏见清单） |
| `gsd-planner` | **50** | 规则密度9 + scope_reduction设计 |
| `gsd-executor` | **50** | analysis_paralysis_guard + deviation_rules |
| `gsd-code-reviewer` | **43** | 三级 depth 分档 |
| `gsd-codebase-mapper` | **41** | 独立可执行性9 |

#### Command 层

| Skill | 总分(/60) | 最强维度 |
|-------|-----------|---------|
| `execute-phase` command | **44** | flag 激活语义 + context budget |
| `verify-work` command | **42** | 最小摩擦 UAT |
| `plan-phase` command | **40** | 多 flag 入口集成 |
| `discuss-phase` command | **35** | --power 异步模式 |
| `new-project` command | **30** | --auto 自动流程 |
| `ship` command | **30** | 生命周期关闭 |

#### Workflow 层

| Skill | 总分(/60) | 最强维度 |
|-------|-----------|---------|
| `execute-phase` workflow | **50** | runtime compat + filesystem completion 检测 |
| `plan-phase` workflow | **49** | revision loop + 大 context 跨 phase 一致性 |
| `verify-work` workflow | **47** | 最低摩擦 UAT + session 持久化 |
| `discuss-phase` workflow | **46** | scope_guardrail + downstream_awareness |
| `new-project` workflow | **41** | MANDATORY FIRST STEP + brownfield 判断 |

#### Reference 层

| Skill | 总分(/60) | 最强维度 |
|-------|-----------|---------|
| `verification-patterns` | **55** | 独立可执行10 + 失败模式10 |
| `context-budget` | **52** | AI特异性10 + context window 分档 |
| `universal-anti-patterns` | **51** | 规则密度9 + 失败模式9 |
| `questioning` | **48** | 独立可执行10 + dream extraction 设计 |
| `tdd` | **45** | TDD 判断 heuristic + plan 独立化 |

#### Template 层

| Skill | 总分(/60) | 最强维度 |
|-------|-----------|---------|
| `phase-prompt`（PLAN.md） | **48** | 使用频率10 + must_haves 机器可读 |
| `VALIDATION.md` | **46** | per-task verification map |
| `project.md` | **43** | 独立可执行10 + Core Value 设计 |
| `state.md` | **43** | 使用频率9 + 状态持久化 |

---

### 6.2 全仓库 Top 10 最强 skill 单元

| 排名 | Skill | 层 | 总分 | 核心价值 |
|------|-------|----|------|---------|
| 1 | `gsd-verifier` | Agent | 54 | 4层验证模型 + override/deferred 机制 |
| 2 | `verification-patterns` | Reference | 55 | 独立可用的 stub 检测规则库 |
| 3 | `gsd-plan-checker` | Agent | 53 | 11维度计划前验证 + scope reduction detection |
| 4 | `context-budget` | Reference | 52 | AI Agent context 管理最完整建模 |
| 5 | `universal-anti-patterns` | Reference | 51 | 全局反模式汇总，横跨8个类别 |
| 6 | `gsd-planner` | Agent | 50 | scope_reduction_prohibition + quality degradation curve |
| 7 | `gsd-executor` | Agent | 50 | deviation_rules + analysis_paralysis_guard |
| 8 | `execute-phase` workflow | Workflow | 50 | runtime compat + filesystem completion 检测 |
| 9 | `plan-phase` workflow | Workflow | 49 | revision loop + 跨 phase 决策一致性 |
| 10 | `gsd-debugger` | Agent | 48 | 认知偏见清单 + meta-debugging 方法论 |

---

### 6.3 按可迁移性分类

**可以直接迁移到其他系统（高独立可执行性）：**
- `verification-patterns.md`：4层验证模型 + grep 命令集
- `context-budget.md`：context 预算规则
- `universal-anti-patterns.md`：通用反模式
- `questioning.md`：提问方法论
- `tdd.md`：TDD 适用判断框架
- `gsd-debugger`（方法论部分）：认知偏见清单

**需要配合 gsd-tools.cjs 才能完整运行（低独立性）：**
- `gsd-verifier`、`gsd-plan-checker`、`gsd-planner`、`gsd-executor`
- 所有 workflow 文件
- STATE.md、ROADMAP.md 相关操作

---

### 6.4 独立评估总结

**这套系统解决的核心问题不是"agent 不会写代码"，而是：**
1. **假完成**（verifier + verification-patterns）
2. **静默降级**（plan-checker + scope_reduction）
3. **分析瘫痪**（executor + analysis_paralysis_guard）
4. **认知偏见**（debugger）
5. **无验证的跨 session 漂移**（PLAN.md must_haves + STATE.md）
6. **context 超限导致质量下降**（context-budget + planning config）

**对使用者最有价值的 3 个独立借鉴点：**
1. **verification-patterns 的 4 层验证模型**：Exists→Substantive→Wired→Data Flow Trace，可以在任何 agent 系统里使用
2. **scope_reduction_prohibition 的禁止语言列表**：禁止 "v1/simplified/static for now" 等缩水用语，强制 phase split
3. **analysis_paralysis_guard 的 5 次 Read/Grep 规则**：5 次无写动作时强制停下，这个 heuristic 简单直接有效

**整体评级：A（79/100，苛刻评分法）**

仓库最强不在入口（command），而在中间层（workflow + reference + agent）。这三层共同构成了一套"让 agent 按工程节奏做事、按证据验收结果、按边界执行权限"的运行时规则体系。

---

_评估完毕。三个文件：`gsd-独立评估报告.md`（Agents层）、`gsd-独立评估报告_2.md`（Command+Workflow层）、`gsd-独立评估报告_3.md`（Reference+Template+综合结论）_
