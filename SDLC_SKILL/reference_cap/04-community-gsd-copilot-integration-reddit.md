# Community Feedback (Reddit, r/GithubCopilot): Porting GSD to GitHub Copilot, Migration Frictions and Trust Concerns

- source_url: https://www.reddit.com/r/GithubCopilot/comments/1qvv7lh/gsd_get_shit_done_now_works_with_github_copilot/
- source_type: community
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 04-map-migration
- trust_level: community
- why_it_matters: 这是“真实迁移/复用行为”的社区样本：用户把 GSD 从 Claude Code → Kilo Code → GitHub Copilot 迁移，并在讨论中暴露出语言依赖、宿主互操作、MCP 安装信任与工具原生能力替代等现实摩擦点。
- claims_supported:
  - “能力单元工件（prompts/agents/skills/instructions）确实在不同宿主之间迁移复用”
  - 迁移的主要摩擦来自宿主差异（目录结构、工具名、原生命令）而不只是 prompt 文本
  - 社区对外部 MCP/插件存在供应链与信任顾虑（下载量、必要性、替代方案）
- date_scope: thread shows “2mo ago” relative timestamp on 2026-04-09 (approx Feb 2026)
- related_frameworks: get-shit-done (GSD), GitHub Copilot (customization), Kilo Code
- related_tools: VS Code Copilot Custom Agents / Prompt Files / Instructions, MCP

## 关键事实

- 发帖者宣称把 GSD 迁移到了 GitHub Copilot，并列出迁移产物规模（prompt files、custom agents、agent skills、instruction files）。
- 讨论中出现的真实摩擦点（节选）：
  - 对“语言依赖”的反感：有人质疑把 TypeScript 相关内容硬塞进框架；有人表示 fork 中移除了 TypeScript 只保留 md。
  - 对 MCP 的信任/必要性疑问：有人提到某 MCP 下载量很少因此不愿安装，并询问是否可用宿主内建 askQuestion 工具替代。
  - 对“为何需要 port”的质疑：有人认为 Copilot/Cursor 可能直接读取 `.claude` skills/agents；发帖者回应是为了适配 Copilot 的 `.github` 目录结构与工具名差异。
  - 兼容与导入路径：用户讨论如何让 Copilot 识别 `.claude` agents/skills，以及 GSD workflows/references 如何正确导入。

## 与本研究的关系

- 直接为 digested_cap/04 的“迁移价值判断”提供社区证据：迁移不是“能不能复制文件”，而是“宿主对配置机制的支持程度 + 插件/MCP 供应链治理 + 语言/工具链的可移植性”。

## 可直接引用的术语 / 概念

- “fresh context per task”
- “planner / executor / verifier / debugger”
- “works with VS Code's native Copilot customization features”
- “not mandatory to download [MCP]”

## captured_excerpt

摘录（来自帖子正文与评论，保持简短）：

> “Now I've ported it to GitHub Copilot.”
>
> “I'm hesitant to install stuff like this.”

## 风险与局限

- Reddit 属于低信源强度：观点代表性不明、细节可能有误；其价值主要在于捕捉迁移摩擦与用户顾虑，而非作为“机制必然有效”的证据。
- 线程讨论的是一个具体 port 的实现路径；是否能推广到企业环境仍需更多案例与工程数据。

