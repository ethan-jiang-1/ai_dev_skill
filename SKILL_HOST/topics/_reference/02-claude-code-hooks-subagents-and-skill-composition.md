# Claude Code Hooks, Subagents, and Skill Composition

- source_url: https://code.claude.com/docs/en/hooks
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current hooks reference snapshot accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 02, 08
- trust_level: official
- why_it_matters: Claude’s strongest workflows are not pure skills; they are compositions of skills with hooks and subagents
- claims_supported: hooks can run shell commands, HTTP endpoints, prompts, or agent checks; hooks have security risk; async hooks exist; subagents can preload skills, choose models, control tools, and maintain project/user/local memory
- canonical_exception: no

## 关键事实

- Claude hooks can execute:
  - command hooks
  - HTTP hooks
  - prompt hooks
  - agent hooks
- Hooks run with the user’s system permissions and the docs include explicit security warnings.
- Async hooks are supported for `command` hooks and do not block Claude’s main execution.
- Subagents can:
  - choose models explicitly or inherit
  - restrict tools via allowlists or denylists
  - preload skills into their context
  - enable persistent memory at `user`, `project`, or `local` scope
- Subagent memory can be version-controlled at project scope.
- Subagent frontmatter and settings can define hook behavior during subagent execution.

## 与本研究的关系

- Central to Topic `02` because it shows where Claude’s most advanced skill-based workflows actually live.
- Central to Topic `08` because research workflows often need this composition pattern.

## 可直接引用的术语 / 概念

- `agent hooks`
- `async hooks`
- `hooks run with your full user permissions`
- `preload skills into subagents`
- `project / user / local memory`

## 模型 / 宿主 / 版本相关信息

- This source directly links workflow power to model selection, tool restrictions, and memory scope.
- It is strong evidence that Claude’s skill ceiling depends heavily on surrounding host capabilities.

## 风险与局限

- This source is powerful but also shows complexity: security, context inflation, and behavioral coupling increase fast once hooks and subagents are involved.

