# 独立评估报告 · eval_4

**评估对象：规划自动化与工程复盘 skill**
- `/autoplan` (SKILL.md, version 1.0.0, preamble-tier: 3)
- `/retro` (SKILL.md, version 2.0.0, preamble-tier: 2)

**评估框架：**
- 结构化程度、可验证性、复用性、工具依赖、协作价值、可维护性、学习成本、落地门槛（1-5分）
- 六维总评（规则密度、认知增量、失败模式覆盖、独立可执行性、AI Agent 特异性、使用频率期望，1-10分）

---

## 一、`/autoplan` — 全自动 Review Pipeline

### 1.1 核心定位

`/autoplan` 是 plan-ceo-review + plan-design-review + plan-eng-review + plan-devex-review 四个 skill 的自动化编排器：

> "One command. Rough plan in, fully reviewed plan out. /autoplan reads the full CEO, design, eng, and DX review skill files from disk and follows them at full depth — same rigor, same sections, same methodology as running each skill manually. The only difference: intermediate AskUserQuestion calls are auto-decided using the 6 principles."

触发词是 "auto review"、"autoplan"、"run all reviews"、"make the decisions for me"。

---

### 1.2 核心设计：The 6 Decision Principles

这是 `/autoplan` 最核心的设计——用 6 条原则替代用户在中间步骤的判断：

1. **Choose completeness** — 选覆盖更多边界的方案
2. **Boil lakes** — 在 blast radius 内的修复全部自动批准（<5 个文件，无新基础设施）
3. **Pragmatic** — 两个方案都能解决问题时选更简洁的
4. **DRY** — 如果和已有功能重复，拒绝
5. **Explicit over clever** — 10 行明显的代码 > 200 行抽象
6. **Bias toward action** — 合并 > 反复 review > 停滞

不同 phase 有不同的优先级权重：
- CEO phase：P1（completeness）+ P2（boil lakes）主导
- Eng phase：P5（explicit）+ P3（pragmatic）主导
- Design phase：P5（explicit）+ P1（completeness）主导

---

### 1.3 Decision Classification（极重要的亮点）

`/autoplan` 把所有决策分为三类：

**Mechanical（机械决策）**
- 只有一个明显正确答案，静默自动决定。
- 例：是否跑 codex（总是 yes）、是否跑 evals（总是 yes）、已完整 plan 是否减范围（总是 no）。

**Taste（品味决策）**
- 合理的人可能有不同判断，自动决定但汇总到最终 gate。
- 三种来源：两个方案都可行（Close approaches）、模糊的 blast radius（Borderline scope）、codex 有不同建议（Codex disagreements）。

**User Challenge（用户挑战，绝不自动决定）**
- 两个模型都认为用户的方向需要改变时，必须停下来问。
- 这是定性上不同于 taste 决策的东西：当 Claude 和 Codex 都建议合并/拆分/添加/删除用户明确说要做的功能时，必须呈现给用户。
- 格式特别设计：
  - 用户说了什么（原始方向）
  - 两个模型建议什么（变更）
  - 为什么（模型的理由）
  - 我们可能缺什么上下文（明确承认盲点）
  - 如果我们错了，代价是什么

**这个三分法的价值在于：它明确了 AI 应该自主处理什么，不应该自主处理什么。"User Challenge"的设计体现了一种罕见的谦逊——AI 知道自己可能没有用户的业务上下文，不把自己的建议当成决定。**

---

### 1.4 Sequential Execution（强制顺序执行）

> "Phases MUST execute in strict order: CEO → Design → Eng → DX. Each phase MUST complete fully before the next begins. NEVER run phases in parallel — each builds on the previous."

每个 phase 之间有 transition summary 和输出验证。这是保证质量的关键——如果并行执行，后面的 review 就无法利用前面 review 的结论。

---

### 1.5 "Auto-Decide 不等于跳过分析"

这个说明非常重要：

> "Auto-decide replaces the USER'S judgment with the 6 principles. It does NOT replace the ANALYSIS. Every section in the loaded skill files must still be executed at the same depth as the interactive version."

也就是说，即使是 Mechanical 决策，分析过程仍然完整执行，只是不等用户回答。

---

### 1.6 亮点总结

| 亮点 | 描述 |
|------|------|
| 6 Decision Principles | 把 review 中间步骤的判断规则化 |
| 三类决策分类 | Mechanical/Taste/User Challenge 的分层，明确 AI 自主边界 |
| User Challenge 设计 | 两个模型都反对用户方向时，必须停，且呈现方式包含"我们可能错在哪里" |
| Sequential Execution | 严格顺序，每 phase 完整执行，不并行 |
| Auto-decide ≠ skip analysis | 即使自动决定，分析深度不减 |
| 最终 approval gate | 所有 taste decisions 汇总到最后，一次性呈现给用户审核 |

