# Cursor Plugins: Hooks runtime contract (stop / afterAgentResponse)

- source_url: https://github.com/cursor/plugins/blob/main/ralph-loop/hooks/stop-hook.sh
- source_type: official_repo_code
- accessed_at: 2026-04-09
- related_topic: host
- trust_level: official
- why_it_matters: Cursor plugins 的“运行时语义”大多不在 manifest/schema 里，而在 hooks 的实际契约（输入/输出/环境变量/事件名）中体现。官方 `cursor/plugins` 仓库内的示例插件（ralph-loop / continual-learning）提供了实现级证据，可用于补齐“hooks 如何驱动 agent 行为、如何继续/终止回合、如何持久化状态”的关键缺口。

## Key Facts

- 官方插件 `ralph-loop` 的 hooks 配置文件为 `hooks/hooks.json`（`version: 1`），并声明至少两类 hook event：`afterAgentResponse` 与 `stop`；每个 event 对应一个或多个 `command`。（Ref: `ralph-loop/hooks/hooks.json`）
- `stop` hook 的实现脚本在注释中明确给出 Cursor stop hook API：
  - Input 为 JSON（至少包含 `status` 与 `loop_count` 等字段）
  - Output 若输出 `{"followup_message":"<text>"}` 则继续下一轮；若 exit 0 且无输出则停止。（Ref: `ralph-loop/hooks/stop-hook.sh`）
- `afterAgentResponse` hook 的实现脚本注释明确 Input 为 `{ "text": "<assistant response text>" }`，输出为空（fire-and-forget）。（Ref: `ralph-loop/hooks/capture-response.sh`）
- 示例实现表明 Cursor 会向 hook 命令提供项目/插件相关环境：
  - `CURSOR_PROJECT_DIR` 可用于定位项目目录（脚本使用其拼出 `.cursor/...` 状态文件路径）。
  - `${CURSOR_PLUGIN_ROOT}` 可用于从 hooks 配置中引用插件根目录（例如 `bun run ${CURSOR_PLUGIN_ROOT}/...`）。（Ref: `ralph-loop/hooks/stop-hook.sh`; `continual-learning/hooks/hooks.json`）
- 官方插件 `continual-learning` 的 README 明确描述 hooks -> skill 的联动：在符合条件的 `stop` events 上，hook “may emit a followup_message” 来要求 agent 运行某个 skill，从而实现自动化的“回合结束触发下一步流程”。（Ref: `continual-learning/README.md`）

## Claims Supported

- “Cursor plugins 的 hooks 是运行时控制面：能在回合生命周期事件上执行命令，并通过 `followup_message` 驱动 agent 继续执行流程。”（主题 1 host；机制/失败模式）
- “Cursor hooks 具备执行外部命令与写入项目内 `.cursor/...` 状态的能力，因此插件/扩展生态会直接放大供应链与权限边界风险，需要与宿主的权限/治理机制一并评估。”（主题 1 host；主题 2 dist；安全/治理）

## Captured Excerpts (keep short)

> Output: { "followup_message": "<text>" }  to continue, or exit 0 with no output to stop

## Terms / Concepts

- hooks
- `hooks.json` (`version: 1`)
- hook events: `stop`, `afterAgentResponse`
- `followup_message`
- `CURSOR_PROJECT_DIR`, `CURSOR_PLUGIN_ROOT`

## Risks / Limits

- 证据来自官方示例插件与脚本注释，能反映“意图中的 API 形态”，但不等价于 Cursor 在所有运行形态（IDE vs CLI mode）下的行为一致性；仍需结合产品文档/实现差异做交叉核验。

