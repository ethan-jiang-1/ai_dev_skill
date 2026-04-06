# Superpowers 独立技能评估报告（第 3 部分 — 终章）

> 评估人：Claude Opus 4.6 | 评估日期：2026-04-07  
> 评估范围：Skill #11 ~ #14 + 全仓库总评 + 支撑体系评估  
> 评估依据：逐文件源码精读 + 结构化维度评分

---

## Skill #11: finishing-a-development-branch

**路径**: `skills/finishing-a-development-branch/SKILL.md`  
**角色**: 开发链尾环 — 引导 agent 完成分支的收尾决策  
**字数**: ~500 词

### 设计理念

这个 skill 解决的是开发完成后的**"最后一公里"问题**：agent 实现了所有功能、通过了所有测试，然后……不知道该做什么。merge？PR？保留？丢弃？

它通过一个标准化的 5 步流程（Verify Tests → Determine Base Branch → Present Options → Execute Choice → Cleanup Worktree）将这个开放性问题转化为一个结构化的决策。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 9 | 5 步流程清晰；4 个选项各有独立的执行脚本；Quick Reference 表格一目了然；Common Mistakes 和 Red Flags 完整。缺少流程图但步骤足够线性不需要 |
| 规则密度 | 8 | "If tests fail → Stop. Don't proceed to Step 2." 是硬门禁。Option 4（Discard）要求用户键入 "discard" 确认。"Present exactly 4 options" 限制了选择空间。密度适中 |
| 失败模式覆盖 | 8 | 覆盖了：跳过测试验证、open-ended question（"接下来做什么？"→ 模糊）、自动清理 worktree（当用户可能还需要时）、不确认就丢弃工作。但对"在 merge 后发现 conflict"的处理不够详细 |
| 可验证性 | 9 | 每个选项的执行结果（merge 成功、PR 创建、分支保留、分支删除）都可以通过 git 状态验证 |
| 认知增量 | 6 | 流程本身不复杂。价值主要在于**标准化**——防止 agent 每次用不同方式收尾 |
| 复用潜力 | 9 | 适用于任何使用 git 的项目。与 worktree 的集成是加分项 |
| token 效率 | 9 | ~500 词传递了完整的收尾流程。简洁高效 |
| 与上下游衔接 | 9 | 被 subagent-driven-development 和 executing-plans 调用。与 using-git-worktrees 配对（清理 worktree）。Integration 段落清晰 |

### 亮点

- **"Present exactly 4 options" 规则** 是一个微妙但重要的设计。它防止了 agent 生成冗长的选项列表或模糊的建议。4 个选项涵盖了所有合理的收尾路径。
- **Option 4 的确认机制**（"Type 'discard' to confirm"）是防止误删的最后一道防线。包括显示"将永久删除"的内容清单——commits 列表让用户清楚知道自己将失去什么。
- **Quick Reference 表格** 用 4×4 矩阵清晰展示每个选项的行为差异（Merge/Push/Keep Worktree/Cleanup Branch），一眼可比。
- **与 worktree 的集成** 体现了 superpowers 的系统性：创建 worktree 的 skill（using-git-worktrees）和清理 worktree 的 skill（finishing-a-development-branch）形成完整的生命周期。

### 问题

- **缺少 merge conflict 处理**：Option 1（Merge Locally）执行 `git merge` 后如果有 conflict，skill 没有给出处理指导。
- **Option 2 的 PR 模板过简**：PR body 只有 Summary 和 Test Plan 两个部分。对于大型 PR，可能需要更丰富的模板。
- **没有 "partial merge" 选项**：如果只想合并部分 commit，没有对应的选项。

### 评分

**加权总分: 8.3 / 10**  
**评级: A+**

> finishing-a-development-branch 是一个精简、可靠的收尾流程。它不追求创新，而是追求标准化和安全性。

---

## Skill #12: using-git-worktrees

**路径**: `skills/using-git-worktrees/SKILL.md`  
**角色**: 基础设施 skill — 创建隔离工作空间  
**字数**: ~500 词

### 设计理念

using-git-worktrees 是一个**操作型 skill**，它的核心价值不在纪律塑形，而在于**自动化一个容易出错的操作流程**：