---

### 1.7 问题与局限

- **依赖 4 个 review skill 的完整文件**：`/autoplan` 从磁盘读取 CEO/design/eng/DX 的 SKILL.md，如果这些文件不存在或版本不匹配，整个流程会出问题。
- 6 个决策原则本身是 gstack 的哲学判断，不一定适合所有团队（比如"Boil lakes"在某些资源紧张的初创公司可能不是最优）。
- User Challenge 的触发依赖两个模型（Claude + Codex）的一致，如果 Codex 不可用，这个机制降级为单模型判断。

---

### 1.8 八维评分（autoplan，1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | 6原则明确，三分类清晰，sequential 强制，transition 验证 |
| 可验证性 | 4 | 每个自动决策有原则依据，taste decisions 汇总可见；但用户无法事后追溯为什么 AI 做了某个机械决策 |
| 复用性 | 3 | 6 个原则可借鉴，但实现高度绑定 gstack 4 个 review skill |
| 工具依赖 | 3 | 需要 4 个 review skill 文件在磁盘上，推荐 Codex（可选） |
| 协作价值 | 5 | approval gate + user challenge 设计，让 AI 自动化和人工决策有清晰边界 |
| 可维护性 | 4 | 原则稳定，但需要跟踪 4 个 review skill 的更新 |
| 学习成本 | 4 | 用户需要理解三分类和最终 gate 的工作方式 |
| 落地门槛 | 3 | 需要完整 gstack 生态 + Codex（推荐），但基本功能只需 Claude |

---

## 二、`/retro` — 周度工程复盘

### 2.1 核心定位

> "Weekly engineering retrospective. Analyzes commit history, work patterns, and code quality metrics with persistent history and trend tracking. Team-aware: breaks down per-person contributions with praise and growth areas."

v2.0.0，preamble-tier 是最低的 2（说明它的公共部分最精简，专注在核心功能上）。

触发词："weekly retro"、"what did we ship"、"engineering retrospective"，主动建议时机是"工作周末或 sprint 结束时"。

---

### 2.2 结构分析

**参数系统（设计完整）**

```
/retro              → 默认最近 7 天
/retro 24h          → 最近 24 小时
/retro 14d          → 最近 14 天
/retro 30d          → 最近 30 天
/retro compare      → 当前时段 vs 上一时段对比
/retro compare 14d  → 指定时间窗口对比
/retro global       → 跨项目 retro（扫描所有 AI 编码工具的使用）
/retro global 14d   → 跨项目 + 指定时间窗口
```

**Midnight-aligned windows（工程细节）**

> "For day (d) and week (w) units, compute an absolute start date at local midnight, not a relative string... Use `--since="2026-03-11T00:00:00"` — the explicit T00:00:00 suffix ensures git starts from midnight."

这个细节很多人不会想到：`--since="2026-03-11"` 在晚上 11 点运行时意味着"从 11 点开始"，而不是"从午夜开始"，会漏掉当天大部分的提交。

**数据收集（Step 1，12 个并行 git 命令）**

同时运行 12 个 git 命令：
1. 完整 commit 历史（with 统计）
2. 每个 commit 的 test vs production LOC 分解
3. commit 时间戳（用于 session 检测）
4. 文件变更热点分析
5. PR/MR 编号提取
6. 每个 author 的文件热点
7. 每个 author 的 commit 数量
8. Greptile triage 历史
9. TODOS.md 积压
10. 测试文件数量
11. 回归测试 commits
12. gstack skill 使用遥测

**Metrics Table（指标丰富）**

| Metric | Value |
|--------|-------|
| Commits to main | N |
| Contributors | N |
| Total insertions | N |
| Test LOC ratio | N% |
| Active days | N |
| Detected sessions | N |
| Avg LOC/session-hour | N |
| Greptile signal | N% |
| Test Health | N total tests · M added · K regression |

**Per-author leaderboard（团队感知）**

```
Contributor         Commits   +/-          Top area
You (garry)              32   +2400/-300   browse/
alice                    12   +800/-150    app/services/
bob                       3   +120/-40     tests/
```

- 当前运行者（git config user.name）显示为"You (name)"，永远排第一。
- 这个设计让 retro 对个人和团队都有直接价值。

**Global Retro 模式（亮点）**

`/retro global` 会跨项目扫描：
- `~/.claude/` 下的所有 gstack 项目
- gstack skill 使用日志（`~/.gstack/analytics/skill-usage.jsonl`）
- 产出"你在所有项目上用了哪些 skill，各花了多少时间"的报告

这个模式特别适合 solo developer 或 freelancer，可以跨项目看自己的工作模式。

---

### 2.3 亮点总结

