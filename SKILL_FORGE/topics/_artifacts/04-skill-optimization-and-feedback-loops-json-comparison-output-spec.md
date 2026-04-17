# 04 / Mock Runner JSON Comparison Output Spec

- `status`: `draft_ready_for_implementation`
- `purpose`: `把 mock runner 未来要输出的 machine-readable comparison artifact 固定下来，避免 Markdown 报告、状态摘要和后续真实 adapter 结果各写各的。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-adapter-and-assertion-spec.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner-report.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md`

## Why This Exists

当前 mock runner 只产出 Markdown 报告，已经足够证明 promotion blocking 语义，但还不够支撑：

- 稳定回读的 case-level compare 结果
- 后续 `status` / `queue` 的低歧义同步
- 真实 adapter 接入后的 baseline / candidate 统一消费接口
- 失败分类、阻断原因与 promotion decision 的结构化回填

因此，Markdown 报告可以继续保留，但不再作为 compare 结果的唯一事实来源。

## Output Contract

未来实现时，mock runner 应同时产出：

- 终端 stdout：面向人读的简短摘要
- Markdown 报告：`04-skill-optimization-and-feedback-loops-mock-runner-report.md`
- JSON compare artifact：建议路径为 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner-report.json`

其中 JSON artifact 是 compare 结果的 machine-readable SSOT；Markdown 报告应由它派生，不允许手工补写出与 JSON 冲突的统计数字。

## Required Top-Level Fields

```json
{
  "artifact_type": "skill_regression_comparison",
  "schema_version": 1,
  "runner_mode": "mock",
  "baseline_fixture": "04-skill-optimization-and-feedback-loops-mock-baseline.json",
  "candidate_fixture": "04-skill-optimization-and-feedback-loops-mock-candidate.json",
  "promotion_blocked": true,
  "promoted": false,
  "summary": {},
  "blocking_failures": [],
  "cases": []
}
```

最小必需字段：

- `artifact_type`
- `schema_version`
- `runner_mode`
- `baseline_fixture`
- `candidate_fixture`
- `promotion_blocked`
- `promoted`
- `summary`
- `blocking_failures`
- `cases`

## Summary Block

`summary` 至少包含：

```json
{
  "total_cases": 3,
  "regressions": 3,
  "improvements": 0,
  "unchanged_pass": 0,
  "unchanged_fail": 0,
  "new_cases": 0,
  "removed_cases": 0
}
```

如果未来真实 adapter 已能稳定提供数值，也可以继续补：

- `baseline_cost_usd`
- `candidate_cost_usd`
- `baseline_latency_ms`
- `candidate_latency_ms`
- `baseline_step_count`
- `candidate_step_count`

但这些增强字段不能阻塞 mock mode 的最小 JSON 产出。

## Blocking Failures

`blocking_failures` 不是把所有失败平铺，而是只记录会阻断 promotion 的 failure records。

每条至少包含：

```json
{
  "case_id": "ship-safety-001",
  "status": "regressed",
  "blocking_reason": "gate_regression",
  "assertion": "safety",
  "failure_class": "Safety / Governance Failure"
}
```

推荐 `blocking_reason` 枚举：

- `gate_regression`
- `trigger_regression`
- `safety_regression`
- `forbidden_tool_args`
- `manual_review_required`

## Case Record

每个 `cases[]` 元素至少包含：

```json
{
  "case_id": "review-output-001",
  "status": "regressed",
  "tier": "gate",
  "blocking": true,
  "baseline": {
    "passed": true
  },
  "candidate": {
    "passed": false,
    "trigger_passed": true,
    "trajectory_passed": false,
    "tool_contract_passed": true,
    "output_contract_passed": false,
    "safety_passed": true,
    "needs_judge": false,
    "failures": []
  }
}
```

要求：

- `baseline` 和 `candidate` 都保留 assertion-level pass/fail 面
- `failures` 保持与现有 assertion failure shape 一致
- `blocking` 由 compare 规则派生，不由人工补写
- `status` 只允许：`improved / regressed / unchanged_pass / unchanged_fail / new_case / removed_case`

## Derivation Rules

- `promotion_blocked = true` 当且仅当存在 blocking failure
- `promoted = true` 只在 `promotion_blocked = false` 且 compare 决策明确允许时成立
- Markdown 报告中的 `promotion_blocked / total_cases / regressions / improvements` 必须直接取自 JSON
- `status.md` 只应摘要 JSON 顶层 summary，不复制 case payload

## Manual Review Boundary

若未来加入 `needs_judge = true` 的 case：

- JSON 里必须显式保留 `needs_judge`
- 若它处于 `tier: gate`，默认应写入 `blocking_failures`
- Markdown 报告不得把 `needs_judge` 默写成 pass

## First Implementation Acceptance Bar

实现完成后，至少应满足：

- mock runner 仍能输出当前 Markdown 报告
- 新增 JSON artifact
- JSON 中能准确表达当前三条 regression 的 blocking 面
- JSON 与 Markdown 的统计数字完全一致
- `status` 能安全摘录 `promotion_blocked / total_cases / regressions / improvements`
