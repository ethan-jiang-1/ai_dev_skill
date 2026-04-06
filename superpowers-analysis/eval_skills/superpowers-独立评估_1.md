# Superpowers 独立技能评估报告（第 1 部分）

> 评估人：Claude Opus 4.6 | 评估日期：2026-04-06  
> 评估范围：Skill #1 ~ #5（流程治理层 + 开发链路核心）  
> 评估依据：逐文件源码精读 + 结构化维度评分

---

## 评估框架说明

每个 skill 按以下 8 个维度独立评分（1-10 分）：

| 维度 | 含义 |
|---|---|
| **结构完整性** | front matter、checklist、flow、gate 等结构元素是否齐备 |
| **规则密度** | 单位篇幅内可执行规则（禁止项、必须项、条件分支）的数量 |
| **失败模式覆盖** | 对 agent 常见偏差（跳步、臆断、合理化）的覆盖程度 |
| **可验证性** | 行为结果是否可通过测试或外部证据验证 |
| **认知增量** | 对没用过此 skill 的 agent 带来的认知提升幅度 |
| **复用潜力** | 跨项目、跨宿主的通用性 |
| **token 效率** | 以最少 token 传递最多可执行信息的能力 |
| **与上下游衔接** | 与其他 skill 的 integration 关系是否清晰、可操作 |

最终给出单个 skill 的加权总分（10 分制）和字母评级。

---

## Skill #1: using-superpowers

**路径**: `skills/using-superpowers/SKILL.md`  
**角色**: 系统级 bootstrap — 决定所有 skill 是否被调用  
**字数**: ~700 词

### 设计理念

这个 skill 不做具体任务，而是解决一个元问题：**agent 拥有技能但不主动使用技能**。

它通过三个机制实现：
1. **1% 规则**："哪怕有 1% 的可能性某个 skill 适用，你就必须调用它"
2. **Red Flags 表**：列出 12 种 agent 常见的自我合理化思维，逐条击破
3. **优先级排序**：Process skill（如 brainstorming、debugging）必须先于 Implementation skill

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 9 | front matter 规范；有 Graphviz 流程图；有优先级表；缺少 checklist（但这个 skill 本质上不是 checklist 型） |
| 规则密度 | 10 | 每一段几乎都是可执行规则：MUST、NEVER、STOP。密度极高 |
| 失败模式覆盖 | 10 | Red Flags 表是全仓库最精彩的设计之一——12 条合理化拦截，覆盖了"太简单""先探索再说""我知道那个 skill"等几乎所有常见偏差 |
| 可验证性 | 7 | 行为可以通过 test/skill-triggering 验证 skill 是否被触发，但中间状态（agent 内心是否真的检查了）不可直接验证 |
| 认知增量 | 10 | 这是一个"如果你不读它，你根本不知道你应该读它"的 skill。它解决的问题是 agent 行为系统的元缺陷 |
| 复用潜力 | 10 | 与任何项目类型无关，纯通用 |
| token 效率 | 8 | ~700 词传递了大量规则，但 Red Flags 表占据较多空间（不过这些空间是值得的） |
| 与上下游衔接 | 9 | 明确给出 Skill Priority 顺序；有多宿主适配引用（Copilot CLI、Gemini CLI、Codex）。唯一不足是没有显式标注自己与 hooks/session-start 的关系 |

### 亮点

- **"1% chance" 规则** 是一个极其精准的行为约束。它不是模糊的"建议检查"，而是将阈值降到极低，让 agent 几乎没有不调用的理由。
- **Red Flags 表** 的设计反映了大量实战调优经验。它不是理论推演，而是从真实 agent 行为中提取的反模式清单。
- **SUBAGENT-STOP 标签** 让 subagent 跳过此 skill，避免递归注入——这是一个细节但非常关键的设计。
- **Instruction Priority 层级**（用户 > Superpowers > 系统默认）是一个成熟的优先级声明，防止 skill 变成独裁。

### 问题

