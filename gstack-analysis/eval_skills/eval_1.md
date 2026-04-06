# 独立评估报告 · eval_1

**评估对象：代码质量与工程 Review 类 skill**
- `/review` (SKILL.md, version 1.0.0, preamble-tier: 4)
- `/plan-eng-review` (SKILL.md, version 1.0.0, preamble-tier: 3)

**评估框架：**
- 结构化程度、可验证性、复用性、工具依赖、协作价值、可维护性、学习成本、落地门槛（1-5分）
- 六维总评（规则密度、认知增量、失败模式覆盖、独立可执行性、AI Agent 特异性、使用频率期望，1-10分）

---

## 一、`/review` — Pre-Landing PR Review

### 1.1 核心定位

这是一个 **pre-landing 代码审查 skill**，定位非常清晰：
> "Analyzes diff against the base branch for SQL safety, LLM trust boundary violations, conditional side effects, and other structural issues."

触发词是 "review this PR"、"code review"、"check my diff"，并支持当用户即将 merge 时主动建议。

---

### 1.2 结构分析

`/review` 的工作流包含以下关键步骤：

**Step 0：平台检测 + base branch 推断**
- 支持 GitHub / GitLab / 纯 git fallback，三级降级。
- 这是一个很工程化的细节——大多数 review skill 直接假定 `main`，而这里用 `gh pr view` 或 `glab mr view` 动态获取，对 monorepo 和多分支团队价值很高。

**Step 1：branch 检查**
- 如果在 base branch 上直接停止，输出明确的中止消息。

**Step 1.5：Scope Drift Detection（亮点）**
- 读取 TODOS.md、PR description、commit messages，推断 stated intent。
- 把 diff 的实际改动对比 stated intent，识别两类问题：
  - **SCOPE CREEP**：与 stated intent 无关的文件/功能
  - **MISSING REQUIREMENTS**：TODOS/PR 里有但 diff 里没有
- 输出格式化的 Scope Check 报告：`CLEAN / DRIFT DETECTED / REQUIREMENTS MISSING`
- 这个 step 非常有价值，很多团队的 AI review 工具根本不做 scope drift 检测，这是一个认知增量明显的设计。

**Plan File Discovery + Plan Completion Audit（核心亮点）**
- 主动搜索 plan file（通过 branch 名、repo 名匹配），对比 plan 里的 actionable items 与实际 diff。
- 每个 item 标注 `DONE / PARTIAL / NOT DONE / CHANGED`，并给出证据（具体文件行数）。
- 对 PARTIAL/NOT DONE 的 item 深入追查原因：scope cut / context exhaustion / misunderstood requirement / blocked by dependency / genuinely forgotten。
- HIGH impact discrepancy 触发 AskUserQuestion。
- **这是一套完整的 plan delivery 追溯系统，工程价值极高。**

**Confidence Calibration（亮点）**
- 每个 finding 必须标注 confidence (1-10)，并有明确的展示规则：
  - 9-10：直接显示
  - 7-8：正常显示
  - 5-6：加 caveat
  - 3-4：仅放附录
  - 1-2：仅 P0 才报
- finding 格式：`[SEVERITY] (confidence: N/10) file:line — description`
- 如果低 confidence 的 finding 后来被用户证实是 bug，触发 calibration learning 写入。

**Review Sections（4层）**
1. Architecture review（架构 + 依赖图 + 安全边界 + production failure 场景）
2. Code quality review（DRY 违规 + 错误处理 + 技术债 + ASCII 图是否过时）
3. Test review（100% coverage 目标 + 测试框架检测 + 用例分析）
4. Performance review（N+1、缓存、索引、内存）

每一节都有 **STOP** 点，强制一次一个 issue，不允许批量 AskUserQuestion。

---

### 1.3 亮点总结

| 亮点 | 描述 |
|------|------|
| Scope Drift Detection | 把 review 前置到"交付的是不是用户想要的" |
| Plan Completion Audit | diff 与 plan 的交叉对比，追溯交付差距 |
| Confidence Calibration | 每条 finding 标信心度，低信心条件展示 |
| 平台感知 | 自动识别 GitHub / GitLab / git-native，三级降级 |
| STOP 规则 | 一次一个问题，防止 AI 批量轰炸用户 |
| Learnings 写入 | 发现的 plan delivery gap 写入持久记忆 |

---

### 1.4 问题与局限