1. 选择 worktree 目录（按优先级：现有目录 > CLAUDE.md 偏好 > 询问用户）
2. 验证安全性（确保目录被 .gitignore 忽略）
3. 创建 worktree + 安装依赖 + 验证测试基线

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 9 | Directory Selection Process（3 级优先级）+ Safety Verification + Creation Steps（5 步）+ Quick Reference 表 + Common Mistakes + Example Workflow + Red Flags + Integration。结构完整 |
| 规则密度 | 8 | 目录选择有明确的优先级序列。Safety Verification 的"MUST verify directory is ignored"是硬规则。"If NOT ignored → Fix immediately" 是自动修复规则。密度适中 |
| 失败模式覆盖 | 9 | 覆盖了 4 种常见错误：跳过 ignore 验证（worktree 内容被 git 跟踪）、假设目录位置（不遵守优先级）、在测试失败时继续（无法区分新 bug 和已有问题）、硬编码 setup 命令（不同项目用不同工具）。每种错误都有具体的"Problem → Fix"描述 |
| 可验证性 | 9 | worktree 是否创建成功可以通过 `git worktree list` 验证。测试基线是否通过有明确的命令输出。目录是否被忽略可以通过 `git check-ignore` 验证 |
| 认知增量 | 7 | git worktree 本身不是新概念。但"自动检测项目类型 → 安装依赖 → 验证基线"的自动化流程是实用增量。Safety Verification 防止了一个不明显但严重的陷阱（worktree 内容被提交） |
| 复用潜力 | 8 | 适用于任何 git 项目。依赖 git worktree 功能 |
| token 效率 | 8 | ~500 词。Auto-detect setup 部分的多语言 if/then 占据了一些空间，但这是必要的 |
| 与上下游衔接 | 10 | 被 brainstorming、subagent-driven-development、executing-plans 调用。与 finishing-a-development-branch 配对。Integration 段落精确标注了"Called by"和"Pairs with"关系 |

### 亮点

- **Safety Verification** 是这个 skill 最有价值的部分。大多数 worktree 教程不会提醒你"确保目录被 .gitignore 忽略"，但如果不做这一步，worktree 的整个内容可能被意外提交到仓库中。
- **目录选择优先级**（existing > CLAUDE.md > ask user）是一个深思熟虑的设计。它避免了每次都询问用户，同时尊重用户的偏好设置。
- **"If NOT ignored → Fix immediately"** 是"发现问题就修复"哲学的体现。它不只是警告，而是直接修复（添加到 .gitignore + commit）。
- **自动检测项目类型**（package.json → npm install；Cargo.toml → cargo build；requirements.txt → pip install）减少了手动配置的需求。

### 问题

- **对复杂项目的覆盖不足**：monorepo、多语言项目、需要特殊环境变量的项目，auto-detect 可能不够。
- **Global directory 路径** `~/.config/superpowers/worktrees/` 是一个固定路径，可能与用户的 XDG 配置冲突。
- **没有 worktree 状态检查**：如果之前的 worktree 因为某种原因没有被清理，创建新 worktree 时没有检测机制。

### 评分

**加权总分: 8.5 / 10**  
**评级: S**

> using-git-worktrees 是一个看起来"只是工具型 skill"，但 Safety Verification 的设计让它成为防止数据泄露的重要守护者。

---

## Skill #13: dispatching-parallel-agents

**路径**: `skills/dispatching-parallel-agents/SKILL.md`  
**角色**: 效率型 skill — 并行派发多个独立调查 agent  
**字数**: ~600 词

### 设计理念

dispatching-parallel-agents 解决的是一个效率问题：**当多个独立的 bug/任务需要调查时，顺序处理是浪费时间的**。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 8 | When to Use 流程图 + The Pattern（4 步）+ Agent Prompt Structure + Common Mistakes + When NOT to Use + Real Example + Verification。结构完整但没有 checklist |
| 规则密度 | 6 | "Use when" 和 "Don't use when" 条件清晰但不算"规则"。缺少 Iron Law 级别的硬约束。更多是指导性建议 |
| 失败模式覆盖 | 7 | Common Mistakes 用 ❌/✅ 对比了 4 种错误：太宽泛、没上下文、没约束、输出模糊。When NOT to Use 覆盖了 related failures、shared state 等情况。但对"agent 之间意外编辑同一文件"的处理只是"Check for conflicts"，不够详细 |
| 可验证性 | 7 | 每个 agent 的输出是可验证的。但"任务是否真的独立"只能事后通过是否有 conflict 来验证 |
| 认知增量 | 7 | 并行化本身不是新概念。但"Agent Prompt Structure" 的指导（Focused + Self-contained + Specific about output）对写出好的 subagent prompt 是有价值的 |
| 复用潜力 | 8 | 依赖宿主支持并行 subagent。概念通用 |
| token 效率 | 8 | ~600 词。Real Example 占据较多空间但提供了高价值的具体场景 |
| 与上下游衔接 | 6 | 与 subagent-driven-development 有概念重叠（都是 subagent 调度），但没有明确标注两者的区别和适用边界。与 systematic-debugging 也有隐含的衔接（多个独立 bug → 并行调查） |

