# Skills Versus `AGENTS.md` Boundary

- `source_url`: `https://vercel.com/kb/guide/agent-skills-creating-installing-and-sharing-reusable-agent-context`
- `source_type`: `official-guide`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `official`
- `why_it_matters`: `如果不先拆清楚 skills 和 `AGENTS.md` 的职责边界，toolchain 分析很容易把 repo-level guidance 和 skill package 混成一类。`
- `claims_supported`:
  - skills 负责按需加载的 reusable context
  - `AGENTS.md` 更接近 repo-level、always-on 指导
  - `description` 与 trigger 逻辑是 skill package 层的重要接口，而不是 `AGENTS.md` 的职责

## 关键事实

- Vercel KB 明确把 `Skills vs AGENTS.md` 单列为判断项。
- 同一篇 guide 还强调:
  - `Progressive disclosure`
  - `description is the trigger`
- 这意味着 skills 在 lifecycle 中承担的是按需触发、任务粒度复用，而不是全局仓库约束。

## 与本研究的关系

- 对 `02` 来说，这份材料非常关键，因为它把两个经常被混淆的对象拆开了:
  - repo-level guidance
  - packaged reusable skill
- 一旦这个边界固定，后续 installer、sample library、runtime bridge、audit pipeline 的定位也会更清楚。

## 风险与局限

- 这份材料主要来自一套实践 guide，而不是正式标准文本。
- 它更适合帮助我们区分对象边界，不足以单独证明所有生态都遵循同样习惯。
