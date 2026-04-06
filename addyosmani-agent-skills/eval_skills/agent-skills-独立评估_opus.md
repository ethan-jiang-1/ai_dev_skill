# Agent Skills 独立评估

## 评估说明

### 为什么要重新评估

前一轮评估（`agent-skills-全量评估.md`）用 5 个维度在 1-5 分尺度上给 20 个 skill 打了分。结果是：几乎所有 skill 都拿到 4-5 分，总分集中在 17-24 之间。第 1 名和第 12 名只差 4 分。这意味着评估没有完成它最基本的任务——区分好坏。

具体来说，旧评估有三个结构性缺陷：

**缺陷一：维度测的是模板合规性，不是内容质量。** 这 20 个 skill 全部遵循同一个模板格式——都有 Overview、When to Use、Process/Workflow、Common Rationalizations、Red Flags、Verification 这些 section。所以"结构化程度"和"验证强度"本质上在问"这个 skill 是不是用了标准模板"——答案当然几乎全是"是"。

**缺陷二：1-5 分刻度太窄。** 5 个刻度很难表达"一般"和"真正优秀"的差别。实际评分被压在 3-5 之间，区分度接近零。

**缺陷三：维度不正交。** "协作价值"和"复用范围"几乎完全正相关（通用的 skill 当然对协作也有价值）。"结构化程度"和"验证强度"也高度相关。5 个维度实质上只携带约 2.5 个独立信号。

### 本轮评估的设计原则

1. **评分必须区分真正优秀和平庸。** 改用 1-10 分，且锚定分数用具体 skill 做示例，确保分数能拉开。
2. **维度必须正交。** 每个维度测量其他维度不覆盖的东西。一个 skill 可以"规则密度高但认知增量低"，也可以"AI 特异性强但独立可执行性差"。
3. **评估基于文本内容本身。** 不评"这个 skill 的理念好不好"，而评"SKILL.md 里到底写了什么、写得多具体、有多少是读者靠自己想不到的"。

## 六个评估维度

### 维度 1：规则密度（Rule Density）

**定义：** 技能中包含多少条具体的、可测试的、有条件逻辑的规则？

**计数标准：** 命名规则（如 Rule 0-5）、编号原则、具体阈值（如"~100 行"）、决策树、判断表（Rationalization/Reality）、条件分支（如"if X → do Y, if Z → do W"）。

**排除标准：** "保持简单""注意安全""先理解再动手"之类的泛泛建议不算规则。

**分数锚定：**
- 3 分：有 3-6 条具体规则，大部分是标准知识
- 5 分：有 6-10 条规则，部分带条件逻辑
- 7 分：有命名规则 + 决策树/诊断树 + 判断表
- 9 分：极密。多组命名规则 + 多棵决策树 + 反模式表 + 红旗清单，每条都有代码示例

### 维度 2：认知增量（Cognitive Delta）

**定义：** 一个 5 年以上经验的资深工程师读完后，有多少内容是他原来不知道的、或者不会自然采纳的？

**判断标准：** 不是"这个概念好不好"，而是"这个概念对一个有经验的人来说是新的吗"。

**分数锚定：**
- 2 分：几乎全部是教科书或通行实践。如"原子提交""trunk-based 分支"
- 4 分：大部分是标准知识，有 1-2 个有用的新框架
- 6 分：有可观的非显然洞见。如 Chesterton's Fence 应用到代码简化、AI Aesthetic 对照表
- 8 分：引入了全新的框架或心智模型。如 Three-Tier Boundary System
- 10 分：核心概念几乎完全是新发明的。如 Context Hierarchy、trust levels for loaded files

### 维度 3：失败模式覆盖（Failure Mode Coverage）

**定义：** 是否具体命名了"会出什么错"，并给出了可操作的反制措施？

**计数标准：** Rationalization/Reality 表行数、Red Flags 条目数及具体程度、Anti-Pattern 表条目、"When NOT to use"的精确度、具体的条件分支诊断逻辑。

**分数锚定：**
- 3 分：有 Rationalization 表和 Red Flags，但条目少于 4 或内容泛泛
- 5 分：覆盖 5-8 个具体失败场景，有反制措施但不够细
- 7 分：覆盖全面，带条件诊断逻辑（if this symptom → check that cause）
- 9 分：读完失败模式部分就能避开大部分常见错误。每个失败模式都有具体 rebuttals

### 维度 4：独立可执行性（Standalone Executability）

**定义：** 一个 agent 或开发者能否只靠这份 SKILL.md 就执行这个技能？需要的外部工具/基础设施越少，分越高。