### 亮点

- **Agent Prompt Structure** 段落是全仓库最好的"如何写 subagent prompt"指导。3 条原则（Focused、Self-contained、Specific about output）加上一个完整的实际 prompt 示例。
- **Real Example** 不是虚构的——它标注了具体日期（2025-10-03）和具体的测试文件名，表明这是从真实 session 中提取的。
- **"Do NOT just increase timeouts - find the real issue"** 这行出现在 prompt 示例中，体现了 systematic-debugging 的精神渗透到了 agent prompt 的编写中。
- **Verification 4 步**（Review each summary → Check for conflicts → Run full suite → Spot check）提供了清晰的集成验证流程。

### 问题

- **与 SDD 的边界模糊**：SDD 也是 subagent 调度，但 SDD 是按 plan task 顺序执行，dispatching-parallel-agents 是独立任务并行。两者的适用边界应该更明确。
- **"2+ independent tasks" 的判断标准** 偏主观。什么算"independent"？文档给出了一些信号（different test files、different subsystems），但没有提供系统化的判断框架。
- **缺少失败回退策略**：如果一个 agent 失败了怎么办？重新派发？顺序处理？没有指导。

### 评分

**加权总分: 7.2 / 10**  
**评级: B+**

> dispatching-parallel-agents 是一个实用但不算创新的效率工具。它的 Agent Prompt Structure 指导比 skill 本身更有价值。

---

## Skill #14: writing-skills

**路径**: `skills/writing-skills/SKILL.md`  
**角色**: 元 skill — 教 agent 如何创建新的 skill  
**字数**: ~2000 词 + 支撑文件（anthropic-best-practices.md、persuasion-principles.md、testing-skills-with-subagents.md、graphviz-conventions.dot、render-graphs.js）

### 设计理念

writing-skills 是 superpowers 中最独特的 skill——它是**教你如何写 skill 的 skill**。它的核心主张是：

> **Writing skills IS Test-Driven Development applied to process documentation.**

这个类比将 skill 创建从"写文档"转变为"开发经过测试的行为规范"。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 10 | TDD Mapping 表 + Skill Types（3 类）+ Directory Structure + SKILL.md Structure + CSO（Claude Search Optimization）4 个维度 + Flowchart Usage 指导 + Code Examples 指导 + Iron Law + Testing All Skill Types（4 种类型各有测试方法）+ Rationalization Table + Bulletproofing 策略 + RED-GREEN-REFACTOR for Skills + Anti-Patterns + STOP Gate + Skill Creation Checklist + Discovery Workflow。这是全仓库结构最复杂的 skill |
| 规则密度 | 9 | Iron Law（NO SKILL WITHOUT A FAILING TEST FIRST）是核心。CSO 段落有 12 条具体的 Do/Don't 规则。Token Efficiency 有 5 种压缩技巧。Checklist 有 15+ 个勾选项。但部分内容偏向指导而非硬规则 |
| 失败模式覆盖 | 9 | Anti-Patterns 覆盖了 4 种常见错误（Narrative Example、Multi-Language Dilution、Code in Flowcharts、Generic Labels）。Rationalization Table 有 8 条。STOP Gate 防止批量创建未测试的 skill |
| 可验证性 | 8 | Skill Creation Checklist 提供了 15+ 个可勾选的验证项。但"skill 是否真的有效"最终取决于 agent 行为测试，这比代码测试更难量化 |
| 认知增量 | 10 | "skill creation = TDD for documentation" 这个类比本身就是极高的认知增量。CSO（Claude Search Optimization）概念——为 agent 的搜索行为优化 skill 元数据——是一个全新的设计维度。"description 不应该总结工作流"的发现更是来自真实测试的宝贵经验 |
| 复用潜力 | 10 | 任何想创建 agent skill 的人都可以使用。完全通用 |
| token 效率 | 5 | ~2000 词是全仓库最长的 skill。CSO 段落、Bulletproofing 段落、Testing All Skill Types 段落各自都很长。但作为"元 skill"，它承载的信息本质上就是最多的 |
| 与上下游衔接 | 7 | 引用了 test-driven-development（REQUIRED BACKGROUND）和 testing-skills-with-subagents.md。但与其他 skill 的关系主要是间接的（通过定义 skill 创建标准影响所有 skill）。没有显式的 Integration 段落 |

