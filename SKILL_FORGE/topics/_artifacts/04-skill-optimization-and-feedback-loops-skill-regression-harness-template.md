# 04 / SKILL.md Regression Harness Template

- `status`: `draft`
- `purpose`: `把 04 的 failure taxonomy 与 eval loop baseline 落成一个可执行的 skill 回归测试骨架。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-eval-loop-baseline.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-promptfoo-agent-trajectory-regression.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-langsmith-offline-online-feedback-loop.md`

## 目录骨架

```txt
skill-regression/
  cases/
    trigger-cases.md
    workflow-cases.md
    tool-use-cases.md
    boundary-cases.md
    safety-cases.md
  expected/
    outputs.md
    trajectories.md
    tool-contracts.md
  runs/
    baseline/
    candidate/
  revision-log.md
  regression-result.md
  promotion-decision.md
```

## Case 格式

每个 case 至少包含：

```md
## <case-id>

- user_task:
- expected_skill_behavior:
- should_trigger: `yes / no / conditional`
- failure_class:
- artifact_layer:
- expected_trajectory:
- expected_output_contract:
- safety_constraints:
- source:
```

字段说明：

- `user_task`：真实或代表性用户任务。
- `expected_skill_behavior`：skill 应该做什么，不只是最终答案是什么。
- `should_trigger`：用于覆盖漏触发、误触发和边界任务。
- `failure_class`：引用 failure taxonomy。
- `artifact_layer`：定位到 description、workflow steps、tool contract、supporting files 等层。
- `expected_trajectory`：关键步骤、工具调用、工具顺序和 step count。
- `expected_output_contract`：最终输出的格式、内容和边界。
- `safety_constraints`：权限、凭据、外部命令、发布行为等约束。
- `source`：来自线上 trace、人工构造、用户修正还是历史 regression。

## Assertion 层

### 1. Trigger Assertions

- 应触发的 case 必须触发目标 skill。
- 不应触发的 case 不能触发目标 skill。
- conditional case 必须解释触发或不触发的理由。

### 2. Workflow Assertions

- 关键步骤不能跳过。
- 多阶段 workflow 必须产出中间产物。
- 不允许只输出结论而不执行流程。
- step count 不能异常膨胀。

### 3. Tool Assertions

- 必须调用的工具被调用。
- 禁止调用的工具未被调用。
- 工具参数符合 schema 和语义预期。
- 工具顺序符合 workflow。
- 工具结果被用于后续决策。

### 4. Output Assertions

- 输出满足格式要求。
- 输出覆盖必要字段。
- 输出没有越过 skill 边界。
- 输出没有引入未验证假设。

### 5. Safety Assertions

- 没有泄露或要求凭据。
- 没有执行未授权命令。
- 没有绕过发布前审查。
- 没有把第三方 skill 目录信号误当质量背书。

## Regression Run 流程

### Step 1. Freeze Baseline

- 记录当前稳定 skill 版本。
- 保存当前 `SKILL.md`、scripts、references、metadata。
- 记录当前通过的 case set。

### Step 2. Propose Candidate

候选修订必须写明：

- 修改了哪个 artifact layer
- 修复哪个 failure class
- 预期改善哪个 case
- 可能影响哪些旧 case

### Step 3. Run Cases

最小运行集合：

- 所有目标失败 case
- 至少一组已通过 success case
- 至少一组 no-trigger boundary case
- 至少一组 high-risk tool / safety case

### Step 4. Compare

比较维度：

- trigger pass / fail
- workflow pass / fail
- tool trajectory pass / fail
- output contract pass / fail
- safety pass / fail
- cost / latency / step count 是否异常增加

### Step 5. Decide

```md
# Promotion Decision

- candidate_version:
- baseline_version:
- promoted: `yes / no`
- reason:
- fixed_cases:
- regressed_cases:
- new_risks:
- fallback_version:
- next_revision:
```

## 最小通过标准

- 目标失败 case 有改善。
- 既有关键 success case 不回退。
- no-trigger case 没有明显误触发增加。
- high-risk safety case 不恶化。
- 若 tool trajectory 改变，必须解释为什么可接受。

## 后续自动化方向

- 用 Promptfoo 类工具承载 trigger、output、trajectory assertions。
- 用 LangSmith 类平台收集 production traces 和 human feedback。
- 用 DSPy / OpenAI evals 类机制生成候选修订，但只作为 proposal source。
- promotion gate 必须保留人工审阅。
