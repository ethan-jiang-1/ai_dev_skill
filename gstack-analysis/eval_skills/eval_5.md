# 独立评估报告 · eval_5

**评估对象：性能基准与代码审查子模块**
- `/benchmark` (SKILL.md，性能回归检测)
- `review/specialists/` (7个专家 Checklist：security, performance, testing, maintainability, api-contract, data-migration, red-team)

**评估框架：**
- 结构化程度、可验证性、复用性、工具依赖、协作价值、可维护性、学习成本、落地门槛（1-5分）
- 六维总评（规则密度、认知增量、失败模式覆盖、独立可执行性、AI Agent 特异性、使用频率期望，1-10分）

---

## 一、`/benchmark` — 性能回归检测

### 1.1 核心定位

`/benchmark` 是一个**性能指标追踪 skill**，专门用于检测 web app 的性能回归：

> "Performance regression detection for web applications. Captures real performance metrics, compares against baselines, and identifies regressions before they ship."

它不是 profiler，不是 load testing 工具，而是**基线对比工具**——在某个"已知良好"的状态下捕获基线，之后每次 commit 与基线对比。

---

### 1.2 结构分析

**Phase 架构（8个阶段）**

```
Phase 1: Setup            → 参数解析，browse binary 检测
Phase 2: URL/baseline 解析 → 确定测试对象和基线
Phase 3: 性能数据收集      → 使用 browse binary 捕获真实指标
Phase 4: 结构化 JSON 输出  → 标准化格式存储
Phase 5: Comparison       → 与基线对比，标注回归
Phase 6: 最慢资源分析     → Top 10 最慢资源 + 建议
Phase 7: Performance Budget Check → 与行业标准对比
Phase 8: Trend Analysis   → 历史趋势（--trend 模式）
```

**实际捕获的指标（全量）**

使用 `window.performance.getEntriesByType()` + `window.performance.timing` 采集：

```json
{
  "ttfb_ms": 120,
  "fcp_ms": 450,
  "lcp_ms": 800,
  "dom_interactive_ms": 600,
  "dom_complete_ms": 1200,
  "full_load_ms": 1400,
  "total_requests": 42,
  "total_transfer_bytes": 1250000,
  "js_bundle_bytes": 450000,
  "css_bundle_bytes": 85000,
  "largest_resources": [...]
}
```

这是真实浏览器性能数据，不是估算。

**Regression Report（输出格式，亮点）**

```
PERFORMANCE REPORT — [url]
══════════════════════════
Page: /
─────────────────────────────────────────────────────
Metric              Baseline    Current     Delta    Status
────────            ────────    ───────     ─────    ──────
TTFB                120ms       135ms       +15ms    OK
LCP                 800ms       1600ms      +800ms   REGRESSION
JS Bundle           450KB       720KB       +270KB   REGRESSION

REGRESSIONS DETECTED: 3
  [1] LCP doubled (800ms → 1600ms) — likely a large new image or blocking resource
  [2] JS bundle +60% (450KB → 720KB) — new dependency or missing tree-shaking
```

**Regression Thresholds（明确的判断标准）**

| Metric | REGRESSION | WARNING |
|--------|-----------|---------|
| 时间指标 | >50% 增加 OR >500ms 绝对增加 | >20% 增加 |
| Bundle size | >25% 增加 | >10% 增加 |
| Request count | N/A | >30% 增加 |

这些阈值是 hard-coded 的，不能根据项目自定义——这是一个可以改进的地方。

**Trend Analysis（--trend 模式，亮点）**

```
PERFORMANCE TRENDS (last 5 benchmarks)
══════════════════════════════════════
Date        FCP     LCP     Bundle    Requests    Grade
2026-03-10  420ms   750ms   380KB     38          A
2026-03-18  480ms   1600ms  720KB     58          B

TREND: Performance degrading. LCP doubled in 8 days.
       JS bundle growing 50KB/week. Investigate.
```

这是一个时间维度的视角——不只是"现在比基线差了多少"，而是"最近几次 benchmark 的变化趋势是什么"。

**核心设计原则（重要）**

> - **Measure, don't guess.** 使用真实 performance.getEntries() 数据，不是估算
> - **Baseline is essential.** 没有基线只能报绝对数字，无法检测回归
> - **Relative thresholds, not absolute.** 2000ms 对复杂 dashboard 可以接受，对 landing page 就不行
> - **Bundle size is the leading indicator.** Load time 随网络变化，bundle size 是确定性的，是追踪的主要指标
> - **Read-only.** 只产出报告，不修改代码

---

### 1.3 亮点总结

