# get-shit-done skill 独立评估报告

> 评估对象：`get-shit-done-analysis/source_snapshot/get-shit-done/`  
> 评估人：Claude（独立评估，不依赖已有分析文档）  
> 评估日期：2026-04-06

---

## 评估框架

每个 skill 按 6 个维度评分，1-10分：

| 维度 | 说明 |
|------|------|
| 规则密度 | 具体规则、判断条件、流程约束的密度 |
| 认知增量 | 对有经验的人是否有新东西 |
| 失败模式覆盖 | 是否明确指出常见失控点并给出反制 |
| 独立可执行性 | 离开原仓库是否能单独使用 |
| AI Agent特异性 | 是否专门针对 agent 的典型失败模式设计 |
| 使用频率期望 | 真实开发中的高频触发可能性 |

评级：
- 1-3：弱
- 4-6：中等
- 7-8：强
- 9-10：非常强

---

## 一、Agent 层评估

路径：`agents/*.md`（共 24 个）

---

### 1. `gsd-verifier`

**定位：** 相位验证 agent，核心使命是 goal-backward 验证——"目标达成"而非"任务完成"

**内容亮点：**

- **4层验证模型**：Exists → Substantive → Wired → Data-Flow Trace（Level 4），层层递进，每层都有具体判断标准和bash命令
- **re-verification 模式**：检测到前次 VERIFICATION.md 时，自动进入"重跑失败项+快速回归已通过项"的差量模式，节省大量成本
- **override 机制**：允许用户通过 YAML frontmatter 声明某些失败是故意的，用 80% token 匹配做模糊对比，设计细腻
- **deferred 过滤（Step 9b）**：自动把"下一个 phase 会处理"的 gap 从当前报告中隔离，防止误报
- **Behavioral Spot-Checks（Step 7b）**：不启动 server 的前提下，用 curl/node 验证真实行为
- **YAML frontmatter gap 结构化**：直接为下游 `/gsd-plan-phase --gaps` 喂机器可读输入，形成闭环
- **stub_detection_patterns** 附录：React组件/API Route/Wiring 的红旗代码模式逐一列举

**独立判断：**  
这是整套系统逻辑密度最高的文件。它不只告诉 verifier "要验证"，而是把每个决策树都写死：什么时候用人工、什么时候算 pass、status 字段只有3种值且有明确决策顺序。这种程度的流程硬编码在 prompt 工程里极罕见。override + deferred 两个机制说明作者真实跑过这套系统，知道哪里会误报。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 10 | Step 0-10 每步有决策树、bash命令、状态映射表 |
| 认知增量 | 9 | override机制、deferred过滤、Level 4 data-flow trace 是实质性新设计 |
| 失败模式覆盖 | 10 | 专为"stub假完成"设计，覆盖React/API/DB/wiring全部红旗 |
| 独立可执行性 | 7 | 依赖 gsd-tools.cjs、ROADMAP.md，脱离原runtime迁移成本较高 |
| AI Agent特异性 | 10 | 完全针对 agent 假完成、hallucination、偷懒任务而设计 |
| 使用频率期望 | 8 | 每个 phase 结束都应触发，高频但偏重 |
| **总分** | **54/60** | |

**结论：** 全仓库最强单文件，"反假完成"工程思维的集大成，值得任何 agent workflow 借鉴其4层验证模型。

---

### 3. `gsd-executor`

**定位：** Plan 执行 agent，负责把 PLAN.md 原子化落地，每个 task 独立 commit，处理偏差和 checkpoint

**内容亮点：**

- **deviation_rules（4条规则）**：清晰区分"自动修"（Rule 1-3）与"先问再改"（Rule 4）的边界，特别是 Rule 4 专门处理架构级变更，防止 agent 擅自重构
- **analysis_paralysis_guard**：5次连续Read/Grep/Glob而无Write/Edit/Bash动作时，强制停下并说明原因或开始写代码——这是对 agent "分析瘫痪"模式的直接反制
- **FIX ATTEMPT LIMIT**：单个 task 最多 3 次自动修复尝试，之后文档化问题继续下一个 task，防止无限循环
- **auto_mode_detection**：检测 auto-chain 模式，checkpoint:human-verify 时自动通过，减少中断
- **stub_tracking in summary**：在写 SUMMARY.md 前主动扫描已改文件的 stub 模式，防止把假完成写进摘要
- **threat surface scan**：在 SUMMARY 前检查是否引入了计划外的安全相关 surface（新接口、auth 路径、文件访问、schema 变更），并产出 Threat Flags 表
- **self_check after SUMMARY**：验证 SUMMARY 声明的文件确实存在、commit hash 确实有效，做不到就不继续

