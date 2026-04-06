# 独立评估报告 · eval_3

**评估对象：交付流程类 skill**
- `/ship` (SKILL.md, version 1.0.0, preamble-tier: 4)
- `/land-and-deploy` (post-PR 合并 + 部署 + 验证)
- `/canary` (post-deploy 生产监控)
- `/document-release` (发布后文档更新，辅助 skill)

**评估框架：**
- 结构化程度、可验证性、复用性、工具依赖、协作价值、可维护性、学习成本、落地门槛（1-5分）
- 六维总评（规则密度、认知增量、失败模式覆盖、独立可执行性、AI Agent 特异性、使用频率期望，1-10分）

---

## 一、`/ship` — 全自动发布工作流

### 1.1 核心定位

`/ship` 是 gstack 交付链路的核心 skill，定位极为明确：

> "Ship workflow: detect + merge base branch, run tests, review diff, bump VERSION, update CHANGELOG, commit, push, create PR."

触发词覆盖了所有"我要发布了"的表述："ship", "deploy", "push to main", "create a PR", "merge and push", "get it deployed"。

**非常关键的设计哲学：**
> "This is a **non-interactive, fully automated** workflow. Do NOT ask for confirmation at any step. The user said `/ship` which means DO IT."

这是一个非常大胆的设计决策——把"确认门"最小化，同时通过明确的 STOP 规则定义什么时候才真的需要停。

---

### 1.2 结构分析

**STOP 规则（极其关键的亮点）**

`/ship` 明确列出了两个列表：

**只在这些情况 STOP：**
- 在 base branch 上（中止）
- 合并冲突无法自动解决
- in-branch 测试失败
- pre-landing review 发现需要用户判断的 ASK 项
- MINOR/MAJOR 版本号变更（问一次）
- AI 覆盖率低于最低阈值（hard gate）
- Plan items NOT DONE 且无用户 override

**绝不为这些 STOP：**
- 未提交的改动（自动包含）
- 版本号选择（自动选 MICRO/PATCH）
- CHANGELOG 内容（自动从 diff 生成）
- commit message 审批（自动 commit）
- 多文件变更（自动分割成 bisectable commits）
- auto-fixable 的 review 发现（自动修复 + commit）

这个"STOP 清单 vs 不 STOP 清单"的设计非常成熟。大多数 AI 发布工具要么过于谨慎（问太多），要么过于激进（不问）。这里做了精确的分类。

**Review Readiness Dashboard（亮点）**

在发布前，`/ship` 会展示一个格式化的 review 状态面板：

```
+====================================================================+
|                    REVIEW READINESS DASHBOARD                       |
+====================================================================+
| Review          | Runs | Last Run            | Status    | Required |
|-----------------|------|---------------------|-----------|----------|
| Eng Review      |  1   | 2026-03-16 15:00    | CLEAR     | YES      |
| CEO Review      |  0   | —                   | —         | no       |
| Design Review   |  0   | —                   | —         | no       |
| Adversarial     |  0   | —                   | —         | no       |
| Outside Voice   |  0   | —                   | —         | no       |
+--------------------------------------------------------------------+
| VERDICT: CLEARED — Eng Review passed                                |
+====================================================================+
```

- **Eng Review 是唯一的强制 gate**，其他都是 optional。
- 有 staleness detection：如果 review 距今 >7 天或当前 commit 不匹配，会提示 stale。
- 有 source attribution：显示 review 是通过 `/autoplan` 还是手动触发的。

**Test Failure Ownership Triage（亮点）**

测试失败时不是直接 STOP，而是先做分类：
- **In-branch failure**：这个 branch 的代码导致的，必须修复才能发布。
- **Likely pre-existing**：与这个 branch 无关的历史问题，可以记录在 PR body 但不阻塞。
- **判断原则：ambiguous → 默认 in-branch**（宁可误报，不要放过）

这个设计解决了一个实际痛点：很多团队有一些常年 flaky 的测试，如果所有测试失败都阻塞发布，实际上没人用 CI。

**Distribution Pipeline Check（Step 1.5，亮点）**

如果 diff 引入了新的独立 artifact（CLI binary/库/工具）：
1. 检查是否有 CI/CD release workflow
2. 如果没有，AskUserQuestion：立即添加 / 记录到 TODOS.md / 内部用
3. 如果有，静默通过

这防止了"代码写了但没有分发渠道"这个常见陷阱。

**版本管理（Step 4）**

