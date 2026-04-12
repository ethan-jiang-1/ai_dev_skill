# skills.sh Ecosystem Usage Signals

- source_url: https://skills.sh/vercel-labs
- source_type: official_registry_listing
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled last month before access; includes 2026 first-seen and install counters on skill pages
- date_scope: 2026-Q1
- related_topic: 06, 07, 08
- trust_level: official
- why_it_matters: gives concrete evidence that the ecosystem now has measurable install volume and cross-host usage patterns
- claims_supported: skills.sh tracks repos, skills, and total installs; individual skill pages show first-seen dates and per-host install distribution; discovery and adoption now have observable market signals
- canonical_exception: no

## 关键事实

- The `skills.sh/vercel-labs` listing showed dozens of repos, dozens of skills, and very large aggregate install counts as of access.
- The `find-skills` skill page documents a package-manager style workflow for discovering and installing ecosystem skills.
- Individual skill pages can show:
  - `First Seen` dates in 2026
  - weekly installs
  - host breakdowns such as installs on `codex`, `opencode`, `gemini-cli`, `claude-code`, and others
- This means at least some skills are now being tracked as cross-host installable artifacts, not just repo folders.

## 与本研究的关系

- Strong support for Topic `06` because it provides live ecosystem and interoperability signals.
- Strong support for Topic `07` and `08` because discovery and selection increasingly happen through ranked registry flows.

## 可直接引用的术语 / 概念

- `First Seen`
- `weekly installs`
- `installed on codex / opencode / claude-code`
- `find-skills`

## 模型 / 宿主 / 版本相关信息

- Registry host breakdowns are especially useful for studying where skills are actually being installed across agent clients.

## 风险与局限

- Install counts are adoption signals, not proof of runtime quality.
- Registry data may overweight hosts that integrate the CLI or telemetry more directly.