**分数锚定：**
- 2 分：需要 feature flag 系统 + 监控 + 灰度 + 回滚基础设施
- 4 分：需要特定工具/平台（如 Chrome DevTools MCP、GitHub Actions）
- 6 分：需要常见工具但大多数项目已有（如测试运行器）
- 8 分：只需标准开发工具（编辑器 + 版本控制 + 测试）
- 10 分：纯纪律/流程层面，零外部依赖

### 维度 5：AI Agent 特异性（AI Agent Specificity）

**定义：** 这个技能在多大程度上是专门为 AI agent 的失败模式设计的？

**判断标准：** 是否针对幻觉、过度生成、虚假自信、scope creep、sycophancy 等 AI 特有问题？把 SKILL.md 里所有 AI 相关的改为人类版本，内容需要改多少？

**分数锚定：**
- 2 分：放到任何人类工程师手册里完全不需要改动
- 4 分：主要是通用工程知识，偶尔提到 agent
- 6 分：有专门针对 AI 行为的 section 或规则
- 8 分：核心设计围绕 AI agent 失败模式
- 10 分：这个 skill 如果没有 AI agent 就不会存在

### 维度 6：使用频率期望（Expected Usage Frequency）

**定义：** 在典型的一周 AI 辅助开发中（各种项目类型和规模），这个技能会被触发多少次？

**分数锚定：**
- 2 分：一个季度或更少（如系统迁移、大版本下线）
- 4 分：一个月几次（如项目初期的 brainstorming、架构决策）
- 6 分：每周（如 CI 改动、前端调试）
- 8 分：每周多次（如每次 PR review、每次提交）
- 10 分：几乎每次写代码都用

## 全量评分表

| 排名 | Skill | 阶段 | 规则密度 | 认知增量 | 失败模式 | 可执行性 | AI特异性 | 使用频率 | 总分 |
|---:|---|---|---:|---:|---:|---:|---:|---:|---:|
| 1 | incremental-implementation | Build | 9 | 6 | 9 | 9 | 8 | 9 | **50** |
| 2 | debugging-and-error-recovery | Verify | 8 | 6 | 8 | 8 | 7 | 9 | **46** |
| 2 | test-driven-development | Build | 8 | 5 | 8 | 7 | 8 | 9 | **45** |
| 4 | context-engineering | Build | 6 | 9 | 7 | 8 | 10 | 9 | **49** |
| 5 | security-and-hardening | Review | 8 | 7 | 7 | 6 | 5 | 7 | **40** |
| 6 | code-review-and-quality | Review | 7 | 5 | 7 | 8 | 6 | 8 | **41** |
| 7 | code-simplification | Review | 7 | 6 | 6 | 9 | 6 | 6 | **40** |
| 8 | frontend-ui-engineering | Build | 6 | 6 | 5 | 7 | 6 | 5 | **35** |
| 9 | spec-driven-development | Define | 5 | 4 | 5 | 8 | 6 | 7 | **35** |
| 10 | using-agent-skills | Meta | 4 | 5 | 6 | 9 | 9 | 5 | **38** |
| 11 | planning-and-task-breakdown | Plan | 5 | 4 | 5 | 8 | 6 | 7 | **35** |
| 12 | api-and-interface-design | Build | 5 | 5 | 5 | 8 | 3 | 6 | **32** |
| 13 | performance-optimization | Review | 6 | 3 | 5 | 5 | 4 | 5 | **28** |
| 14 | idea-refine | Define | 5 | 5 | 4 | 9 | 5 | 3 | **31** |
| 15 | git-workflow-and-versioning | Ship | 5 | 2 | 4 | 8 | 4 | 7 | **30** |
| 16 | browser-testing-with-devtools | Verify | 5 | 5 | 4 | 3 | 6 | 5 | **28** |
| 17 | ci-cd-and-automation | Ship | 5 | 2 | 4 | 3 | 4 | 5 | **23** |
| 18 | documentation-and-adrs | Ship | 3 | 3 | 3 | 8 | 2 | 4 | **23** |
| 19 | shipping-and-launch | Ship | 4 | 2 | 4 | 2 | 3 | 3 | **18** |
| 20 | deprecation-and-migration | Ship | 4 | 4 | 3 | 4 | 2 | 2 | **19** |

**分数分布统计：** 最高 50，最低 18，跨度 32 分。旧评估跨度仅 7 分。

**注：** 按总分重新排序（修正了计划中的预估）：

