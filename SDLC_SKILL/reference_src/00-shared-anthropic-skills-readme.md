# anthropics/skills: README

- source_url: https://github.com/anthropics/skills
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: shared
- trust_level: official
- why_it_matters: 作为 Agent Skills 格式的权威参考实现之一，README 同时给出 Claude/Claude Code 的使用与安装路径（/plugin marketplace/install）。

## Key Facts

- 仓库定位：Anthropic 为 Claude 实现的 skills（并提示 Agent Skills 标准信息见 agentskills.io）。
- README 定义 skills：包含指令、脚本、资源的文件夹；Claude 会动态加载以提升特定任务表现。
- 仓库包含示例技能，覆盖创意、技术、企业工作流等；每个 skill 在独立文件夹，包含 `SKILL.md`（指令+元数据）。
- 许可策略：部分技能 Apache-2.0 开源；文档创建与编辑类技能（docx/pdf/pptx/xlsx）标注为 source-available（非开源），但作为复杂生产技能参考开放。
- Claude Code 安装路径：
  - 可将仓库注册为 Claude Code Plugin marketplace（README 给出 `/plugin marketplace add anthropics/skills`）。
  - 可通过 marketplace 浏览安装或直接 `/plugin install ...` 安装指定插件。
- README 给出最小技能示例，强调 frontmatter 的 `name` 与 `description`。

## Claims Supported

- “官方宿主平台通过自己的机制（plugin marketplace/install）来分发与挂载 skills。”（主题1 host 与主题2 dist 交叉）
- “真实技能不仅是 prompt，还可能带脚本与资源；同时存在开源与 source-available 的供给模式。”（主题3 supply 与主题2 安全/治理）

## Captured Excerpts (keep short)

> Skills are folders of instructions, scripts, and resources that Claude loads dynamically...

> This repository contains Anthropic's implementation of skills for Claude.

## Terms / Concepts

- plugin marketplace
- source-available skills

## Risks / Limits

- README 明确“示例用途”，并提醒实际行为可能不同；作为模式参考需要结合实际运行验证。