**独立判断：**  
这个文件最值得关注的是它把 agent 的"走偏"场景分类得非常细：analysis paralysis、fix loop、scope creep（Rule 4 边界）、stub交付、安全漏洞暗引。每种都有具体的触发条件和处置协议。deviation_rules 的4规则分类是真实工程经验的沉淀，不是泛泛的"出问题就问用户"。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | deviation_rules/analysis_paralysis/fix_attempt_limit 每条都有触发条件和动作 |
| 认知增量 | 8 | analysis_paralysis_guard 和 threat_surface_scan 是实质性设计 |
| 失败模式覆盖 | 9 | 覆盖：分析瘫痪、修复循环、架构越界、stub交付、安全引入 |
| 独立可执行性 | 6 | 依赖 gsd-tools.cjs、STATE.md、ROADMAP.md 等，迁移成本高 |
| AI Agent特异性 | 9 | analysis_paralysis 和 fix_attempt_limit 完全是 agent 特有问题 |
| 使用频率期望 | 9 | 每个 plan 都需要 executor，最高频角色 |
| **总分** | **50/60** | |

**结论：** 执行层最成熟的 agent，deviation_rules 尤其值得单独借鉴。analysis_paralysis_guard 是点睛之笔。

---

### 4. `gsd-code-reviewer`

**定位：** 代码审查 agent，三级深度（quick/standard/deep）产出结构化 REVIEW.md

**内容亮点：**

- **三级 depth 模式**：quick（grep pattern扫描，2分钟）/ standard（逐文件读 + 语言特定检查，15分钟）/ deep（跨文件import图+调用链追踪，30分钟），三档适配不同场景
- **语言特定检查清单**：JS/TS/Python/Go/C/Shell各有具体的危险模式列表，不是泛化的"检查安全问题"
- **severity 三分类**：Critical（安全/崩溃）/ Warning（逻辑错误）/ Info（代码质量），每类有明确边界举例
- **fail closed on scope**：找不到明确文件列表时直接报错而不是自己发明启发式规则，防止静默误审
- **status 区分**：`skipped`（没有可审查文件）vs `clean`（审查了没问题），这个区分对下游消费者很重要
- **v1 scope 边界**：明确声明性能问题（O(n²)/内存泄漏）不在 v1 范围内，防止 review 范围蔓延

**独立判断：**  
三级 depth 分档是这个文件最成熟的设计——它承认"不同场景需要不同深度的 review"，而不是要求每次都做最深的分析。fail closed 策略和 status 区分显示作者有真实的系统集成经验。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | 三级depth各有具体检查规则，severity分类有明确边界 |
| 认知增量 | 7 | depth三档分级和fail-closed策略是实质设计 |
| 失败模式覆盖 | 7 | 覆盖：scope误判、severity误分、性能问题scope蔓延 |
| 独立可执行性 | 8 | 核心逻辑不强依赖 gsd-tools，可较容易迁移 |
| AI Agent特异性 | 6 | review本身是通用场景，但 fail-closed 和 scope control 有agent意识 |
| 使用频率期望 | 7 | 每次 phase 后触发，中高频 |
| **总分** | **43/60** | |

**结论：** 实用但不算特别突破性的设计，三级 depth 分级是最值得借鉴的部分。

---

### 5. `gsd-codebase-mapper`

**定位：** 代码库探索 agent，按 4 个 focus 区域（tech/arch/quality/concerns）写出结构化分析文档到 `.planning/codebase/`

**内容亮点：**

- **why_this_matters 块**：明确说明每个 focus 的文档会被哪些下游 agent 读取、用于什么场景，建立上下游的契约意识
- **prescriptive over descriptive**：强调文档要写"Use X pattern"而非"X pattern is used"，面向未来执行者而非面向记录
- **forbidden_files 显式列举**：明确禁止读取 .env/credentials/private key 等文件，并说明原因（git commit 会泄漏），安全意识强
- **5个文档模板内嵌**：STACK/INTEGRATIONS/ARCHITECTURE/STRUCTURE/CONVENTIONS/TESTING/CONCERNS 全有完整模板，减少随机输出
- **Return confirmation only**：只返回确认，不返回文档内容，主动控制 context 占用

**独立判断：**  
这是一个"为系统其他部分服务"的 agent，设计目标是让 planner 和 executor 不需要自己探索代码库。why_this_matters 的下游映射表是少见的、把 agent 之间的数据流显式建模的做法。forbidden_files 的安全边界设计值得所有 agent 模板学习。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 7 | 4个focus各有探索命令，模板内嵌完整 |
| 认知增量 | 7 | why_this_matters的下游映射和prescriptive原则是实质设计 |
| 失败模式覆盖 | 6 | 覆盖：模糊描述、隐私文件泄漏、文档内容回流占用context |
| 独立可执行性 | 9 | 基本不依赖 gsd-tools，可直接迁移 |
| AI Agent特异性 | 6 | 主要解决context预算问题（不传内容给orchestrator），有agent意识 |
| 使用频率期望 | 6 | 项目初始化和大型 refactor 时触发，中频 |
| **总分** | **41/60** | |

