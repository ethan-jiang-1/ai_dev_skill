# Wave 2 Formal Comparison Table

- `status`: `in_progress`
- `purpose`: `把对象级 scorecard 草案推进成更正式的横向比较表，供后续前 3 推荐或组合推荐直接复用。`
- `basis`:
  - `W2-candidate-scorecard-draft.md`
  - `W2-cross-topic-synthesis.md`
  - `01 / 02 / 03 evidence summary`
- `warning`: `这仍不是最终榜单，而是最终推荐前的统一比较底稿。`

## 比较维度

- `primary_role`
  - 这个对象最稳定的职责边界是什么
- `learning_value`
  - 它是否适合用来观察成熟 skill 写法、快速缩短摸索期
- `baseline_fit`
  - 它是否适合进入未来默认 workflow baseline
- `portability_sensitivity`
  - 它是否强依赖特定 surface、特定安装路径或特定运行语义
- `evaluation_readiness`
  - 它是否自带或天然接近 test / monitor / versioning / rollback 语义
- `trust_burden`
  - 使用它时，是否需要显著额外的审查、过滤或任务级验证
- `recommended_usage_now`
  - 在当前证据下，最合理的使用方式是什么

## 当前正式比较表

| Object | primary_role | learning_value | baseline_fit | portability_sensitivity | evaluation_readiness | trust_burden | recommended_usage_now |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `vercel-labs/agent-skills` | `sample-library` | `high` | `conditional` | `medium` | `weak` | `medium` | 当结构样板池与高质量参考库使用，不单独承担 install / governance / evaluation |
| `vercel-labs/skills` | `installer / manager` | `medium` | `strong` | `medium` | `conditional` | `medium-high` | 当 install / distribution layer 使用，但必须额外接 trust gate 与任务级评测 |
| `skill-forge` | `governance / publish` | `medium` | `strong` | `low-medium` | `conditional` | `low-medium` | 当 governance / publish layer 跟踪与接入，不宜仅凭方向感直接重押为唯一基座 |
| `skills.sh` | `registry / directory` | `high` | `weak` | `low` | `weak` | `high` | 当 discovery / learning 入口使用，不把目录信号当质量或安全背书 |
| `github/awesome-copilot` | `community learning hub` | `high` | `weak` | `low` | `weak` | `medium-high` | 当外部样本与教程入口使用，适合扩搜与借鉴，不适合直接当工程基座 |
| `Ai-Agent-Skills` | `library-manager` | `medium` | `conditional` | `medium` | `conditional` | `medium` | 当团队内部 curated library 管理层试用，不替代通用 installer 与 governance |
| `open-skills` | `runtime-bridge` | `medium` | `conditional` | `high` | `conditional` | `medium` | 在本地 / MCP / 自托管场景中作为 runtime bridge 引入，非默认全局基座 |

## 当前观察

### 1. 最强学习层和最强工程层不是同一批对象

- `skills.sh`、`github/awesome-copilot`、`vercel-labs/agent-skills` 更像 learning-first。
- `vercel-labs/skills`、`skill-forge` 更像 engineering-baseline-first。

### 2. 当前没有对象同时在所有维度上都明显最强

- `agent-skills` 强在样板和学习。
- `skills` 强在安装和分发。
- `skill-forge` 强在治理与发布方向。
- `open-skills`、`Ai-Agent-Skills` 更像场景化增强层。

### 3. 当前最重要的负约束不是“功能少”，而是“不能误用”

- 目录站与社区聚合站不能被误读为信任背书。
- installer 不能被误读为 evaluation system。
- sample library 不能被误读为 lifecycle 全链路基座。

## 对最终推荐语法的影响

- 如果最终必须给一个总榜，这个总榜会丢失很多关键信息。
- 更稳的表达方式是至少拆成三类:
  - `learning / discovery`
  - `engineering baseline`
  - `governance / trust`
- 只有在这三类都明确后，再给一个“最值得先试的组合”，才不会把不同职责的对象硬压成一行。

## 当前最接近可执行的组合

- `vercel-labs/agent-skills`
  - 负责结构样板与高质量内容参考
- `vercel-labs/skills`
  - 负责 install / distribution / compatibility
- `skill-forge`
  - 负责 governance / publish / trust-oriented quality gate

补充约束：

- 这套组合仍然不自动解决:
  - independent evaluation
  - version pinning
  - rollback
  - recall overload
- 因此它更像 `minimum viable baseline`，而不是“装完即稳”的完整体系。
