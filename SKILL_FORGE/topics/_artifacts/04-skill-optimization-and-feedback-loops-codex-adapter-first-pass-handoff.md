# 04 / Codex Adapter First-Pass Handoff

- `status`: `ready_for_implementation_handoff`
- `purpose`: `在不改代码的前提下，把第一个真实 Codex adapter 的实现边界、输入输出、阶段顺序和验收口径固定下来，降低后续接手歧义。`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-json-comparison-output-spec.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`

## Why Codex First

把 Codex 作为第一个真实 adapter，不是因为它天然更强，而是因为当前本地条件更成熟：

- 已有 `codex exec --json` 方向的本地参考
- 已有 temp `HOME` + `.codex/skills/{name}/SKILL.md` 的可迁移安装思路
- 已有 `gstack` 本地 eval harness 证据可借用

因此它是最适合作为 first real adapter 的实现对象。

## First-Pass Scope

第一版 Codex adapter 只需要回答一件事：

> 能否把一个本地 skill case 跑成 normalized run record，并进入同一套 compare / promotion decision 语义？

第一版不要求：

- 自动优化 skill
- 覆盖全部 surface 特性
- 处理所有 Codex 事件变体
- 引入 semantic judge

## Assumed Inputs

第一版默认输入：

- 一个本地 skill path
- 一个 case pack entry
- `run_kind = baseline` 或 `candidate`
- 一个干净、可控的执行目录

第一版默认不扩 scope 到：

- 多 skill 自动发现
- 并发执行
- 远程环境状态恢复

## Proposed Execution Shape

### 1. Install Surface

- 在临时 `HOME` 下准备 `.codex/skills/{skill_name}/SKILL.md`
- 保证 skill 安装是 case-scoped 或 run-scoped，而不是污染全局环境
- 若 skill 依赖 supporting files，应明确复制策略或符号链接策略

### 2. Invoke Surface

- 通过 `codex exec --json` 或等价 JSON 事件流执行
- 保留原始 trace 文件路径，供后续 compare / debug / handoff 回读

### 3. Normalize Output

至少归一化为：

- `case_id`
- `adapter = codex`
- `run_kind`
- `selected_skill`
- `triggered`
- `intermediate_steps`
- `tool_calls`
- `final_output`
- `errors`
- `cost_usd`
- `latency_ms`
- `step_count`
- `raw_trace_path`

最终 shape 以 `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md` 为准。

## Open Questions To Resolve In Implementation

这些问题在实现时必须显式回答，不能靠默认脑补：

- `selected_skill` 是显式事件、trace 推断，还是 output 近似推断
- `triggered` 的判定边界是什么
- `tool_calls` 是否能稳定抽出 name + args
- reasoning / stderr / command execution 记录，哪些进入 normalized run，哪些只放 raw trace
- skill supporting files 如何随 temp `HOME` 一起安装
- run timeout、non-zero exit、partial trace 时如何保留 failure evidence

## First Acceptance Run

第一轮真实 adapter 不需要覆盖全部 local case pack。

最小验收建议：

- 先跑 `review-no-trigger-001`
- 再跑 `review-output-001`
- 若两者稳定，再补 `ship-safety-001`

理由：

- `review-no-trigger-001` 能先验证 false positive boundary
- `review-output-001` 能验证 findings-first / severity / file-line / testing-gap 类 output contract
- `ship-safety-001` 风险最高，适合在前两类稳定后再进入

## Promote / Suspend Rule

若第一版 Codex adapter 只能做到“可跑但字段不稳定”，应：

- 保留 raw trace
- 写明哪些字段已稳定，哪些字段暂为近似
- 明确是否还能进入 compare

若它连最小 normalized run 都无法稳定产出，则应：

- 暂不假装打通真实 adapter
- 在状态文件里继续保持 `real Codex adapter execution = suspended`
- 把 blocker 写成具体字段或事件缺口，而不是泛写成“还不稳定”

## Handoff Checklist

真正开始实现前，接手者至少应先读：

- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-agent-adapter-contract.md`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-runner-prototype-spec.md`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/04-skill-optimization-and-feedback-loops-json-comparison-output-spec.md`
- `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-local-gstack-eval-harness.md`

接手者开始实现时，至少应产出：

- 一个最小 Codex adapter design note 或 executable draft
- 一份真实 baseline / candidate run 保存位置说明
- 一条是否已满足 compare prerequisites 的明确判断