**结论：** 系统工具型 agent，服务角色定位清晰，forbidden_files 设计值得所有 agent 模板借鉴。

---

### 6. `gsd-debugger`

**定位：** Debug agent，用科学方法论（假说-实验-验证）追溯 bug 根因，维护持久化 debug 会话状态

**内容亮点：**

- **philosophy 块**：把"用户=症状报告者，Claude=根因调查者"的角色分工写死，明确不问"哪个文件有问题"这类用户无法知道的问题
- **认知偏见清单**：Confirmation/Anchoring/Availability/Sunk Cost 四类偏见逐一列举，每条有"陷阱"和"解药"，罕见的元认知设计
- **meta-debugging 块**：专门处理"调试自己写的代码"这个更难的场景，强调"treat your code as foreign"
- **When to Restart 协议**：列出5个强制重启信号（2小时无进展/3次修复无效/修了但不知道为什么），防止在错误路径上无限沉没
- **假说质量标准**：给出"好假说 vs 坏假说"的具体对比（可证伪 vs 不可证伪），附Experimental Design Framework
- **Sunk Cost 每30分钟检查点**：规定每30分钟问自己"如果重新开始，我还会选这条路吗？"

**独立判断：**  
这个文件最特别的地方在于它在教 Claude 怎么思维，而不只是给步骤。认知偏见清单和 meta-debugging 块在 prompt 工程里几乎没有先例。When to Restart 协议解决了 agent 在错误路径上卡死的问题，这比"继续试"要成熟很多。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 8 | 假说框架/认知偏见/restart协议每块都有具体触发条件 |
| 认知增量 | 9 | 认知偏见清单、meta-debugging、sunk cost检查点是突破性设计 |
| 失败模式覆盖 | 8 | 覆盖：确认偏见、沉没成本陷阱、自写代码的心理盲区 |
| 独立可执行性 | 8 | 核心是方法论，不强依赖 gsd-tools，可较好迁移 |
| AI Agent特异性 | 8 | 认知偏见和meta-debugging专门针对 agent 的内部推理失败 |
| 使用频率期望 | 7 | bug发生时触发，中高频 |
| **总分** | **48/60** | |

**结论：** 认知方法论层面最成熟的 agent，认知偏见清单和 meta-debugging 概念值得独立提炼。

---

### 7. `gsd-plan-checker`

**定位：** Plan 执行前验证 agent，在 executor 启动前用 goal-backward 方式验证 PLAN.md 能否达成目标

**内容亮点：**

- **明确区分 plan-checker vs verifier**：plan-checker 验证"plans WILL achieve goal"（执行前），verifier 验证"code DID achieve goal"（执行后），同一方法论在不同时间点的复用
- **11个验证维度**：Requirement Coverage / Task Completeness / Dependency Correctness / Key Links Planned / Scope Sanity / Verification Derivation / Context Compliance / Scope Reduction Detection / Nyquist Compliance / Cross-Plan Data Contracts / CLAUDE.md Compliance
- **Scope Reduction Detection（Dimension 7b）**：专门检测 planner 把用户决策"静默降级"的行为（v1/simplified/static for now等用语），ALWAYS BLOCKER级别——这是 plan-checker 独有的最强设计
- **Nyquist Compliance（Dimension 8）**：检查每个 task 的 verify 是否有 automated 命令、采样连续性（每3个 task 至少2个有自动化验证）
- **Cross-Plan Data Contracts（Dimension 9）**：当多个 plan 共享数据管道时，检查数据变换是否兼容（如 Plan A strip 了 Plan B 需要的原始数据）

**独立判断：**  
Dimension 7b（Scope Reduction Detection）是这个文件最有价值的部分，它识别的"plans look compliant but deliver a shadow of the requirement"是现实中最隐蔽的失败模式之一。11个维度的系统化覆盖显示这个文件在实际使用中经历了多次迭代（每个维度都像是修复了一次真实事故）。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 10 | 11个维度，每个有触发条件、红旗示例、YAML格式issue结构 |
| 认知增量 | 9 | Scope Reduction Detection和Cross-Plan Data Contracts是突破性设计 |
| 失败模式覆盖 | 10 | 覆盖：要求遗漏/任务不完整/循环依赖/孤立artifact/scope超出/静默降级 |
| 独立可执行性 | 7 | 依赖 gsd-tools 验证plan结构，较难完全脱离 |
| AI Agent特异性 | 9 | scope reduction detection专门针对 planner agent 的隐蔽失败模式 |
| 使用频率期望 | 8 | 每次 plan-phase 后触发，高频闸门 |
| **总分** | **53/60** | |

