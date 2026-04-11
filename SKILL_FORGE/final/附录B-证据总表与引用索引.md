# 附录 B：证据总表与引用索引

主 Playbook 中的 `[E..]` 轻引用，统一在这里回指。

## 何时打开这份附录

- 当你想知道 `00` 里的某条判断到底是从哪里来的
- 当你要把这套结论讲给团队听，希望每条核心判断都有出处
- 当你想区分“这是主线建议”还是“这是底层证据”

## B1. 主证据表

| 证据编号 | 核心支持点 | 主要来源 |
| --- | --- | --- |
| `E01` | 为什么原始研究会拆成 `01 / 02 / 03` 三个 topic | `../topics/00-topic-registry.md` |
| `E02` | 当前共享事实：最小共同层存在，但职责和 surface 不能混读 | `../topics/_artifacts/W2-cross-topic-synthesis.md` |
| `E03` | 最终推荐口径是“分角色推荐 + baseline 组合”，不是单一赢家 | `../topics/_artifacts/W2-final-recommendation-and-baseline.md` |
| `E04` | 最小可执行 workflow：从样板、portable core、受控安装到 trust gate 和 A/B 评测 | `../topics/_artifacts/W2-combination-baseline-workflow-draft.md` |
| `E05` | 高质量样板库通常包含 `SKILL.md`、`scripts/`、`references/`，适合学结构和 `Use when` | `../topics/_reference/00-shared-vercel-agent-skills.md` |
| `E06` | `skills.sh` 是 discovery / directory 入口，降低了找到现成 skill 的成本 | `../topics/_reference/00-shared-skills-sh-home.md` |
| `E07` | `awesome-copilot` 把学习、搜索和第三方资源集中到一个入口，但安装前必须检查 | `../topics/_reference/00-shared-awesome-copilot-readme.md` |
| `E08` | `vercel-labs/skills` 是 installer / manager / compatibility layer，支持 project/global scope 与 single source of truth | `../topics/_reference/00-shared-vercel-skills-cli.md` |
| `E09` | 官方 guide 直接支持“借鉴现成 skill + treat skills like code”的路径 | `../topics/_reference/03-ecosystem-signals-and-adoption-vercel-kb-learning-leverage.md` |
| `E10` | 外部 skill 资源需要保留独立 trust boundary，不能因为好找就直接信 | `../topics/_reference/03-ecosystem-signals-and-adoption-trust-boundaries.md` |
| `E11` | public skills 的效果分布、clone inflation 和质量风险说明“可发现”不等于“可用” | `../topics/_reference/03-ecosystem-signals-and-adoption-independent-effectiveness-benchmark.md`；`../topics/_reference/03-ecosystem-signals-and-adoption-clone-security-and-quality-risks.md` |
| `E12` | 当前最清楚的对象角色分工、baseline fit 与 anti-misread 口径 | `../topics/_artifacts/W2-formal-comparison-table.md`；`../topics/_artifacts/W2-candidate-scorecard-draft.md` |
| `E13` | `agent-skills` 本地拆解：生命周期组织、命令入口与流程纪律 | `../topics/_reference/00-shared-local-example-agent-skills-teardown.md` |
| `E14` | `get-shit-done` 本地拆解：五层 skill-like runtime 结构 | `../topics/_reference/00-shared-local-example-get-shit-done-teardown.md` |
| `E15` | `superpowers` 本地拆解：workflow-enforcing plugin、hooks 与行为测试 | `../topics/_reference/00-shared-local-example-superpowers-teardown.md` |
| `E16` | `gstack` 本地拆解：模板治理、浏览器 runtime、specialist review 与系统化工作流 | `../topics/_reference/00-shared-local-example-gstack-teardown.md` |
| `E17` | portable core、progressive disclosure 与跨 surface 的方法论边界 | `../topics/01-skill-methodology-and-spec.md`；`../topics/_reference/01-skill-methodology-and-spec-methodology-convergence-draft.md` |

## B2. 主文档常见判断应回指到哪里

| 主文档里的判断 | 默认回指 |
| --- | --- |
| “先读后编会更快” | `E06` + `E07` + `E09` |
| “不要追单一赢家，要做职责拆分” | `E02` + `E03` + `E12` |
| “高质量样板库值得先读” | `E05` + `E13` |
| “installer 不是 trust / evaluation 系统” | `E08` + `E12` |
| “发现容易不等于可直接信” | `E06` + `E10` + `E11` |
| “要先写 portable core，再补 host-specific extensions” | `E02` + `E04` + `E17` |
| “要用 role-based bundles，而不是全量激活” | `E04` |

## B3. 这轮新增的例子层来自哪里

这轮 final package 新增的“鲜明例子”，主要来自两类来源：

- 现有 research reference
  - `skills.sh`
  - `github/awesome-copilot`
  - `vercel-labs/agent-skills`
  - `vercel-labs/skills`
- 本地既有拆解样本
  - `agent-skills`
  - `get-shit-done`
  - `superpowers`
  - `gstack`

也就是说，这轮写作没有先为了“找例子”而扩搜网络，而是优先消费了本地已经存在的高价值样本层。
