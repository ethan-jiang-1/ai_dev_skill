# 主题 4（framework）证据摘要（Wave 1）

## 证据包清单

- `../reference_src/00-shared-agentskills-specification.md`
- `../reference_src/00-shared-gsd-readme.md`
- `../reference_src/00-shared-owasp-llm-top10-v1-1.md`
- `../reference_src/04-framework-superpowers-github-readme.md`
- `../reference_src/04-framework-gstack-github-readme.md`
- `../reference_src/04-framework-bmad-method-github-readme.md`
- `../reference_src/04-framework-spec-kit-github-readme.md`
- `../reference_src/04-framework-openspec-github-readme.md`
- `../reference_src/04-framework-feature-driven-flow-github-readme.md`
- `../reference_src/04-framework-roo-code-custom-instructions-docs.md`
- `../reference_src/04-framework-roo-code-custom-modes-docs.md`
- `../reference_src/04-framework-aider-conventions-github-readme.md`
- `../reference_src/04-framework-aider-conventions-docs.md`

## 关键判断 -> 证据回指

- “工程治理”可以被框架化为可执行原语：固定阶段/不变量、显式 gates、规则分层覆写、以及工件化状态管理，而不是停留在提示词口号。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-openspec-github-readme.md）
- “工程操作系统型框架”往往具备端到端链路与强制触发特征，并提供跨宿主安装/升级路径（例如 Superpowers 与 gstack 的工作流与分发/团队模式）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-gstack-github-readme.md）
- “轻规则集”路线同样能产生治理效果：通过 read-only conventions 或 repo rules 的持续注入，降低采用摩擦并减少规则在长对话中的稀释。（Ref: ../reference_src/04-framework-aider-conventions-docs.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- 框架扩展生态与插件化会扩大供应链与过度代理风险面，必须将权限收敛与审计边界明确化（例如 Spec Kit 的“不审计 extensions”声明 + OWASP 风险分类 + Roo Code mode 权限约束）。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）

## 6 个固定问题覆盖情况

- 这个主题当前的硬事实是什么：多种框架已将 SDLC 治理落成可安装资产与明确流程契约（例如 Superpowers 的 mandatory skill-driven workflow；FDF 的七阶段 + 不变量；Spec Kit 的命令链路与 cross-host 形式差异；Roo Code 的 rules/modes 体系）。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- 背后的根本机制是什么：以“工件化 + 阶段门禁 + 规则分层 + 角色/权限隔离”把风险显式化，让 agent 的行为更可控、可审计、可回归验证。（Ref: ../reference_src/04-framework-openspec-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- 生态最近在往哪里演化：从一次性 prompt 走向可安装/可升级/可迁移的运行时资产（installers、update 命令、team mode），并显式追求跨宿主兼容。（Ref: ../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md；../reference_src/04-framework-openspec-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md）
- 采用或落地的难点在哪里：强流程带来流程摩擦；跨宿主命令/落盘差异带来集成与排障成本；团队场景还要治理版本一致性与升级节奏。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-gstack-github-readme.md）
- 社区争议和失败模式在哪里：扩展/插件不审计导致责任边界不清；过度代理与供应链风险扩大；以及权限边界与工具访问控制不当带来的安全问题。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- 哪些对象最值得继续追踪：Superpowers、gstack、BMAD-METHOD、Spec Kit、OpenSpec、FDF、Roo Code rules/modes、Aider conventions；以及这些框架各自的“更细 docs/模板/规则文件”与真实落地复盘。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md）

## 缺口与下一步补搜

- 需要把关键框架的“机制细节”再下钻一层：例如 Superpowers 各 skill 的 `SKILL.md`、FDF 的 rules schema/packs/specification、Spec Kit 的 docs 与模板工件结构，避免只停留在 README 级事实。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md）
- 需要补“官方说法 vs 社区实践”的交叉核验：收集落地案例、失败复盘、以及在团队协作与 CI/CD 中的真实摩擦点，才能给出更稳健的“个人/团队适配”结论。（Ref: ../reference_src/04-framework-gstack-github-readme.md）
