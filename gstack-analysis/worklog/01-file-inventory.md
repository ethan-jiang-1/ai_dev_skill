# gstack 仓库目录盘点

## 输入源

- GitHub URL：`https://github.com/garrytan/gstack`
- snapshot 路径：`source_snapshot/gstack/`
- snapshot commit：`03973c2fabfb4988a2a4c2fefc44a7e280804884`
- 默认分支：`main`

## 第一轮盘点结论

这个仓库不是普通的 Markdown skill 清单，而是一个把：

- skill 文本入口
- 模板生成系统
- 浏览器 runtime
- 设计 runtime
- 多宿主安装层
- 测试与评估层

绑在一起的 AI 工程工作流仓库。

## 最值得先看的根文件

- `README.md`：整体定位、命令地图、安装方式、使用顺序
- `ARCHITECTURE.md`：浏览器 daemon、SKILL 模板系统、安全模型
- `ETHOS.md`：Boil the Lake / Search Before Building 这些方法论
- `docs/skills.md`：每个 skill 的深挖说明
- `package.json`：build、test、eval、skill-check 等脚本入口
- `CLAUDE.md` / `AGENTS.md`：宿主接入方式与使用约束

## 顶层结构盘点

### 1. 显式 skill 目录

顶层可直接识别的 skill 目录主要包括：

- `office-hours/`
- `plan-ceo-review/`
- `plan-eng-review/`
- `plan-design-review/`
- `plan-devex-review/`
- `design-consultation/`
- `design-shotgun/`
- `design-html/`
- `review/`
- `qa/`
- `qa-only/`
- `ship/`
- `land-and-deploy/`
- `canary/`
- `benchmark/`
- `browse/`
- `connect-chrome/`
- `open-gstack-browser/`
- `setup-browser-cookies/`
- `setup-deploy/`
- `retro/`
- `investigate/`
- `document-release/`
- `codex/`
- `cso/`
- `autoplan/`
- `devex-review/`
- `careful/`
- `freeze/`
- `guard/`
- `unfreeze/`
- `gstack-upgrade/`
- `learn/`
- `checkpoint/`
- `health/`

补充一个根级 `SKILL.md` 后，仓库当前共有：

- 36 个顶层 skill 入口
- 40 个 `SKILL.md`
- 37 个 `SKILL.md.tmpl`
- 4 个 `openclaw/skills/*/SKILL.md`

## skill-like 单元分布

### A. 顶层技能入口

主要形态：

- `<skill>/SKILL.md`
- `<skill>/SKILL.md.tmpl`

这一层是最显式的 skill 层，负责：

- 暴露 name / description / allowed-tools
- 写清触发条件与执行方式
- 通过模板占位符继承共用流程块

### B. 深层辅助 skill-like 内容

#### `review/`

- `review/specialists/*.md`：7 个专题审查模块
- `review/checklist.md`
- `review/design-checklist.md`
- `review/greptile-triage.md`
- `review/TODOS-format.md`

它说明 `/review` 不是单 prompt，而是带 specialist 子模块的复合 skill。

#### `qa/`

- `qa/references/issue-taxonomy.md`
- `qa/templates/qa-report-template.md`

这层把 QA 的问题分类与交付格式固化下来。

#### `openclaw/skills/`

- `gstack-openclaw-office-hours`
- `gstack-openclaw-ceo-review`
- `gstack-openclaw-investigate`
- `gstack-openclaw-retro`

这四个不是 Claude Code skill 的镜像副本，而是 OpenClaw 原生对话技能。

## runtime 与工程实现层

### `browse/`

- `browse/src/*.ts`：20 个 TypeScript 源文件
- `browse/test/*.test.ts`：31 个测试文件
- `browse/scripts/build-node-server.sh`

这是 gstack 最硬核的 runtime 层，对应持久化浏览器与本地 HTTP daemon。

### `design/`

- `design/src/*.ts`：16 个 TypeScript 源文件
- `design/test/*.test.ts`：3 个测试文件

这是设计相关技能的程序化支持层。

### `extension/`

- sidepanel / popup / background / content 脚本
- 浏览器侧栏与扩展 UI 资产

### `bin/`

- 29 个可执行脚本或工具入口
- 包含 update、config、analytics、timeline、team-init、repo-mode 等能力

这一层说明 gstack 不只是文档技能，也在不断把操作系统化能力下沉到脚本层。

## 文档与规范层

- `docs/skills.md`
- `docs/OPENCLAW.md`
- `docs/ADDING_A_HOST.md`
- `docs/designs/*.md`
- `BROWSER.md`
- `DESIGN.md`
- `ARCHITECTURE.md`
- `ETHOS.md`
- `CONTRIBUTING.md`

这些文件不是外围说明，而是在共同定义 skill 的使用边界、runtime 假设和演进方法。

## 测试与 CI

### 测试脚本

`package.json` 里可见：

- `test`
- `test:evals`
- `test:e2e`
- `test:gate`
- `test:periodic`
- `test:codex`
- `test:gemini`
- `test:audit`
- `skill:check`
- `gen:skill-docs`

### CI 工作流

`.github/workflows/` 当前包含：

- `actionlint.yml`
- `ci-image.yml`
- `evals.yml`
- `evals-periodic.yml`
- `skill-docs.yml`

这说明它把 skill 文档新鲜度、评估集和 CI 镜像都纳入自动化。

## 我接下来优先深入的地方

- 顶层 skill 的共同 front matter 结构
- `SKILL.md.tmpl -> SKILL.md` 的模板生成机制
- `/browse` 的 daemon + ref system + token 安全模型
- `/autoplan`、`/review`、`/qa`、`/ship` 这条核心工作流闭环
- OpenClaw、本地浏览器扩展、其他 agent host 的适配方式