| 排名 | Skill | 总分 |
|---:|---|---:|
| 1 | incremental-implementation | 50 |
| 2 | context-engineering | 49 |
| 3 | debugging-and-error-recovery | 46 |
| 4 | test-driven-development | 45 |
| 5 | code-review-and-quality | 41 |
| 6 | security-and-hardening | 40 |
| 6 | code-simplification | 40 |
| 8 | using-agent-skills | 38 |
| 9 | frontend-ui-engineering | 35 |
| 9 | spec-driven-development | 35 |
| 9 | planning-and-task-breakdown | 35 |
| 12 | api-and-interface-design | 32 |
| 13 | idea-refine | 31 |
| 14 | git-workflow-and-versioning | 30 |
| 15 | performance-optimization | 28 |
| 15 | browser-testing-with-devtools | 28 |
| 17 | ci-cd-and-automation | 23 |
| 17 | documentation-and-adrs | 23 |
| 19 | deprecation-and-migration | 19 |
| 20 | shipping-and-launch | 18 |

## 分层分析

### 第一梯队（总分 40+）：真正值得借鉴的 skill

#### 1. incremental-implementation（50 分）

这是整个仓库写得最好的 skill。

**规则密度 9 分的依据：** Rule 0 到 Rule 5 六条命名规则，每条都有 Good/Bad 对比代码。三种切片策略（Vertical Slices、Contract-First Slicing、Risk-First Slicing）各自附带完整的多步骤示例。Rationalization/Reality 表 5 行，每行都切中 agent 真实行为（"I'll test it all at the end" → "Bugs compound. A bug in Slice 1 makes Slices 2-5 wrong"）。Red Flags 清单 9 条，具体到"More than 100 lines of code written without running tests"和"Building abstractions before the third use case demands it"。

**AI 特异性 8 分的依据：** 这个 skill 存在的根本原因就是 AI agent 一次生成太多代码。Rule 0 的 Simplicity Check（"Generic EventBus with middleware pipeline for one notification → ✗"）、Rule 0.5 的 Scope Discipline（"不要顺手清理你没改的代码"）、Rule 1 的 One Thing at a Time——每条规则都在约束 agent 最常犯的错误。"Working with Agents"一节直接给出了如何指挥 agent 按切片执行的示范 prompt。

**最值得借鉴的点：** Rule 0.5（Scope Discipline）的"NOTICED BUT NOT TOUCHING"模式——agent 发现了不在任务范围内的问题时，记录下来但不动手修。这个模式对 agent 纪律极其有效。

#### 2. context-engineering（49 分）

这是整个仓库 AI 原生程度最高的 skill。

**认知增量 9 分的依据：** 5 级 Context Hierarchy（Rules Files → Specs → Source Files → Error Output → Conversation History）是全新的分层概念。Trust levels 把加载的文件分为 Trusted / Verify before acting / Untrusted 三级——这个分类在传统工程里不存在。Confusion Management 的两种模式（Context Conflicts 和 Incomplete Requirements）提供了具体的沟通模板——这些是 AI 时代才出现的工程问题。

**AI 特异性 10 分的依据：** 如果没有 AI agent，这个 skill 根本不会被发明。Context window 管理、幻觉防控、context starvation / flooding / stale 的诊断——每一个概念都是因为 AI agent 才存在的。Anti-Pattern 表中的"Context flooding"（"Agent loses focus when loaded with >5,000 lines"）直接引用了 AI 的注意力机制限制。

**最值得借鉴的点：** Inline Planning Pattern（多步任务前先发一个轻量计划让用户确认）和"Missing Requirement"模板。这两个模式能直接降低 agent 自行脑补的频率。

#### 3. debugging-and-error-recovery（46 分）

这是最成熟的排障流程 skill。

**规则密度 8 分的依据：** 6 步主流程（Reproduce → Localize → Reduce → Fix → Guard → Verify）。每步下面都有展开的子决策树。最出色的是"非可复现 bug"的 4 分支调查策略：Timing-dependent → Environment-dependent → State-dependent → Truly random，每个分支下有 3-4 条具体调查动作。另外还有 3 个错误类型（Test Failure / Build Failure / Runtime Error）的独立诊断树。

**失败模式覆盖 8 分的依据：** Rationalization 表 5 行，每条 Reality 部分都非常精准（"I know what the bug is, I'll just fix it" → "You might be right 70% of the time. The other 30% costs hours"）。额外的"Treating Error Output as Untrusted Data"一节点出了一个很少有人注意的安全问题——error message 中可能嵌入恶意指令。

**最值得借鉴的点：** Stop-the-Line 规则——出错后停止所有新功能开发。这直接对抗 agent 最常见的行为：遇到测试失败后绕过错误继续写新代码。

