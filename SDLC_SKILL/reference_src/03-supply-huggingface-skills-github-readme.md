# huggingface/skills: README

- source_url: https://github.com/huggingface/skills
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: Hugging Face 的官方 skills 仓库是“企业第一方 + 多宿主兼容 + MCP/插件清单化治理”的综合样本，并给出 Codex/Gemini/Cursor 的适配方式与 fallback（AGENTS.md）。

## Key Facts

- 仓库定位：面向 AI/ML 任务（数据集、训练、评估等）的 Hugging Face Skills；声称可与 Codex/Claude Code/Gemini CLI/Cursor 等主流工具互操作。
- 仓库声明遵循 Agent Skills 标准格式（skills 目录下每个 skill 是自包含文件夹，含 `SKILL.md` 与可选脚本/资源）。
- README 明确提出“术语与实现差异”：
  - “Skills”是 Anthropic 术语；
  - OpenAI Codex 使用 Agent Skills 格式并从标准 `.agents/skills` 位置发现（README 指向 Codex Skills guide）；
  - Gemini 使用 extensions（`gemini-extension.json`）；
  - 仓库提供 `agents/AGENTS.md` 作为不支持 skills 的 fallback。
- 安装/适配方式（README 列出）：
  - Claude Code：通过 plugin marketplace 注册并安装指定 skill。
  - Codex：将 `skills/` 中需要的 skill copy/symlink 到 Codex 的 `.agents/skills` 位置；并提到 `AGENTS.md` fallback。
  - Gemini CLI：通过 `gemini extensions install` 安装（支持本地或 GitHub URL，并需 `--consent`）。
  - Cursor：仓库包含 Cursor plugin manifests（如 `.cursor-plugin/plugin.json`）与 `.mcp.json`（配置 Hugging Face MCP server URL），通过 Cursor plugin flow 安装。
- README 解释 marketplace.json 与 `SKILL.md` description 的差异：`SKILL.md` description 用于 Claude 激活匹配，而 marketplace 描述面向人类浏览；CI 校验 name/path 一致性。

## Claims Supported

- “企业第一方供给的高价值在于：它能同时提供‘官方工作流’与‘跨宿主适配层（manifest/extension/fallback）’，而不是单一宿主专用 prompt。”（主题3 supply）
- “skills 与 MCP 会在供给侧合流：仓库同时提供 skill 指令与 MCP server 配置入口（.mcp.json）。”（主题3 MCP 共生）

## Captured Excerpts (keep short)

> This repo is compatible with all of them, and more!

## Terms / Concepts

- `.cursor-plugin/plugin.json`
- `.mcp.json` (MCP server URL config)
- `agents/AGENTS.md` fallback
- marketplace.json vs SKILL.md description

## Risks / Limits

- README 包含对其他宿主（Codex/Gemini/Cursor）的适配描述，需分别用对应宿主官方文档核验“标准位置/manifest schema”等细节与时效性。

