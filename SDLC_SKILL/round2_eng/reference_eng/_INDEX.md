# reference_eng Index

目标：快速回答“某个 eng 判断的证据在哪里”，减少翻找成本，支持 30 秒回指。

维护方式：新增或更新 `reference_eng/*.md` 后，同步补一行到这里即可。

| File | related_topic | trust_level | Supports (short) |
|---|---|---|---|
| _TEMPLATE-reference.md | shared | official | Template only |
| 01-scaffold-kirschner-sweller-clark-minimal-guidance-2006.md | 01-scaffold | academic | Guided instruction vs minimal guidance; cognitive load; worked examples |
| 01-scaffold-belief-offloading-human-ai-interaction-arxiv-2602-08754.md | 01-scaffold | academic | Defines belief offloading as LLM-specific cognitive offloading risk; taxonomy/boundaries |
| 01-scaffold-tutor-move-taxonomy-arxiv-2603-05778.md | 01-scaffold | academic | Tutoring moves taxonomy; eliciting reasoning vs giving answers |
| 01-scaffold-prather-et-al-novice-copilot-interactions-arxiv-2304-02491.md | 01-scaffold | academic | Novice Copilot study: drifting/shepherding patterns; cognitive/metacognitive difficulties; scaffolding implications |
| 01-scaffold-vaithilingam-zhang-glassman-expectation-vs-experience-copilot-chi22.md | 01-scaffold | academic | Usability study: Copilot preference but difficulties understanding/editing/debugging; time/success not necessarily improved |
| 01-scaffold-barke-james-polikarpova-grounded-copilot-oopsla-2023.md | 01-scaffold | academic | Grounded theory: bimodal Copilot use (acceleration vs exploration); validation/affordance implications |
| 02-tier-dreyfus-five-stage-model-adult-skill-acquisition-2004.md | 02-tier | academic | Five-stage skill acquisition model (Novice→Expert) to ground difficulty tiers |
| 02-tier-ericsson-1993-deliberate-practice-expert-performance.md | 02-tier | academic | Deliberate practice theory for expertise; supports training-matrix framing |
| 02-tier-scott-ghinea-2013-barriers-deliberate-practice-programming.md | 02-tier | academic | Programming education barriers to practice; soft scaffolding + feedback |
| 02-tier-shu-ha-ri-agile-leadership-dreyfus-model.md | 02-tier | practitioner | Practical staged learning framing (Shu-Ha-Ri) + Dreyfus stage summary |
| 02-tier-bjork-bjork-2020-desirable-difficulties.md | 02-tier | academic | Desirable difficulties; learning vs performance; supports “intermediate tier” rationale |
| 02-tier-baltes-diehl-theory-software-development-expertise-2018.md | 02-tier | academic | Software dev expertise theory; experience ≠ expertise; context-dependent self-assessment |
| 02-tier-vessey-1985-expertise-in-debugging-process-analysis.md | 02-tier | academic | Expert-vs-novice debugging: chunking ability relates to strategy; breadth-first + system view vs erratic depth-first |
| 02-tier-burkhardt-detienne-wiedenbeck-1998-oo-comprehension-expertise.md | 02-tier | academic | OO comprehension expertise: experts more top-down inference-driven + multiple guidance; novices more execution-based |
| 02-tier-bergersen-et-al-inferring-programming-skill-time-quality-esem-2011.md | 02-tier | academic | Measures programming skill by combining time+quality across representative tasks; supports measurable tiering |
| 02-tier-al-madi-et-al-longitudinal-eye-tracking-token-effects-icpc-2021.md | 02-tier | academic | Longitudinal eye-tracking: token frequency/length effects; ML classifies novice vs expert (~72% accuracy) |
| 02-tier-ikutani-et-al-imitating-visual-attention-experts-arxiv-1903-06320.md | 02-tier | academic | Conceptual framework: imitation learning from expert gaze to train attention models/agents for SE tasks |
| 02-tier-kuang-et-al-gazeprinter-expert-gaze-guide-novices-arxiv-2603-19855.md | 02-tier | academic | GazePrinter: expert-gaze visualization shifts novice navigation/path (significant), while time/load gains are weak/not significant |
| 04-path-github-copilot-repo-custom-instructions.md | 04-path | official | Team-governed instruction assets: repo-wide/path-specific/AGENTS.md precedence |
| 04-path-github-copilot-cli-tool-permissions.md | 04-path | official | Copilot CLI tool permission model; allow/deny; approvals; yolo risk |
| 04-path-github-copilot-cli-trusted-folders-config.md | 04-path | official | Trusted folders + config file as governance primitive |
| 04-path-github-copilot-policies-concepts.md | 04-path | official | Copilot policy types (feature/privacy/models) and org vs enterprise control |
| 04-path-github-copilot-cloud-agent-about.md | 04-path | official | Cloud agent: autonomous GitHub workflow + ephemeral Actions env + limitations |
| 04-path-github-copilot-cloud-agent-pilot-guide.md | 04-path | official | Rollout playbook for piloting cloud agent (instructions + setup steps + permissions) |
| 04-path-cursor-plugins-marketplace-team-governance-2026-02-17.md | 04-path | official | Cursor trend: private team marketplaces + central governance/security controls |
| 04-path-ziegler-kalliamvakou-et-al-productivity-assessment-neural-code-completion-arxiv-2205-06537.md | 04-path | academic | GitHub case study: acceptance rate drives perceived productivity; defines telemetry funnel + persistence metrics |
| 04-path-li-et-al-understanding-prompt-management-github-repos-arxiv-2509-12421.md | 04-path | academic | Large-scale prompt management study (24,800 prompts/92 repos): formatting inconsistency, duplication, readability issues; best practices |
| 03-devlife-claude-what-are-skills.md | 03-devlife | official | Claude skills: progressive disclosure + dynamic loading + governance scopes |
| 03-devlife-windsurf-cascade-skills-docs.md | 03-devlife | official | Windsurf skills: invocation modes + scopes + progressive disclosure |
| 03-devlife-openai-evals-readme.md | 03-devlife | official | Official eval framework/registry; custom evals; dashboard-run evals |
| 03-devlife-cursor-vs-windsurf-blott-2025.md | 03-devlife | practitioner | Third-party view: manual vs automatic context handling (Cursor vs Windsurf) |
| 03-devlife-vercel-skills-lock-files.md | 03-devlife | official | Lock files for installed skills (team-shareable local lockfile; deterministic output) |
| 03-devlife-vercel-skills-update-system.md | 03-devlife | official | Hash-based update checks (`skills check/update`) via remote update API |
| 03-devlife-windsurf-workflows-manual-only.md | 03-devlife | official | Workflows are manual-only; explicit slash-command invocation; scoped storage |
| 03-devlife-vercel-skills-source-formats.md | 03-devlife | official | Source formats + deterministic parsing order; well-known endpoint; skill filters |
| 03-devlife-borg-hewett-et-al-echoes-of-ai-maintainability-arxiv-2507-00788.md | 03-devlife | academic | Large preregistered experiment: AI assistants speed Phase 1 but show no significant downstream maintainability differences in Phase 2 RCT |
| 03-devlife-brandebusemeyer-schimmer-arnrich-genai-dev-experience-field-study-arxiv-2512-19926.md | 03-devlife | academic | Pro dev field study: interaction type/intensity affects efficiency, accuracy, and workload (in-code vs chat vs combined) |
| 03-devlife-shah-et-al-evolution-programmers-trust-genai-assistants-arxiv-2509-13253.md | 03-devlife | academic | Trust calibration over time (1h vs 10 days) for Copilot on legacy code; factors + verification-focused recommendations |
| 03-devlife-pandey-singh-wei-shankar-copilot-real-world-projects-arxiv-2406-17910.md | 03-devlife | practitioner | Cisco field evaluation: task taxonomy + time-savings claims + underperforming scenarios (multi-file, proprietary, C/C++) |
| 03-devlife-peng-et-al-impact-ai-developer-productivity-copilot-arxiv-2302-06590.md | 03-devlife | academic | Controlled experiment: Copilot treatment completes JS HTTP server 55.8% faster; GitHub Classroom + tests as harness |
| 04-path-owasp-top-10-llm-apps-v1-1.md | 04-path | practitioner | OWASP LLM Top 10 risk taxonomy for team governance (injection/supply chain/plugins/agency) |
| 04-path-stray-brandtzaeg-wivestad-et-al-copilot-longitudinal-case-study-arxiv-2509-20353.md | 04-path | academic | Longitudinal org case: Copilot users already more active pre-adoption; no significant commit-metric change post-adoption; perceived vs metric gap |
| 04-path-sea-change-ai-powered-developer-lifecycle-arxiv-2306-15033.md | 04-path | practitioner | Industry report: n≈934k telemetry; acceptance-rate-as-impact framing; claims effect grows over time & higher for less experienced |
| 04-path-zoominfo-copilot-deployment-productivity-arxiv-2501-13282.md | 04-path | practitioner | Enterprise deployment (400+ devs): four-phase rollout; acceptance + satisfaction metrics; language variation; lessons learned |
| 01-scaffold-community-experienceddevs-copilot-focus-disruption.md | 01-scaffold | community | Experienced devs report distraction/decision fatigue from always-on autocomplete |
| 01-scaffold-chi-wylie-icap-framework-2014.md | 01-scaffold | academic | ICAP engagement taxonomy (Passive→Active→Constructive→Interactive) linked to learning outcomes |
| 01-scaffold-anthropic-engineering-agent-skills-progressive-disclosure-2025.md | 01-scaffold | official | Multi-level progressive disclosure: metadata preload + SKILL.md body/files on-demand |
| 01-scaffold-llm-supported-self-explanation-calculus-arxiv-2604-00142.md | 01-scaffold | academic | LLM-supported open-ended self-explanation improves explanation quality on transfer tasks (fixed time) |
| 01-scaffold-risko-gilbert-cognitive-offloading-2016.md | 01-scaffold | academic | Defines cognitive offloading; triggers + consequences (review) |
| 01-scaffold-github-copilot-students-brownfield-arxiv-2506-10051.md | 01-scaffold | academic | Controlled experiment: Copilot shifts student brownfield processes; faster completion but understanding concerns |
| 01-scaffold-qiao-et-al-comprehension-performance-gap-brownfield-arxiv-2511-02922.md | 01-scaffold | academic | Copilot boosts time/tests passed but comprehension unchanged (comprehension-performance gap); no correlation found |