#### 4. test-driven-development（45 分）

**规则密度 8 分的依据：** Red-Green-Refactor 三步循环。Prove-It Pattern（bug fix 必须先写复现测试）。Test Pyramid 三层分布比例（80% / 15% / 5%）。Test Sizes 资源模型表（Small / Medium / Large 各有具体约束）。Anti-Pattern 表 6 行。"DAMP Over DRY in Tests"原则带完整对比代码。Beyonce Rule（"If you liked it, you should have put a test on it"）。Preference order for test doubles（Real > Fake > Stub > Mock）。

**AI 特异性 8 分的依据：** Prove-It Pattern 直接对抗 agent 的"自认为已修好"。Rationalization 表中"I'll write tests after the code works" → "You won't. And tests written after the fact test implementation, not behavior"精准命中 agent 行为。Subagent 模式（让另一个 agent 写复现测试，主 agent 不知道 fix 方案，确保测试独立性）是一个纯 AI 协作模式。

**最值得借鉴的点：** "Test State, Not Interactions"原则——Assert on outcome, not method calls。这对 agent 特别重要，因为 agent 倾向于生成 interaction-based 的 mock 测试。

#### 5. code-review-and-quality（41 分）

**规则密度 7 分的依据：** 五轴审查框架（Correctness / Readability / Architecture / Security / Performance），每轴有 4-5 个具体检查点。Change sizing 三级阈值（~100 好 / ~300 可接受 / ~1000 太大）。Severity 标签 5 级（Critical / 无前缀 / Nit / Optional / FYI）。Disagreement 解决层次 4 级。Dead Code Hygiene 专项清单。

**失败模式覆盖 7 分的依据：** 明确指出 sycophancy 是 review 的失败模式——"Don't rubber-stamp. LGTM without evidence of review helps no one"。还有"Don't accept 'I'll clean it up later'"——"Experience shows deferred cleanup rarely happens"。这些都是 agent 做 review 时真正容易犯的错。

**最值得借鉴的点：** Multi-Model Review Pattern（Model A 写代码，Model B 审查，不同模型有不同盲点）。以及 Severity 标签系统——让 author 知道什么必须改、什么可以忽略。

#### 6. security-and-hardening（40 分）

**规则密度 8 分的依据：** Three-Tier Boundary System（Always Do 8 条 / Ask First 7 条 / Never Do 7 条），每条都是具体的操作要求而非泛泛原则。OWASP Top 10 的前 6 条各有 Bad/Good 对比代码。npm audit 结果的决策树（severity × reachability × fix availability）。Rate limiting 的具体配置代码。Input validation 的 Zod schema 完整示例。

**认知增量 7 分的依据：** Three-Tier Boundary System 是一个有效的新分类法——把安全行为分成"无条件做""问了再做""绝对不做"三层，比传统的 OWASP checklist 更适合 agent 执行。npm audit triage 决策树也是一个非显然的判断框架。

**最值得借鉴的点：** Three-Tier 模式可以推广到安全以外的领域——任何需要约束 agent 行为的场景都可以用这种 Always/Ask/Never 分层。

#### 7. code-simplification（40 分）

**规则密度 7 分的依据：** 虽然 SKILL.md 行数不算多，但五个核心原则（Preserve Behavior / Follow Conventions / Clarity Over Cleverness / Maintain Balance / Scope to What Changed）每个都有具体的判断标准和代码对比。Chesterton's Fence 原则被完整翻译成代码语境——"先理解为什么这段代码存在，再决定是否删除"。还有三张具体的简化 pattern 表。

**独立可执行性 9 分的依据：** 零外部依赖。只需要一段代码和基本的测试能力就能执行。这使得它可以在任何环境下立即使用。

**最值得借鉴的点：** "Clarity Over Cleverness"原则配合 agent 使用特别有效——agent 天生倾向于生成"聪明"的代码（过度抽象、过度泛化），这个 skill 直接对抗这个倾向。

### 第二梯队（总分 28-39）：有价值但需要认清短板

#### 8. using-agent-skills（38 分）

AI 特异性极高（9 分），因为它完全是为 agent 的 skill 调度设计的。但规则密度低（4 分），因为它本质是一张路由表——"收到 bug → 用 debugging skill""收到新功能 → 用 spec-driven-development"。认知增量中等（5 分），因为路由逻辑本身并不复杂。**如果你只需要一个 skill 分流器，它有用；如果你想学到工程知识，它没什么内容。**

#### 9. frontend-ui-engineering（35 分）

