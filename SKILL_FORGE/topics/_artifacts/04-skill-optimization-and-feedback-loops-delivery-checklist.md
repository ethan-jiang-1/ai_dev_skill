# 04 / Skill Workflow Delivery Checklist

- `status`: `draft`
- `purpose`: `把 04 的研究结论压缩成 handoff-ready checklist，便于后续直接接本地 workflow 或 runner implementation。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-final-recommendation-and-baseline.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-method-stack-scorecard.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-failure-taxonomy-draft.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-local-case-pack.md`

## Use This Checklist When

- authoring a new skill workflow
- promoting a revised skill version
- reopening runner implementation
- deciding whether a candidate revision is safe to ship

## Checklist

### 1. Artifact Boundary

- [ ] 明确这次要优化的是哪个 artifact 层，而不是笼统说“调 prompt”
- [ ] 记录目标 skill path、version、host surface 和 relevant supporting files
- [ ] 写清这次 revision 主要修哪类 failure

### 2. Trigger Boundary

- [ ] 至少有一个 `should_trigger` case
- [ ] 至少有一个 `should_not_trigger` case
- [ ] description / metadata 改动时，必须同步检查是否引入误触发

### 3. Workflow And Tool Contract

- [ ] 关键步骤、检查点、stop condition 或 handoff condition 已明确
- [ ] 高风险工具、外部命令或 destructive action 有明确 guardrail
- [ ] output contract 不只看“回答了”，还看结构、顺序、证据要求

### 4. Failure Taxonomy

- [ ] 每个新失败样本已归类到 taxonomy 主类
- [ ] 跨类样本已标出最靠近根因的 artifact layer
- [ ] 不允许只写“prompt 不够好”

### 5. Case Pack Coverage

- [ ] 目标失败样本已进入 local case pack
- [ ] 至少保留一个保护旧行为的 success case
- [ ] 至少保留一个边界 / no-trigger case
- [ ] 如涉及高风险行为，至少保留一个 safety case

### 6. Compare Contract

- [ ] baseline 与 candidate 的比较维度已明确
- [ ] 至少比较 trigger / no-trigger
- [ ] 至少比较 trajectory 或 output contract
- [ ] 如有高风险动作，比较 safety boundary
- [ ] promote / reject / fallback 口径在运行前已写清

### 7. Feedback Loop

- [ ] 线上失败、人工修正或 review findings 能回流成后续 case
- [ ] failure 样本不是一次性消费，而是进入后续 regression
- [ ] 结构化 revision log 已记录为什么改、改了什么、预期改善什么

### 8. Promotion Discipline

- [ ] 自动化只负责 bounded candidate revision 或 compare，不直接替代人工 promotion
- [ ] 高风险改动有人工 gate
- [ ] 已保留 stable pinned version 或 fallback path

## Promotion Rule Of Thumb

只有同时满足下面四条，才适合 promote：

1. 目标失败样本确实改善
2. 已通过样本没有明显回退
3. 边界样本没有新增误触发
4. 安全 / destructive behavior 没有恶化

如果任一条不满足：

- reject candidate
- 或 fallback
- 或继续局部修订

## Current Practical Meaning For 04

在当前 round-1 状态下，这份 checklist 的作用是：

- 防止 `04` 又退化成 prompt 调优讨论
- 防止方法学栈继续散开
- 给后续 runner reopen 一个更稳的文档前置门槛
