# 面向 Coding Agent 的 Skill Engineering Deep Research Progressive Plan（一轮）Execution Queue

> 对应计划：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.md`
> 对应状态：`/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
> 本文件只记录连续执行动作、补队列候选与提升规则；不替代设计态蓝图或完整状态面。

## Active Queue

- queue_health: `paused_after_milestone`

### current_task

- action: `hold the queue in paused_after_milestone; do not promote new mainline work unless an explicit reopen decision is made`
- done_condition: `explicit reopen request exists`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `if reopened, change queue_health back to active, record the new branch goal, and reset Resume Checkpoint`

### next_task

- action: `optional reopen: expand machine-readable case-pack parity beyond the first 9 cases`
- done_condition: `the machine-readable case pack either includes the superpowers extension cases or an explicit parity policy is written`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `update topic 04 gap and Resume Checkpoint`

### next_after_next

- action: `optional reopen: tighten the real smoke contract again only if stricter behavior benchmarking is intentionally requested`
- done_condition: `the stricter contract is justified, documented, and rerun against real traces`
- writes_to: `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.yaml; /Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-matcher-rules.yaml; /Users/bowhead/ai_dev_skill/SKILL_FORGE/plan/skill-engineering-deep-research-progressive-plan-round-1.status.md`
- status_sync: `record why the reopen is worth the extra strictness`

## Blocked State

- blocked_reason: `not_applicable`
- interrupt_condition_matched: `not_applicable`
- unblock_trigger: `not_applicable`

When this section is active, `STATUS_PATH.state` must be `blocked`, `STATUS_PATH.blocking_issue` must summarize the same blocker, and `STATUS_PATH.Resume Checkpoint.safe_to_interrupt` must match the actual interrupt safety.

## Refill Pool

- refill_state: `inactive_while_paused`
- activation_rule: `after explicit reopen, regenerate candidate blocks from next_task, next_after_next, and the latest topic 04 gap`
- do_not_reintroduce: `already completed items such as JSON comparison SSOT, implementation-reopen packaging, final branch-state review, Python runner migration, and the first 3/3 real smoke milestone`

## Promotion Rules

- when_current_finishes: `only after explicit reopen; otherwise keep the queue in paused_after_milestone`
- when_queue_becomes_thin: `only when queue_health is active, promote the highest-value ready candidate and replenish the third slot`
- when_paused_after_milestone: `keep the hold-state current_task and do not auto-promote refill work`
- when_blocked: `write blocked state explicitly and keep unblock trigger concrete`
- when_to_suspend_branch: `when a branch no longer advances the mainline or cannot be unblocked cheaply`

## No-Empty-Queue Rule

- before_closing_current_task: `when queue_health is active, refill first; when queue_health is paused_after_milestone, keep only the hold-state current_task`
- must_refill_to: `current_task / next_task / next_after_next`
- only_allowed_empty_condition: `paused_after_milestone or true mainline blockage that satisfies Autonomous Execution Protocol interrupt conditions`