认知增量的 6 分几乎全来自一张表——AI Aesthetic 对照表（"Purple/indigo everything → Use the project's actual color palette"等 8 行），这是全仓库最有创意的内容之一。但除此之外，组件架构（composition over configuration）、状态管理选型（useState → Context → Zustand）、a11y（WCAG 2.1 AA）、响应式设计——全部是任何前端工程师的基础知识。**AI Aesthetic 表单独拿出来价值很高，其余部分对资深前端工程师没有增量。**

#### 9. spec-driven-development（35 分）

理念非常重要（"先写规格再写代码"），但 SKILL.md 的实际内容偏薄。它描述了 Specify → Plan → Tasks → Implement 的 gated workflow，但没有给出一个完整的"好 spec 长什么样"的示例。相比之下，idea-refine 的 examples.md 有完整的对话示范。**概念是对的，但 SKILL.md 本身的信息密度不够高。**

#### 9. planning-and-task-breakdown（35 分）

和 spec-driven-development 类似——垂直切片、依赖图、checkpoint 的概念都对，但实际内容密度不如 incremental-implementation。后者才是"怎么真正按切片执行"的详细指南。**如果 planning-and-task-breakdown 是"战略"，incremental-implementation 才是"战术手册"——后者才是你真正需要的。**

#### 12. api-and-interface-design（32 分）

Contract First 和 Hyrum's Law 都是好原则，但 SKILL.md 更像一份参考文档而非可执行工作流。AI 特异性低（3 分）——把"agent"换成"工程师"，内容完全不需要修改。**适合当参考资料翻阅，不适合当 agent 行为规则。**

#### 13. idea-refine（31 分）

这是唯一一个附带 4 个支撑文件（frameworks.md、examples.md、refinement-criteria.md、scripts）的 skill，附带内容的质量很高——examples.md 里的餐厅案例是一个完美的 ideation session 示范。但使用频率极低（3 分）——只在项目初期或需求模糊时使用。且它更像产品发现工具而非工程技能。**它的支撑材料比主 skill 更有价值。**

#### 14. git-workflow-and-versioning（30 分）

认知增量 2 分——原子提交、trunk-based、descriptive commit messages、git bisect，全部是教科书级内容。一个用过 git 两年的工程师都知道这些。唯一有一点新意的是 "save point pattern"（频繁提交作为安全网）和 worktree 推荐，但这也不算罕见知识。**使用频率高（7 分）救了它——每次提交都会用到，但学不到新东西。**

#### 15. performance-optimization（28 分）

"Measure before optimizing"的理念对，symptom triage tree（What is slow → First page load / Interaction sluggish / Backend API → 各自子分支）有诊断价值。但 N+1 查询、图片优化、React.memo、bundle splitting 全是标准知识（认知增量 3 分）。独立可执行性也不高（5 分），因为需要 profiling 工具、Lighthouse、APM 等。**triage tree 可以借鉴，其余内容不如直接去看 web.dev。**

#### 15. browser-testing-with-devtools（28 分）

Security Boundaries 一节是亮点——把浏览器内容定义为 untrusted data，禁止 agent 执行 DOM 中发现的指令，禁止读取 cookies/localStorage。这个安全模型有独立价值。但整个 skill 强依赖 Chrome DevTools MCP（独立可执行性 3 分），没有这个 MCP server 就无法执行。**Security Boundaries 模型值得提取，其余内容与 MCP 工具绑定太深。**

### 第三梯队（总分 <25）：价值有限

#### 17. ci-cd-and-automation（23 分）

认知增量 2 分——内容主要是 GitHub Actions YAML 模板和"Shift Left"这种通行理念。独立可执行性 3 分——需要 GitHub Actions 或类似 CI 平台。它更像一份配置模板集而非一个 skill。**如果你需要 GitHub Actions 模板，直接看 GitHub 官方文档更新更全。**

#### 17. documentation-and-adrs（23 分）

整个 skill 的价值浓缩在一个 ADR 模板里（Title / Status / Context / Decision / Consequences）。除此之外，"comments should explain why not what""keep READMEs up to date"都是通行常识。AI 特异性 2 分——和 agent 完全无关。**ADR 模板本身有用，但不需要一整个 skill 来包装它。**

#### 19. deprecation-and-migration（19 分）

使用频率 2 分——一个季度可能用一次。AI 特异性 2 分——放到任何工程手册里无需改动。Strangler Pattern 和 Adapter Pattern 是标准知识。**对大型遗留系统有价值，但在 AI 辅助开发的日常中几乎用不上。**

#### 20. shipping-and-launch（18 分）

