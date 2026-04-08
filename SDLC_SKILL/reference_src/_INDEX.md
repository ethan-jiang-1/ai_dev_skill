# reference_src Index

目标：快速回答“某个判断的证据在哪里”，减少翻找成本。

维护方式：新增或更新 `reference_src/*.md` 后，同步补一行到这里即可。

| File | related_topic | trust_level | Supports (short) |
|---|---|---|---|
| _TEMPLATE-reference.md | shared | official | Template only |
| 00-shared-agentskills-overview.md | shared | official | Definition/value of Agent Skills; load on demand |
| 00-shared-agentskills-specification.md | shared | official | Directory + SKILL.md YAML frontmatter constraints |
| 00-shared-cloudflare-agent-skills-discovery-rfc-0-2-0.md | shared | official | Well-known discovery spec v0.2.0: agent-skills path + schema/type/url/digest + verification + archive safety |
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
| 01-host-google-gemini-cli-extensions-reference.md | host | official | Gemini CLI extensions: manifest + install/update/disable + MCP/skills bundle |
| 01-host-opencode-agent-skills-docs.md | host | official | OpenCode skill discovery paths + permissions + tool disable |
| 01-host-openai-codex-agent-skills-docs.md | host | official | Codex skills: .agents/skills scanning + progressive disclosure + plugins |
| 01-host-windsurf-skills-docs.md | host | official | Windsurf skill scopes/paths + progressive disclosure + @mention |
| 01-host-cursor-plugins-blog-2026-02-17.md | host | official | Cursor plugin primitives; curated marketplace; team governance trend |
| 01-host-cursor-plugins-github-readme.md | host | official | Official plugin repo structure: marketplace.json + per-plugin plugin.json + packaged primitives dirs |
| 01-host-cursor-plugins-json-schemas.md | host | official | JSON Schemas for plugin.json + marketplace.json; formal field constraints + source semantics |
| 01-host-cursor-plugins-create-plugin-scaffold-skill.md | host | official | Official SKILL.md states default local plugin directory ~/.cursor/plugins/local/... (no install step) |
| 01-host-cursor-plugins-hooks-runtime-contract.md | host | official | Cursor plugin hooks runtime contract: stop/afterAgentResponse + followup_message semantics |
| 01-host-cursor-forum-plugins-2-5.md | host | official | Cursor plugin install via /add-plugin; marketplace |
| 01-host-cursor-forum-cli-mode-plugins-bug.md | host | community | Failure mode: IDE vs CLI plugin loading mismatch |
| 01-host-github-copilot-repo-custom-instructions.md | host | official | Copilot repo instructions: .github/copilot-instructions.md + .github/instructions + AGENTS.md precedence |
| 01-host-github-copilot-cli-custom-instructions.md | host | official | Copilot CLI instructions: AGENTS.md + COPILOT_CUSTOM_INSTRUCTIONS_DIRS + local instructions |
| 01-host-github-copilot-cli-allowing-tools.md | host | official | Copilot CLI tool permissions: available/excluded + allow/deny + yolo + reset |
| 01-host-github-copilot-cli-configure.md | host | official | Copilot CLI config: trusted_folders + ~/.copilot/config.json + COPILOT_HOME |
| 01-host-github-copilot-cli-command-reference.md | host | official | Copilot CLI slash commands + MCP options + settings scopes + env vars |
| 02-dist-sundial-home.md | dist | official | Hub positioning; scale + “verified” claim |
| 02-dist-sundial-docs-cli.md | dist | official | CLI install; agent target directories; auth; global/local |
| 02-dist-sundial-docs-push-publish.md | dist | official | Push/publish; immutable snapshots; auto-bump; visibility |
| 02-dist-sundial-docs-security.md | dist | official | Scanning pipeline: Cisco AI Skill Scanner + Semgrep + review |
| 02-dist-sundial-docs-specification.md | dist | official | SKILL.md fields + practice constraints (<=500 lines, refs) |
| 02-dist-vercel-skills-docs-source-formats.md | dist | official | Source detection logic + well-known endpoint for skills CLI |
| 02-dist-vercel-skills-docs-lock-files.md | dist | official | Global/local lock files + skillFolderHash/computedHash + team-friendly design |
| 02-dist-vercel-skills-docs-update-system.md | dist | official | Update system: skills check/update + remote API hash comparison |
| 02-dist-vercel-skills-well-known-index-schema.md | dist | official | Well-known index.json schema + agent-skills preferred + validation rules |
| 02-dist-x-docs-skill-md.md | dist | official | X docs: skills CLI install + well-known endpoints (agent-skills 0.2.0 + legacy skills) |
| 02-dist-x-well-known-agent-skills-index-json.md | dist | official | X well-known agent-skills index.json (v0.2.0 with $schema/type/url/digest) |
| 02-dist-x-well-known-skills-index-json.md | dist | official | X well-known skills index.json (legacy files format) |
| 02-dist-backstage-docs-ai-skills.md | dist | official | Backstage docs: npx skills add consumes well-known skills index; updates offer upstream merge |
| 02-dist-backstage-well-known-skills-index-json.md | dist | official | Backstage well-known skills index.json (legacy files format) |
| 02-dist-cognite-well-known-agent-skills-index-json.md | dist | official | Cognite well-known agent-skills index.json (v0.2.0 with $schema/type/url/digest) |
| 02-dist-cognite-well-known-skills-index-json.md | dist | official | Cognite well-known skills index.json (legacy files format) |
| 02-dist-lobehub-github-readme.md | dist | official | “10,000+ Skills” scale claim + MCP-compatible plugins |
| 02-dist-lobehub-market-cli-npm.md | dist | practitioner | Marketplace CLI package existence (name/version/homepage) |
| 03-supply-expo-docs-expo-skills.md | supply | official | Expo official skills + install via Claude/Cursor/skills CLI + MCP |
| 03-supply-expo-site-expo-skills.md | supply | official | Expo skills official landing + CLI command |
| 03-supply-expo-skills-github-readme.md | supply | official | expo/skills install + Cursor auto-discovery vs / commands |
| 03-supply-cloudflare-skills-github-readme.md | supply | official | Cloudflare skills + commands + remote MCP servers supply |
| 03-supply-huggingface-skills-github-readme.md | supply | official | HF skills: cross-host compatibility + manifests + governance split |
| 03-supply-huggingface-docs-agent-skills.md | supply | official | HF Hub docs: curated skills + install + available skills |
| 03-supply-cognite-docs-ide-ai-integration.md | supply | official | Cognite docs: MCP server + SKILL.md capability file install/update via npx skills + well-known |
| 03-supply-cloudflare-mcp-guide.md | supply | official | MCP terminology + remote vs local + best practices (Cloudflare) |
| 03-supply-awesome-agent-skills-voltagent.md | supply | community | Curated awesome index for official/community agent skills |
| 03-supply-awesome-mcp-servers.md | supply | community | Curated index: MCP reference/official servers |
| 03-supply-mcp-base-protocol-2025-06-18.md | supply | official | MCP base protocol: JSON-RPC + auth + schema |
| 03-supply-mcp-servers-github-readme.md | supply | official | Official reference servers + MCP Registry pointer + security boundaries |
| 03-supply-mcp-registry-github-readme.md | supply | official | MCP Registry overview; preview/API freeze; publishing auth + namespace verification |
| 03-supply-mcp-registry-quickstart-publish.md | supply | official | Publish flow with mcp-publisher; registry hosts metadata only; server.json + verification |
| 03-supply-mcp-registry-authentication.md | supply | official | Auth methods; namespace formats; DNS/HTTP well-known verification |
| 03-supply-mcp-registry-package-types.md | supply | official | Supported package types + ownership verification rules |
| 03-supply-mcp-registry-aggregators.md | supply | official | Aggregators/subregistries; read-only API; no uptime/durability; _meta injection |
| 03-supply-mcp-registry-moderation-policy.md | supply | official | Permissive moderation; minimal-to-no moderation; status=deleted |
| 03-supply-mcp-registry-versioning.md | supply | official | Immutable metadata; unique versions; semver sorting + version-range prohibition |
| 03-supply-mcp-registry-server-schema-2025-12-11.md | supply | official | server.json JSON Schema: required fields + packages/remotes + _meta extension + security warnings |
| 03-supply-mcp-registry-community-projects.md | supply | official | Official list of community registry consumers (browsers/clients/CLI) + disclaimer (no endorsement) |
| 03-supply-servicenow-ai-gateway-mcp-registry-consumption-2026-03.md | supply | official | Enterprise consumer: ServiceNow AI Gateway browses/imports MCP servers from MCP community registry |
| 03-supply-mcp-server-features-overview-2025-06-18.md | supply | official | MCP server primitives: prompts/resources/tools + control hierarchy |
| 03-supply-mcp-server-prompts-2025-06-18.md | supply | official | MCP prompts: user-controlled templates + list/get + list_changed + security |
| 03-supply-mcp-server-resources-2025-06-18.md | supply | official | MCP resources: URI + list/read/templates + subscribe/notifications + security |
| 03-supply-mcp-server-tools-2025-06-18.md | supply | official | MCP tools: tool schema + list/call + list_changed + human-in-loop + security |
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
