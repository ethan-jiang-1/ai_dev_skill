# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）Execution Queue

> 对应计划：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md`
> 对应状态：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
> 本文件只记录连续执行动作、补队列候选与提升规则；不替代设计态蓝图或完整状态面。

## Active Queue

- queue_health: `ready`

### current_task

- action: `add JSON comparison output to the 04 mock runner`
- done_condition: `mock runner still emits the existing Markdown report and also emits machine-readable JSON comparison output with promotion status, case totals, per-case regression details, and blocking failures`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner.rb; /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-mock-runner-report.md; optional new JSON report artifact; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update Resume Checkpoint.last_completed_step, last_verified_command, last_verified_result, and Worklog`

### next_task

- action: `extract hard-coded output matcher into configurable matcher rules`
- done_condition: `runner reads matcher rules from a separate config artifact or clearly documented rules block, and mock comparison result remains promotion_blocked for the current candidate fixture`
- writes_to: `new matcher rules artifact under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts; 04 mock runner; mock runner report; status`
- status_sync: `update Suspended Branches if matcher work changes the real-adapter unblock conditions; otherwise update Resume Checkpoint`

### next_after_next

- action: `prototype first real Codex adapter using the local gstack / codex exec pattern`
- done_condition: `adapter contract has a first executable Codex adapter draft, or the branch is explicitly suspended with concrete blocker and reopen trigger`
- writes_to: `new or updated adapter artifact under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts; runner prototype spec; status`
- status_sync: `promote or update the real Codex adapter Suspended Branch record`

## Blocked State

- blocked_reason: `not_applicable`
- interrupt_condition_matched: `not_applicable`
- unblock_trigger: `not_applicable`

When this section is active, `STATUS_PATH.state` must be `blocked`, `STATUS_PATH.blocking_issue` must summarize the same blocker, and `STATUS_PATH.Resume Checkpoint.safe_to_interrupt` must match the actual interrupt safety.

## Refill Pool

Repeat the following candidate block as needed. Do not collapse multiple candidates into one comma-separated line.

### Candidate Block

- candidate: `validate field-level surface support matrix across Codex / GitHub / Claude`
- done_condition: `field support matrix moves from draft claims to checked compatibility notes, or is archived with explicit reason`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-field-support-matrix-codex-github-claude.md; status`
- status_sync: `update Archived / Suspended Branches and Readiness residual risk summary`
- why_next: `improves precision of portable core vs surface-specific extension claims`
- prerequisite: `main JSON/matcher queue is complete or user prioritizes compatibility validation`
- promotion_trigger: `current_task closes and queue becomes thin`

### Candidate Block

- candidate: `expand mock regression case pack beyond the current three cases`
- done_condition: `case pack includes additional representative failures and mock runner covers them without weakening existing promotion blocking`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml; schema if needed; mock runner report; status`
- status_sync: `update Wave 1 topic 04 gap and Resume Checkpoint`
- why_next: `increases confidence before real adapter execution`
- prerequisite: `JSON output and configurable matcher are in place`
- promotion_trigger: `runner work remains active after next_task`

### Candidate Block

- candidate: `write AGENTS.md / Agent Skills standards supplement`
- done_condition: `supplement explains how repo-level guidance, skill artifact structure, trigger descriptions, tool contracts, and regression loop fit together`
- writes_to: `new or updated artifact under /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts; status`
- status_sync: `update Wave 2 synthesis or final recommendation residual risk if adopted`
- why_next: `turns research findings into a practical workflow supplement`
- prerequisite: `current V8 migration and runner queue are stable`
- promotion_trigger: `user shifts from research continuation to final delivery hardening`

## Promotion Rules

- when_current_finishes: `promote next_task, shift next_after_next, refill immediately`
- when_queue_becomes_thin: `promote highest-value ready candidate and replenish the third slot`
- when_blocked: `write blocked state explicitly and keep unblock trigger concrete`
- when_to_suspend_branch: `when a branch no longer advances the mainline or cannot be unblocked cheaply`

## No-Empty-Queue Rule

- before_closing_current_task: `refill active queue first`
- must_refill_to: `current_task / next_task / next_after_next`
- only_allowed_empty_condition: `true mainline blockage that satisfies Autonomous Execution Protocol interrupt conditions`