- **依赖 hook 注入**：如果 SessionStart hook 失败或宿主不支持 hook，这个 skill 完全不会生效。它是整个系统的单点故障。
- **语气压力**：`<EXTREMELY-IMPORTANT>` 标签 + 全大写 + "This is not negotiable" 的措辞，可能让部分用户感到不适。但从 agent 行为塑形角度看，这种强度是有效的。
- **无降级方案**：如果用户明确不想要这种纪律（比如纯探索性对话），没有显式的 opt-out 机制（虽然 Instruction Priority 隐式允许用户覆盖）。

### 评分

**加权总分: 9.1 / 10**  
**评级: S**

> 这是 superpowers 的心脏。如果整个仓库只能保留一个 skill，它应该是 using-superpowers。

---

## Skill #2: brainstorming

**路径**: `skills/brainstorming/SKILL.md`  
**角色**: 开发链第一环 — 将模糊想法转化为经批准的设计文档  
**字数**: ~1100 词

### 设计理念

brainstorming 不是"让 agent 自由发挥创意"，而是一个**结构化的需求提炼和设计审批流程**。它的核心主张是：

> 任何项目——无论看起来多简单——都必须先经过设计审批，再进入实现。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 10 | 9 步 checklist + Graphviz 流程图 + HARD-GATE 标签 + Anti-Pattern 段落 + 设计原则 + 文档规范 + Self-Review checklist + User Review Gate + 衔接声明。结构极其完整 |
| 规则密度 | 9 | HARD-GATE 是强约束；"一次只问一个问题""提出 2-3 个方案""YAGNI ruthlessly" 都是明确规则。但相比 TDD/debugging，纪律性稍低（因为本质是协作型 skill） |
| 失败模式覆盖 | 9 | Anti-Pattern 段落直击"太简单不需要设计"这一最常见偏差。Scope Check 防止过大项目未拆分。但对"agent 在提问阶段就开始偷偷实现"的覆盖不够显式 |
| 可验证性 | 8 | 设计文档会被写入 `docs/superpowers/specs/`，可验证输出物存在。Spec Self-Review 和 User Review Gate 是双重验证。但"问题质量"本身难以量化验证 |
| 认知增量 | 8 | "设计先于实现"不是新概念，但将其落地为 9 步 checklist + HARD-GATE + Visual Companion 是显著增量 |
| 复用潜力 | 9 | 完全通用。唯一限制是 Visual Companion 需要浏览器支持 |
| token 效率 | 7 | ~1100 词偏长。Visual Companion 段落占据较多空间，但只在视觉相关场景触发。可以考虑将 Visual Companion 完全移到支撑文件（实际上它已经做了，SKILL.md 里是入口） |
| 与上下游衔接 | 10 | 终端状态明确："唯一的下一步是 writing-plans"。对 Visual Companion 的引用指向 `visual-companion.md`。与 Spec Self-Review 的四步检查衔接清晰 |

### 亮点

- **HARD-GATE 标签** 是一个极强的约束："在用户批准设计之前，不得写任何代码、调用任何实现 skill、做任何实现动作"。这比普通的"建议先设计"强 10 倍。
- **"一次只问一个问题"** 的规则非常实用。agent 最常见的错误之一就是一次抛出 5 个问题淹没用户。
- **Scope Check** 对大型项目的拆分建议（"如果请求包含多个独立子系统，立即标记"）是一个容易被忽略但极其重要的守护。
- **Spec Self-Review 四步检查**（placeholder scan、internal consistency、scope check、ambiguity check）是自动化质量门。
- **设计原则中的隔离性要求**（"每个单元一个明确目的""可以独立理解和测试"）不是空泛的建议，而是操作性很强的设计指导。

### 问题

- **对超简单任务的摩擦**：即使是"改一个配置项"，也必须走 9 步流程。虽然文档说"设计可以很短"，但流程开销仍然存在。
- **Visual Companion 的依赖**：需要本地服务器 + 浏览器，增加了技术门槛。
- **"提出 2-3 个方案"** 对某些已经很明确的需求来说可能是多余的。

### 评分

