# 独立评估报告 · eval_2

**评估对象：质量保证类 skill**
- `/qa` (SKILL.md, version 2.0.0, preamble-tier: 4)
- `/qa-only`（报告专用模式，独立 skill，结构与 `/qa` 相同，仅跳过修复环节）

**评估框架：**
- 结构化程度、可验证性、复用性、工具依赖、协作价值、可维护性、学习成本、落地门槛（1-5分）
- 六维总评（规则密度、认知增量、失败模式覆盖、独立可执行性、AI Agent 特异性、使用频率期望，1-10分）

---

## 一、`/qa` — 系统性 QA 测试与修复

### 1.1 核心定位

这是 gstack 中 **直接产生代码变更** 的核心 skill 之一。它不只是"测试"，而是"测试 + 修复 + 验证" 的完整闭环：

> "Systematically QA test a web application and fix bugs found. Runs QA testing, then iteratively fixes bugs in source code, committing each fix atomically and re-verifying."

版本是 2.0.0（说明有过一次大版本重构），触发词是 "qa"、"test this site"、"find bugs"、"test and fix"、"does this work?"。

---

### 1.2 结构分析

**三层测试 Tier（设计亮点）**

```
Quick      → Critical + High 级别 bug（最快出结果）
Standard   → + Medium 级别（默认，大多数场景）
Exhaustive → + Low / Cosmetic（完整性优先场景）
```

这个分层设计非常实用：开发者在做快速验证时用 Quick，在准备发布时用 Standard，在需要完整覆盖时用 Exhaustive。

**CDP 模式检测（亮点）**

```bash
$B status 2>/dev/null | grep -q "Mode: cdp" && echo "CDP_MODE=true" || echo "CDP_MODE=false"
```

如果用户的浏览器通过 CDP（Chrome DevTools Protocol）连接，自动跳过 cookie 导入、user-agent 覆盖、headless 检测绕过——因为真实浏览器已经有真实的 auth session。这个设计说明 gstack 对 agent 运行环境做了细粒度适配。

**Diff-Aware Mode（亮点）**

如果没有给 URL 且在 feature branch 上，自动进入 diff-aware 模式：
- 只测试与 diff 相关的功能
- 这显著降低了测试范围，提升了 focus

**Clean Working Tree 强制检查**

在开始前检查 `git status --porcelain`，如果 dirty 则强制用户选择：
- A) 先 commit
- B) 先 stash
- C) 放弃

原因：QA 需要对每个 bug fix 做 atomic commit，dirty 状态会污染 commit 历史。

**Test Framework Bootstrap（亮点）**

这是一个完整的测试基础设施自动化安装流程：
1. 检测项目 runtime（Ruby/Node/Python/Go/Rust/PHP/Elixir）
2. 检测是否已有测试框架
3. 如果没有，WebSearch 搜索当前最佳实践
4. AskUserQuestion 让用户选择框架
5. 自动安装、配置、创建目录结构
6. 生成 3-5 个真实测试用例（针对最近改动的文件）
7. 验证测试通过
8. 如果 `.github/` 存在，自动创建 CI/CD workflow

这个 bootstrap 机制的价值在于：**它把"我的项目根本没有测试"这个状态自动处理掉**，而不是让 QA 流程因为没有测试框架而停止。

**生产报告结构**

`/qa` 结束后产出：
- 带 before/after health score 的报告
- fix evidence（每个 bug 的修复证明）
- ship-readiness summary

---

### 1.3 底层执行力：`/browse` 依赖

`/qa` 的核心测试能力依赖 `$B`（gstack browser binary，基于 Playwright）：

```bash
_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
B=""
[ -n "$_ROOT" ] && [ -x "$_ROOT/.claude/skills/gstack/browse/dist/browse" ] && B="$_ROOT/.claude/skills/gstack/browse/dist/browse"
[ -z "$B" ] && B=~/.claude/skills/gstack/browse/dist/browse
```

如果 browse binary 不存在，自动触发 setup 流程（包括 bun 安装，有 checksum 验证）。

这意味着 `/qa` 的测试能力是**真实的浏览器操作**，而不是静态分析或模拟请求。它可以：
- 截图
- 点击元素
- 填表单
- 导航页面
- 检测 console errors

---

### 1.4 亮点总结

| 亮点 | 描述 |
|------|------|
| Test → Fix → Verify 闭环 | 不只是找 bug，找了就修，修了就再测 |
| 三层 Tier | Quick/Standard/Exhaustive，适配不同场景 |
| CDP 模式自适应 | 自动检测浏览器连接模式，调整行为 |
| Diff-Aware 模式 | feature branch 下自动聚焦 diff 相关功能 |
| Test Framework Bootstrap | 没有测试框架时自动安装，包括 CI/CD 配置 |
| Atomic Bug Fix Commits | 每个 bug fix 独立 commit，可追溯、可 revert |
| Real Browser Testing | 基于 Playwright 的真实浏览器交互，不是模拟 |