自动判断版本号类型并 bump：
- MICRO/PATCH：自动选（不问）
- MINOR/MAJOR：STOP 问用户

CHANGELOG 从 diff + commit messages 自动生成，不需要用户参与。

**Idempotency（重跑安全性）**

> "Re-running /ship means 'run the whole checklist again.' Every verification step runs on every invocation. Only *actions* are idempotent."

每次重跑都会重新验证所有检查，但：
- VERSION 已经 bump 了 → 跳过 bump，直接读版本
- 已经 push 了 → 跳过 push
- PR 已存在 → 更新 body，不重新创建

---

### 1.3 亮点总结

| 亮点 | 描述 |
|------|------|
| STOP 规则 vs 不 STOP 规则 | 明确区分什么需要人工判断，什么不需要 |
| Review Readiness Dashboard | 格式化展示所有 review 状态，staleness 检测 |
| Test Failure Triage | 区分 in-branch 和 pre-existing 失败，不无脑阻塞 |
| Distribution Pipeline Check | 防止新 binary 没有分发渠道 |
| 幂等重跑 | 每次重跑重新验证，但不重复执行已完成的 actions |
| Auto-fix review findings | dead code、N+1、stale comments 自动修复 commit |
| AUTO VERSION + CHANGELOG | 无需用户手写，自动从 diff 生成 |

---

### 1.4 问题与局限

- **GitHub-first**：很多检查都依赖 `gh` CLI，GitLab 支持有限，GitLab 的 `/land-and-deploy` 甚至直接 STOP 说"不支持"。
- 高度自动化在某些企业场景不适合：有些团队 release 需要人工 sign-off 流程，`/ship` 的哲学会和这种文化冲突。
- CHANGELOG 自动生成的质量依赖 commit message 质量，如果团队的 commit messages 很糟糕，CHANGELOG 也会很糟糕。

---

## 二、`/land-and-deploy` — 合并、部署、验证

### 2.1 核心定位

`/ship` 创建 PR，`/land-and-deploy` 做剩下的：

> "This skill picks up where `/ship` left off. `/ship` creates the PR. You merge it, wait for deploy, and verify production."

角色定位是 **Release Engineer**，语气设计特别有意思：
> "Every message to the user should make them feel like they have a senior release engineer sitting next to them."
> "First run = teacher mode. Subsequent runs = efficient mode."

---

### 2.2 结构分析

**Pre-merge Readiness Gate（Step 3.5，关键 STOP）**

这是 `/land-and-deploy` 中唯一的硬性用户确认 gate：
- 检查 CI 状态
- 检查是否有未解决的 review 意见
- 检查 docs 更新状态
- 展示确认清单，等用户确认

这个设计的逻辑是：merge 是不可逆的操作，所以在这个时刻才值得停下来让人看一眼。

**Deploy Wait & Monitor**

- 等待 CI/CD pipeline 跑完（支持 GitHub Actions、Fly.io、Railway、Render、Heroku 等）
- 智能 polling：不是每 5 秒问一次，而是指数退避
- 告知用户当前在等什么，为什么

**自动 Revert 触发**
- 如果 deploy 失败，自动提供 revert 选项
- 如果 canary 检测到生产问题，同样提供 revert

---

### 2.3 局限

- **仅支持 GitHub**（GitLab 直接 STOP）
- 依赖特定 CI/CD 平台的 API（`gh run view` 等），对自建 CI 支持差
- 需要生产 URL 才能做 canary 验证，纯 API/backend 项目需要额外配置

---

## 三、`/canary` — Post-Deploy 生产监控

### 3.1 核心定位

> "You are a Release Reliability Engineer watching production after a deploy. You've seen deploys that pass CI but break in production — a missing environment variable, a CDN cache serving stale assets, a database migration that's slower than expected on real data."

这个定位非常具体：捕捉"CI 通过但生产挂了"这类问题。

### 3.2 结构分析

**Arguments 设计**

```
/canary <url>               → 10分钟监控（默认）
/canary <url> --duration 5m → 自定义时长
/canary <url> --baseline    → 部署前捕获基线截图
/canary <url> --pages /,/dashboard,/settings → 指定监控页面
/canary <url> --quick       → 单次健康检查
```

**--baseline 模式（亮点）**

在部署前先跑 `--baseline`，捕获页面截图 + console errors + 性能指标。部署后再跑普通 canary，自动对比：
- 视觉差异
- 新增的 console errors
- 性能回归