| 亮点 | 描述 |
|------|------|
| 真实浏览器数据 | performance.getEntries() 而非估算 |
| 明确回归阈值 | 时间/bundle size 的 REGRESSION/WARNING/OK 三档 |
| Trend Analysis | 历史趋势，不只是单次对比 |
| 第三方资源标注 | 标注 analytics.js 等第三方但聚焦 first-party 建议 |
| Performance Budget | 与行业标准对比，给出 A-F 评级 |
| Read-only 原则 | 严格保持观察者角色，不自动修改代码 |

---

### 1.4 问题与局限

- **强依赖 browse binary**（Playwright），同 `/qa`
- **无法做 server-side 性能测试**（数据库查询时间、API 响应时间），只针对 web app 前端指标
- **Regression thresholds 不可配置**，不同类型 app 的合理阈值差别很大
- **第一次运行需要 `--baseline`**，很多用户会忘记先跑基线就直接跑 benchmark

---

### 1.5 八维评分（benchmark，1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | 8个 Phase，报告格式标准，阈值明确 |
| 可验证性 | 5 | 所有数据来自真实浏览器 API，有 JSON 存档，可重复查阅 |
| 复用性 | 4 | 报告格式和 Phase 架构可借鉴，但 browse binary 依赖难复用 |
| 工具依赖 | 2 | 强依赖 browse binary + 运行中的 web app |
| 协作价值 | 4 | 可以把 benchmark 纳入 CI/CD 自动检测，防止性能回归上 main |
| 可维护性 | 4 | 阈值写死是维护隐患，但整体框架稳定 |
| 学习成本 | 3 | `--baseline` 的使用顺序不直觉，需要文档 |
| 落地门槛 | 2 | 需要 browse binary + web app 运行时，同 `/qa` |

---

## 二、`review/specialists/` — 专家 Checklist 子模块

### 2.1 核心定位

这是 `/review` skill 调用的 7 个专家子模块，每个专家聚焦一个审查维度：

| 专家 | 触发范围 | 审查重点 |
|------|---------|---------|
| `security.md` | `SCOPE_AUTH=true` 或 backend diff > 100 行 | 注入、Auth bypass、密码学误用、XSS、反序列化 |
| `performance.md` | `SCOPE_BACKEND=true` 或 `SCOPE_FRONTEND=true` | N+1、索引缺失、算法复杂度、Bundle size、渲染性能 |
| `testing.md` | 所有 diff | 覆盖率、测试质量、边界用例、回归测试 |
| `maintainability.md` | 所有 diff | DRY 违规、命名、模块边界、注释 |
| `api-contract.md` | API endpoint 变更 | 向后兼容性、版本策略、文档同步 |
| `data-migration.md` | 数据库 schema 变更 | 迁移安全、回滚、数据完整性 |
| `red-team.md` | 所有 diff | 主动寻找可被恶意用户利用的假设 |

---

### 2.2 设计模式分析

**标准化 JSON 输出格式（所有专家统一）**

```json
{
  "severity": "CRITICAL|INFORMATIONAL",
  "confidence": 9,
  "path": "app/models/user.rb",
  "line": 47,
  "category": "security",
  "summary": "SQL injection via string interpolation",
  "fix": "Use parameterized queries: User.where('id = ?', id)",
  "fingerprint": "app/models/user.rb:47:security",
  "specialist": "security"
}
```

这个设计非常好：所有专家用相同的 JSON schema，主 review agent 可以汇总所有专家的输出，按 severity 排序，去重（fingerprint），统一展示。

**"No Findings" 规则**

> "If no findings: output `NO FINDINGS` and nothing else."

这个规则防止了"没有找到问题"和"没有运行"的歧义——如果专家跑了但没问题，它明确说 `NO FINDINGS`，而不是沉默。

**security.md 的深度（举例）**

security 专家不是泛泛的"检查安全问题"，而是有具体的 category + 每个 category 内的具体检查项：

- Input Validation at Trust Boundaries（5项）
- Auth & Authorization Bypass（6项）
- Injection Vectors beyond SQL（6项：command, template, LDAP, SSRF, path traversal, header）
- Cryptographic Misuse（5项）
- Secrets Exposure（5项）
- XSS via Escape Hatches（框架具体：Rails html_safe、React dangerouslySetInnerHTML、Vue v-html）
- Deserialization（2项）

**performance.md 的深度**

- N+1 Queries（含 GraphQL DataLoader 检查）
- Missing Database Indexes（包括 composite indexes）
- Algorithmic Complexity（O(n²) 模式、string concatenation in loops）
- Bundle Size Impact（包括 lodash full import 这类常见陷阱）
- Rendering Performance（fetch waterfalls、React.memo 遗漏、layout thrashing）
- Missing Pagination（unbounded list endpoints）
- Blocking in Async Contexts（time.sleep() in event loop）

