# Independent Benchmark On Public Skill Effectiveness

- `source_url`: `https://arxiv.org/abs/2603.15401`
- `source_type`: `independent-research`
- `accessed_at`: `2026-04-11`
- `related_topic`: `03-ecosystem-signals-and-adoption`
- `trust_level`: `independent`
- `why_it_matters`: `这份独立研究最关键的价值是打破一个容易被 adoption signal 掩盖的错觉: public skills 很多，不等于 public skills 普遍有效。`
- `claims_supported`:
  - 外部 skill 的有效性分布非常不均匀
  - availability / discoverability 不能替代 task-level evaluation
  - version mismatch 与 context mismatch 可能让 skill 产生负效果

## 关键事实

- 论文评测对象覆盖:
  - `49` 个公开 SWE skills
  - `565` 个 task instances
  - `6` 个 software engineering subdomains
- 结果并不乐观:
  - `39 / 49` 没有观察到有效提升
  - 平均增益只有 `+1.2%`
  - 只有 `7` 个出现显著正向效果
  - `3` 个出现负效果
- 论文把负效果的重要原因指向:
  - version mismatch
  - context mismatch
- 这意味着“找到一个 skill 并装上”与“它能稳定帮助你的任务”之间，仍然有一整段必须自己验证的距离。

## 与本研究的关系

- 对 `03` 来说，这份研究让 adoption judgement 必须再多一层:
  - `有人在分享`
  - 不等于
  - `对我的任务有效`
- 这并不否定借鉴现成 skill 的学习价值，反而更支持我们当前的成长口径:
  - 先借鉴
  - 再实验
  - 再沉淀
- 它也说明最终推荐不能只给“哪里最热闹”，还要给“哪些对象更值得拿来做有控制的试验”。

## 风险与局限

- 这份基准聚焦 SWE 任务，不应直接外推到全部非 SWE 场景。
- 它提供的是总体分布，不负责替我们评估某个具体 skill 在特定仓库和任务上的真实效果。
