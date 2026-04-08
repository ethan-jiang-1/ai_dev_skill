# 主题 4（framework）证据摘要（Wave 1）

## 证据包清单

- `../reference_src/00-shared-agentskills-specification.md`
- `../reference_src/00-shared-gsd-readme.md`
- `../reference_src/00-shared-owasp-llm-top10-v1-1.md`
- `../reference_src/04-framework-superpowers-github-readme.md`
- `../reference_src/04-framework-superpowers-using-superpowers-skill.md`
- `../reference_src/04-framework-superpowers-verification-before-completion-skill.md`
- `../reference_src/04-framework-superpowers-test-driven-development-skill.md`
- `../reference_src/04-framework-gstack-github-readme.md`
- `../reference_src/04-framework-bmad-method-github-readme.md`
- `../reference_src/04-framework-spec-kit-github-readme.md`
- `../reference_src/04-framework-spec-kit-templates-and-commands.md`
- `../reference_src/04-framework-openspec-github-readme.md`
- `../reference_src/04-framework-feature-driven-flow-github-readme.md`
- `../reference_src/04-framework-feature-driven-flow-specification.md`
- `../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md`
- `../reference_src/04-framework-roo-code-custom-instructions-docs.md`
- `../reference_src/04-framework-roo-code-custom-modes-docs.md`
- `../reference_src/04-framework-aider-conventions-github-readme.md`
- `../reference_src/04-framework-aider-conventions-docs.md`

## 关键判断 -> 证据回指

- “工程治理”可以被框架化为可执行原语：固定阶段/不变量、显式 gates、规则分层覆写、以及工件化状态管理，而不是停留在提示词口号。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-openspec-github-readme.md）
- [hard_fact] FDF 的 runtime spec 明确把 “执行计划”固化为用户确认的 Effective Rule Matrix，并定义 gates/checklists 的派生与 phase 迁移条件；同时 Effective Rule Matrix 具备严格 JSON Schema（含 7-phase keys 与 `additionalProperties=false`），使“可审计/可复用”落为机器可校验工件。（Ref: ../reference_src/04-framework-feature-driven-flow-specification.md；../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md）
- “工程操作系统型框架”往往具备端到端链路与强制触发特征，并提供跨宿主安装/升级路径（例如 Superpowers 与 gstack 的工作流与分发/团队模式）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-gstack-github-readme.md）
- [hard_fact] Superpowers 的强约束不仅存在于 README，而是被写入具体 skills：启动型 `using-superpowers` 要求任何响应（含澄清问题）前先调用 Skill tool 检查并加载相关 skills；`test-driven-development` 把“先红后绿”的 TDD 写成不可协商门禁；`verification-before-completion` 把“无新鲜验证证据不做完成声明”写成 completion gate。（Ref: ../reference_src/04-framework-superpowers-using-superpowers-skill.md；../reference_src/04-framework-superpowers-test-driven-development-skill.md；../reference_src/04-framework-superpowers-verification-before-completion-skill.md）
- “轻规则集”路线同样能产生治理效果：通过 read-only conventions 或 repo rules 的持续注入，降低采用摩擦并减少规则在长对话中的稀释。（Ref: ../reference_src/04-framework-aider-conventions-docs.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- [hard_fact] Spec Kit 将 spec-driven workflow 固化为“可版本控制模板 + 命令契约”：spec/plan/tasks/checklist/constitution 等工件模板明确 mandatory sections 与 gates；命令模板支持 `.specify/extensions.yml` hooks，并在 implement 前对 checklists 完成度做门禁检查（未完成则需用户确认是否继续）。（Ref: ../reference_src/04-framework-spec-kit-templates-and-commands.md；../reference_src/04-framework-spec-kit-github-readme.md）
- 框架扩展生态与插件化会扩大供应链与过度代理风险面，必须将权限收敛与审计边界明确化（例如 Spec Kit 的“不审计 extensions”声明 + OWASP 风险分类 + Roo Code mode 权限约束）。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）

## 6 个固定问题覆盖情况

- 这个主题当前的硬事实是什么：多种框架已将 SDLC 治理落成可安装资产与明确流程契约（例如 Superpowers 的 mandatory skill-driven workflow；FDF 的七阶段 + 不变量；Spec Kit 的命令链路与 cross-host 形式差异；Roo Code 的 rules/modes 体系）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- 背后的根本机制是什么：以“工件化 + 阶段门禁 + 规则分层 + 角色/权限隔离”把风险显式化，让 agent 的行为更可控、可审计、可回归验证。（Ref: ../reference_src/04-framework-openspec-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- 生态最近在往哪里演化：从一次性 prompt 走向可安装/可升级/可迁移的运行时资产（installers、update 命令、team mode），并显式追求跨宿主兼容。（Ref: ../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md；../reference_src/04-framework-openspec-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md）
- 采用或落地的难点在哪里：强流程带来流程摩擦；跨宿主命令/落盘差异带来集成与排障成本；团队场景还要治理版本一致性与升级节奏。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-gstack-github-readme.md）
- 社区争议和失败模式在哪里：扩展/插件不审计导致责任边界不清；过度代理与供应链风险扩大；以及权限边界与工具访问控制不当带来的安全问题。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- 哪些对象最值得继续追踪：Superpowers、gstack、BMAD-METHOD、Spec Kit、OpenSpec、FDF、Roo Code rules/modes、Aider conventions；以及这些框架各自的“更细 docs/模板/规则文件”与真实落地复盘。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md）

## 缺口与下一步补搜

- 需要把关键框架的“机制细节”再下钻一层：FDF 已补齐 runtime spec + effective matrix schema，但仍需继续补 packs/rules/templates 的高杠杆实例；Superpowers 已补齐部分关键 skills（startup discipline + TDD gate + verification gate），但仍可继续补“plans/worktrees/review/finish”等工作流技能与其触发机制；Spec Kit 已补齐 templates 与命令契约，但仍需补更多 docs（例如 CLI/HookExecutor 的实际行为、模板如何被各宿主执行）与真实落地案例，避免只停留在模板/README 级事实。（Ref: ../reference_src/04-framework-feature-driven-flow-specification.md；../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md；../reference_src/04-framework-superpowers-using-superpowers-skill.md；../reference_src/04-framework-superpowers-test-driven-development-skill.md；../reference_src/04-framework-superpowers-verification-before-completion-skill.md；../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-spec-kit-templates-and-commands.md；../reference_src/04-framework-spec-kit-github-readme.md）
- 需要补“官方说法 vs 社区实践”的交叉核验：收集落地案例、失败复盘、以及在团队协作与 CI/CD 中的真实摩擦点，才能给出更稳健的“个人/团队适配”结论。（Ref: ../reference_src/04-framework-gstack-github-readme.md）
