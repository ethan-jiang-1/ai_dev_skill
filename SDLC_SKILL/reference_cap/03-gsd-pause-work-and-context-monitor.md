# GSD: `gsd:pause-work` + `gsd-context-monitor` Hook (Context-aware Stop, Handoff File, Safe Resume)

- source_url: https://github.com/glittercowboy/get-shit-done/blob/295a5726dc6139f383acfc0dbef6b88d4ec94dfa/commands/gsd/pause-work.md
- source_type: official
- accessed_at: 2026-04-09 11:16:45 +0800
- related_dimension: 03-review-ship-ops
- trust_level: official
- why_it_matters: GSD 把“长程任务不中断”落到可执行机制：`pause-work` 通过 workflow 生成 `.continue-here.md` 交接文件并 WIP commit；`gsd-context-monitor` 作为 AfterTool/PostToolUse hook 读取 context 指标，在 context 低时向 agent 注入警告并建议在自然停点运行 `/gsd-pause-work`。这类能力单元直接针对 agent 的上下文耗尽与状态丢失失败模式。
- claims_supported:
  - 状态交接应落盘成结构化 handoff 文件，并纳入 git（可回滚/可审计）
  - hooks 能把“上下文耗尽”从隐性风险变成显式信号，并触发 pause-work 机制
  - 安全处理（session_id 防 path traversal、debounce、config 可关闭）是 hooks 可靠性的关键
- date_scope: as of git commit 295a5726dc6139f383acfc0dbef6b88d4ec94dfa (2026-04-08)
- related_frameworks: get-shit-done (GSD)
- related_tools: hooks (PostToolUse/AfterTool), /tmp bridge file, .continue-here.md, git commit

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/get-shit-done
- commit: 295a5726dc6139f383acfc0dbef6b88d4ec94dfa
- file_paths:
  - commands/gsd/pause-work.md
  - hooks/gsd-context-monitor.js

## 关键事实

- `gsd:pause-work` 的目标：创建 `.continue-here.md` handoff 文件，保存“当前相位/完成进度/剩余工作/决策/阻塞”，并做 WIP commit，提供 resume instructions。
- `gsd-context-monitor` hook：
  - 从 statusline bridge file 读取 context metrics（`/tmp/claude-ctx-{session_id}.json`）
  - remaining <=35% 发 WARNING，<=25% 发 CRITICAL（且有 debounce 与 severity escalation）
  - 当检测到 `.planning/STATE.md`（GSD active）时，在 CRITICAL 提示里建议用户在自然停点运行 `/gsd-pause-work`
  - 做了输入与路径安全处理（拒绝 session_id path traversal；忽略 stale metrics；silent fail 不阻塞工具执行）

## 与本研究的关系

- 支撑 `digested_cap/03` 的“文件型持久化记忆 + pause/resume 是长程 agent 的底座”判断，并提供一手 hook+workflow 证据。
- 也提供了可迁移的安全实践样本：hook 的输入校验、debounce、config 禁用开关。

## 可直接引用的术语 / 概念

- “Create `.continue-here.md` handoff file”
- “Context Monitor … injects warnings when context usage is high”
- “CRITICAL … run /gsd-pause-work at the next natural stopping point”

## captured_excerpt

摘录（来自 `gsd-context-monitor.js`）：

> “CONTEXT CRITICAL … run /gsd-pause-work at the next natural stopping point.”

## 风险与局限

- hook 依赖宿主提供可靠的 context metrics 与桥接文件；不同宿主（Claude/Codex/Gemini）实现差异可能影响触发一致性。
- handoff 文件写入与 WIP commit 会改变 repo 状态；企业团队需要明确“哪些文件可入库、哪些应放在私有通道”。