---

### 1.5 问题与局限

**核心问题：需要 web app 运行时**
- `/qa` 的设计前提是有一个跑起来的 web application。对于纯后端、CLI 工具、库类项目，测试能力大幅缩水。
- 虽然有 Test Framework Bootstrap，但那更多是 unit test 层面，不是真正的 QA。

**browse binary 是硬依赖**
- 没有 browse binary，`/qa` 就失去了最核心的测试执行力。
- binary 是平台相关的（Mach-O arm64），在 Linux/Windows/Intel Mac 上需要 build-from-source。

**Exhaustive 模式的成本**
- 修复所有 cosmetic 级别的 bug 有时候不是好的工程决策，但 skill 没有对这个做更多判断。

---

### 1.6 八维评分（1-5分）

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | Tier 分层 + 阶段清晰 + 原子 commit 设计 + 报告模板 |
| 可验证性 | 5 | 每个 fix 都有 before/after 截图 + commit 作为证据 |
| 复用性 | 4 | Tier 系统和 Bootstrap 可迁移，但 browse 依赖难直接复用 |
| 工具依赖 | 2 | 强依赖 browse binary（Playwright）+ bun 运行时 + 运行中的 web app |
| 协作价值 | 5 | Atomic commits + health score + ship-readiness 报告，对团队 QA 流程价值高 |
| 可维护性 | 4 | 模板生成，但 Playwright 依赖有维护风险 |
| 学习成本 | 3 | 参数系统（URL、Tier、Mode、Scope、Auth）对初用者有门槛 |
| 落地门槛 | 2 | 需要 web app 运行时 + browse binary，重度依赖基础设施 |

---

## 二、`/qa` 与 review 体系的位置关系

```
[plan-eng-review] → 架构规划阶段
        ↓
        ↓ (编码)
        ↓
[review]          → pre-landing 代码 review（静态分析）
        ↓
[qa]              → 真实浏览器 QA 测试 + 修复（动态测试）
        ↓
[ship]            → 打包发布
```

`/qa` 处于 static review 之后、ship 之前，填补了"代码写完了但不知道 app 有没有真的 work"这个 gap。

---

## 三、`/qa` 与 `/qa-only` 的分工

| | `/qa` | `/qa-only` |
|-|-------|------------|
| 测试 | 是 | 是 |
| 修复 bug | 是（迭代修复） | 否（仅报告） |
| commit | 每个 fix atomic commit | 不产生 commit |
| 适用场景 | 主动修 bug | 只想看报告 |

这个分工设计很合理：有时候你只想知道有哪些问题，而不是让 AI 直接修。

---

## 四、六维总评（1-10分）

| 维度 | 分数 | 简评 |
|------|------|------|
| 规则密度 | 9 | Tier 规则、CDP 适配规则、dirty tree 处理规则、atomic commit 规则、Bootstrap 流程、CI 创建规则，规则密度极高 |
| 认知增量 | 9 | "Test → Fix → Verify" 闭环、Diff-Aware 模式、Test Framework Bootstrap、real browser testing——每一个都是超越"给你写几个测试"的东西 |
| 失败模式覆盖 | 8 | 覆盖 dirty working tree、missing browse binary、missing test framework、missing web app URL；分 Tier 应对不同严重度；但对纯后端场景没有很好的降级方案 |
| 独立可执行性 | 6 | 在完整 gstack 环境下（browse binary + web app + bun）可独立运行；依赖链较重，迁移成本高 |
| AI Agent 特异性 | 9 | CDP 模式检测、Diff-Aware 模式、Tier 系统、Atomic commit 设计、Test Bootstrap——这些都是专门针对 AI agent 在 QA 场景的弱点设计的 |
| 使用频率期望 | 9 | 每次 feature 完成后的标准流程，使用频率应该非常高 |

**六维总分：9+9+8+6+9+9 = 50**
**平均分：50/6 ≈ 8.33**
**百分制：83.3/100**
**评级：A**

---

## 五、一句话总评

**`/qa` 把"AI 做 QA"从"让 AI 帮你写几个测试用例"提升到了"AI 用真实浏览器找 bug、修 bug、验证修复、原子提交、出具报告"的完整流水线——它最强的地方不是找 bug 的能力，而是把 QA 流程标准化到任何一个工程师都能在 30 秒内拿到完整执行结果的程度。代价是它需要一个跑起来的 web app 和 Playwright 基础设施，对没有这些的团队门槛显著偏高。**
