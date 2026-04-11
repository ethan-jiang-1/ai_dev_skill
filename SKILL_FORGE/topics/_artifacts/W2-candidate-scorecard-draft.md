# Wave 2 Candidate Scorecard Draft

- `status`: `in_progress`
- `purpose`: `把第二轮新增的 portability / orchestration / effectiveness / trust 证据，映射回当前候选对象，而不是直接跳到最终排名。`
- `basis`:
  - `W2-cross-topic-synthesis.md`
  - `00-shared-object-classification-draft.md`
  - `01 / 02 / 03 evidence summary`
- `warning`: `这不是最终榜单，只是进入最终排序前的对象级判断草案。`

## 评分口径

- `learning_leverage`
  - `high`: 非常适合借鉴、拆结构、快速上手
  - `medium`: 有学习价值，但更依赖特定场景
  - `low`: 对学习帮助有限，或成本较高
- `engineering_baseline_fit`
  - `strong`: 很适合进入未来 baseline 组合
  - `conditional`: 有价值，但只覆盖特定 segment 或前提较多
  - `weak`: 更适合参考，不适合作为基座
- `trust_posture`
  - `learn-first`: 更适合先读、先拆、先实验
  - `controlled-trial`: 可小范围试用，但必须带 audit / evaluation gate
  - `track-only`: 暂时更适合跟踪，不适合直接重押

## 当前对象级草案

| Object | Primary role | learning_leverage | engineering_baseline_fit | trust_posture | W2 约束下的当前判断 |
| --- | --- | --- | --- | --- | --- |
| `vercel-labs/agent-skills` | `sample-library` | `high` | `conditional` | `learn-first` | 最适合当结构样板与内容参考，但不能单独承担 install、governance、evaluation |
| `vercel-labs/skills` | `installer / manager` | `medium` | `strong` | `controlled-trial` | 很像 baseline 的安装与分发层，但 install 不等于 trust，也不等于 effectiveness |
| `skill-forge` | `governance / publish` | `medium` | `strong` | `track-only` | 在治理维度非常关键，但外部采用信号仍偏早期，更像重点跟踪对象 |
| `skills.sh` | `registry / directory` | `high` | `weak` | `learn-first` | discovery / learning 价值极强，但 clone inflation 与安全风险使其不应被误当质量背书 |
| `github/awesome-copilot` | `community learning hub` | `high` | `weak` | `learn-first` | 非常适合扩搜索与快速借鉴，不适合直接当工程基座 |
| `Ai-Agent-Skills` | `library-manager` | `medium` | `conditional` | `controlled-trial` | 更适合团队 / 个人 curated library 场景，但不是主流 install baseline 的直接替代 |
| `open-skills` | `runtime-bridge` | `medium` | `conditional` | `controlled-trial` | 如果目标是本地 / MCP / 自托管执行，这一层很关键；否则不必强行纳入默认基座 |

## 当前三类推荐语义

### 1. Learning-first objects

- `skills.sh`
- `github/awesome-copilot`
- `vercel-labs/agent-skills`

当前口径：

- 这些对象最适合回答“去哪里找现成 skill、怎么快速观察成熟写法、怎么缩短冷启动摸索期”。
- 但它们不自动回答“我是否应该直接装到生产 workflow 里”。

### 2. Engineering baseline objects

- `vercel-labs/skills`
- `skill-forge`
- `vercel-labs/agent-skills`

当前口径：

- 如果要形成自己的 baseline，当前更像需要:
  - `agent-skills` 提供结构样板
  - `skills` 提供 install / distribution layer
  - `skill-forge` 提供 governance / publish layer
- 这套组合现在最稳，但还必须外加:
  - evaluation gate
  - versioning / rollback discipline

### 3. Context-specific objects

- `Ai-Agent-Skills`
- `open-skills`

当前口径：

- 这两类对象都不是“默认所有团队都该先上”的层。
- 它们更像场景化增强：
  - 前者偏 internal library curation
  - 后者偏 local / MCP runtime adaptation

## 暂不下的判断

- 不在这一版 scorecard 里给最终前 `3` 总榜。
- 不把 `learning_leverage` 误写成 `engineering_maturity`。
- 不把目录规模、下载量或第三方教程数量误写成 `trust_posture`。

## 下一步最值得做的事

- 把这张草案继续细化成真正的横向对比表，至少补:
  - portability
  - lifecycle coverage
  - evaluation readiness
  - trust / audit requirement
- 然后再决定最终输出是:
  - 前 `3` 总榜
  - 还是按 `learning / engineering / governance` 给出分角色推荐。
