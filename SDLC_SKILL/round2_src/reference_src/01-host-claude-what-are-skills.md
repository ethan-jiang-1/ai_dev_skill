# Claude Support: What are skills?

- source_url: https://support.claude.com/en/articles/12512176-what-are-skills
- source_type: official_docs
- accessed_at: 2026-04-08
- published_at:
- related_topic: host
- trust_level: official
- why_it_matters: 给出 Claude 侧 “skills 的运行机制（progressive disclosure、动态加载）+ 分类（Anthropic/Custom/Org/Partner）+ 启用前提（code execution）”，用于区分“开放格式”与“宿主实现语义”。

## Key Facts

- Skills 定义：包含 instructions、scripts、resources 的文件夹；Claude 会动态加载以提升特定任务表现。
- 机制：skills 通过 progressive disclosure 工作，Claude 判断相关性并加载完成任务所需信息，以避免 context window overload。
- 类型：
  - Anthropic Skills：由 Anthropic 维护，Claude 会在相关时自动调用（文档创建类技能作为示例）。
  - Custom Skills：用户/组织创建，用于特定工作流与领域任务；可附带可执行脚本。
  - Organization provisioned skills：Team/Enterprise Owner 可为组织预置，默认启用/禁用可控。
  - Partner skills：来自合作伙伴的专业技能，文中提到与 MCP connectors 的集成设计。
- 可用性：文中说明 skills 面向多种 Claude 计划可用，并强调需要启用 code execution。
- 开放标准：文中明确提到 Agent Skills 规范作为 open standard 发布在 agentskills.io（并提及 reference Python SDK）。

## Claims Supported

- “progressive disclosure 是 Claude skills 的核心运行机制之一（不是一次性注入全部上下文）。”（主题1 机制）
- “同一概念下存在官方技能、个人技能、组织技能、伙伴技能等供给层级。”（主题3 供给与治理）

## Captured Excerpts (keep short)

> Skills work through progressive disclosure...

## Terms / Concepts

- progressive disclosure
- context window overload
- organization provisioned skills
- partner skills (MCP connectors)

## Risks / Limits

- 该文档描述 Claude 侧语义与产品能力；与 Agent Skills 规范的字段约束并不完全等价，需要单独对齐差异。

