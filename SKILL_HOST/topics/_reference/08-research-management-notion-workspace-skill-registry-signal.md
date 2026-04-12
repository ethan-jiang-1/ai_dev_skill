# Research Management (Notion Workspace) Skill Registry Signal

- source_url: https://skills.sh/qodex-ai/ai-agent-skills/research-management
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:20:00 CST
- published_or_updated_at: First Seen Jan 22, 2026 (skills.sh listing)
- date_scope: 2026-Q1
- related_topic: 08
- trust_level: practitioner
- why_it_matters: adds a 2026 “research workflow in a knowledge base” example (Notion), highlighting external-dependency portability and permission/tool breakpoints
- claims_supported: deep research skills often integrate external systems; these raise portability and maintenance costs; install portability can coexist with runtime dependency constraints
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Installation command:
  - `npx skills add https://github.com/qodex-ai/ai-agent-skills --skill research-management`
- Repository: `https://github.com/qodex-ai/ai-agent-skills`
- Weekly installs (listing): `63`
- First seen (listing): `Jan 22, 2026`
- Installs-across signal (listing UI): `opencode`, `gemini-cli`, `codex`, `cursor`, `github-copilot`
- Skill positioning (listing description): search Notion workspace → fetch/analyze pages → synthesize → create structured documentation

## 核心内容摘录

- This is a “deep research operations” shape: knowledge-base retrieval + synthesis + structured output.
- It also clearly indicates an external dependency boundary (Notion), which is a portability breakpoint even if the skill format is shared.

## 与本研究的关系

- Strengthens Topic `08` by adding an example that makes portability layers concrete:
  - not only host/runtime differences, but also third-party integration requirements and permission boundaries.
- Supports the Wave 2 framing: advanced research skills frequently hit “external dependency portability” earlier than users expect.

## 可直接引用的术语 / 概念

- `Notion workspace`
- `knowledge base retrieval`
- `synthesize findings`
- `structured documentation`

## 模型 / 宿主 / 版本相关信息

- This workflow is sensitive to:
  - host tool availability (ability to fetch/search)
  - permission envelope (whether the host can access external services)
  - integration credentials and environment management
- Even within one host, provider/tool gating can disable the intended research loop.

## 风险与局限

- External integrations create additional failure modes (auth, rate limits, data access policy, stale indexes).
- A registry listing does not guarantee that the skill includes robust error handling or security guidance.

