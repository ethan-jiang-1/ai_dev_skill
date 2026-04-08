# 主题 4（framework）问题清单更新（Wave 1）

## 已回答（有证据回指）

- 这些框架到底“在治理什么”，核心治理原语有哪些（工件化/门禁/规则分层/权限隔离）？（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-feature-driven-flow-specification.md；../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- 哪些框架更像“工程操作系统”（端到端链路 + 强制触发 + 分发/升级策略）？（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-superpowers-using-superpowers-skill.md；../reference_src/04-framework-superpowers-verification-before-completion-skill.md；../reference_src/04-framework-superpowers-test-driven-development-skill.md；../reference_src/04-framework-gstack-github-readme.md）
- Brownfield 增量改造与工件包闭环如何落地？（Ref: ../reference_src/04-framework-openspec-github-readme.md）
- 轻规则集（conventions/rules）如何在工程上生效（read-only + prompt caching + repo rules 优先级）？（Ref: ../reference_src/04-framework-aider-conventions-docs.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md）
- 扩展生态的责任边界与供应链风险在官方口径里如何呈现？（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）

## 待验证 / 待补搜

- 需要从“README 级事实”下钻到“机制实现级证据”：FDF 已补齐 `docs/specification.md` 与 Effective Rule Matrix schema，但仍可继续抓核心 rules/packs/templates 的高杠杆实例；Superpowers 已补齐部分关键 skills（startup discipline + verification gate + TDD gate），但仍可继续补其余工作流 skills（plans/worktrees/review/finish 等）与触发机制；Spec Kit 已补齐 templates 与命令契约，但仍需补 CLI/HookExecutor 的实际行为与真实落地案例。（Ref: ../reference_src/04-framework-feature-driven-flow-specification.md；../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md；../reference_src/04-framework-superpowers-using-superpowers-skill.md；../reference_src/04-framework-superpowers-verification-before-completion-skill.md；../reference_src/04-framework-superpowers-test-driven-development-skill.md；../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-spec-kit-templates-and-commands.md；../reference_src/04-framework-spec-kit-github-readme.md）
- 需要补充“官方说法 vs 社区实践”的交叉核验：团队实际采用中的阻力点、常见绕过方式、与在 CI/CD 或 code review 流程里的真实落地质量。（Ref: ../reference_src/04-framework-gstack-github-readme.md；../reference_src/04-framework-bmad-method-github-readme.md）
- 需要补齐安全视角的“具体失败模式案例”（不仅是分类）：例如插件/扩展供应链、越权工具调用、以及权限配置错误导致的数据泄露或破坏性操作。（Ref: ../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：基本稳定（Superpowers/GSD/gstack/BMAD/Spec Kit/OpenSpec/FDF/Roo Code/Aider）。
- 新搜到的材料是否主要重复已知事实：开始出现重复（多数 README 在重复“工作流/安装/命令”层信息）。
- 是否已覆盖 6 个固定问题（且每个有证据）：已覆盖（见 `04-framework-evidence-summary.md`）。
- 是否已补搜反例、限制、争议：部分覆盖（extensions 不审计、供应链/过度代理风险、强流程摩擦），仍缺真实失败复盘。
- 是否已完成“官方说法 vs 社区实践”交叉核验：未完成（需要补社区落地案例与批评/反例）。