独立可执行性最低（2 分）——需要 feature flag 系统、分阶段发布能力、监控告警、回滚基础设施。没有这些基础设施，这个 skill 就是一张无法执行的 checklist。认知增量 2 分——pre-launch checklist、staged rollout、rollback plan 都是标准 DevOps 知识。**理念正确但落地前提太重。**

## 六维横切分析

### 规则密度 Top 5

| 排名 | Skill | 分数 | 关键证据 |
|---:|---|---:|---|
| 1 | incremental-implementation | 9 | Rule 0-5 命名规则 + 3 种切片策略 + Rationalization 表 5 行 + Red Flags 9 条 |
| 2 | debugging-and-error-recovery | 8 | 6 步主流程 + 3 种错误类型诊断树 + 非可复现 bug 4 分支策略 |
| 2 | test-driven-development | 8 | Red-Green-Refactor + Prove-It + Test Pyramid + Test Sizes 表 + Anti-Pattern 6 行 |
| 2 | security-and-hardening | 8 | Three-Tier Boundary 22 条 + OWASP 6 条代码示例 + npm audit 决策树 |
| 5 | code-review-and-quality | 7 | 五轴框架 + change sizing 3 级 + severity 5 级 + disagreement 4 级 |

### 规则密度 Bottom 5

| 排名 | Skill | 分数 | 为什么低 |
|---:|---|---:|---|
| 20 | documentation-and-adrs | 3 | 本质只有一条规则"写 ADR"加一个模板 |
| 19 | using-agent-skills | 4 | 路由表，不是规则集 |
| 18 | shipping-and-launch | 4 | 大量 checklist 但缺少条件判断逻辑 |
| 17 | deprecation-and-migration | 4 | 原则好但规则稀疏 |
| 16 | spec-driven-development | 5 | 描述了 gated workflow 但每个 gate 的判断标准不够具体 |

### 认知增量 Top 5

| 排名 | Skill | 分数 | 什么内容是新的 |
|---:|---|---:|---|
| 1 | context-engineering | 9 | Context Hierarchy、trust levels、confusion management——全新 AI 原生概念 |
| 2 | security-and-hardening | 7 | Three-Tier Boundary System 分类法 + npm audit triage 决策树 |
| 3 | incremental-implementation | 6 | Risk-First Slicing、Rule 0 Simplicity Check 的具体判断清单 |
| 3 | debugging-and-error-recovery | 6 | 非可复现 bug 的分类调查策略（Timing / Environment / State / Random） |
| 3 | code-simplification | 6 | Chesterton's Fence 应用到代码简化语境 |
| 3 | frontend-ui-engineering | 6 | AI Aesthetic 对照表——识别和对抗 AI 生成 UI 的同质化模式 |

### 认知增量 Bottom 5

| 排名 | Skill | 分数 | 为什么低 |
|---:|---|---:|---|
| 20 | git-workflow-and-versioning | 2 | 原子提交 + trunk-based = 教科书 |
| 19 | ci-cd-and-automation | 2 | Shift Left + GitHub Actions 模板 = 通行知识 |
| 19 | shipping-and-launch | 2 | pre-launch checklist + staged rollout = 标准 DevOps |
| 17 | performance-optimization | 3 | N+1 / React.memo / image optimization = 常识 |
| 17 | documentation-and-adrs | 3 | "explain why not what" = 常识 |

### 失败模式覆盖 Top 5

| 排名 | Skill | 分数 | 关键证据 |
|---:|---|---:|---|
| 1 | incremental-implementation | 9 | Rationalization 表 5 行每条精准切中 agent 真实借口 + Red Flags 9 条可操作 |
| 2 | debugging-and-error-recovery | 8 | 3 种错误类型的独立诊断树 + "error output as untrusted data" |
| 2 | test-driven-development | 8 | Rationalization 6 行 + Anti-Pattern 6 行 + Prove-It 对抗虚假修复 |
| 4 | context-engineering | 7 | Anti-Pattern 表 6 行（starvation/flooding/stale）+ confusion management |
| 4 | code-review-and-quality | 7 | Anti-sycophancy 指导 + "Don't accept 'I'll clean it up later'" |
| 4 | security-and-hardening | 7 | "Never Do"列表 = 7 条硬性失败防线 + Rationalization 表 5 行 |

### 失败模式覆盖 Bottom 5

