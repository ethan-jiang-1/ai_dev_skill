# gstack: Architecture (Persistent Browser Daemon, Security Model, Ref/Locator Interaction, SKILL.md Drift Prevention)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/ARCHITECTURE.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: gstack 用“确定性工具 + 长生命周期 daemon + token”把浏览器 QA/运维能力从 prompt 变成可运行机制；同时用 SKILL.md 模板生成防止文档漂移，属于“机制落地证据”密度很高的一手来源。
- claims_supported:
  - “headless browser QA”需要持久状态与低延迟，否则会话级 QA 成本指数上升
  - “localhost only + bearer token + 0600 state file”是可迁移的最小安全模型基线
  - “ref/locator”交互属于 tool-level 机制（非纯 prompt），可降低误点击与 stale element 风险
  - “doc generation”是治理机制：避免命令/flag 漂移导致 skill 失效
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: Bun, Playwright, Chromium, Claude Code skills

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_path: ARCHITECTURE.md

## 关键事实

- gstack 的“核心 idea”是给 agent 提供持久化浏览器与一组 workflow skills；并明确指出“浏览器是 hard part，其它都是 Markdown”。
- 采用 daemon model：长生命周期 Chromium + localhost HTTP server + CLI 调用；首次启动约数秒，后续命令 100-200ms 级别。
- State file：写入 `.gstack/browse.json`，包含 pid/port/token 等；并说明采用 atomic write 与 `0o600` 权限。
- Port selection：随机 10000-60000，避免多 workspace 端口冲突。
- Version auto-restart：通过 `browse/dist/.version` 与 running server 的 `binaryVersion` 比对，避免 stale binary。
- Security model：
  - HTTP server 仅绑定 `localhost`
  - 每次 session 生成 bearer token 并要求每个请求携带
- Ref/Locator 机制：
  - 用 Playwright Locator（基于 accessibility tree / getByRole）而不是 DOM 注入属性，理由包括 CSP、框架 hydration、Shadow DOM 等
  - Refs 在 navigation 时清理，并在使用前做 staleness detection（count==0 立即失败）
- SKILL.md 模板系统：
  - `SKILL.md.tmpl` + 生成脚本 → `SKILL.md`
  - 目标是避免手写文档与 code drift。

## 与本研究的关系

- 作为 “从 repo 内部走向真实运行时 QA” 的一手机制证据：browser daemon + refs + snapshot/diff 使得运行时验证可规模化。
- 作为 “确定性门禁比 LLM 自检可靠” 的支撑：token、state file、auto-restart、staleness detection 都是确定性机制。

## 可直接引用的术语 / 概念

- “persistent browser”
- “daemon model”
- “Localhost only”
- “Bearer token auth”
- “Locators, not DOM mutation”
- “SKILL.md template system”

## captured_excerpt

摘录（来自 `ARCHITECTURE.md`）：

> “gstack runs a long-lived Chromium daemon that the CLI talks to over localhost HTTP.”
>
> “The HTTP server binds to `localhost`, not `0.0.0.0`.”

## 风险与局限

- gstack 的 browser/QA 能力在企业环境中可能触及隐私与凭据管理问题；需要更严格的 secret handling、隔离与审计。
- 文档强调的延迟与状态收益需要在真实环境验证（不同 OS、CI、headless 环境、登录方式差异）。

