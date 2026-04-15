# 04 / Skill 持续优化、评测闭环与反馈回流 / Question List

- `status`: `active_backlog`

## 拓扑迁移后的必做项

- 把 `github_skill-forge.md` 作为正式 seed 输入之一，而不是只把它当作外部参考
- 先确认 `skill-forge` 这类 skill artifact 级优化对象，是否足以支撑 `04` 的首批问题框架
- 为 `04` 建立首批专属 reference，避免 topic 只有 seed 没有证据落库
- 为 `04` 建立一版 `failure taxonomy` 草案
- 为 `04` 建立一版最小 `eval / replay / regression loop` baseline
- 把 `04` 的结论重新吸收到 `W2-cross-topic-synthesis.md`、workflow baseline 与 final recommendation 语法

## 已初步回答

- `skill-forge` 是否足以作为 `04` 的起步样本
  - 可以。它代表 artifact governance / discoverability / executability / publish gate 路线，但不覆盖完整线上 trace 和 regression harness。
- skill regression 是否只需要检查最终输出
  - 不够。Promptfoo agent eval 证据说明 workflow skill 还应检查 trajectory、tool calls、tool args、tool sequence 和 step count。
- 发布后反馈如何回流成 eval case
  - LangSmith 模式提供了可迁移结构：production trace / online eval 暴露问题，人工反馈和 annotation queue 补标签，再进入 offline dataset 做 regression。
- 自动优化能否直接等同于 prompt tuning
  - 不能。DSPy 更适合作为 program-level candidate revision pattern，迁移到 skill 时应先作用于 description、examples、workflow steps、tool contract 等局部部件。

## 初步研究问题

- skill 持续优化的对象边界到底是什么，哪些问题不应再被偷换成 prompt tuning
- `skill-forge` 代表的是“skill 结构 / discoverability / executability 优化”中的哪一类路线
- 发布后的 skill 失败，最小可用的分类框架应该怎么建
- 哪些失败信号可以从 trace、回放、用户修正和回归样本里稳定提取
- skill 的最小 eval set 应该如何设计，才能支持版本前后比较
- 哪些修订环节可以自动化，哪些必须保留人工审阅和发布门槛

## 仍待补充

- 公开案例中是否存在 skill 版本前后量化比较
- promptfoo / LangSmith / DSPy / OpenAI evals 如何组合成一条最小可执行 skill regression harness
- `failure taxonomy` 是否需要拆出单独的 `trajectory failure` 与 `CI gate failure`
- `eval loop baseline` 是否需要明确样本文件格式、assertion schema 与 promote / reject 阈值

## 已进一步回答

- 本地是否存在可迁移的 skill eval / runner 模式
  - 存在。`gstack` 的 eval code 已覆盖 LLM judge、agent E2E runner、trace parsing、tool-call extraction、touchfile selection、structured result store 与 before / after compare。
- 下一步应该继续写抽象研究，还是推进 runner 规格
  - 应推进 runner 规格。`04` 已经有足够方法论证据，当前更高价值缺口是把 case pack、adapter contract 和 local eval pattern 收束成可实现 runner。

## 已新增工件

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-skill-regression-harness-template.md`
  - 提供 `cases / expected / runs / revision-log / regression-result / promotion-decision` 的最小目录和字段骨架。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`
  - 把本地 `gstack / ship`、`gstack / review`、`agent-skills / code-review-and-quality` 转成可用于 regression harness 的首批 case pack。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`
  - 固定 skill regression harness 与真实 agent runner 之间的输入 / 输出 / assertion result schema。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`
  - 把本地 `gstack` 的 eval / runner / compare 代码作为 04 的真实本地证据源。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`
  - 把 case pack、adapter contract 与本地 eval pattern 收束成可实现的 `skill-regression-runner` 规格。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-adapter-and-assertion-spec.md`
  - 固定 mock adapter、deterministic assertion、compare 与 promotion blocking 的第一版语义，降低真实 agent adapter 前的不确定性。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner.rb`
  - 已实现最小 mock runner：加载 YAML case pack、做 schema-like validation、执行 deterministic assertions、比较 baseline / candidate 并输出 Markdown promotion report。
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner-report.md`
  - 已记录一次 mock baseline / candidate 对比，覆盖 no-trigger false positive、review output contract regression 与 unsafe ship behavior 三类 promotion blocker。

## 下一轮 TODO

- 给 mock runner 增加 JSON comparison output。
- 把 hard-coded output matcher 提取成可配置规则。
- 选择 Codex adapter 作为第一个真实 adapter，因为本地 `gstack` 已有 temp HOME 安装和 `codex exec --json` parser 参考。
- 至少跑一次 baseline / candidate 对比，哪怕 candidate 是一个小的 description 或 workflow contract 改动。
- 把真实运行暴露的新失败类回填到 failure taxonomy。

## 当前判断

- `04` 当前不该从“再找几个 prompt 优化框架”起步，而应从 skill artifact 级对象和可迁移的评测闭环模式起步。
- `skill-forge` 是当前最值得作为 `04` 起步样本之一的开源对象，因为它已经把 skill 的 discoverability、executability、结构一致性与发布前治理视为优化对象。