**加权总分: 8.8 / 10**  
**评级: S**

> brainstorming 是开发链路的入口，它的质量直接决定后续所有步骤的基础。作为"设计审批"skill，它的结构完整度和与上下游的衔接是全仓库最好的。

---

## Skill #3: writing-plans

**路径**: `skills/writing-plans/SKILL.md`  
**角色**: 将设计文档转化为可执行的逐步实现计划  
**字数**: ~650 词

### 设计理念

writing-plans 的核心假设是：**执行者对代码库和问题域一无所知**。因此计划必须：
- 精确到每个文件路径
- 精确到每个步骤的代码
- 精确到每个验证命令的预期输出

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 10 | Plan Document Header 模板 + Task Structure 模板 + Self-Review 三步 + Execution Handoff。结构完整且规范化程度极高 |
| 规则密度 | 10 | "No Placeholders" 列出 6 种被禁止的模糊写法；"Bite-Sized Task Granularity" 规定每步 2-5 分钟；每步必须包含实际代码。密度极高 |
| 失败模式覆盖 | 10 | "No Placeholders" 段落是针对 agent 生成计划时最常见的敷衍行为（"TBD""implement later""similar to Task N"）的精确打击 |
| 可验证性 | 9 | 计划输出为 markdown 文件，可以验证其结构和内容。Self-Review 三步检查（spec coverage、placeholder scan、type consistency）提供了自验证机制。但"计划是否真的足够详细让盲人执行"很难自动验证 |
| 认知增量 | 9 | "假设执行者一无所知"的设计哲学本身就是强认知增量。"No Placeholders" 规则将其落地 |
| 复用潜力 | 9 | 通用。唯一的项目特异性是 `docs/superpowers/plans/` 这个默认路径（但已声明用户可覆盖） |
| token 效率 | 9 | ~650 词内传递了计划编写的全部要求。模板部分不可压缩（本身就是给执行者看的），其余部分简洁 |
| 与上下游衔接 | 10 | 上游：由 brainstorming 产出的 spec 触发。下游：明确提供两个执行路径（subagent-driven-development vs executing-plans）并让用户选择 |

### 亮点

- **"No Placeholders" 规则** 是 writing-plans 的灵魂。它把"写计划"从"写大纲"提升到了"写可执行脚本"。6 种被禁止的模式直接来自 agent 生成计划的真实失败案例。
- **Bite-Sized Granularity**（每步 2-5 分钟）是一个非常实用的约束。它防止了 agent 写出"步骤 3：实现整个认证系统"这种伪步骤。
- **Self-Review 三步** 特别是 "Type consistency"（检查前后 task 中函数名是否一致）非常细致，体现了实战中遇到过这种 bug。
- **Plan Document Header 模板** 中的 `> For agentic workers: REQUIRED SUB-SKILL` 标注确保计划的执行者知道应该用哪个 skill 来执行。
- **File Structure 段落** 要求在定义 task 之前先规划文件结构——这是一个容易被跳过但对代码质量至关重要的步骤。

### 问题

- **Scope Check 与 brainstorming 的重叠**：brainstorming 已经做了 scope 拆分，writing-plans 又做一次。虽然是防御性设计，但可能产生重复工作。
- **Self-Review 没有显式要求执行**：三步检查是文字描述，没有 checklist 勾选要求。
- **代码示例的局限性**：模板中的代码示例是 Python/bash，但实际项目可能是任何语言。

### 评分

**加权总分: 9.5 / 10**  
**评级: S+**

> writing-plans 是全仓库"规则密度 vs token 效率"比值最高的 skill。650 词内传递了极其密集的可执行规则，且每条规则都有明确的失败模式作为背景支撑。

---

## Skill #4: executing-plans

**路径**: `skills/executing-plans/SKILL.md`  
**角色**: 在独立 session 中按计划逐步执行任务  
**字数**: ~300 词

### 设计理念

