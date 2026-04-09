# SDLC 方法论框架与工程治理

## 第一轮摘要（保留，不修改）

<!-- 下方为第一轮摘要原文，仅调整标题层级以适配二轮追加结构，不改动正文内容 -->

### 这份片段在讲什么

这份上下文聚焦在最重的一类对象：  
不是单个 skill，而是会重塑整个软件开发流程的框架。

原始研究认为，真正高杠杆的能力包有时并不是单点技能，  
而是把方法学、工程纪律、角色分工、验证闭环和状态治理一起编码进去的系统。

### 从原始研究提炼出的核心结论

#### 1. 这里研究的是“工程操作系统”，不是普通 skill

原始研究覆盖了几种代表性框架：

- Superpowers
- Get Shit Done (GSD)
- Gstack
- BMAD-METHOD
- Spec Kit
- OpenSpec
- Feature-Driven-Flow
- Roo Code rules
- Aider conventions

它们共同点是：

- 不只是给模型一段提示词
- 而是在规定人和 agent 应该怎么协作
- 并试图控制漂移、幻觉、漏验证、流程失序等问题

#### 2. 这些框架的差异，本质上是治理思路不同

原始研究里可以提炼出几种典型流派：

- `Superpowers`：强调前置思考、TDD、系统性调试，属于强纪律流程派
- `GSD`：强调 `STATE.md`、生命周期和漂移检测，属于长周期状态治理派
- `Gstack`：强调角色人格和“虚拟团队”，属于组织社会学模拟派
- `BMAD`：强调多角色敏捷流水线和规模自适应，属于重型敏捷派
- `Spec Kit`：强调 spec-driven development 和规约先行，属于契约驱动派
- `OpenSpec`：强调 Brownfield 增量改造和 delta specs，属于老系统微干预派
- `FDF`：强调 7 阶段固定流水线和 gate，属于审计治理派
- `Roo Code`：强调模式隔离和上下文污染控制
- `Aider`：强调 conventions 挂载和轻量刚性约束

#### 3. 这一类框架最适合研究“工程能力是怎么被写进 skill 的”

原始研究里最有价值的，不只是项目名单，  
而是这些框架分别把哪种工程能力写进了能力包：

- 需求澄清
- 计划拆解
- 设计审查
- 测试优先
- 根因分析
- 状态同步
- 范围控制
- 发布纪律
- 上下文污染隔离

也就是说，这类框架是研究“skill 如何承载工程方法学”的最好样本。

### 这一片段里最值得继续研究的对象

- Superpowers
- GSD
- Gstack
- BMAD-METHOD
- Spec Kit
- OpenSpec
- FDF
- Roo Code
- Aider

### 适合继续 Deep Research 的问题

- 哪些框架最适合个人开发者，哪些更适合团队
- 哪些框架在防漂移、防漏验证、防跑偏上最强
- 哪些框架最容易拆出可复用 skill 单元
- 哪些框架更像完整方法论，哪些更像轻量治理工具
- 哪些框架最适合作为“让工程师通过读 skill 学会方法学”的样本
- Brownfield、Greenfield、多角色协作、长周期项目分别更适合哪类框架

### 这一片段的用途

如果下一轮 Deep Research 想回答下面这些问题，这份片段最适合直接当上下文：

- “现在最值得研究的软件开发 agent 方法论框架有哪些？”
- “哪些框架在把工程纪律写进 skill / workflow / rules？”
- “如何比较 Superpowers、GSD、Gstack、Spec Kit、OpenSpec 这些框架的治理差异？”

## 二轮新增证据

