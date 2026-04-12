# skills.sh Docs, Registry Safety, and Telemetry

- source_url: https://skills.sh/docs
- source_type: official_registry_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled last month before access
- date_scope: current-2026
- related_topic: 06, 07, 08
- trust_level: official
- why_it_matters: this is one of the clearest 2026 signals that skills now have a distribution and ranking layer beyond raw GitHub repositories
- claims_supported: skills.sh provides install docs; ranking is based on anonymous CLI telemetry; the ecosystem has explicit security-audit language but no blanket safety guarantee
- canonical_exception: no

## 关键事实

- `skills.sh` positions itself as a place to discover, install, and use skills with AI agents.
- Installation is centered on the `skills` CLI, for example `npx skills add vercel-labs/agent-skills`.
- Rankings on the leaderboard are driven by anonymous telemetry from skill installs.
- The docs say the telemetry tracks installs, not personal usage details.
- The docs also state there are routine security audits, while explicitly warning that not every listed skill can be guaranteed safe or high quality.

## 与本研究的关系

- Important for Topic `06` because it turns distribution, telemetry, and audit posture into explicit comparison axes.
- Important for Topic `07` and Topic `08` because many users will discover writing and research skills through registries rather than from scratch.

## 可直接引用的术语 / 概念

- `skills leaderboard`
- `anonymous telemetry`
- `routine security audits`
- `cannot guarantee the quality or security of every skill`

## 模型 / 宿主 / 版本相关信息

- This source is about ecosystem tooling, not a single host.
- It is especially relevant to discovery, trust, and adoption trends.

## 风险与局限

- Registry telemetry is an adoption signal, not a quality guarantee.
- Security-audit language reduces naive trust, but does not replace per-skill review.

