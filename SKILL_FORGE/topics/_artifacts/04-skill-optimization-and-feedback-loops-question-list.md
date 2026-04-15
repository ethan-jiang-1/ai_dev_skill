# 04 / Skill 持续优化、评测闭环与反馈回流 / Question List

- `status`: `not_started`

## 拓扑迁移后的必做项

- 把 `github_skill-forge.md` 作为正式 seed 输入之一，而不是只把它当作外部参考
- 先确认 `skill-forge` 这类 skill artifact 级优化对象，是否足以支撑 `04` 的首批问题框架
- 为 `04` 建立首批专属 reference，避免 topic 只有 seed 没有证据落库
- 为 `04` 建立一版 `failure taxonomy` 草案
- 为 `04` 建立一版最小 `eval / replay / regression loop` baseline
- 把 `04` 的结论重新吸收到 `W2-cross-topic-synthesis.md`、workflow baseline 与 final recommendation 语法

## 初步研究问题

- skill 持续优化的对象边界到底是什么，哪些问题不应再被偷换成 prompt tuning
- `skill-forge` 代表的是“skill 结构 / discoverability / executability 优化”中的哪一类路线
- 发布后的 skill 失败，最小可用的分类框架应该怎么建
- 哪些失败信号可以从 trace、回放、用户修正和回归样本里稳定提取
- skill 的最小 eval set 应该如何设计，才能支持版本前后比较
- 哪些修订环节可以自动化，哪些必须保留人工审阅和发布门槛

## 当前判断

- `04` 当前不该从“再找几个 prompt 优化框架”起步，而应从 skill artifact 级对象和可迁移的评测闭环模式起步。
- `skill-forge` 是当前最值得作为 `04` 起步样本之一的开源对象，因为它已经把 skill 的 discoverability、executability、结构一致性与发布前治理视为优化对象。