**结论：** 全仓库第二强的单文件（仅次于 gsd-verifier），Scope Reduction Detection 是最有独立借鉴价值的设计。

---

### 8. 其余 agents（省略详评）

以下 agents 与研发/写代码/产品不直接相关，或属于辅助/支撑角色，不做详细评估：

| Agent | 简述 | 省略理由 |
|-------|------|----------|
| `gsd-advisor-researcher` | 提供外部研究建议 | 偏咨询，不直接涉及代码生产 |
| `gsd-assumptions-analyzer` | 分析 phase 假设 | 辅助工具，价值依附于其他 agent |
| `gsd-code-fixer` | 修复代码 review 问题 | 类似 executor 的简化版，无独立新设计 |
| `gsd-doc-verifier` | 验证文档 | 文档场景，与代码评估关系弱 |
| `gsd-doc-writer` | 写文档 | 文档场景 |
| `gsd-integration-checker` | 检查集成点 | 值得关注但属 verifier 衍生，不单独评 |
| `gsd-intel-updater` | 更新 intel 文档 | 知识管理，不直接写代码 |
| `gsd-nyquist-auditor` | TDD/验证密度审计 | 在 plan-checker 里已覆盖，单体价值较低 |
| `gsd-phase-researcher` | Phase 前研究 | 研究辅助，不直接写代码 |
| `gsd-project-researcher` | 项目研究 | 研究辅助 |
| `gsd-research-synthesizer` | 研究综合 | 研究辅助 |
| `gsd-roadmapper` | 生成 roadmap | 产品规划，偏工程管理而非写代码 |
| `gsd-security-auditor` | 安全审计 | 专项工具，不通用 |
| `gsd-ui-auditor` / `gsd-ui-checker` / `gsd-ui-researcher` | UI 相关 | 偏 UI/UX 专项，不作通用评估 |
| `gsd-user-profiler` | 用户画像 | 产品分析，与编码关系弱 |

---

## 二、Command 层评估（核心6个生命周期入口）

路径：`commands/gsd/*.md`

---

### 2. `gsd-planner`

**定位：** Phase 规划 agent，产出可直接执行的 PLAN.md，"Plans are prompts, not documents that become prompts"

**内容亮点：**

- **context_fidelity 块**：锁定用户在 discuss 阶段做出的决策（D-XX），要求 planner 逐条映射到 task，不得绕过或隐性简化
- **scope_reduction_prohibition 块**：禁止使用 "v1/simplified/static for now" 等缩水语言，复杂时强制推荐 phase split 而非静默降级，并要求输出 decision coverage matrix
- **Quality Degradation Curve**：把 context 使用率与输出质量挂钩（0-30%→PEAK，70%+→POOR），推导出"每个plan最多2-3个task"的硬规则
- **discovery_levels**：4个研究级别（Level 0-3），根据任务类型决定是否需要先做研究，避免盲目开工
- **dependency_graph**：wave分析 + vertical slices vs horizontal layers的取舍原则，优先并行
- **Interface-First Task Ordering**：先定义类型/接口，再实现，防止 executor 探索地图式开工
- **Nyquist Rule**：每个 task 的 `<verify>` 必须包含 `<automated>` 命令，没有测试就先创建测试脚手架

**独立判断：**  
scope_reduction_prohibition 是这个文件最有洞见的部分。它解决了一个真实问题：agent 在任务太重时会静默缩水（把"实现X"改成"静态写死X"），而用户往往发现不了。强制 phase split + decision coverage matrix 是对这个失败模式的有效反制。Context Degradation Curve 把上下文预算的直觉数字化，有实战价值。

| 维度 | 分数 | 说明 |
|------|------|------|
| 规则密度 | 9 | context_fidelity/scope_reduction/discovery_levels 每块都有硬规则 |
| 认知增量 | 8 | scope_reduction_prohibition 的 phase split 强制机制是实质新颖设计 |
| 失败模式覆盖 | 9 | 覆盖：静默缩水、忽略用户决策、过大任务不拆分、水平层序替代垂直切片 |
| 独立可执行性 | 7 | 依赖 CONTEXT.md/ROADMAP.md/gsd-tools，但核心原则可迁移 |
| AI Agent特异性 | 9 | Quality Degradation Curve 和 scope_reduction 都是专门针对 agent 的设计 |
| 使用频率期望 | 8 | 每个 phase 都需要 planner，高频核心角色 |
| **总分** | **50/60** | |

**结论：** 规划层最强设计，scope_reduction_prohibition 尤其值得单独借鉴。

---