---

### 2.3 亮点总结

| 亮点 | 描述 |
|------|------|
| 统一 JSON schema | 所有专家输出可被主 agent 汇总、排序、去重 |
| NO FINDINGS 规则 | 明确区分"没问题"和"没跑" |
| 框架具体的 XSS 检查 | Rails/React/Vue/Django 各自的 escape hatch |
| 触发范围控制 | 按 diff scope 自动决定哪些专家运行 |
| confidence score 一致 | 与主 review 的 confidence 系统完全兼容 |
| red-team 专家 | 主动站在攻击者角度，不只是找已知模式 |

---

### 2.4 问题与局限

- 专家 checklist 是静态的，没有机制学习项目特有的安全/性能模式
- `red-team.md` 的质量高度依赖 agent 的想象力，checklist 能帮助结构化思维，但本质上是开放式的
- security 专家的范围在 `SCOPE_AUTH=true` 或 backend diff > 100 行时才触发，对小 PR 可能过于保守

---

### 2.5 八维评分（specialists，1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | 统一 JSON schema，触发范围明确，NO FINDINGS 规则 |
| 可验证性 | 4 | JSON 输出有 fingerprint，可以跨 session 去重；但专家的输出质量依赖 agent 的阅读理解 |
| 复用性 | 5 | JSON schema + checklist 格式高度可迁移，可以独立用于任何 review 流程 |
| 工具依赖 | 5 | 纯 Markdown checklist，只需要 Read 工具 |
| 协作价值 | 5 | 多专家并行 review，每个专家聚焦一个维度，比单一 review 覆盖更全 |
| 可维护性 | 5 | 独立文件，可以单独更新某个专家的 checklist |
| 学习成本 | 1 | 极低，每个专家就是一个 checklist |
| 落地门槛 | 5 | 纯 Markdown，无依赖，最容易迁移的部分 |

---

## 三、benchmark 与 specialists 在研发工作流中的位置

```
[review/specialists/] — pre-landing review 时并行调用，提升 review 深度
[benchmark]          — 可在 /ship 前运行，防止性能回归上线
                      也可在 /qa 后运行，在 QA 环境确认性能基准
```

`/benchmark` 和 `review/specialists/` 是两类不同的"扩展"：
- specialists 是 `/review` 的横向扩展（更多维度的静态分析）
- `/benchmark` 是动态测试层的补充（真实浏览器的性能数字）

---

## 四、六维总评（1-10分）

以 benchmark + review specialists 整体评估

| 维度 | 分数 | 简评 |
|------|------|------|
| 规则密度 | 9 | benchmark 的回归阈值规则、Phase 规则；specialists 的触发范围规则、JSON schema 规则、NO FINDINGS 规则，规则密度都很高 |
| 认知增量 | 8 | benchmark 的 bundle size as leading indicator 原则、trend analysis；specialists 的 red-team 视角、框架具体的 XSS 检查；认知增量中等偏高，但这两个更多是现有知识的系统化，而非突破性新设计 |
| 失败模式覆盖 | 8 | benchmark 覆盖性能回归的常见模式（bundle growth、request count 增加、LCP 劣化）；specialists 覆盖了 OWASP Top 10 的大多数 + 性能反模式 + API 兼容性 + data migration 风险 |
| 独立可执行性 | 7 | specialists 纯 Markdown，可完全独立使用；benchmark 独立运行能力较强，只需 browse binary |
| AI Agent 特异性 | 7 | specialists 的 JSON schema 是专门为 AI agent 聚合设计的（fingerprint 去重、confidence scoring）；benchmark 的"read-only"原则是对 AI agent 自主边界的约束 |
| 使用频率期望 | 7 | specialists 每次 review 时自动调用，使用频率高；benchmark 每次 PR 前应该跑，但实际上很多人会跳过 |

**六维总分：9+8+8+7+7+7 = 46**
**平均分：46/6 ≈ 7.67**
**百分制：76.7/100**
**评级：A-**

---

## 五、一句话总评

**`review/specialists/` 是 gstack review 体系里最容易被低估的部分——7个专家用统一 JSON schema 并行输出 findings，有框架具体的检查项和明确的 NO FINDINGS 语义，是这套系统里"最容易被其他团队直接借用"的部分；`/benchmark` 则用真实浏览器数据把"我们的 bundle 是不是越来越大"这个经常被忽视的问题变成了可追踪的趋势线。两者的共同局限是都高度依赖 web app 运行时。**
