# 附录 E：证据总表与引用索引

主文和各附录中的 `[E..]` 轻引用，统一在这里回指。

这份附录的目标不是堆满材料，而是帮你快速回答两个问题：

- 这条判断到底从哪里来
- 它主要支撑的是哪一部分 final 叙事

## E1. 主证据表

| 证据编号 | 核心支持点 | 主要来源 |
| --- | --- | --- |
| `E01` | 这轮 research 为什么拆成四个 topic，以及 `04` 是正式吸收的一层 | `../topics/00-topic-registry.md` |
| `E02` | 当前共享事实：skill 已经稳定呈现为目录级对象，而不是单段 prompt | `../topics/_artifacts/00-shared-evidence-summary.md` |
| `E03` | `AGENTS.md`、skill package、installer、directory、learning layer 应分开理解 | `../topics/_artifacts/00-shared-object-classification-draft.md` |
| `E04` | 最小共同层、portable core 与 surface-specific extension 的边界 | `../topics/_artifacts/01-skill-methodology-and-spec-evidence-summary.md`；`../topics/_artifacts/W2-surface-compatibility-appendix-codex-github-claude.md` |
| `E05` | 当前最稳的总判断是分角色推荐 + baseline 组合 + optimization layer | `../topics/_artifacts/W2-final-recommendation-and-baseline.md` |
| `E06` | cross-topic 共享判断：学习层、工程层、治理层、优化层必须拆开看 | `../topics/_artifacts/W2-cross-topic-synthesis.md` |
| `E07` | 当前最小可执行 workflow：样板、portable core、受控安装、trust gate、A/B evaluation、版本与 bundling | `../topics/_artifacts/W2-combination-baseline-workflow-draft.md` |
| `E08` | 对象正式比较：各层对象的职责边界、baseline fit 与 anti-misread 口径 | `../topics/_artifacts/W2-formal-comparison-table.md` |
| `E09` | 三家 surface 的共同层与不可误读的扩展边界 | `../topics/_artifacts/W2-surface-compatibility-appendix-codex-github-claude.md` |
| `E10` | 官方与实践 guide 共同支持“先借鉴现成 skill，再实验收束”的成长路径 | `../topics/_reference/03-ecosystem-signals-and-adoption-vercel-kb-learning-leverage.md`；`../topics/_reference/01-skill-methodology-and-spec-vercel-guide-portable-methodology.md` |
| `E11` | 外部共享 skill 需要保留独立 trust boundary，不能因发现便利而直接信任 | `../topics/_reference/03-ecosystem-signals-and-adoption-trust-boundaries.md` |
| `E12` | public skills 的效果分布、clone inflation 与质量风险证明“好找”不等于“好用” | `../topics/_reference/03-ecosystem-signals-and-adoption-independent-effectiveness-benchmark.md`；`../topics/_reference/03-ecosystem-signals-and-adoption-clone-security-and-quality-risks.md` |
| `E13` | skill 的最小共同层包括 `SKILL.md`、`name`、`description` 和按需支撑文件 | `../topics/_reference/01-skill-methodology-and-spec-methodology-convergence-draft.md` |
| `E14` | `vercel-labs/agent-skills` 适合作为高质量样板库，重点在结构与 `Use when` | `../topics/_reference/00-shared-vercel-agent-skills.md`；`../topics/_reference/00-shared-local-example-agent-skills-teardown.md` |
| `E15` | `skills.sh` 是 discovery / directory 入口，降低了找到现成 skill 的成本 | `../topics/_reference/00-shared-skills-sh-home.md`；`../topics/_reference/03-ecosystem-signals-and-adoption-skills-sh-directory-signals.md` |
| `E16` | `github/awesome-copilot` 形成了 community learning hub，适合扩视野与学教程层 | `../topics/_reference/00-shared-awesome-copilot-readme.md`；`../topics/_reference/03-ecosystem-signals-and-adoption-awesome-copilot-repo-signals.md` |
| `E17` | `vercel-labs/skills` 更像 installer / manager / compatibility layer，而不是 trust 系统 | `../topics/_reference/00-shared-vercel-skills-cli.md`；`../topics/_artifacts/02-skill-toolchain-and-lifecycle-evidence-summary.md` |
| `E18` | `skill-forge` 更像 governance / publish / artifact optimization 层 | `../topics/_reference/00-shared-skill-forge-readme.md`；`../topics/_reference/04-skill-optimization-and-feedback-loops-skill-forge-artifact-optimization.md` |
| `E19` | 本地 `agent-skills` 拆解可以训练生命周期视角和样板阅读方式 | `../topics/_reference/00-shared-local-example-agent-skills-teardown.md` |
| `E20` | 本地 `get-shit-done` 拆解体现了 command / agent / workflow / reference / template 五层结构 | `../topics/_reference/00-shared-local-example-get-shit-done-teardown.md` |
| `E21` | 本地 `superpowers` 拆解体现了 hooks、bootstrap 和 workflow-enforcing plugin 视角 | `../topics/_reference/00-shared-local-example-superpowers-teardown.md` |
| `E22` | `04` 的核心判断：skill 优化是 artifact-level optimization，而不是单纯 prompt tuning | `../topics/_artifacts/04-skill-optimization-and-feedback-loops-evidence-summary.md` |
| `E23` | 持续优化闭环应覆盖 failure taxonomy、trajectory regression、feedback loop、candidate revision 与 human gate | `../topics/_artifacts/04-skill-optimization-and-feedback-loops-evidence-summary.md`；`../topics/_artifacts/W2-final-recommendation-and-baseline.md` |
| `E24` | 本地 `gstack` 拆解体现了系统化工作流、specialist review 与更产品化的 skill 结构 | `../topics/_reference/00-shared-local-example-gstack-teardown.md` |
| `E25` | workflow skill 的 regression 不应只看 final answer，还要看 intermediate steps、tool calls、tool args、tool sequence 与 step count | `../topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-agent-trajectory-regression.md` |
| `E26` | CI quality gate 可以迁移到 skill 修订比较，阻断坏版本进入常用路径 | `../topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-ci-quality-gates.md` |
| `E27` | production traces、online evaluation、offline datasets、human feedback 可形成持续优化闭环 | `../topics/_reference/04-skill-optimization-and-feedback-loops-langsmith-offline-online-feedback-loop.md` |
| `E28` | candidate revision / eval flywheel 的边界：适合给候选，不直接替代人工晋级门槛 | `../topics/_reference/04-skill-optimization-and-feedback-loops-dspy-program-optimizer-pattern.md`；`../topics/_reference/04-skill-optimization-and-feedback-loops-openai-evals-optimization-flywheel.md` |
| `E29` | lifecycle 至少分化出 loader、sample library、installer、governance、runtime bridge、evaluation、versioning 等层 | `../topics/_artifacts/02-skill-toolchain-and-lifecycle-evidence-summary.md` |
| `E30` | adoption signal 至少要拆成 discovery、learning、trust、effectiveness 四层 | `../topics/_artifacts/03-ecosystem-signals-and-adoption-evidence-summary.md` |

