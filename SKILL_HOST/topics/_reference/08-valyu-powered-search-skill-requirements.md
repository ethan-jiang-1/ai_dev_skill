# Valyu-Powered Search Skill Requirements

- source_url: https://skills.sh/yorkeccak/scientific-skills/drug-discovery-search
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 01:44:09 CST
- published_or_updated_at: crawled 2 months ago
- date_scope: 2026-Q1
- related_topic: 08
- trust_level: practitioner
- why_it_matters: demonstrates the tool/dependency-heavy end of research-skill design, where strength comes from deterministic data sources
- claims_supported: advanced research/search skills increasingly depend on explicit environment prerequisites and external APIs; Valyu is being used as a backend for domain search
- canonical_exception: no

## 关键事实

- The skill searches multiple drug-discovery databases using Valyu’s semantic search API.
- It declares explicit requirements:
  - Node.js 18+
  - Valyu API key
- It emphasizes unified results and semantic search rather than manual parameter construction.

## 与本研究的关系

- Important for Topic `08` because it shows that some “research skills” are really deterministic retrieval wrappers with domain specialization.
- Useful for contrasting tool-heavy search skills with workflow-heavy orchestration skills.

## 可直接引用的术语 / 概念

- `Valyu semantic search API`
- `Node.js 18+`
- `Valyu API key`
- `unified results`

## 模型 / 宿主 / 版本相关信息

- This kind of skill is especially sensitive to host support for scripts, env vars, external APIs, and permission models.

## 风险与局限

- Stronger retrieval quality comes with dependency management burden.
- Portability is limited if a host cannot easily support the required environment.

