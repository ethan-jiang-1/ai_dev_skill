# 04 / Skill Optimization Method Stack Scorecard

- `status`: `draft`
- `purpose`: `把 04 当前已确认的方法学栈压缩成一张可比较的 scorecard，避免 topic 继续漂成工具名收集。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-existing-methodology-stack.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-evidence-summary.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md`

## Scoring Semantics

- `strong`: 该对象直接覆盖这一层，是主要抓手
- `partial`: 能提供可迁移模式，但不是原生中心能力
- `weak`: 只提供边缘帮助，不应把希望压在这里
- `none`: 当前证据下不覆盖

## Scorecard

| Method / Object | Artifact Governance | Trigger Tuning | Trajectory Regression | Feedback Loop | Candidate Revision | Promotion Gate | Main Use |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `skill-forge` | `strong` | `partial` | `partial` | `weak` | `weak` | `strong` | 发布前审计、结构一致性、discoverability、executability、publish gate |
| `description + metadata tuning` | `weak` | `strong` | `weak` | `none` | `partial` | `weak` | 解决漏触发、误触发、描述过窄 / 过宽 |
| Promptfoo agent eval | `weak` | `partial` | `strong` | `weak` | `weak` | `strong` | trajectory、tool sequence、step count、CI gate |
| LangSmith-style trace loop | `weak` | `partial` | `partial` | `strong` | `weak` | `partial` | production trace、annotation、online-to-offline 回流 |
| DSPy optimizer pattern | `none` | `partial` | `partial` | `weak` | `strong` | `weak` | bounded candidate generation、metric-guided revision |
| OpenAI eval flywheel | `weak` | `partial` | `partial` | `partial` | `strong` | `partial` | baseline、test data、feedback-driven iteration |
| local `gstack` eval harness | `partial` | `partial` | `strong` | `partial` | `partial` | `strong` | 本地 runner、compare、trace extraction、structured result store |
| `superpowers` feedback-driven revision | `partial` | `partial` | `partial` | `strong` | `strong` | `strong` | 从真实失败报告进入局部 skill 修订、phase rollout 与 success metrics |

## Current Best Combination

当前最合理的组合不是选一个赢家，而是按层拼接：

1. `skill-forge`
   - 负责 artifact governance 与 publish gate
2. description / metadata tuning
   - 负责 trigger / no-trigger 边界
3. Promptfoo or local `gstack`-style regression
   - 负责 trajectory、tool-use、output contract 与 compare
4. LangSmith-style trace loop
   - 负责 online-to-offline feedback 回流
5. DSPy / OpenAI-style candidate revision
   - 负责 bounded candidate generation
6. `superpowers`-style phased revision discipline
   - 负责 success metrics、risk staging 与 human promotion gate

## What This Clarifies

- `04` 不该继续被理解成“再搜几个优化框架”。
- 目前也没有证据支持单一 `skill optimizer` 能独立覆盖从发现失败到 promote 的全链路。
- 真正稳定的 skill optimization baseline，需要把：
  - artifact governance
  - trigger tuning
  - trajectory regression
  - feedback loop
  - candidate revision
  - human promotion gate
  视为六个相互配合的层。

## Implication For Next Work

- 文档层下一步不该再堆对象名，而应把这些层收束成：
  - 更广的 local case pack
  - handoff-ready delivery checklist
  - 再之后才是 runner implementation reopen
