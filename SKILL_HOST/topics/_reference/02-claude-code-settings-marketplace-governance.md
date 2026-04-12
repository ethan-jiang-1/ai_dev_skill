# Claude Code Settings and Marketplace Governance

- source_url: https://code.claude.com/docs/en/settings
- source_type: official_docs
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-canonical
- related_topic: 02
- trust_level: official
- why_it_matters: shows how Claude governs plugin and marketplace rollout across user, project, local, and managed settings
- claims_supported: enabledPlugins and extraKnownMarketplaces are scoped; managed settings can hide plugins and block installation; repository marketplaces require trust and explicit consent
- canonical_exception: no

## 关键事实

- `enabledPlugins` can be set in:
  - user settings
  - project settings
  - local settings
  - managed settings
- Managed settings can block installation at all scopes and hide the plugin from the marketplace.
- `extraKnownMarketplaces` can pre-register marketplace sources in repository settings so team members can discover required plugin sources.
- Repository marketplace installation still respects trust boundaries and explicit consent.
- `strictKnownMarketplaces` exists as a stronger organizational policy mechanism than `extraKnownMarketplaces`.

## 与本研究的关系

- Important for Topic `02` because it shows Claude’s ecosystem is not just extensible, but governable.
- Useful for enterprise/team discussions about security and rollout.

## 可直接引用的术语 / 概念

- `enabledPlugins`
- `extraKnownMarketplaces`
- `strictKnownMarketplaces`
- `managed settings`
- `explicit consent`

## 模型 / 宿主 / 版本相关信息

- These are host-governance features, not model features.
- They materially affect how reusable skills can be deployed in managed environments.

## 风险与局限

- Governance controls help manage trust, but they also add rollout complexity and more places where behavior can differ by environment.