## E2. 主文常见判断默认回指

| 主文里的判断 | 默认回指 |
| --- | --- |
| “skill 不是单段 prompt，而是目录级能力包” | `E02` + `E13` |
| “不要混淆 `AGENTS.md`、skill、installer、directory” | `E03` |
| “当前最难的是会不会读样本，而不是找不找得到样本” | `E10` + `E15` + `E16` |
| “当前最稳的答案不是单一赢家，而是分角色推荐 + baseline 组合” | `E05` + `E06` + `E08` |
| “最小 workflow 包含 portable core、受控安装、trust gate 与 A/B evaluation” | `E07` |
| “跨 surface 时要先写 portable core，再补扩展层” | `E04` + `E09` |
| “skill 上线不等于成熟” | `E22` + `E23` |
| “workflow skill 的评测不能只看最终答案” | `E25` |
| “持续优化需要失败分类、回放和人工晋级门槛” | `E23` + `E27` + `E28` |

## E3. 各附录重点依赖哪些证据

| 文件 | 重点依赖 |
| --- | --- |
| `00-Skill实践Playbook-从借鉴到持续演进.md` | `E01` `E02` `E03` `E05` `E06` `E07` `E09` `E10` `E22` `E23` |
| `附录A-代表性样本与阅读路径.md` | `E14` `E15` `E16` `E19` `E20` `E21` `E24` |
| `附录B-对象分层与Baseline组合比较.md` | `E05` `E06` `E08` `E17` `E18` `E29` `E30` |
| `附录C-Cross-Surface兼容边界与Portable-Core.md` | `E04` `E09` `E13` |
| `附录D-持续优化闭环与评测操作.md` | `E22` `E23` `E25` `E26` `E27` `E28` |
| `附录F-术语解释与常见误解.md` | `E02` `E03` `E04` `E07` `E22` `E23` |

## E4. 这轮 final 的例子层来自哪里

这轮 final 没有为了补例子而重新扩搜新的网络材料。  
主要例子来自两类：

### 1. 已有 reference

- `skills.sh`
- `github/awesome-copilot`
- `vercel-labs/agent-skills`
- `vercel-labs/skills`
- `skill-forge`
- 各类 optimization references

### 2. 本地既有拆解样本

- `agent-skills`
- `get-shit-done`
- `superpowers`
- `gstack`

这意味着：

- final 的例子层来自当前 research 已经挖回来的材料
- 不是为了写作方便再临时找的“漂亮例子”

## E5. 读完这份附录后，下一步做什么

如果你是在 review 主文或附录中的某条判断，最简单的动作是：

1. 先找到它的 `[E..]` 编号。
2. 在这份附录里定位到来源。
3. 再回看它是不是被正确表述成了 final judgment（最终判断），而不是把 working note（工作草稿）误当结论。