executing-plans 是一个**精简的计划执行器**。它的存在意义是提供一个不依赖 subagent 的执行路径，适用于不支持 subagent 的宿主环境。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 7 | 三步流程 + When to Stop + When to Revisit + Integration。结构清晰但简单。没有 checklist、没有流程图 |
| 规则密度 | 7 | "STOP executing immediately when" 列出了 4 种停止条件。"Don't force through blockers" 是关键规则。但整体规则数量偏少 |
| 失败模式覆盖 | 6 | 覆盖了"猜而不问"和"强行推进 blocker"两种失败模式。但缺少对"跳过验证步骤""在 main 分支上直接开发"等更细致的覆盖（虽然 Remember 列表提到了后者） |
| 可验证性 | 7 | TodoWrite 跟踪任务状态可验证。但没有像 subagent-driven-development 那样的 spec compliance review 机制 |
| 认知增量 | 5 | 基本是"读计划、执行、报告"的常识流程。相比 subagent-driven-development，增量较低 |
| 复用潜力 | 8 | 通用。作为 subagent-driven-development 的降级方案存在价值 |
| token 效率 | 9 | ~300 词极简。信息密度合理 |
| 与上下游衔接 | 8 | 上游：writing-plans。下游：finishing-a-development-branch。Integration 段落清晰列出依赖关系。但主动引导用户"如果有 subagent 支持，请用 subagent-driven-development"的方式可以更显眼 |

### 亮点

- **极简设计**：不添加不必要的复杂度。对于不支持 subagent 的环境，这正是所需的。
- **"Tell your human partner" 提醒**：主动告诉用户 subagent 版本更好，这是一个罕见的 skill 自我降级建议。
- **"Never start implementation on main/master branch" 规则** 虽然只是一行，但防止了最严重的破坏性操作之一。

### 问题

- **缺少 review 机制**：相比 subagent-driven-development 的两阶段 review（spec compliance + code quality），executing-plans 完全没有 review 环节。
- **缺少失败处理的细节**：When to Stop 列出了停止条件，但停止后应该怎么做（重试？重新规划？向用户汇报？）不够明确。
- **与 subagent-driven-development 的定位有些模糊**：文档说"parallel session"但实际含义不太清晰。

### 评分

**加权总分: 7.1 / 10**  
**评级: B+**

> executing-plans 是一个功能性的降级方案，但与 subagent-driven-development 相比，它在质量保障（缺少 review 机制）和失败模式覆盖上有明显差距。

---

## Skill #5: subagent-driven-development

**路径**: `skills/subagent-driven-development/SKILL.md`  
**角色**: 以 subagent 为执行单元的开发流程核心引擎  
**字数**: ~1200 词（SKILL.md）+ 支撑文件（implementer-prompt, spec-reviewer-prompt, code-quality-reviewer-prompt）

### 设计理念

subagent-driven-development (SDD) 是 superpowers 最复杂、最雄心勃勃的 skill。它的核心范式是：

> 每个 task 派出一个全新的 subagent 执行，执行后经过两阶段 review（spec compliance → code quality），通过后才进入下一个 task。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 10 | When to Use 流程图 + The Process 完整流程图 + Model Selection 指南 + Handling Implementer Status 四种状态 + Prompt Templates + Example Workflow + Advantages/Cost 分析 + Red Flags + Integration。结构极其完整 |
| 规则密度 | 10 | Red Flags 列出 12 条 "Never"；四种 implementer status 各有处理规则；review 顺序不可颠倒（spec compliance 必须在 code quality 之前）。规则密度极高 |
| 失败模式覆盖 | 10 | 覆盖了几乎所有可能的失败模式：跳过 review、颠倒 review 顺序、并行派发 implementer（导致冲突）、忽略 subagent 提问、接受"差不多"的 spec compliance、让 self-review 替代 actual review、在未解决问题时移至下一个 task |
| 可验证性 | 9 | 两阶段 review 提供了双重验证。spec-reviewer-prompt 的 "CRITICAL: Do Not Trust the Report" 是一个很强的验证约束。但最终集成后的整体验证只有一次 final code review |
| 认知增量 | 10 | "fresh subagent per task + two-stage review" 的范式对大多数 agent 工作流来说是全新的。Model Selection 的成本/能力权衡指导也是高价值增量 |
| 复用潜力 | 8 | 依赖宿主支持 subagent（Task/Agent tool）。在不支持的环境中无法使用。但概念本身是通用的 |
| token 效率 | 7 | ~1200 词 + 3 个支撑文件。总 token 量较大。但考虑到流程复杂度，这个长度是合理的。Prompt Templates 外置到支撑文件是正确的设计 |
| 与上下游衔接 | 10 | 上游：writing-plans 或 executing-plans 的选择。下游：finishing-a-development-branch。Integration 段落列出所有依赖关系。subagent 内部引用 test-driven-development skill |

