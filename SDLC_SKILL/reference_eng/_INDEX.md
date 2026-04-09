# reference_eng Index

目标：快速回答“某个 eng 判断的证据在哪里”，减少翻找成本，支持 30 秒回指。

维护方式：新增或更新 `reference_eng/*.md` 后，同步补一行到这里即可。

| File | related_topic | trust_level | Supports (short) |
|---|---|---|---|
| _TEMPLATE-reference.md | shared | official | Template only |
| 01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md | 01-scaffold | academic | Guided instruction vs minimal guidance; cognitive load; worked examples |
| 01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md | 01-scaffold | academic | Defines belief offloading as LLM-specific cognitive offloading risk; taxonomy/boundaries |
| 01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md | 01-scaffold | academic | Tutoring moves taxonomy; eliciting reasoning vs giving answers |
| 02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md | 02-tier | academic | Five-stage skill acquisition model (Novice→Expert) to ground difficulty tiers |
| 02-tier-ericsson-1993-deliberate-practice-expert-performance.md | 02-tier | academic | Deliberate practice theory for expertise; supports training-matrix framing |
| 02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md | 02-tier | academic | Programming education barriers to practice; soft scaffolding + feedback |
| 02-tier-shu-ha-ri-agile-leadership-dreyfus-model.md | 02-tier | practitioner | Practical staged learning framing (Shu-Ha-Ri) + Dreyfus stage summary |
| 02-tier-bjork-bjork-2020-desirable-difficulties.md | 02-tier | academic | Desirable difficulties; learning vs performance; supports “intermediate tier” rationale |
| 02-tier-baltes-diehl-theory-software-development-expertise-2018.md | 02-tier | academic | Software dev expertise theory; experience ≠ expertise; context-dependent self-assessment |
| 02-tier-vessey-1985-expertise-in-debugging-process-analysis.md | 02-tier | academic | Expert-vs-novice debugging: chunking ability relates to strategy; breadth-first + system view vs erratic depth-first |
| 02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md | 02-tier | academic | OO comprehension expertise: experts more top-down inference-driven + multiple guidance; novices more execution-based |
| 04-path-github-copilot-repo-custom-instructions.md | 04-path | official | Team-governed instruction assets: repo-wide/path-specific/AGENTS.md precedence |
| 04-path-github-copilot-cli-tool-permissions.md | 04-path | official | Copilot CLI tool permission model; allow/deny; approvals; yolo risk |
| 04-path-github-copilot-cli-trusted-folders-config.md | 04-path | official | Trusted folders + config file as governance primitive |
| 04-path-github-copilot-policies-concepts.md | 04-path | official | Copilot policy types (feature/privacy/models) and org vs enterprise control |
| 04-path-github-copilot-cloud-agent-about.md | 04-path | official | Cloud agent: autonomous GitHub workflow + ephemeral Actions env + limitations |
| 04-path-github-copilot-cloud-agent-pilot-guide.md | 04-path | official | Rollout playbook for piloting cloud agent (instructions + setup steps + permissions) |
| 04-path-cursor-plugins-marketplace-team-governance-2026-02-17.md | 04-path | official | Cursor trend: private team marketplaces + central governance/security controls |
| 03-devlife-claude-what-are-skills.md | 03-devlife | official | Claude skills: progressive disclosure + dynamic loading + governance scopes |
| 03-devlife-windsurf-cascade-skills-docs.md | 03-devlife | official | Windsurf skills: invocation modes + scopes + progressive disclosure |
| 03-devlife-openai-evals-readme.md | 03-devlife | official | Official eval framework/registry; custom evals; dashboard-run evals |
| 03-devlife-cursor-vs-windsurf-blott-2025.md | 03-devlife | practitioner | Third-party view: manual vs automatic context handling (Cursor vs Windsurf) |
| 03-devlife-vercel-skills-lock-files.md | 03-devlife | official | Lock files for installed skills (team-shareable local lockfile; deterministic output) |
| 03-devlife-vercel-skills-update-system.md | 03-devlife | official | Hash-based update checks (`skills check/update`) via remote update API |
| 03-devlife-windsurf-workflows-manual-only.md | 03-devlife | official | Workflows are manual-only; explicit slash-command invocation; scoped storage |
| 03-devlife-vercel-skills-source-formats.md | 03-devlife | official | Source formats + deterministic parsing order; well-known endpoint; skill filters |
| 04-path-owasp-top-10-llm-apps-v1-1.md | 04-path | practitioner | OWASP LLM Top 10 risk taxonomy for team governance (injection/supply chain/plugins/agency) |
| 01-scaffold-community-experienceddevs-copilot-focus-disruption.md | 01-scaffold | community | Experienced devs report distraction/decision fatigue from always-on autocomplete |
| 01-scaffold-chi-wylie-icap-framework-2014.md | 01-scaffold | academic | ICAP engagement taxonomy (Passive→Active→Constructive→Interactive) linked to learning outcomes |
| 01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md | 01-scaffold | official | Multi-level progressive disclosure: metadata preload + SKILL.md body/files on-demand |
| 01-scaffold-llm-supported-self-explanation-calculus-arxiv-2604-00142.md | 01-scaffold | academic | LLM-supported open-ended self-explanation improves explanation quality on transfer tasks (fixed time) |
| 01-scaffold-risko-gilbert-cognitive-offloading-2016.md | 01-scaffold | academic | Defines cognitive offloading; triggers + consequences (review) |
| 01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md | 01-scaffold | academic | Controlled experiment: Copilot shifts student brownfield processes; faster completion but understanding concerns |
