# Hugging Face Hub Docs: Agent Skills

- source_url: https://huggingface.co/docs/hub/en/agents-skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: supply
- trust_level: official
- why_it_matters: Hugging Face 用官方 Hub 文档把 skills 作为“curated set + SKILL.md 资产 + 多宿主兼容”的供给层产品化，提供可引用的安装与技能清单口径。

## Key Facts

- 文档定位：Hugging Face 提供 curated set 的 skills，覆盖训练、数据集创建、评估、实验追踪等；每个 skill 是自包含 `SKILL.md`，agent 在任务中遵循其指令。
- 兼容宿主：文档明确支持 Claude Code、OpenAI Codex、Google Gemini CLI、Cursor，并指向 agentskills.io 了解格式。
- 安装（文档示例）：通过 Claude Code plugin marketplace 注册 `huggingface/skills` 并安装指定 skill（`/plugin marketplace add huggingface/skills`、`/plugin install <skill-name>@huggingface/skills`）。
- 文档列出 Available Skills（如 hf-cli、huggingface-datasets、huggingface-llm-trainer 等）及用途。

## Claims Supported

- “企业第一方供给在产品层面会把 skills 做成 curated set 并提供官方清单口径。”（主题3 supply）
- “企业第一方 docs 会显式对齐 Agent Skills 标准（agentskills.io）并声明多宿主兼容。”（主题1 host；主题3 supply）

## Captured Excerpts (keep short)

> Each Skill is a self-contained SKILL.md that your agent follows...

## Terms / Concepts

- curated set
- SKILL.md as instruction asset

## Risks / Limits

- 页面提到多宿主安装标签，但示例主要展示 Claude Code 安装；Codex/Gemini/Cursor 的具体落盘/manifest 仍需分别抓官方细则。