### 亮点

- **CSO（Claude Search Optimization）** 是 superpowers 中最独创的概念。它把"如何让 agent 找到你的 skill"当作一个优化问题来解决。关键发现："description 如果总结了工作流，Claude 可能按 description 执行而跳过正文"——这个发现价值极高。
- **TDD Mapping 表** 将代码开发概念（test case、production code、refactor）与 skill 创建概念（pressure scenario、skill document、close loopholes）做了精确的映射。这不只是类比，而是可操作的方法论。
- **Testing All Skill Types** 按 skill 类型（Discipline、Technique、Pattern、Reference）给出了不同的测试方法。这比"一刀切"的测试建议更精准。
- **Bulletproofing 策略** 是写纪律型 skill 的实战指南："Close Every Loophole Explicitly""Address 'Spirit vs Letter' Arguments""Build Rationalization Table""Create Red Flags List"。这些策略正是 TDD skill、debugging skill 等纪律型 skill 中实际使用的技巧。
- **Token Efficiency 段落** 体现了成本意识：getting-started 类 skill 要 <150 词、其他 <500 词。还给出了 5 种具体的压缩技巧。
- **STOP Gate**（"Before Moving to Next Skill"）防止了批量创建未测试 skill 的诱惑。
- **persuasion-principles.md 引用**（Cialdini, 2021; Meincke et al., 2025）将行为塑形建立在学术研究基础上。

### 问题

- **长度是最大问题**：~2000 词在 skill 中是极端异常值。虽然内容都是有价值的，但 agent 可能不会完整阅读。
- **自我参照悖论**：这个 skill 教你如何写 skill，但它自己的 token 效率违反了它自己的规则（<500 词目标）。
- **测试方法论的实操性**：RED-GREEN-REFACTOR for Skills 需要 subagent 来执行 baseline 测试。如果宿主不支持 subagent，测试流程就无法完成。
- **Anthropic best practices 引用** 可能与 superpowers 自己的 skill 哲学有冲突（CLAUDE.md 明确说"Our internal skill philosophy differs from Anthropic's published guidance"）。

### 评分

**加权总分: 8.3 / 10**  
**评级: A+**

> writing-skills 是全仓库认知增量最高的 skill。CSO 概念和"TDD for documentation"框架都是原创贡献。但其 2000 词的长度与其自身倡导的 token 效率原则相矛盾。

---

## 支撑体系评估

### hooks/hooks.json + session-start

| 维度 | 评价 |
|---|---|
| 设计意图 | 在 session 启动时自动注入 using-superpowers skill，解决"agent 不主动查 skill"的根本问题 |
| 技术实现 | 使用 `SessionStart` 事件 + `run-hook.cmd` 脚本。matcher 覆盖 `startup|clear|compact` |
| 优点 | 零用户干预；每次新 session 自动生效；跨平台（通过 run-hook.cmd） |
| 问题 | 单点依赖：如果 hook 执行失败，整个系统不会报错，only silently degrade |
| 评分 | **8.5 / 10** |

### subagent prompt 模板

| 模板 | 评分 | 核心价值 |
|---|---:|---|
| implementer-prompt.md | 9.0 | 四种状态码（DONE/DONE_WITH_CONCERNS/BLOCKED/NEEDS_CONTEXT）+ Self-Review 框架 + "It is always OK to stop" 安全阀 |
| spec-reviewer-prompt.md | 9.5 | "CRITICAL: Do Not Trust the Report" 是全仓库最强的反信任偏差规则 |
| code-quality-reviewer-prompt.md | 8.0 | 简洁的模板引用，附加了 4 条文件组织检查。相对较薄 |

### CLAUDE.md（贡献者指南）

这不是 skill，而是仓库治理文档。但它的设计水平值得单独评价。

| 维度 | 评价 |
|---|---|
| 对 AI agent 的约束 | "94% PR rejection rate" 开篇就建立了严肃氛围。5 条 MUST 检查（读 PR template、搜索已有 PR、验证真实问题、确认属于 core、给用户看 diff）是极强的 gate |
| "What We Will Not Accept" | 8 类被禁止的贡献，每类都有具体的判断标准。特别是"Compliance changes to skills"——明确拒绝"按照 Anthropic 官方指南重写 skill"的 PR |
| "your human partner" 术语 | 明确说明这是刻意的、不可替换的 |
| 评分 | **9.0 / 10** — 这是我见过的对 AI agent 贡献行为约束最严格的开源仓库指南 |