- **文件极长（约 700+ 行专属内容）**，初次阅读成本较高，很多行为分布在不同位置。
- Plan Completion Audit 的质量高度依赖 plan file 格式规范，如果团队不用 gstack 的 plan 格式，这个能力基本失效。
- Scope Drift 的 "stated intent" 推断如果 commit messages 很差（如 "WIP"、"fix"），精度会大幅下降。

---

### 1.5 八维评分（1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | 每个 step 边界清晰，格式标准，STOP 点明确 |
| 可验证性 | 5 | confidence scoring + evidence 要求 + plan audit，所有 finding 都要有来源 |
| 复用性 | 4 | Plan Completion Audit 可复用，但和 gstack plan 格式绑定 |
| 工具依赖 | 3 | 依赖 gh/glab CLI、learnings binary、telemetry binary |
| 协作价值 | 5 | STOP 规则 + scope drift + plan audit，显著提升协作质量 |
| 可维护性 | 4 | 模板生成，但文件长度会带来维护难度 |
| 学习成本 | 3 | 流程复杂，需要理解 step 依赖关系 |
| 落地门槛 | 3 | 需要 gstack 生态，低配置时 Plan Audit 失效 |

---

## 二、`/plan-eng-review` — Engineering Plan Review

### 2.1 核心定位

这是一个 **架构规划阶段的 review skill**，在开始写代码之前使用：
> "Eng manager-mode plan review. Lock in the execution plan — architecture, data flow, diagrams, edge cases, test coverage, performance."

触发词：「review the architecture」「engineering review」「lock in the plan」。
依赖 `/office-hours` 产出的 design doc 效果更好（benefits-from 字段）。

---

### 2.2 结构分析

**核心哲学框架（亮点）**

这是这个 skill 最突出的地方——它不只是"看看计划"，而是把 15 个"优秀 Eng Manager 认知模式"直接编码进了流程：

> 1. State diagnosis（团队状态诊断）
> 2. Blast radius instinct（最坏情况 + 影响范围评估）
> 3. Boring by default（创新 token 意识）
> 4. Incremental over revolutionary（strangler fig, not big bang）
> 5. Systems over heroes（为 3am 疲惫的人类设计，不是为最好的工程师）
> 6. Reversibility preference（feature flags, A/B test, canary rollout）
> 7. Failure is information（blameless postmortem, error budget）
> 8. Org structure IS architecture（Conway's Law）
> 9. DX is product quality（CI/CD 速度是软件质量的领先指标）
> 10. Essential vs accidental complexity（Brooks: No Silver Bullet）
> 11. Two-week smell test（两周内新人能 ship feature 吗？）
> 12. Glue work awareness（不让人只做粘合工作）
> 13. Make the change easy, then make the easy change（重构先于实现）
> 14. Own your code in production（Dev + Ops 合一）
> 15. Error budgets over uptime targets（99.9% uptime = 0.1% downtime budget to spend）

这些不是装饰，而是在 Architecture review、Code quality review、Test review、Performance review 四个 section 里实际调用的判断框架。

**Step 0: Scope Challenge（亮点）**

在任何内容 review 之前，先做 6 个范围挑战：
1. 已有代码能否解决子问题？（避免重复建轮子）
2. 最小变更集是什么？（ruthlessly flag scope creep）
3. 复杂度嗅探（8+ files 或 2+ 新 class/service 视为 smell）
4. WebSearch 检查（框架有没有内置，当前最佳实践）
5. TODOS 交叉引用（有没有 deferred item 被阻塞或可打包）
6. 完整性检查（plan 是完整版还是快捷方式？用 AI 之后完整性应该接近免费）
7. 分发检查（新的 binary/library/container 有没有 CI/CD pipeline？）

这个 Step 0 是一个**主动阻断过度设计**的机制，在大多数 AI review 工具里看不到这种反向检查。

**设计文档集成**
- 先检查是否有 design doc，如果没有，主动提议运行 `/office-hours`。
- 如果有 design doc，把它作为问题定义、约束和方案选择的 source of truth。

**Review Sections（与 /review 对应的 plan 版）**
1. Architecture review（含 distribution pipeline 检查）
2. Code quality review（含 ASCII 图维护检查）
3. Test review（100% coverage，含测试框架检测、覆盖率分析）
4. Performance review

STOP 规则同 `/review`：一次一个 issue，不批量。

**Prior Learnings 集成**
- 搜索跨项目 learnings，如果 review finding 匹配历史 learning，展示 `"Prior learning applied: [key]"`。
- 这个设计让 review 的质量会随时间复利增长。

