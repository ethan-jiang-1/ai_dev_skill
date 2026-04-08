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
| 01-host-opencode-agent-skills-docs.md | host | official | OpenCode skill discovery paths + permissions + tool disable |
| 01-host-windsurf-skills-docs.md | host | official | Windsurf skill scopes/paths + progressive disclosure + @mention |
| 01-host-cursor-plugins-blog-2026-02-17.md | host | official | Cursor plugin primitives; curated marketplace; team governance trend |
| 01-host-cursor-forum-plugins-2-5.md | host | official | Cursor plugin install via /add-plugin; marketplace |
| 01-host-cursor-forum-cli-mode-plugins-bug.md | host | community | Failure mode: IDE vs CLI plugin loading mismatch |
| 02-dist-sundial-home.md | dist | official | Hub positioning; scale + “verified” claim |
| 02-dist-sundial-docs-cli.md | dist | official | CLI install; agent target directories; auth; global/local |
| 02-dist-sundial-docs-push-publish.md | dist | official | Push/publish; immutable snapshots; auto-bump; visibility |
| 02-dist-sundial-docs-security.md | dist | official | Scanning pipeline: Cisco AI Skill Scanner + Semgrep + review |
| 02-dist-sundial-docs-specification.md | dist | official | SKILL.md fields + practice constraints (<=500 lines, refs) |
| 02-dist-vercel-skills-docs-source-formats.md | dist | official | Source detection logic + well-known endpoint for skills CLI |
| 02-dist-lobehub-github-readme.md | dist | official | “10,000+ Skills” scale claim + MCP-compatible plugins |
| 02-dist-lobehub-market-cli-npm.md | dist | practitioner | Marketplace CLI package existence (name/version/homepage) |
| 03-supply-expo-docs-expo-skills.md | supply | official | Expo official skills + install via Claude/Cursor/skills CLI + MCP |
| 03-supply-expo-site-expo-skills.md | supply | official | Expo skills official landing + CLI command |
| 03-supply-expo-skills-github-readme.md | supply | official | expo/skills install + Cursor auto-discovery vs / commands |
| 03-supply-cloudflare-skills-github-readme.md | supply | official | Cloudflare skills + commands + remote MCP servers supply |
| 03-supply-huggingface-skills-github-readme.md | supply | official | HF skills: cross-host compatibility + manifests + governance split |
| 03-supply-huggingface-docs-agent-skills.md | supply | official | HF Hub docs: curated skills + install + available skills |
| 03-supply-cloudflare-mcp-guide.md | supply | official | MCP terminology + remote vs local + best practices (Cloudflare) |
| 03-supply-awesome-agent-skills-voltagent.md | supply | community | Curated awesome index for official/community agent skills |
| 03-supply-awesome-mcp-servers.md | supply | community | Curated index: MCP reference/official servers |
| 03-supply-mcp-base-protocol-2025-06-18.md | supply | official | MCP base protocol: JSON-RPC + auth + schema |
| 04-framework-aider-conventions-docs.md | framework | official | Aider conventions: read-only load + prompt caching + config |
| 04-framework-aider-conventions-github-readme.md | framework | official | Conventions template repo; project-level governance via CONVENTIONS.md |
| 04-framework-bmad-method-github-readme.md | framework | official | BMAD: scale-adaptive agile framework + modules + installer |
| 04-framework-feature-driven-flow-github-readme.md | framework | official | FDF: fixed 7 phases + rule matrix + gates + overlays |
| 04-framework-gstack-github-readme.md | framework | official | gstack: role-based virtual team + team mode + host targeting |
| 04-framework-openspec-github-readme.md | framework | official | OpenSpec: artifact-guided workflow for brownfield changes |
| 04-framework-roo-code-custom-instructions-docs.md | framework | official | Roo Code rules: file locations + load order + AGENTS.md |
| 04-framework-roo-code-custom-modes-docs.md | framework | official | Roo Code modes: tool/file permissions + import/export |
| 04-framework-spec-kit-github-readme.md | framework | official | Spec Kit: spec-driven phases + commands + extension boundaries |
| 04-framework-superpowers-github-readme.md | framework | official | Superpowers: mandatory skill-driven SDLC workflow + TDD gates |