---

## 全仓库总评

### 14 个 Skill 评分汇总

| # | Skill | 评分 | 评级 | 类型 |
|---:|---|---:|---|---|
| 1 | using-superpowers | 9.1 | S | Bootstrap 治理 |
| 2 | brainstorming | 8.8 | S | 流程（设计） |
| 3 | writing-plans | 9.5 | S+ | 流程（计划） |
| 4 | executing-plans | 7.1 | B+ | 流程（执行-降级） |
| 5 | subagent-driven-development | 9.3 | S+ | 流程（执行-完整） |
| 6 | systematic-debugging | 9.1 | S | 纪律（调试） |
| 7 | test-driven-development | 9.0 | S | 纪律（开发） |
| 8 | verification-before-completion | 9.3 | S+ | 纪律（验证） |
| 9 | requesting-code-review | 7.8 | A | 质量保障（请求） |
| 10 | receiving-code-review | 8.5 | S | 质量保障（接收） |
| 11 | finishing-a-development-branch | 8.3 | A+ | 流程（收尾） |
| 12 | using-git-worktrees | 8.5 | S | 基础设施 |
| 13 | dispatching-parallel-agents | 7.2 | B+ | 效率优化 |
| 14 | writing-skills | 8.3 | A+ | 元 skill |

### 统计

- **14 个 skill 平均分: 8.56 / 10**
- **最高分: writing-plans (9.5), verification-before-completion (9.3), subagent-driven-development (9.3)**
- **最低分: executing-plans (7.1), dispatching-parallel-agents (7.2)**
- **S+ 评级: 3 个** | **S 评级: 6 个** | **A+ 评级: 2 个** | **A 评级: 1 个** | **B+ 评级: 2 个**
- **S 及以上占比: 64%**

### 六维仓库级评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 规则密度 | 10 | 14 个 skill 中有 7 个的规则密度达到 9-10 分。Iron Law、Red Flags、Rationalization Table 三件套的密度在同类仓库中无出其右 |
| 认知增量 | 9 | CSO 概念、两阶段 review、"TDD for documentation"、"1% chance rule"、"3+ fixes = architecture problem" 等都是高价值原创概念。扣 1 分因为部分 skill 的认知增量较低（executing-plans、dispatching-parallel-agents） |
| 失败模式覆盖 | 10 | 这是 superpowers 最突出的优势。从"表演性认同"到"假装完成"到"猜修循环"到"跳过测试"到"提前实现"到"批量创建未测试 skill"——几乎穷举了 agent 在软件开发中的所有常见偏差 |
| 独立可执行性 | 8 | 安装路径清晰、结构标准化、多宿主适配完善。但完整效果依赖 subagent 支持、hook 机制、worktree 功能。在不支持这些功能的最小化环境中，只能使用部分 skill |
| AI Agent 特异性 | 10 | 每一个 skill 都是围绕"agent 的典型行为偏差"设计的。Red Flags 表、Rationalization Table、"your human partner's Signals"、SUBAGENT-STOP 标签——这些设计在人类流程文档中完全不需要，但在 agent 语境中不可或缺 |
| 使用频率期望 | 9 | brainstorming、writing-plans、TDD、debugging、verification 这五个 skill 在几乎每个开发 session 中都会被触发。using-superpowers 在每个 session 开始时触发。writing-skills 频率较低但价值密度高。只有 dispatching-parallel-agents 的触发频率较低 |

**六维平均分: 9.33 / 10**  
**百分制换算: 93.3 / 100**  
**最终评级: S**

### 与全量评估的对比

| 维度 | 全量评估（前次） | 本次独立评估 | 差异 |
|---|---:|---:|---|
| 规则密度 | 10 | 10 | 一致 |
| 认知增量 | 8 | 9 | ↑ 本次更细致地识别了 CSO、"3+ fixes rule" 等原创概念 |
| 失败模式覆盖 | 10 | 10 | 一致 |
| 独立可执行性 | 8 | 8 | 一致 |
| AI Agent 特异性 | 10 | 10 | 一致 |
| 使用频率期望 | 9 | 9 | 一致 |
| **六维平均** | **9.17** | **9.33** | ↑ 0.16 |
| **百分制** | **91.7** | **93.3** | ↑ 1.6 |
| **评级** | **S** | **S** | 一致 |

### 全仓库架构图