---

### 2.3 亮点总结

| 亮点 | 描述 |
|------|------|
| 15 个 Eng Manager 认知模式 | 把资深 EM 的判断模式显性化为可执行规则 |
| Step 0 Scope Challenge | 主动阻断过度设计，7 个维度 |
| 分发检查 | 检查新 binary 是否有 CI/CD pipeline，防止"代码写了没人能用" |
| Boring by Default | innovation token 概念，评估是否值得引入新技术 |
| Prior Learnings 复利 | 历史 review 发现会影响当前 review 的质量 |
| 与 office-hours 联动 | 缺少 design doc 时主动触发上游 skill |

---

### 2.4 问题与局限

- **最重的 preamble-tier=3**，说明它比 `/review` 的通用 preamble 更重，理解成本更高。
- 15 个认知模式虽然设计精良，但如果 agent 不能真正理解这些模式背后的第一性原理（比如 error budget 的含义），很可能只是形式上的 checklist。
- 依赖 `/office-hours` 产出的 design doc，如果 team 不使用这个上游 skill，很多判断的上下文会缺失。

---

### 2.5 八维评分（1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | 认知模式 + Step 0 + 四层 review + STOP 规则，结构极为严密 |
| 可验证性 | 4 | 每个 finding 有来源，但 plan 阶段比 diff 阶段更难做确定性验证 |
| 复用性 | 4 | 认知模式是高复用的，但 design doc 集成绑定 gstack 生态 |
| 工具依赖 | 3 | WebSearch（可选）+ learnings binary + office-hours（推荐依赖） |
| 协作价值 | 5 | EM 认知模式 + scope challenge + "系统过英雄" 原则，对团队工程文化很有价值 |
| 可维护性 | 4 | 模板生成，认知模式相对稳定 |
| 学习成本 | 4 | 认知模式需要用户有一定 EM 经验才能充分理解 |
| 落地门槛 | 3 | 效果最佳时依赖 office-hours + learnings 系统，对轻量用户有门槛 |

---

## 三、两个 skill 的关系与流程位置

```
[office-hours] → 产生 design doc
      ↓
[plan-eng-review] → 锁定架构，输出 plan 完成
      ↓
      ↓ (开始编码)
      ↓
[review] → pre-landing PR review，对比 diff 与 plan
      ↓
[ship] → 发布
```

两个 skill 是同一条工程链路上的前后两段。`plan-eng-review` 在开始编码前锁定架构，`review` 在完成编码后验证交付与计划的一致性。两者形成了一个闭环：计划 → 执行 → 验证。

---

## 四、六维总评（1-10分）

评估对象：`/review` + `/plan-eng-review` 作为"代码质量与工程 Review 系统"整体

| 维度 | 分数 | 简评 |
|------|------|------|
| 规则密度 | 10 | 显性规则极多：confidence scoring、STOP 规则、15个认知模式、scope challenge 7项、plan audit 4状态，每个细节都有明确规则 |
| 认知增量 | 9 | Scope Drift Detection、Plan Completion Audit、Confidence Calibration、EM 认知模式，都是超越"帮你看看代码"的东西；唯一拖分项是这些能力强依赖 gstack 生态 |
| 失败模式覆盖 | 9 | 覆盖 scope creep、delivery gap、confidence misalignment、over-engineering、missing distribution pipeline；对 plan 与 diff 的不一致有专门追溯机制 |
| 独立可执行性 | 7 | `/review` 在简单场景下可独立运行；Plan Completion Audit 和 Learnings 功能需要 gstack 生态 |
| AI Agent 特异性 | 9 | confidence calibration、STOP 规则、learnings 复利、spawned session 模式，都是专门针对 AI agent 弱点的设计 |
| 使用频率期望 | 9 | `/review` 应该在每次 PR 前运行，`/plan-eng-review` 应该在每次架构决策前运行；两者都是高频 skill |

**六维总分：10+9+9+7+9+9 = 53**
**平均分：53/6 ≈ 8.83**
**百分制：88.3/100**
**评级：A+**

---

## 五、一句话总评

**`/review` + `/plan-eng-review` 组合构建了一套从计划到交付的双层验证机制：前者把 15 个 EM 认知模式编码成可执行的架构检查，后者把"是否交付了用户想要的"这个最容易被忽略的问题做成了可追溯的系统——这不是普通的 AI code review，而是一个能学习、能追溯、能复利的工程质量系统。**
