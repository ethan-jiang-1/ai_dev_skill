# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）Execution Queue

> 对应计划：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md`
> 对应状态：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
> 本文件只记录连续执行动作、补队列候选与提升规则；不替代设计态蓝图或完整状态面。

## Active Queue

- queue_health: `ready`

### current_task

- action: `add the first real Codex adapter on the YAML-covered subset`
- done_condition: `at least one no-trigger case, one output-contract case, and one safety case run through a real Codex adapter with normalized run records`
- writes_to: `adapter implementation files, reports, and /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update real Codex adapter execution branch and Resume Checkpoint`

### next_task

- action: `expand machine-readable case-pack parity beyond the first 9 cases if the Codex adapter stabilizes`
- done_condition: `the machine-readable case pack either includes the superpowers extension cases or an explicit parity policy is written`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 gap and Resume Checkpoint`

### next_after_next

- action: `reassess whether 04 should continue implementation expansion or pause after the first real-adapter milestone`
- done_condition: `status explicitly records whether 04 stays on implementation mainline or returns to a suspended branch after the first adapter milestone`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 stop decision or suspended branch state`

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

- candidate: `prepare an implementation-reopen handoff note grounded in the new case pack, scorecard, and delivery checklist`
- done_condition: `the suspended real-adapter branch has an explicit MD-only reopen note with prerequisites, boundaries, and acceptance order`
- writes_to: `new or updated 04 artifact under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts; status`
- status_sync: `update Suspended Branches.real Codex adapter execution and Resume Checkpoint`
- why_next: `reduces ambiguity when 04 moves from document baseline into implementation prep`
- prerequisite: `current active 04 queue confirms the trio is internally consistent`
- promotion_trigger: `queue becomes thin after current active tasks`

### Candidate Block

- candidate: `write a final 04 branch-state review that decides continue vs implementation-prep`
- done_condition: `status makes an explicit mainline decision after reviewing the trio and the suspended real-adapter branch`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 stop decision, gap, and Resume Checkpoint`
- why_next: `prevents 04 from hovering indefinitely between deep research and implementation-prep`
- prerequisite: `implementation-reopen handoff note exists or is judged unnecessary`
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
