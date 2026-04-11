# Wave 2 Combination Baseline Workflow Draft

- `status`: `in_progress`
- `purpose`: `把当前最强的“组合式 baseline”从抽象判断推进成可执行 workflow。`
- `basis`:
  - `01 / 02 / 03 evidence summary`
  - `W2-cross-topic-synthesis.md`
  - `W2-candidate-scorecard-draft.md`
- `warning`: `这是当前最小可行 workflow，不是最终定稿，也不是唯一正确路径。`

## 设计原则

- 先围绕 `portable core` 写，再逐步接 surface-specific 扩展。
- 先把 skill 当作 code-like asset 管，再把它当作内容资产分发。
- 先小范围、可回滚地试用，再考虑放大 skill 数量与覆盖范围。
- 把 `learning`, `install`, `governance`, `evaluation` 明确拆层，避免让任一单个对象被误当全链路答案。

## 当前最小可行组合

- `sample-library`
  - 候选对象：`vercel-labs/agent-skills`
- `install / distribution layer`
  - 候选对象：`vercel-labs/skills`
- `governance / publish layer`
  - 候选对象：`skill-forge`
- `discovery / learning inputs`
  - 候选对象：`skills.sh`, `github/awesome-copilot`

## 建议 workflow

### Step 1. 先从现成样板开始，不从空白文档起步

- 目标：
  - 降低冷启动成本
  - 先理解真实 skill 的目录结构、触发写法和 supporting files 组织方式
- 输入层：
  - `skills.sh`
  - `github/awesome-copilot`
  - `vercel-labs/agent-skills`
- 约束：
  - 这一阶段的重点是学习，不是直接部署

### Step 2. 用 portable core 起草自己的 skill skeleton

- 最小共同层优先包括:
  - `SKILL.md`
  - `name`
  - `description`
  - progressive disclosure
  - supporting files on demand
- 暂不默认把下列对象写进 baseline:
  - `allowed-tools`
  - surface-specific hooks
  - 运行时特定容器假设

### Step 3. 为扩展字段单独写 compatibility note

- 如果需要使用 surface-specific frontmatter 或执行语义:
  - 明确标注适用 surface
  - 标注不支持时的退化行为
  - 不把它误写成通用 skill 事实标准
- 目标：
  - 把 `portable core` 与 `surface extensions` 分离

### Step 4. 用 installer / manager 放进受控 scope

- 优先使用:
  - project scope
  - 小规模、可回滚的 install path
- 候选对象：
  - `vercel-labs/skills`
- 原则：
  - 先 controlled trial
  - 再考虑更广泛共享

### Step 5. 在 install 之后立刻走 trust gate

- 最低要求：
  - 读 `SKILL.md`
  - 读 `scripts/`
  - 读 `references/` 中实际会进上下文的高风险内容
  - 检查是否出现权限越界、命令执行、隐藏 contamination、复制拼接痕迹
- 候选对象：
  - `skill-forge`
  - 手工审查
- 原则：
  - installer 不替代安全判断
  - 目录信号不替代来源判断

### Step 6. 对代表性任务做 with / without A-B evaluation

- 至少准备:
  - 一组没有该 skill 的基线任务
  - 一组加载该 skill 的对照任务
- 比较点：
  - 是否真有帮助
  - 是否引入模板污染、API hallucination、错误约定传播
  - 是否因为 version / context mismatch 反而变差
- 原则：
  - validation pass 不等于有效
  - 可发现不等于可用

### Step 7. 为 skill 建立 version pinning 与 rollback 节奏

- 最低要求：
  - 给 skill 版本或快照
  - 记录最近验证通过的版本
  - 更新失败时可快速回退
- 原则：
  - 不把“最新 skill”默认视为“最好 skill”
  - 不把公开生态变更直接推入生产 workflow

### Step 8. 只按 role / task bundle 暴露 skills

- 目的：
  - 降低 recall overload
  - 避免激活过多 skills 导致错误选择
- 原则：
  - 从具体、role-based bundles 开始
  - 不做“全量技能库默认激活”

### Step 9. 定期做 clone / quality / retirement 清理

- 关注点：
  - 是否已被更优版本 supersede
  - 是否只是复制别人的 skill 但没保留 provenance
  - 是否 reference files 膨胀上下文但不提供新信息
- 目标：
  - 防止 library 膨胀
  - 防止历史 skill 长期拖累选择与上下文窗口

## 当前最不该犯的错误

- 把 `skills.sh` 当成质量背书系统。
- 把 `vercel-labs/skills` 当成 evaluation / trust 系统。
- 把 `vercel-labs/agent-skills` 当成全链路工程基座。
- 因为“现成 skill 很容易找到”就跳过来源审查和任务验证。
- 在没有 role-based bundling 的前提下，把大量 skills 同时暴露给 agent。

## 当前 workflow 结论

- 这条 baseline 最重要的特征，不是“工具多”，而是职责拆分清楚。
- 当前更像现实答案的是：
  - `借鉴现成 skill` 用来加速学习
  - `installer / manager` 用来受控装载
  - `governance` 用来过质量与信任门槛
  - `evaluation + versioning` 用来防止错误扩散
- 如果后续要给最终 workflow 建议，这份 draft 已经足够作为骨架继续深化。