<!-- 每条新增事实都带 ../reference_src/*.md 回指 -->

- Agent Skills 规范明确：`SKILL.md` 的 body（frontmatter 之后的 Markdown 指令区）没有格式限制，推荐写“分步指令”等能帮助 agent 高质量执行任务的内容。（Ref: ../reference_src/00-shared-agentskills-specification.md）
- `gsd-build/get-shit-done` README 将其定位为跨宿主的 meta-prompting/context engineering/spec-driven system，并明确列出多 runtime 支持与安装入口（`npx get-shit-done-cc@latest`）。（Ref: ../reference_src/00-shared-gsd-readme.md）
- `gsd-build/get-shit-done` README 明确描述跨宿主落盘格式差异（例如 Claude Code 2.1.88+ 与 Codex 安装为 `skills/gsd-*/SKILL.md`；旧版本 Claude Code 使用 `commands/gsd/`；Cline 使用 `.clinerules`），并宣称安装器会处理多格式。（Ref: ../reference_src/00-shared-gsd-readme.md）
- OWASP LLM Top 10 v1.1 的 “Excessive Agency”“Insecure Plugin Design”“Supply Chain Vulnerabilities” 等条目，为“工程治理型框架提升自主性后带来的风险面”提供通用安全分类参考。（Ref: ../reference_src/00-shared-owasp-llm-top10-v1-1.md）
- Superpowers README 将其定位为“面向 coding agents 的完整软件开发工作流”，建立在一组可组合 skills 之上；并强调技能会自动触发、在任务前检查相关 skills，属于强流程约束（mandatory workflows）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md）
- Superpowers README 列出一条端到端工作流链路（brainstorming → worktrees → plans → subagent-driven-development/executing-plans → TDD → code review → finish），并按宿主给出安装方式（Claude Code/Cursor/Codex/OpenCode/Copilot/Gemini）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md）
- Superpowers 的启动型 skill `using-superpowers` 要求：在任何响应或行动之前（包括澄清问题）必须先调用 Skill tool 检查并加载相关 skills；同时显式定义指令优先级（用户 > Superpowers skills > 默认系统提示），把“先查技能再行动”的纪律写成不可跳过规则。（Ref: ../reference_src/04-framework-superpowers-using-superpowers-skill.md）
- Superpowers 的 `verification-before-completion` 把“证据先于断言”写成 completion gate：没有新鲜的验证输出就不能做任何完成/修复/通过等成功声明，并要求先识别验证命令、运行、阅读输出再做结论。（Ref: ../reference_src/04-framework-superpowers-verification-before-completion-skill.md）
- Superpowers 的 `test-driven-development` 把 TDD 写成顺序门禁：无 failing test 不写 production code；并要求 Verify RED 与 Verify GREEN 都不可跳过（red-green-refactor）。（Ref: ../reference_src/04-framework-superpowers-test-driven-development-skill.md）
- gstack README 将其描述为把 Claude Code 变成“虚拟工程团队”的 process，并用 “Think → Plan → Build → Review → Test → Ship → Reflect” 定义 sprint 顺序，强调上游产物会被下游技能读取。（Ref: ../reference_src/04-framework-gstack-github-readme.md）
- gstack README 给出团队模式（`./setup --team` + repo bootstrap + 节流自动更新检查）以及跨宿主安装目标（`./setup --host <name>` 对 Codex/OpenCode/Cursor 等）。（Ref: ../reference_src/04-framework-gstack-github-readme.md）
- Spec Kit README 将 Spec-Driven Development 解释为让 specs “可执行（executable）”，并给出核心命令链路（constitution/specify/plan/tasks/implement）与补充命令（clarify/analyze/checklist）来处理歧义与一致性检查。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md）
- Spec Kit README 明确多宿主命令暴露差异：多数 agents 用 `/speckit.*`，而 Codex CLI skills mode 使用 `$speckit-*`；并对 community extensions 明确声明“不审计、不背书”。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md）
- Spec Kit 的 `templates/` 提供“工件模板 + 命令契约”的实现级证据：spec/plan/tasks/checklist/constitution 等模板明确 mandatory sections 与 gates；`/speckit.specify/plan/implement` 等命令模板支持 `.specify/extensions.yml` hooks，并在 implement 前对 checklists 完成度做门禁检查（未完成则需用户确认是否继续）。（Ref: ../reference_src/04-framework-spec-kit-templates-and-commands.md）
- Spec Kit 的 integrations 安装机制包含 hash-tracked manifest：为每个安装 integration 记录写入文件的 SHA-256，并在卸载时仅删除 hash 匹配的文件（修改则跳过并报告），同时实现绝对路径/父目录穿越防护与 symlink 安全策略。（Ref: ../reference_src/04-framework-spec-kit-integration-manifest-sha256.md）
- Spec Kit 的 HookExecutor 提供 extension hooks 的实现级运行时语义：读取 `.specify/extensions.yml`（默认 `auto_execute_hooks: true`），支持基于 config/env 的 condition 表达式求值（异常与未知格式默认不执行），并按宿主/skills mode 渲染不同调用形式（Codex `$speckit-*` vs Claude `/<speckit-*>` 等）。（Ref: ../reference_src/04-framework-spec-kit-hook-executor-extensions-yml.md）
- OpenSpec README 强调其 artifact-guided workflow 与 brownfield 场景，并用 `/opsx:propose` 生成变更工件包（proposal/specs/design/tasks），再用 `/opsx:apply` 实施、`/opsx:archive` 归档与回写 specs。（Ref: ../reference_src/04-framework-openspec-github-readme.md）
- BMAD-METHOD README 强调 “Scale-Domain-Adaptive” 会随复杂度调整规划深度，并描述其提供多角色 agents、结构化 workflows、模块化生态；同时提供 `npx bmad-method install` 与 non-interactive 安装参数。（Ref: ../reference_src/04-framework-bmad-method-github-readme.md）
- Feature-Driven-Flow（FDF）README 明确其固定七阶段流程（Scope→Explore→Clarify→Architect→Implement→Verify→Summarize），并通过 policies 编译成 rule matrix、用显式 gates 记录可审计输出；同时给出 core invariants（不跳阶段、Implement 需显式批准、关闭前 Verify/Summarize）。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md）
- FDF README 描述其多宿主实现与 repo-local overlays（Codex 用 `.codex/feature-driven-flow/...`，Claude 用 `.claude/feature-driven-flow/...`），并将 `AGENTS.md` policy 纳入规则优先级链路。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md）
- FDF 的 runtime spec 明确 Effective Rule Matrix 是 canonical execution artifact：在 Scope 阶段导入/编译并校验，且必须由用户显式确认；Scope 之后变更 matrix 需要 before/after diff + 显式批准；同时定义 checklists 与 gate_status 规则（blocking item => `blocked`，phase 迁移要求 `ready`）。（Ref: ../reference_src/04-framework-feature-driven-flow-specification.md）
- FDF 的 Effective Rule Matrix 工件具备严格 JSON Schema：顶层 `additionalProperties=false` 且要求 `schema=fdf/effective-rule-matrix.v1` 等必填字段；`rule_matrix` 也强制包含 7 个 phase keys（`scope/explore/clarify/architect/implement/verify/summarize`），为“可复用/可校验的执行计划”提供机器契约。（Ref: ../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md）
- Roo Code 官方文档定义了可版本控制的 rules/指令文件体系：global vs workspace、mode-specific、legacy `.clinerules` fallback、以及 workspace root 的 `AGENTS.md`（默认自动加载，可配置禁用）。（Ref: ../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- Roo Code 官方文档说明自定义 modes 可限制 tool/file 权限，并支持导入导出 YAML 打包（包含 `.roo/rules-{slug}/`），用于团队共享与模板化。（Ref: ../reference_src/04-framework-roo-code-custom-modes-docs.md）
- Aider conventions 仓库将 conventions 定义为 Markdown 规则文件集合（如 `CONVENTIONS.md`），可通过 read-only 方式加载并可在 `.aider.conf.yml` 配置自动加载。（Ref: ../reference_src/04-framework-aider-conventions-github-readme.md）
- Aider 官方文档建议用 `/read CONVENTIONS.md` 或 `aider --read CONVENTIONS.md` 以 read-only 方式加载 conventions，并指出这样在启用 prompt caching 时可被缓存。（Ref: ../reference_src/04-framework-aider-conventions-docs.md）

## 二轮新增机制理解

<!-- 从“描述”上升到“为什么这样设计”的解释；每条带 ../reference_src/*.md 回指 -->

- 这类框架的共同目标不是“写出更多代码”，而是把工程治理抽象成可执行结构：阶段顺序、门禁（approval/gates）、以及可复用的规则/工件，从机制上对抗 LLM 的跑偏与漏验证。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md）
- “工件化（artifactization）”是核心手段之一：把对话中的需求/设计/任务拆成可落盘的文件与目录（例如 Spec Kit 的 constitution/spec/plan/tasks；OpenSpec 的 proposal/specs/design/tasks 变更包），使状态可追溯、可审计、可增量更新。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-openspec-github-readme.md）
- Spec Kit 进一步把工件化与门禁“脚本化/模板化”：`/speckit.specify` 自动创建 spec 目录与 spec 质量 checklist；`/speckit.plan` 通过脚本产出 research/data-model/contracts/quickstart 并更新 agent context；`/speckit.implement` 在执行 tasks 前先检查 checklists 完成度并要求用户确认是否继续，同时支持 `.specify/extensions.yml` hooks 作为可扩展点。（Ref: ../reference_src/04-framework-spec-kit-templates-and-commands.md；../reference_src/04-framework-spec-kit-hook-executor-extensions-yml.md）
- “强流程不变量”是另一类手段：通过固定阶段与不可跳过的核心约束（例如 FDF 的 core invariants；Superpowers 的 mandatory workflows）把“先澄清再实施、先验证再结束”变成系统默认。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md）
- Superpowers 的“强制性”主要通过技能纪律实现：启动型 `using-superpowers` 把“先查 skills 再行动”写成不可协商规则；`test-driven-development` 与 `verification-before-completion` 则分别把 TDD（先红后绿）与“无新鲜验证证据不做完成声明”写成显式 gate，以对抗直接写实现/过早宣称完成等失败模式。（Ref: ../reference_src/04-framework-superpowers-using-superpowers-skill.md；../reference_src/04-framework-superpowers-test-driven-development-skill.md；../reference_src/04-framework-superpowers-verification-before-completion-skill.md）
- “审计化治理”的关键不在于阶段名字，而在于把执行计划与检查条件工件化：FDF 把 Effective Rule Matrix 定义为 canonical execution artifact（需用户确认、变更需 diff+批准），并以 rules 的 checks 派生 checklist、以 gate_status 控制 phase 迁移；同时 Effective Rule Matrix 具备严格 JSON schema（7-phase keys + `additionalProperties=false`），使复用/校验具备工程抓手。（Ref: ../reference_src/04-framework-feature-driven-flow-specification.md；../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md）
- “角色/模式隔离”把组织结构编码进系统：gstack 通过不同 specialist 命令模拟团队分工；Roo Code 通过 modes 绑定 tool/file 权限并关联 mode-specific rules，用结构化隔离来减少上下文污染与越权。（Ref: ../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-roo-code-custom-modes-docs.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- “分层覆写的规则系统”让团队能把政策写进仓库：Roo Code 明确 global vs workspace、mode-specific、AGENTS.md 的加载顺序与优先级；FDF 将 `AGENTS.md` policy 纳入 rule precedence 并提供 repo-local overlays（`.codex/`、`.claude/`）。（Ref: ../reference_src/04-framework-roo-code-custom-instructions-docs.md；../reference_src/04-framework-feature-driven-flow-github-readme.md）
- “轻规则集”的机制是低摩擦持续约束：Aider 建议用 read-only 的 conventions 文件（配合 prompt caching）把团队偏好稳定注入上下文窗口，避免规则在长对话中被稀释。（Ref: ../reference_src/04-framework-aider-conventions-docs.md；../reference_src/04-framework-aider-conventions-github-readme.md）
- “工程化分发与升级”是框架可落地的前提：gstack 提供 team mode + 自动更新节流；BMAD 提供安装器与 non-interactive 安装；OpenSpec 提供 `openspec update` 刷新指令；Spec Kit 鼓励 pin release tag，并在 integrations 安装层引入 hash-tracked manifest 以支持安全卸载与防误删。（Ref: ../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md；../reference_src/04-framework-openspec-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-spec-kit-integration-manifest-sha256.md）

## 二轮新增趋势与难点

<!-- 趋势：有时间维度的证据；难点：个人/团队/维护；每条带 ../reference_src/*.md 回指 -->

- 趋势：方法论框架正从“提示词/文档”走向“可安装、可升级、可迁移的运行时资产”，普遍出现安装器、update 命令、以及跨宿主适配的分发策略。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md；../reference_src/04-framework-openspec-github-readme.md）
- 趋势：跨宿主/多运行时兼容成为显式需求，导致同一框架在不同宿主下呈现不同命令形态或落盘路径（例如 Spec Kit 的 `/speckit.*` vs `$speckit-*`；FDF 的 `.codex/` vs `.claude/` overlays）。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md）
- 趋势：治理抽象在“重框架”和“轻规则集”两端同时进化。一端用固定阶段与 rule matrix 做审计化治理（FDF）；另一端用 read-only conventions 或 repo rules 做低摩擦约束（Aider/Roo Code）。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-aider-conventions-docs.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- 趋势：扩展生态会推动框架模块化，但也带来责任边界与供应链风险，因而出现“extension code 不审计/不背书”的官方声明。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）
- 难点：强流程框架通过阶段不变量与门禁提高可靠性，但同样会带来更高的采用门槛与流程摩擦，尤其在“小改动/快速试错”场景容易被抵触。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md）
- 难点：团队落地的首要成本常常不是“写框架”，而是“版本一致性与升级治理”：需要 team mode、pin 版本、或集中分发策略，否则不同成员/不同宿主的行为差异会引入不可预期风险。（Ref: ../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md）
- 难点：当框架强化自主性并引入更广的工具权限面，风险面会覆盖到过度代理、插件设计与供应链；因此需要配套的权限收敛、可审计输出与验证闭环。（Ref: ../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/04-framework-roo-code-custom-modes-docs.md；../reference_src/04-framework-feature-driven-flow-github-readme.md）

## 当前判断（二轮综合后）

<!-- 综合第一轮和第二轮的判断；每条判断带 ../reference_src/*.md 回指；如推翻/修正需注明 -->

- 主题 4 的硬事实是：这些“方法论框架”已经把 SDLC 的关键治理单元落成了可安装资产，典型治理原语包括：工件化（spec/plan/tasks）、固定阶段与不变量、显式批准 gate、规则分层覆写、以及角色/模式隔离。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-openspec-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- “更像工程操作系统”的框架通常同时满足三点：有端到端链路（从澄清到验证与收尾）、有强约束不变量、且能跨宿主安装与升级。Superpowers 与 gstack 都呈现出这类特征（强流程 + 固定入口 + 分发/升级策略）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-gstack-github-readme.md）
- “防漂移/防漏验证/防跑偏”最强的机制不是某一句 prompt，而是把风险显式化为阶段与检查：例如 Spec Kit 的 clarify/analyze/checklist 与 FDF 的 Clarify/Implement/Verify gate 约束。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md）
- Brownfield 场景更适合增量工件包与归档流：OpenSpec 将每次变更固化为 proposal/specs/design/tasks 的变更包，并提供 propose/apply/archive 的闭环命令。（Ref: ../reference_src/04-framework-openspec-github-readme.md）
- 个人与团队的适配往往分化为两条路线：个人更容易从“轻规则集”起步（Aider conventions、Roo Code workspace rules），团队则更需要“可复制的安装/升级/权限治理”与“可审计输出”（gstack team mode、FDF gates/rule matrix、BMAD 安装器/模块化）。（Ref: ../reference_src/04-framework-aider-conventions-docs.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md；../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md）
- 对最终报告而言，最可迁移的治理抽象不是具体项目名，而是这几类“可复用机制”：规则分层与优先级、阶段不变量与显式批准、工件化状态管理、以及以 modes/角色为单位的权限与上下文隔离。（Ref: ../reference_src/04-framework-roo-code-custom-instructions-docs.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-openspec-github-readme.md）
