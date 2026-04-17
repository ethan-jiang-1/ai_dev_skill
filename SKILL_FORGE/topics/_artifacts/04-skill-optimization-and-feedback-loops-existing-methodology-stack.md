# 04 / Existing Skill Optimization Stack

- `status`: `reopened_for_active_deepening`
- `purpose`: `把当前已经能找到的 skill optimization 方法学、套路、自动化路径和人工把关边界收束成一个可直接指导后续投资顺序的综合 artifact。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-skill-forge-artifact-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-description-trigger-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-agent-trajectory-regression.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-ci-quality-gates.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-langsmith-offline-online-feedback-loop.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-dspy-program-optimizer-pattern.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-openai-evals-optimization-flywheel.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-evaluation-versioning-loop.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`

## Core Judgment

当前能挖到的“现成东西”不是一个 turnkey `skill optimizer`。

更接近现实答案的是一套可拼接的 optimization stack：

1. artifact governance / publish gate
2. trigger / discoverability tuning
3. trajectory / tool-use regression
4. offline / online feedback loop
5. candidate revision / optimizer pattern
6. human promotion gate

也就是说，真正可落地的 stable skill 优化，不是继续人工反复改 prompt，而是把 skill 当成 versioned artifact，用 cases、traces、regression 和 release discipline 驱动迭代。

## Why This Matters

用户真正需要的不是“skill 大家都会写一些”，而是：

- skill 进入真实工作流后更稳
- 不靠作者凭感觉反复手调
- 有明确的方法学和自动化边界
- 改动之后能比较 baseline 和 candidate，而不是只看 demo

这正是 `04` 应继续投资的方向。

## Existing Stack Layers

### 1. Artifact Governance Layer

代表对象：

- `skill-forge`

它解决的问题：

- skill 结构是否一致
- metadata / README / 实际能力是否一致
- discoverability 是否足够
- workflow executability 是否足够
- 安全问题是否应该阻断发布
- 分发结构是否会产生 shadowing / duplicate copy / broken links

结论：

- 这条线说明 skill optimization 的对象从一开始就不该只是正文 prompt。
- 它更像发布前治理和 artifact audit 层，而不是线上效果评测层。

### 2. Trigger And Discoverability Layer

代表机制：

- `description` / metadata routing
- trigger / no-trigger eval cases

它解决的问题：

- 该触发时没触发
- 不该触发时误触发
- 描述过窄
- 描述过宽
- agent 在 startup 时只看到轻量 metadata，导致 skill body 还没读到就已经路由错了

结论：

- description tuning 不是文案润色，而是 routing interface tuning。
- 这是最容易被低估、但最适合先自动化验证的一层。

### 3. Regression Harness Layer

代表机制：

- Promptfoo-style trajectory assertions
- 本地 `gstack` compare / eval store / adapter pattern

它解决的问题：

- final output 看起来差不多，但中间轨迹已经明显偏航
- 工具调用顺序、参数、步骤数量变坏
- cost / latency / step count 膨胀
- 一个 case 修好了，但原本通过的 case 回退了

结论：

- workflow skill 必须把 `trajectory + tool calls + tool args + step count + output contract + safety` 一起纳入回归。
- 这是让 skill 从“能写”变成“能稳”的主干层。

### 4. Feedback Loop Layer

代表机制：

- LangSmith offline / online evaluation
- production traces -> offline dataset
- annotation queues / human feedback

它解决的问题：

- 线上失败没有进入后续 eval
- 人工修正没有沉淀成高质量样本
- 生产环境问题和离线回归断开

结论：

- 一个 stable skill workflow 必须有 online-to-offline 回流路径。
- 否则回归集会越来越脱离真实失败面。

### 5. Candidate Revision Layer

代表机制：

- DSPy optimizer pattern
- OpenAI eval-driven optimization workflow

它解决的问题：

- 改哪一块 artifact 才最可能修复当前 failure
- 如何基于 metric / cases / traces 生成局部候选修订
- 如何避免每次都人工从空白开始改

结论：

- 自动化最适合做 bounded candidate revision，不适合直接做 fully automatic promotion。
- 当前最合理的优化对象是 skill 局部部件：
  - `description`
  - examples
  - workflow step wording
  - tool contract
  - supporting file structure

### 6. Human Promotion Gate

代表机制：

- version pinning
- representative tasks
- fallback
- deprecate / rollback discipline

它解决的问题：

- 自动候选虽然在部分 eval 上变好，但引入新的风险
- dataset 过窄导致 optimizer overfit
- skill 影响真实工作流，不能无门槛自动上线

结论：

- stable skill workflow 的终局不是“全自动优化”，而是“自动生成候选 + 自动比较 + 人工决定 promote / reject / fallback”。

## What Can Be Automated Now

当前已经有明确现成方法支持自动化的部分：

- 记录 trigger / no-trigger / trajectory / safety cases
- 采集 run trace、tool calls、latency、cost、step count
- 结构化存储 baseline / candidate run results
- 对比 improved / regressed / unchanged
- 阻断明显坏版本
- 把失败 trace 转进 offline dataset
- 生成局部 candidate revisions

## What Should Stay Human-On-The-Loop

当前仍应保留人工把关的部分：

- 失败 taxonomy 的主类定义与修订
- 哪些 case 属于 `gate`，哪些只属于 `periodic`
- 是否接受触发边界变宽或变窄
- 安全 / 权限 / destructive action 的 release 判断
- promotion / reject / rollback 最终决策

## Current Best Practical Pattern

如果今天就要搭一套比较稳的 skill optimization baseline，最现实的组合不是单工具，而是：

1. `skill-forge` 风格的 artifact governance / publish gate
2. description-driven trigger tuning
3. Promptfoo / local harness 风格的 trajectory regression
4. LangSmith 风格的 offline / online feedback loop
5. DSPy / OpenAI evals 风格的 candidate revision workflow
6. 人工 promotion gate + version pinning + fallback

## Recommended Investment Order

### Priority 1

先把 skill regression contract 稳住：

- failure taxonomy
- trigger / no-trigger cases
- trajectory / tool-use assertions
- baseline vs candidate compare contract

### Priority 2

把 feedback loop 接进来：

- production traces
- annotation / human feedback
- offline dataset backfill

### Priority 3

做 bounded automation：

- 只生成局部候选修订
- 不直接自动 promotion

### Priority 4

再考虑更强自动化：

- 自动 failure clustering
- 自动 candidate ranking
- partial self-serve optimization loop

## Current Gaps

即使已经有这些现成方法，当前仍缺三类关键东西：

- 公开可复用的 `SKILL.md` package before / after 优化案例
- 专门面向 skill package 的通用 regression harness 样板
- 更稳定的“candidate revision -> compare -> human promotion”工作流实例

## Takeaway

`04` 现在最值得继续投的，不是继续泛搜 prompt optimization，而是继续沿着这条问题收束：

> 如何把现成的 artifact governance、trigger tuning、trajectory regression、feedback loop 和 candidate revision 拼成一条稳定 skill optimization stack，并让自动化只负责它真正擅长的部分。