### 亮点

- **两阶段 review 设计**（spec compliance → code quality）是全仓库最精妙的质量保障机制。它分离了两个不同的关注点：你建的对不对（spec）→ 你建的好不好（quality）。
- **"CRITICAL: Do Not Trust the Report"**（spec-reviewer-prompt 中）是一个极其重要的约束。它防止了 reviewer 只看 implementer 的自述而不看实际代码。
- **四种 implementer status**（DONE、DONE_WITH_CONCERNS、BLOCKED、NEEDS_CONTEXT）提供了清晰的状态机。特别是 DONE_WITH_CONCERNS 允许"完成但有疑虑"的灰色地带。
- **Model Selection 指南** 是罕见的成本意识设计。大多数 skill 不会考虑"用便宜模型还是贵模型"。
- **"Never dispatch multiple implementation subagents in parallel"** 防止了文件冲突——这个规则来自实践中的真实问题。
- **Example Workflow** 段落是全仓库最好的示例：它不只展示成功路径，还展示了 review 发现问题 → 修复 → 再次 review 的真实循环。

### 问题

- **流程偏重**：对于小型 task（比如改一行代码），走完 implementer + spec review + code quality review 的完整流程开销较大。
- **上下文传递依赖 controller**：controller（调度者）需要手动从 plan 中提取 task 文本并构造 subagent prompt。如果 controller 遗漏了关键上下文，subagent 会失败。
- **review 循环的终止条件不明确**：如果 reviewer 反复发现问题、implementer 反复修复，没有明确的"最大循环次数"上限。

### 评分

**加权总分: 9.3 / 10**  
**评级: S+**

> subagent-driven-development 是 superpowers 最复杂也最有价值的 skill。它将"软件工程最佳实践"（code review、TDD、spec compliance）落地为一个可机器化执行的流水线，两阶段 review 设计是原创性最高的贡献。

---

## 第 1 部分总结

| Skill | 评分 | 评级 | 核心价值 |
|---|---:|---|---|
| using-superpowers | 9.1 | S | 系统心脏：解决"有技能但不用"的元问题 |
| brainstorming | 8.8 | S | 链路入口：将模糊想法转化为经审批的设计文档 |
| writing-plans | 9.5 | S+ | 规则密度之王：650 词内传递最密集的可执行规则 |
| executing-plans | 7.1 | B+ | 功能降级方案：缺少 review 机制是最大短板 |
| subagent-driven-development | 9.3 | S+ | 流水线核心：两阶段 review 是原创性最高的设计 |

**前 5 个 skill 的平均分: 8.76 / 10**

### 观察

1. **梯度设计清晰**：从 brainstorming（设计）→ writing-plans（计划）→ SDD/executing-plans（执行），形成完整的前半链路。
2. **executing-plans 是唯一的弱环**：它的存在有其价值（降级方案），但与 SDD 的差距过大。如果能为 executing-plans 添加至少一个 review checkpoint，整条链路的均匀性会更好。
3. **writing-plans 的"No Placeholders"规则应该推广**：这条规则的精神（禁止模糊表述、要求实际内容）适用于所有产生文档的 skill。

---

*下一部分将评估 Skill #6-10：systematic-debugging、test-driven-development、verification-before-completion、requesting-code-review、receiving-code-review*
