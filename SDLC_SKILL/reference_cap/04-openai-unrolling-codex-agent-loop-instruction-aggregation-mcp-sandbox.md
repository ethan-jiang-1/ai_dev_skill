# OpenAI: Unrolling the Codex Agent Loop (Instruction Aggregation, Sandboxing Boundaries, MCP Tool Caveats)

- source_url: https://openai.com/index/unrolling-the-codex-agent-loop/
- source_type: official
- accessed_at: 2026-04-09 12:54:09 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: 该文给出了 Codex agent loop 的关键“可复核机制细节”：指令如何从多层 AGENTS.md/override 文件聚合、32KiB 上限、sandbox message 的真实边界（只覆盖 shell tool）、以及 MCP server tools 的非 sandbox 属性与缓存/通知 caveats。这些细节直接影响“可迁移形态”“安全边界”“互操作成本”。
- claims_supported:
  - Codex 运行时会从多个位置聚合指令（含 `AGENTS.override.md` / `AGENTS.md`），并对总字节数做上限约束
  - 指令聚合遍历 root→cwd 路径段，形成可解释的 precedence 规则
  - “sandboxed environment”语义只覆盖 shell tool；MCP server tools 并不自动 sandbox
  - MCP 工具的运行时行为（例如 list_changed 通知）会与缓存策略交互，导致 cache misses
  - 存在 output cap（保留 beginning/end）与 compaction 策略以控制上下文与输出规模
- date_scope: accessed 2026-04-09 (page may evolve rapidly)
- related_frameworks: Codex, AGENTS.md, MCP (Model Context Protocol)
- related_tools: $CODEX_HOME, instruction files, shell sandbox, MCP server tools, caching, compaction

## 关键事实

- Codex 的 instruction 聚合会显式查找并拼接多层指令文件：
  - `AGENTS.override.md` / `AGENTS.md` at `$CODEX_HOME`
  - `AGENTS.override.md` / `AGENTS.md` at repository root
  - 以及从 repo root 到当前工作目录（cwd）的逐级目录中同名文件
  - 并限制 instruction files 总大小为 32KiB（超过则截断或停止纳入）。`source_url`
- 文中明确澄清安全边界：
  - “shell tool is sandboxed”
  - 但 “MCP server tools are not” （即 MCP tool 不会因为同一句 sandbox 描述而自动获得同等隔离）。`source_url`
- 文中记录 MCP runtime caveat：当 MCP server 的 `list_tools` 支持 list_changed 通知时，通知会导致 Codex 缓存 miss，从而被迫重新拉取 tool list。`source_url`
- 文中描述 agent loop 的输出治理：对 output length 设上限，达到上限时保留输出的开头与结尾，并标注中间被移除；并在多步过程中进行 compaction 以保留关键信息。`source_url`

## 与本研究的关系

- 为 `round2_cap/04` 的“迁移价值/互操作成本”提供一手细节：AGENTS.md 不只是一个文件名，而是多层 precedence + size cap 的可执行协议；这决定了跨工具迁移时需要考虑的落盘位置与 override 机制。
- 为“安全与治理”提供边界证据：shell sandbox 与 MCP tools 的隔离属性不同，意味着企业把能力单元外移到 MCP 时必须显式补安全门禁与权限治理（不能误以为默认 sandbox 覆盖一切）。

## 可直接引用的术语 / 概念

- “Instruction files include … AGENTS.override.md and AGENTS.md …”
- “we cap the total size … at 32 KiB”
- “While the shell tool is sandboxed … MCP server tools are not.”
- “list_changed notifications … cause a cache miss”

## captured_excerpt

摘录（来自安全边界澄清段落，保持简短）：

> “While the shell tool is sandboxed … MCP server tools are not.”

## 风险与局限

- 该文强调实现细节与 caveats；但这些细节随产品快速演化，落地应以当期官方 docs 与实际行为测试为准。
- “MCP tools not sandboxed”并不等价“不可用”；它提示需要在企业治理中显式补上权限、审批、隔离与审计。

