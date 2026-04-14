# github/spec-kit: Extension hooks runtime (`HookExecutor`, `.specify/extensions.yml`)

- source_url: https://github.com/github/spec-kit/blob/main/src/specify_cli/extensions.py
- source_type: official_repo_code
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这是 Spec Kit “扩展 hooks”从模板口径走向真实运行语义的一手证据：HookExecutor 明确 `.specify/extensions.yml` 的读取/容错、hook 注册结构、enabled/optional/condition 处理、以及跨宿主的 hook 调用命令渲染（Codex `$speckit-*` vs Claude `/<speckit-*>` 等）。用于补齐“extension hooks 到底会不会自动执行、condition 是否会被求值、跨宿主命令风格如何适配”的机制缺口。

## Key Facts

- HookExecutor 使用项目内配置文件：`<project_root>/.specify/extensions.yml`；当配置不存在或解析失败时返回默认结构（含 `settings.auto_execute_hooks: True` 与空 hooks）。（Ref: `HookExecutor.get_project_config`）
- `register_hooks()` 会把 extension manifest 中的 hooks 注册到 project config（按 event name 聚合为数组），并写入字段：`extension`、`command`、`enabled`、`optional`、`prompt`、`description`、`condition`。（Ref: `HookExecutor.register_hooks`）
- `get_hooks_for_event()` 会过滤并仅返回 enabled hooks（默认 enabled）。（Ref: `HookExecutor.get_hooks_for_event`）
- 条件执行：`should_execute_hook()` 在存在 `condition` 时会调用 `_evaluate_condition()`；若 condition 求值异常，默认不执行；未知 condition 格式也默认 False（fail-closed）。（Ref: `HookExecutor.should_execute_hook`; `HookExecutor._evaluate_condition`）
- condition 支持的表达式形态包括（大小写不敏感）：
  - `config.<key.path> is set` / `==` / `!=`（基于 extension 的 ConfigManager）
  - `env.<VAR> is set` / `==` / `!=`。（Ref: `HookExecutor._evaluate_condition`）
- 跨宿主调用风格适配：`_render_hook_invocation()` 会读取 init options（`ai`、`ai_skills` 等）决定 hook 命令在不同宿主的呈现形式：
  - Codex skills mode: `$speckit-<command>`
  - Claude skills mode: `/<speckit-<command>>`
  - Kimi: `/skill:<speckit-<command>>`
  - 否则回退到 `/<command_id>`。（Ref: `HookExecutor._render_hook_invocation`）

## Claims Supported

- “Spec Kit 的扩展 hooks 不是纯文档约定：其运行时语义包含 fail-closed 的 condition 求值、enabled/optional 的控制位、以及对不同宿主命令风格（`/` vs `$`）的渲染适配。”（主题 4 framework；机制/难点）

## Captured Excerpts (keep short)

> # Unknown condition format, default to False for safety

## Terms / Concepts

- `.specify/extensions.yml`
- extension hooks (enabled/optional/condition)
- condition evaluation (config/env)
- invocation rendering (`$speckit-*`, `/<speckit-*>`)

## Risks / Limits

- 该实现说明 “hooks 的配置/求值/展示”语义；hooks 的具体“自动执行与权限边界”仍需结合宿主对命令执行的授权模型、以及 extensions 具体实现进一步核验。