这是很工程化的设计——大多数 AI QA 工具只做部署后检查，不做 before/after 对比。

**真实浏览器监控**

同样依赖 browse binary，可以：
- 截图并对比
- 检测 JavaScript console errors
- 测量页面性能指标
- 检测 404、API 错误

---

### 3.3 局限

- 强依赖 browse binary（Playwright）
- 对 auth 后的页面需要 cookie 导入，配置成本高
- 10 分钟监控可能不够对某些慢速问题（比如内存泄漏，通常需要几小时才显现）

---

## 四、交付链路整体评估

```
[/ship]
  ↓ 创建 PR，自动 review + test + VERSION + CHANGELOG
[/land-and-deploy]
  ↓ 等 CI，合并 PR，等 deploy，canary 验证
[/canary]
  ↓ 持续监控生产 10 分钟
[/document-release]
  ↓ 更新文档（README、changelog 摘要、API 文档等）
```

这是一条完整的"写完代码到生产验证"流水线。每个 skill 的边界清晰：
- `/ship` 只管到"PR 创建"
- `/land-and-deploy` 接管"合并到生产验证"
- `/canary` 可以独立使用，也可被 `/land-and-deploy` 调用
- `/document-release` 在任何时候都可以跑，不依赖前三个

---

## 五、八维评分（1-5分）

以交付流程系统整体评分

| 维度 | 分数 | 理由 |
|------|------|------|
| 结构化程度 | 5 | 每个 skill 边界清晰，步骤有序，STOP 规则精确 |
| 可验证性 | 5 | Review Dashboard + canary before/after + CI status + atomic commits，证据链完整 |
| 复用性 | 3 | `/canary` 可独立复用，但 `/ship`、`/land-and-deploy` 的大量细节与 gstack + GitHub 生态绑定 |
| 工具依赖 | 2 | 强依赖 gh CLI + browse binary + 特定 CI 平台 API |
| 协作价值 | 5 | Review Dashboard 让团队知道发布前做了什么 review，Test Triage 区分 pre-existing 失败防止无效阻塞 |
| 可维护性 | 4 | 模板生成，平台检测逻辑较稳定，但 CI 平台适配需要持续维护 |
| 学习成本 | 3 | STOP 规则设计需要用户理解自动化边界；首次使用时"first-run teacher mode"有帮助 |
| 落地门槛 | 2 | 需要 GitHub + gh CLI + browse binary + 运行中的 web app，对非 GitHub 团队几乎无法用 |

---

## 六、六维总评（1-10分）

| 维度 | 分数 | 简评 |
|------|------|------|
| 规则密度 | 10 | STOP vs 不 STOP 的明确清单、Test Triage 分类逻辑、Review gate 规则、Idempotency 规则、canary baseline 对比规则，规则密度极高 |
| 认知增量 | 8 | Test Failure Triage（区分 in-branch vs pre-existing）、Distribution Pipeline Check、first-run teacher mode、before/after canary 对比——都有认知价值；但整体哲学（"自动化发布"）并不是特别新颖的想法，执行精度高但理念本身不算突破 |
| 失败模式覆盖 | 9 | 覆盖：测试失败分类、合并冲突、CI 失败、deploy 失败 revert、生产问题 revert、VERSION 冲突、missing release pipeline、stale review；几乎所有常见发布失败模式都有处理 |
| 独立可执行性 | 5 | `/canary` 可独立；`/ship` 在 gstack 外使用需要手动处理大量细节；`/land-and-deploy` 几乎不可独立迁移 |
| AI Agent 特异性 | 9 | STOP 规则（限制 AI 的自主边界）、Test Failure Triage（AI 判断 ownership）、Idempotency 设计（safe to re-run）、first-run vs subsequent-run 的自适应 tone——都是专门为 AI agent 场景设计的 |
| 使用频率期望 | 9 | `/ship` 在每次 PR 前都应该跑，使用频率极高 |

**六维总分：10+8+9+5+9+9 = 50**
**平均分：50/6 ≈ 8.33**
**百分制：83.3/100**
**评级：A**

---

## 七、一句话总评

**gstack 的交付流程 skill 把"从 PR 到生产验证"做成了一条有精确 STOP 规则的自动化流水线：它最难得的不是自动化本身，而是对"什么时候 AI 可以自己决定、什么时候必须停下来问人"做了明确而合理的分层——这是大多数 AI 发布工具没有想清楚的问题。代价是对 GitHub 和特定 CI 平台的强绑定，跨平台迁移成本很高。**
