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

