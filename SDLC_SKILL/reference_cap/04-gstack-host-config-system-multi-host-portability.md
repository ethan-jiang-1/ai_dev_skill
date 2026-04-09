# gstack: Host Config System (hosts/*.ts + adapters) for Multi-Host Skill Portability

- source_url: https://github.com/garrytan/gstack/tree/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/hosts
- source_type: official
- accessed_at: 2026-04-09 12:08:50 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: gstack 在代码层实现了“多宿主可移植”机制：用强类型 HostConfig 描述不同宿主（Claude/Codex/Cursor/OpenClaw 等）的安装根目录、frontmatter 字段约束、path/tool rewrites、metadata 生成与 suppressed resolvers，并支持 host-specific adapter 做语义级转换。这是“迁移价值判断”里最硬的工程证据之一，显示迁移并非靠口头约定，而是靠可执行的转换管道治理差异。
- claims_supported:
  - 多宿主兼容需要显式映射层（paths/frontmatter/tools/禁用能力），否则 skills 不能稳定迁移
  - host-specific adapter 用于处理字符串替换无法覆盖的语义差异（例如 AskUserQuestion/agent spawning/browse patterns）
  - 通过 allowlist/denylist 与 description limit 等约束，可把“宿主格式限制”前置为生成 gate
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: gen-skill-docs, setup, host adapters, openai.yaml metadata

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- file_paths:
  - hosts/index.ts
  - hosts/codex.ts
  - hosts/cursor.ts
  - hosts/openclaw.ts
  - scripts/host-config.ts
  - scripts/host-adapters/openclaw-adapter.ts

## 关键事实

- host registry：`hosts/index.ts` 维护 HostConfig 列表，并提供 alias 解析与外部宿主集合（non-Claude hosts 需要生成 skills）。
- HostConfig 的 declarative schema（`scripts/host-config.ts`）覆盖：
  - globalRoot/localSkillRoot/hostSubdir（安装与分发路径）
  - frontmatter transformation（allowlist/denylist、字段保留/剥离、descriptionLimit 与行为）
  - generation（是否生成 metadata、skip/include skills）
  - pathRewrites/toolRewrites/suppressedResolvers（内容层适配）
  - runtimeRoot/sidecar（运行时 symlinks 与 sidecar 结构）
  - install linkingStrategy（真实目录 symlink 或 symlink-generated）
- Codex host 配置示例（`hosts/codex.ts`）：
  - 生成 openai.yaml metadata
  - frontmatter allowlist（仅保留 name/description）并对 description 设定 1024 上限
  - suppressedResolvers：显式禁用某些 Claude-only resolver（如 REVIEW_ARMY）
  - boundaryInstruction：跨模型调用时的 anti-prompt-injection 边界提示
- Cursor host 配置示例（`hosts/cursor.ts`）：定义 `.cursor/skills/gstack` 的安装根与 path rewrites。
- OpenClaw host 配置示例（`hosts/openclaw.ts`）：
  - 将 `CLAUDE.md` rewrite 为 `AGENTS.md`
  - tool rewrites（Bash/Read/Write/Edit/Agent → OpenClaw 等价工具）
  - adapter：`openclaw-adapter.ts` 在 generic rewrites 后做语义级转换（AskUserQuestion → prose、Agent tool → sessions_spawn、`$B` 调用模式等）。

## 与本研究的关系

- 为 `round2_cap/04` 的迁移价值判断提供“可执行互操作层”的一手证据：真正可迁移的是 host adapter/rewrites/generation gates 等机制，而不是命令名或语气。
- 也为“迁移成本主因”提供证据：不同宿主对 frontmatter、工具名、路径约定、可用能力的差异需要持续维护映射层，否则会产生漂移与行为分叉。

## 可直接引用的术语 / 概念

- “Declarative host config system”
- “frontmatter allowlist/denylist”
- “pathRewrites / toolRewrites / suppressedResolvers”
- “host adapter — post-processing content transformer”

## captured_excerpt

摘录（来自 `scripts/host-config.ts` / `openclaw-adapter.ts` 注释）：

> “Declarative host config system.”
>
> “post-processing content transformer … string-replace can't cover”

## 风险与局限

- 映射层本身是长期维护负担（每个宿主升级/格式变化都会引入兼容债）。
- 目前样本覆盖的宿主是有限集合；企业内部宿主或自研平台可能需要自定义 HostConfig 与 adapter。