| 排名 | Skill | 分数 | 为什么低 |
|---:|---|---:|---|
| 20 | documentation-and-adrs | 3 | Rationalization 表薄，Red Flags 是正面指导的简单反转 |
| 19 | deprecation-and-migration | 3 | 失败模式描述笼统 |
| 18 | idea-refine | 4 | Anti-patterns 节存在但多是"不要做太多""不要跳步骤"级别 |
| 17 | git-workflow-and-versioning | 4 | "不要大提交""不要混合 refactor 和 feature"——常识级 |
| 16 | browser-testing-with-devtools | 4 | Security Boundaries 节很好但其余失败模式覆盖不够 |

### 独立可执行性 Top 5

| 排名 | Skill | 分数 | 为什么高 |
|---:|---|---:|---|
| 1 | incremental-implementation | 9 | 只需编辑器 + 测试 + 版本控制 |
| 1 | code-simplification | 9 | 零外部依赖，纯纪律 |
| 1 | using-agent-skills | 9 | 纯路由逻辑，无工具依赖 |
| 1 | idea-refine | 9 | 纯对话 + 写 markdown |
| 5 | context-engineering | 8 | 直接用于组织信息 |

### 独立可执行性 Bottom 5

| 排名 | Skill | 分数 | 需要什么 |
|---:|---|---:|---|
| 20 | shipping-and-launch | 2 | feature flag + 监控 + 灰度 + 回滚基础设施 |
| 19 | browser-testing-with-devtools | 3 | Chrome DevTools MCP server |
| 19 | ci-cd-and-automation | 3 | GitHub Actions 或类似 CI 平台 |
| 17 | deprecation-and-migration | 4 | usage metrics + 替代方案 + 迁移能力 |
| 16 | performance-optimization | 5 | profiling 工具 + Lighthouse + APM |

### AI Agent 特异性 Top 5

| 排名 | Skill | 分数 | 为什么 AI 特有 |
|---:|---|---:|---|
| 1 | context-engineering | 10 | 没有 AI agent 这个 skill 不会存在 |
| 2 | using-agent-skills | 9 | 纯 agent routing |
| 3 | incremental-implementation | 8 | 对抗 agent 过度生成 |
| 3 | test-driven-development | 8 | Prove-It 对抗 agent 虚假自信 |
| 5 | debugging-and-error-recovery | 7 | Stop-the-Line 对抗 agent "边错边继续" |

### AI Agent 特异性 Bottom 5

| 排名 | Skill | 分数 | 为什么和 AI 无关 |
|---:|---|---:|---|
| 20 | deprecation-and-migration | 2 | 放到人类手册里零改动 |
| 20 | documentation-and-adrs | 2 | 同上 |
| 18 | api-and-interface-design | 3 | 通用接口设计原则 |
| 17 | shipping-and-launch | 3 | 标准 DevOps |
| 16 | git-workflow-and-versioning | 4 | 标准 git 实践 |

### 使用频率 Top 5

| 排名 | Skill | 分数 | 频率 |
|---:|---|---:|---|
| 1 | incremental-implementation | 9 | 几乎每个多文件任务 |
| 1 | debugging-and-error-recovery | 9 | 每次出错 |
| 1 | test-driven-development | 9 | 每次行为变更 |
| 1 | context-engineering | 9 | 每个 session 开始 |
| 5 | code-review-and-quality | 8 | 每次 merge 前 |

### 使用频率 Bottom 5

| 排名 | Skill | 分数 | 频率 |
|---:|---|---:|---|
| 20 | deprecation-and-migration | 2 | 一个季度一次 |
| 19 | idea-refine | 3 | 项目初期 |
| 19 | shipping-and-launch | 3 | 部署时 |
| 17 | documentation-and-adrs | 4 | 架构决策时 |
| 16 | using-agent-skills | 5 | session 开始或失焦时 |

## 与旧评估的对比

### 排名变动最大的 skill

| Skill | 旧排名 | 新排名 | 变动 | 原因 |
|---|---:|---:|---|---|
| context-engineering | 11 | 2 | +9 | 旧评估没有"AI 特异性"和"认知增量"维度，无法识别这个 skill 的独特价值 |
| using-agent-skills | 1 | 8 | -7 | 旧评估在每个维度都给了它 5 分（满分），但它本质是路由表，规则密度和认知增量都很低 |
| shipping-and-launch | 5 | 20 | -15 | 旧评估没有"独立可执行性"维度，无法识别它对基础设施的高依赖 |
| ci-cd-and-automation | 4 | 17 | -13 | 同上，加上认知增量低（全是标准 CI/CD 知识） |
| git-workflow-and-versioning | 3 | 14 | -11 | 认知增量 2 分拖了后腿——内容全是教科书级 |

### 为什么旧评估的维度失效

