# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）Execution Queue

> 对应计划：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md`
> 对应状态：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
> 本文件只记录连续执行动作、补队列候选与提升规则；不替代设计态蓝图或完整状态面。

## Active Queue

- queue_health: `ready`

### current_task

- action: `find public before/after skill optimization or regression practice cases and land them into topic 04`
- done_condition: `at least one new authoritative reference or one explicit failed-exploration record clarifies whether public skill-specific before/after optimization cases exist`
- writes_to: `new 04 reference under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference if found; /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-evidence-summary.md; /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-question-list.md; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 counts if evidence lands, or Failed Explorations if the search proves structurally thin`

### next_task

- action: `expand 04 failure taxonomy with promotion decision examples and artifact-layer mapping`
- done_condition: `failure taxonomy includes concrete mappings from trigger, trajectory, safety, and regression failures to specific artifact-layer revisions`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 gap and Resume Checkpoint`

### next_after_next

- action: `expand the 04 local case pack at the MD level before reopening runner implementation`
- done_condition: `local-case-pack.md covers a broader set of trigger, no-trigger, trajectory, tool-contract, and safety patterns aligned with the current methodology stack`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 gap and Resume Checkpoint`

## Blocked State

- blocked_reason: `not_applicable`
- interrupt_condition_matched: `not_applicable`
- unblock_trigger: `not_applicable`

When this section is active, `STATUS_PATH.state` must be `blocked`, `STATUS_PATH.blocking_issue` must summarize the same blocker, and `STATUS_PATH.Resume Checkpoint.safe_to_interrupt` must match the actual interrupt safety.

## Refill Pool

Repeat the following candidate block as needed. Do not collapse multiple candidates into one comma-separated line.

### Candidate Block

- candidate: `implement JSON comparison output using the documented artifact contract`
- done_condition: `mock runner emits the JSON comparison artifact defined by 04-skill-optimization-and-feedback-loops-json-comparison-output-spec.md and Markdown summary stays aligned`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner.rb; /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner-report.md; optional JSON report artifact; status`
- status_sync: `update Resume Checkpoint.last_completed_step, last_verified_command, last_verified_result, and Worklog`
- why_next: `converts the current 04 compare semantics into a machine-readable SSOT when non-MD implementation is in scope`
- prerequisite: `non-MD implementation work is explicitly allowed`
- promotion_trigger: `MD scaffolds are stable and user reopens implementation scope`

### Candidate Block

- candidate: `compare the current public optimization mechanisms into a compact 04 scorecard`
- done_condition: `a scorecard makes it easier to compare governance, trigger tuning, regression, feedback loop, and candidate revision roles across the current method stack`
- writes_to: `new or updated 04 artifact under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts; status`
- status_sync: `update topic 04 gap and Resume Checkpoint`
- why_next: `reduces the risk that 04 keeps drifting back into tool-name collection instead of stack design`
- prerequisite: `current active 04 queue closes one of the evidence or taxonomy gaps`
- promotion_trigger: `queue becomes thin after current active tasks`

### Candidate Block

- candidate: `draft skill workflow delivery checklist from the final recommendation`
- done_condition: `a concise checklist turns the final recommendation into a handoff-ready authoring / install / trust / eval / rollback workflow`
- writes_to: `new or updated artifact under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts; status`
- status_sync: `update Wave 2 final recommendation residual risk if adopted`
- why_next: `turns research conclusions into a reusable delivery surface without touching implementation code`
- prerequisite: `04 methodology stack is stable enough that delivery hardening will not get ahead of the evidence`
- promotion_trigger: `queue becomes thin after current active tasks`

## Promotion Rules

- when_current_finishes: `promote next_task, shift next_after_next, refill immediately`
- when_queue_becomes_thin: `promote highest-value ready candidate and replenish the third slot`
- when_blocked: `write blocked state explicitly and keep unblock trigger concrete`
- when_to_suspend_branch: `when a branch no longer advances the mainline or cannot be unblocked cheaply`

## No-Empty-Queue Rule

- before_closing_current_task: `refill active queue first`
- must_refill_to: `current_task / next_task / next_after_next`
- only_allowed_empty_condition: `true mainline blockage that satisfies Autonomous Execution Protocol interrupt conditions`