| 亮点 | 描述 |
|------|------|
| 12 个并行 git 命令 | 一次性收集全面数据，不是逐步查询 |
| Midnight-aligned windows | 精确时间窗口，防止边界问题 |
| Test LOC ratio | 用 test/production LOC 比追踪测试习惯趋势 |
| Greptile signal rate | 追踪 AI review 工具的准确率（真阳性 vs 误报）|
| Per-author leaderboard | 团队感知，个人定向 |
| Global Retro | 跨项目的工程模式洞察 |
| Prior Learnings 复利 | 历史 learnings 影响 retro 分析质量 |

---

### 2.4 问题与局限

- 数据质量严重依赖 commit message 质量（"WIP"、"fix"、"update" 这类 commit 会降低分析质量）
- Test LOC ratio 是个粗糙指标，可以被轻易刷（写很多空测试）
- Greptile signal 只在用了 Greptile 的团队有价值，对没用的团队这一行是空的
- `compare` 模式的趋势线在 sprint 刚开始时可能会因为数据稀疏而产生误导

---

### 2.5 八维评分（retro，1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 4 | 参数系统完整，指标定义清晰，步骤有序 |
| 可验证性 | 4 | 所有指标都来自 git 历史，可验证；但 session 检测是启发式的 |
| 复用性 | 4 | 核心 git 分析逻辑可迁移，但 global retro 和 learnings 集成绑定 gstack |
| 工具依赖 | 3 | 主要依赖 git + learnings binary；global retro 依赖 gstack analytics |
| 协作价值 | 5 | 团队 retro 场景价值高；per-author breakdown + learnings 应用 |
| 可维护性 | 4 | 核心 git 命令稳定，指标不依赖外部 API |
| 学习成本 | 2 | 参数简单，输出直观，是 gstack 中学习成本最低的 skill 之一 |
| 落地门槛 | 3 | 基本功能只需 git 和 gstack；global retro 和 learnings 需要完整 gstack 生态 |

---

## 三、两个 skill 在研发工作流中的位置

```
[/autoplan] — 编码前：一键完成 CEO + Design + Eng + DX 四层 plan review
     ↓
     编码
     ↓
[/review] — 编码后：pre-landing 代码 review
     ↓
[/ship]
     ↓
[每周末]
     ↓
[/retro] — 回顾本周：git 分析 + 指标 + 团队 breakdown + learnings 应用
```

`/autoplan` 服务于"这个方向对不对、这个计划可不可以"，在编码开始前。`/retro` 服务于"这周我们实际做了什么、模式是什么"，在一个工作周期结束后。两者都是工程学习系统的一部分，前者预防，后者复盘。

---

## 四、六维总评（1-10分）

以 autoplan + retro 整体评估

| 维度 | 分数 | 简评 |
|------|------|------|
| 规则密度 | 9 | Decision Principles + 三分类 + Sequential 规则（autoplan）；Midnight alignment + 数据收集规则 + Greptile signal 计算（retro）——规则密度都很高 |
| 认知增量 | 9 | autoplan 的 User Challenge 设计（AI 知道自己可能错的场景）、6 principles 规则化 review 决策、retro 的 session 检测和 global retro 模式——都有明确的认知增量 |
| 失败模式覆盖 | 8 | autoplan 覆盖"AI 过度自主"（User Challenge gate）、"分析被跳过"（auto-decide ≠ skip analysis）；retro 覆盖时间窗口边界问题（midnight alignment）；但两者对某些失败模式（比如 autoplan 的 Codex 不可用降级）处理不够明确 |
| 独立可执行性 | 6 | autoplan 强依赖 4 个 review skill 文件；retro 基础功能可独立运行，global retro 依赖 gstack analytics |
| AI Agent 特异性 | 9 | User Challenge（AI 承认自己可能没有用户业务上下文）、auto-decide ≠ skip analysis（AI 保持分析质量即使不等人回答）、session detection（识别 AI coding session 边界）——都是专门针对 AI agent 场景的设计 |
| 使用频率期望 | 8 | autoplan 在每次有新 plan 时运行；retro 每周一次——两者都是高频但不是超高频 |

**六维总分：9+9+8+6+9+8 = 49**
**平均分：49/6 ≈ 8.17**
**百分制：81.7/100**
**评级：A**

---

## 五、一句话总评

**`/autoplan` 解决的核心问题是"AI 在 plan review 中间步骤不应该一直问用户"，它通过 6 个原则 + 三分决策分类 + User Challenge 机制，在"自动化效率"和"人工控制权"之间找到了一个可辩护的平衡点；`/retro` 则把"这周的工程数据"转化成了有 team 感知、有趋势的洞察——两个 skill 共同构成了 gstack 工程学习系统的骨架。**
