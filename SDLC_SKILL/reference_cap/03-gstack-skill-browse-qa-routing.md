# gstack: Root SKILL.md (Skill Routing Rules + Browse/QA Workflows)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: 该文件把“什么时候该调用哪种能力单元（skill routing）”写成显式规则，并把 browse/QA 工作流落到确定性 CLI 命令（snapshot/refs/diff/console/network/cookie-import），直接支撑“从代码文本走向真实运行时验证”。
- claims_supported:
  - “Routing rules”是一种可迁移的编排机制：当匹配 skill 时禁止 ad-hoc inline 回答
  - “Headless browser QA”可通过标准化工作流减少漏测与走偏
  - “环境变量凭据 + cookie import”体现运行时测试的安全与便利权衡
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: gstack browse CLI (Playwright/Chromium)

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: SKILL.md

## 关键事实

- 明确给出“Routing rules”：当用户意图与某个 skill 匹配时，必须先 invoke skill，而不是直接回答问题。
- 对 browse/QA 能力给出可操作的工作流模板，包括：
  - `goto` 导航
  - `snapshot -i` 获取可交互元素并产生 `@e` refs
  - `fill/click` 通过 refs 操作
  - `snapshot -D` diff 对比交互前后变化
  - `console`/`network` 检查运行时错误与失败请求
  - `responsive` / `viewport` 做响应式截图
  - `cookie-import-browser` 导入真实浏览器 cookies 测试鉴权页面
- 明确提示凭据安全：建议通过环境变量注入测试账号密码。

## 与本研究的关系

- 提供了“QA/验证”能力单元的具体机制与接口，不是泛泛描述。
- Skill routing 作为 orchestrator-like 能力的轻量实现，可被迁移到企业内部的 agent runtime（把“何时必须跑验证/审查”固化为路由规则）。

## 可直接引用的术语 / 概念

- “Routing rules”
- “Do NOT answer … directly when a matching skill exists.”
- “Persistent headless Chromium”
- “snapshot / refs / diff”

## captured_excerpt

摘录（来自 `SKILL.md`）：

> “Do NOT answer the user's question directly when a matching skill exists. The skill provides a structured, multi-step workflow …”
>
> “State persists between calls (cookies, tabs, sessions).”

## 风险与局限

- Routing rules 的效果依赖宿主是否真的“强制路由”，否则易被忽略。
- Cookie import 在企业环境有合规/权限边界问题，需要更明确的审计与最小权限策略。