| 旧维度 | 失效原因 |
|---|---|
| 结构化程度 | 20 个 skill 用同一模板，天花板效应——全部 4-5 分 |
| 验证强度 | 模板自带 Verification section，几乎无法区分 |
| 复用范围 | 和"协作价值"高度相关，不是独立信号 |
| 工具依赖 | 方向对但刻度反了——旧评估里高分=高依赖=实际上是缺点 |
| 协作价值 | 太抽象，任何"好的工程实践"都有协作价值 |

### 新旧评估的本质区别

旧评估问的是：**"这个 skill 像不像一个好的 skill？"** 答案几乎全是"像"——因为它们都遵循了好的模板。

新评估问的是：**"这个 skill 的内容值不值得我花时间读？读完之后我能得到什么我原来没有的东西？我能直接用起来吗？"** 这些问题才能把"真正优秀"和"格式正确但内容平庸"区分开。

## 采纳建议

### 必借鉴（无论项目类型和规模）

| Skill | 从中提取什么 |
|---|---|
| incremental-implementation | Rule 0-5 + Scope Discipline 的"NOTICED BUT NOT TOUCHING"模式 + 薄切片的具体执行规范 |
| context-engineering | Context Hierarchy + Trust Levels + Confusion Management 模板 + Inline Planning Pattern |
| debugging-and-error-recovery | Stop-the-Line 规则 + 6 步 triage + 非可复现 bug 调查框架 |
| test-driven-development | Prove-It Pattern + "Test State, Not Interactions" + DAMP over DRY in tests |

**这四个 skill 是这个仓库的真正精华。** 它们的共同特点是：规则具体、AI 特异性高、使用频率高、可以直接执行。

### 按需借鉴（特定场景高价值）

| Skill | 什么场景用 | 提取什么 |
|---|---|---|
| code-review-and-quality | 每次 code review | 五轴审查 + Severity 标签 + Anti-sycophancy + Multi-Model Review |
| security-and-hardening | 涉及外部输入时 | Three-Tier Boundary System（可推广到安全以外的 agent 行为约束） |
| code-simplification | 实现后整理时 | Chesterton's Fence + "Clarity Over Cleverness" |
| frontend-ui-engineering | 前端开发时 | AI Aesthetic 对照表（只需要这一张表） |
| spec-driven-development | 复杂新功能开发前 | gated workflow 的概念（但具体模板需要你自己补充） |

### 仅参考（理念可取但内容价值有限）

| Skill | 为什么仅参考 | 还有什么价值 |
|---|---|---|
| planning-and-task-breakdown | 被 incremental-implementation 完全覆盖且后者更具体 | 垂直切片概念（但后者讲得更好） |
| using-agent-skills | 路由表，不是技能 | skill 分流的思路可以参考 |
| idea-refine | 使用频率太低 | examples.md 的餐厅案例作为 ideation 示范很好 |
| api-and-interface-design | 通用参考文档，AI 特异性低 | Contract First 作为理念提醒 |
| browser-testing-with-devtools | 工具绑定太深 | Security Boundaries 模型值得单独提取 |
| performance-optimization | 标准知识为主 | symptom triage tree 可以借鉴 |
| git-workflow-and-versioning | 教科书内容 | 如果团队没有 git 规范，可以直接用 |
| ci-cd-and-automation | 配置模板集 | 如果你用 GitHub Actions 且没有现成模板，有参考价值 |
| documentation-and-adrs | 一个模板的价值 | ADR 模板本身值得保留 |
| shipping-and-launch | 基础设施依赖太重 | 如果你有灰度能力，checklist 可以参考 |
| deprecation-and-migration | 低频 + 非 AI 特有 | 大型系统退场时翻看 |

## 结语

这 20 个 skill 的质量差异远比旧评估呈现的大。最好的 4 个 skill（incremental-implementation、context-engineering、debugging-and-error-recovery、test-driven-development）提供了真正的 AI 工程纪律框架——具体规则、AI 特有失败模式的精准反制、高频使用场景。它们的价值不在于"理念正确"，而在于"规则到位，可以直接变成 agent 行为约束"。

最弱的几个 skill 不是"坏"的——它们的理念大多正确——但内容上要么是标准知识的重新包装（git-workflow、ci-cd），要么是无法独立执行的理想化 checklist（shipping-and-launch），要么是低频的利基场景（deprecation-and-migration）。

**对你来说最重要的判断标准是：从每个 skill 中你能提取出什么具体的、可操作的、你原来不会自然做到的规则。** 用这个标准去读，前 4 个 skill 每个都能给你 5-10 条立即可用的规则；后 6 个每个最多给你 1 条。