```
                    ┌─────────────────────────┐
                    │    using-superpowers     │  ← 系统 bootstrap
                    │     (1% chance rule)     │
                    └──────────┬──────────────┘
                               │
              ┌────────────────┼────────────────┐
              ▼                ▼                ▼
       ┌──────────┐    ┌──────────────┐   ┌──────────┐
       │brainstorm│    │  systematic  │   │   TDD    │
       │  (设计)   │    │  debugging   │   │ (纪律)   │
       └────┬─────┘    │   (纪律)     │   └────┬─────┘
            │          └──────────────┘        │
            ▼                                  │
     ┌──────────────┐                          │
     │writing-plans │                          │
     │  (计划)      │                          │
     └──────┬───────┘                          │
            │                                  │
     ┌──────┴───────┐                          │
     │              │                          │
     ▼              ▼                          │
┌─────────┐  ┌───────────────┐                 │
│executing│  │subagent-driven│ ◄───────────────┘
│ -plans  │  │ development   │
│ (降级)   │  │  (完整版)     │
└────┬────┘  └──────┬────────┘
     │              │
     │    ┌─────────┴─────────┐
     │    ▼                   ▼
     │  ┌──────────┐  ┌──────────────┐
     │  │requesting│  │  receiving   │
     │  │code-review│ │ code-review  │
     │  └──────────┘  └──────────────┘
     │         │
     │         ▼
     │  ┌───────────────┐
     │  │ verification  │
     │  │before-complete│
     │  └───────────────┘
     │         │
     └────┬────┘
          ▼
   ┌──────────────┐     ┌────────────────┐
   │ finishing-a   │ ◄── │using-git       │
   │ dev-branch    │     │worktrees       │
   └──────────────┘     └────────────────┘

  旁路 skill:
   ┌──────────────────┐   ┌──────────────┐
   │ dispatching      │   │ writing      │
   │ parallel-agents  │   │ skills       │
   └──────────────────┘   └──────────────┘
```

### 核心结论

**superpowers 不是 14 个独立 skill 的集合。它是一个行为治理系统。**

这个结论的依据：

1. **bootstrap 机制**（using-superpowers + hooks）确保 skill 系统在 session 开始时被激活
2. **流程链路**（brainstorming → writing-plans → SDD/executing-plans → review → finishing）确保开发活动按固定路径推进
3. **纪律层**（TDD + debugging + verification）确保开发活动的质量底线
4. **质量保障层**（requesting/receiving code review + two-stage review）确保输出经过独立审查
5. **元 skill**（writing-skills）确保系统本身可以被扩展和维护

### 最值得学习的 5 个设计模式

1. **Iron Law + Rationalization Table 组合**：用一条不可违反的规则建立底线，再用反合理化表防止 agent 找到绕过的理由
2. **CSO（Claude Search Optimization）**：为 agent 的搜索行为优化 skill 元数据——特别是"description 不应总结工作流"的发现
3. **两阶段 review**（spec compliance → code quality）：分离"对不对"和"好不好"两个关注点
4. **"your human partner's Signals" 反推机制**：从用户的语言信号反推 agent 的行为偏差
5. **SUBAGENT-STOP 标签**：防止 bootstrap skill 在 subagent 中被递归执行

### 最大的结构性风险

1. **hook 单点故障**：如果 SessionStart hook 不触发，using-superpowers 不会被加载，整个系统可能不被使用
2. **token 预算压力**：14 个 skill 的总 token 量很大（估算 ~12,000 词）。如果 agent 的上下文窗口有限，可能无法同时加载多个 skill
3. **纪律疲劳**：过多的 Iron Law + Red Flags + Rationalization Table 可能让用户或 agent 产生"规则过载"的感觉
4. **宿主依赖**：完整功能（subagent、worktree、hook）依赖宿主支持。在最小化环境中，只有纪律型 skill 可以独立发挥作用

---

## 一句话最终评价

**superpowers 是目前公开可见的 agent skill 仓库中，行为治理完成度最高的一个。它最不可替代的价值不在于任何单个 skill 的内容，而在于 bootstrap → 流程链路 → 纪律层 → 质量保障 → 元扩展 这套闭环系统的整体设计。**

---

*全量独立评估完毕。报告共 3 个文件：*
- `superpowers-独立评估_1.md`：Skill #1-5（流程治理层 + 开发链路核心）
- `superpowers-独立评估_2.md`：Skill #6-10（纪律层 + 代码审查层）
- `superpowers-独立评估_3.md`：Skill #11-14 + 支撑体系 + 全仓库总评
