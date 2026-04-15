# 04 / Skill Failure Taxonomy Draft

- `status`: `draft`
- `based_on`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-skill-forge-artifact-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-description-trigger-optimization.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_reference/04-skill-optimization-and-feedback-loops-evaluation-versioning-loop.md`

## 目的

这份草案用于把 skill 失败从“prompt 不够好”拆开，方便后续把失败样本定位到具体 artifact 层。

## Failure Classes

### 1. Trigger / Discoverability Failure

- 应触发但未触发
- 不应触发但误触发
- 描述过窄，真实任务语言未覆盖
- 描述过宽，导致 skill 被错误加载

### 2. Workflow Executability Failure

- agent 看到了 skill，但没有按步骤执行
- agent 跳过检查点或中间产物
- workflow 太长，被当作背景知识吸收
- 执行流程缺少 stop condition 或 handoff condition

### 3. Tool-Use Contract Failure

- 该调用工具时未调用
- 不该调用工具时调用
- 工具调用顺序错误
- 输出格式或 schema 不稳定
- 工具结果未正确影响下一步决策

### 4. Structural / Packaging Failure

- `SKILL.md`、scripts、references 的分层不清
- 支撑文件缺失或链接损坏
- README / description / actual capability 不一致
- 多平台安装路径或链接导致 shadowing / duplicate copy

### 5. Safety / Governance Failure

- skill 携带敏感文件或凭据风险
- 权限 / allowed tools 边界不清
- 第三方 skill 未经审查直接进入工作流
- critical issue 未能在发布前阻断

### 6. Versioning / Regression Failure

- 修改后没有代表性任务回归
- 新版本修复一个失败，同时引入另一个失败
- 没有 version pinning 或 fallback
- 已废弃 skill 仍被继续使用

### 7. Trajectory Regression Failure

- 最终答案看似正确，但中间步骤明显偏航
- 工具调用数量异常膨胀
- 工具调用顺序不符合 workflow 约束
- 工具参数与预期 schema 或语义不匹配
- agent 绕开了 skill 要求的关键检查点

### 8. Feedback Loop Failure

- 线上失败没有被记录为 trace
- 用户修正没有进入后续 eval dataset
- 人工审阅结果没有形成可复用标签
- offline regression 与 online monitoring 断开
- 同类失败反复出现但没有进入 failure taxonomy

## 使用方式

- 每个失败样本先归入一个主类。
- 如果跨类，优先记录最靠近根因的 artifact 层。
- 每次 skill 修订必须写明试图修复的 failure class。
- 回归测试应覆盖已知高频 failure class，而不是只覆盖 happy path。
