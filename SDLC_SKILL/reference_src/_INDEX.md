# reference_src Index

目标：快速回答“某个判断的证据在哪里”，减少翻找成本。

维护方式：新增或更新 `reference_src/*.md` 后，同步补一行到这里即可。

| File | related_topic | trust_level | Supports (short) |
|---|---|---|---|
| _TEMPLATE-reference.md | shared | official | Template only |
| 00-shared-agentskills-overview.md | shared | official | Definition/value of Agent Skills; load on demand |
| 00-shared-agentskills-specification.md | shared | official | Directory + SKILL.md YAML frontmatter constraints |
| 00-shared-vercel-skills-cli-readme.md | shared | official | `npx skills` install/find/update model; source formats |
| 00-shared-anthropic-skills-readme.md | shared | official | Claude skills implementation; plugin marketplace install |
| 00-shared-anthropic-engineering-agent-skills-2025.md | shared | official | Progressive disclosure: metadata preload + on-demand loading |
| 00-shared-windsurf-workflows-docs.md | shared | official | Workflows are manual-only; storage/discovery/limits |
| 00-shared-gsd-readme.md | shared | official | Cross-host install formats; governance-oriented framework |
| 00-shared-owasp-llm-top10-v1-1.md | shared | academic | Security baseline: prompt injection, supply chain, plugins |
| 00-shared-cursor-vs-windsurf-blott-2025.md | shared | practitioner | Third-party comparison: context management differences |
| 01-host-claude-what-are-skills.md | host | official | Claude skills model: dynamic load + progressive disclosure |
| 01-host-claude-using-skills-in-claude.md | host | official | Enable/upload/share/provision skills in Claude UI |
| 01-host-claude-creating-custom-skills.md | host | official | Custom skill structure; metadata as progressive disclosure |
