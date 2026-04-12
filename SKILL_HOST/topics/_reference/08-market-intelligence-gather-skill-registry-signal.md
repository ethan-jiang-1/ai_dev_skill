# Market Intelligence Gather Skill Registry Signal

- source_url: https://skills.sh/qodex-ai/ai-agent-skills/market-intelligence-gather
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:20:00 CST
- published_or_updated_at: First Seen Jan 22, 2026 (skills.sh listing)
- date_scope: 2026-Q1
- related_topic: 08
- trust_level: practitioner
- why_it_matters: adds a 2026 market-intelligence deep-research example that depends on extraction + analysis, aligning with “research skills encode decomposition + validation, not only search”
- claims_supported: deep research skills are role-shaped (market intel); they often imply external retrieval and permission constraints; install portability can be broad while runtime constraints diverge by host/provider
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Installation command:
  - `npx skills add https://github.com/qodex-ai/ai-agent-skills --skill market-intelligence-gather`
- Repository: `https://github.com/qodex-ai/ai-agent-skills`
- Weekly installs (listing): `77`
- First seen (listing): `Jan 22, 2026`
- Installs-across signal (listing UI): `opencode`, `gemini-cli`, `codex`, `cursor`, `github-copilot`
- Skill positioning (listing description): extract competitor ads from ad libraries; analyze use cases/problems/copy/creative that resonates

## 核心内容摘录

- The listing encodes a multi-step research workflow: locate sources (ad libraries) → extract artifacts → analyze themes and positioning → synthesize actionable insights.
- This is a representative “market research” sub-type of deep research skills.

## 与本研究的关系

- Extends Topic `08` taxonomy beyond “academic papers” into market intelligence.
- Reinforces the maintenance/runtime theme: success depends on real retrieval tooling, permissions, and provider support, not on file format alone.

## 可直接引用的术语 / 概念

- `market intelligence`
- `ad libraries`
- `positioning analysis`
- `copy/creative analysis`

## 模型 / 宿主 / 版本相关信息

- This workflow class is tool-surface sensitive: if `websearch/webfetch` (or equivalent) is gated or unreliable, the skill becomes non-functional or shallow.
- Different hosts/providers may have different browsing policies; the same skill can “install” but fail to execute its intended research loop.

## 风险与局限

- Market-intel workflows are vulnerable to stale data and unverifiable claims; strong evidence discipline is required.
- The listing does not itself prove the skill includes robust validation/attribution; it is an adoption signal and workflow-shape signal.

