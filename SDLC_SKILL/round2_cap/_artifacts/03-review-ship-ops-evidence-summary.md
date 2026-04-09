# 03-review-ship-ops Evidence Summary (Wave 1/2)

目标：把“审查发布运维与状态持久化”的关键判断，压缩成可复用的 evidence map（每条都有 `reference_cap/*.md` 回指）。

## Key Claims → Evidence Pointers

“Review 最大失败模式之一是 builder self-review（self-bias / 回音壁）；缓解需要 fresh-context critic + multi-review aggregation + cross-model synthesis”：
- gstack `/review`：always-on adversarial review（Claude fresh-context subagent + 可选 Codex），并做 cross-model synthesis（`reference_cap/03-gstack-review-skill-adversarial-and-specialists.md`）
- self-bias 研究：self-refine 可能放大 self-bias，外部反馈可缓解（`reference_cap/03-arxiv-2402.11436-llm-self-bias-self-refinement.md`）
- SWR-Bench：multi-review aggregation 可显著提升 issue detection F1（`reference_cap/03-arxiv-2509.01494-swr-bench-llm-code-review-benchmark.md`）

“成熟的 PR review 能力单元应是结构化 workflow，而不是泛点评：base branch 检测、scope drift 检测、checklist 驱动、specialists、fix-first、持久化产物”：
- gstack `/review`：Step0/1.5（platform+base branch / scope drift），specialist dispatch，fix-first，review log JSONL 落盘（`reference_cap/03-gstack-review-skill-adversarial-and-specialists.md`）
- GSD `gsd:code-review`：phase-scoped + depth 策略 + config gate + REVIEW.md 产物（`reference_cap/03-gsd-code-review-command-and-artifact.md`）

“QA 必须穿透到运行时，并以证据为中心（截图/console/perf/交互前后差异）；baseline/regression 把一次性 QA 变成回归资产”：
- gstack `/qa`：evidence tiers、health score rubric、baseline/regression（`reference_cap/03-gstack-qa-skill-runtime-verification.md`）
- gstack browse/QA 路由与 browse daemon 能力（`reference_cap/03-gstack-skill-browse-qa-routing.md`）

“文档同步属于 release pipeline 的能力单元；diff-aware audit + 风险分级 gate + CHANGELOG 硬规则是关键防漂移机制”：
- gstack `/document-release`：after `/ship` before merge，auto-update vs ask-user，cross-doc consistency，NEVER CLOBBER CHANGELOG（`reference_cap/03-gstack-document-release-skill-doc-drift.md`）
- gstack `/review`：doc staleness check → 推荐 `/document-release`（`reference_cap/03-gstack-review-skill-adversarial-and-specialists.md`）

“Operate/Release Reliability 可通过 baseline+delta 机制化：canary（对变化报警）+ benchmark（阈值判定回归）+ health（质量趋势）”：
- gstack `/canary`：baseline + 周期巡检 + transient tolerance + report/JSONL（`reference_cap/03-gstack-canary-skill-post-deploy-monitor.md`）
- gstack `/benchmark`：性能指标与资源分解 + baseline/delta + trend/budget（`reference_cap/03-gstack-benchmark-skill-perf-regression.md`）
- gstack `/health`：health-history.jsonl + trend analysis（`reference_cap/03-gstack-health-skill-quality-gates.md`）

“长程任务需要状态持久化与上下文耗尽治理：checkpoint/handoff 文件 + hooks 注入 stop 信号 + WIP commit”：
- gstack `/checkpoint`：no-code hard gate + 结构化 checkpoint 文件 + 跨 branch 恢复（`reference_cap/03-gstack-checkpoint-skill-state-persistence.md`）
- GSD pause-work + context monitor hook：`.continue-here.md` + WARNING/CRITICAL 注入 + 安全输入校验（`reference_cap/03-gsd-pause-work-and-context-monitor.md`）

“趋势：code review benchmark 正在走向 PR-centric/full-context + 更客观的覆盖式评价；comment comprehension 被拆成可测中间能力（CTR/CL/SI）”：
- SWR-Bench（PR-centric + full context + objective eval）（`reference_cap/03-arxiv-2509.01494-swr-bench-llm-code-review-benchmark.md`）
- CodeReviewQA（CTR/CL/SI probes + contamination mitigation）（`reference_cap/03-arxiv-2503.16167-codereviewqa-code-review-comprehension.md`）

“工业实证：质量门禁的关键痛点是静态分析高假阳性；LLM+静态分析 hybrid 可在企业流水线中显著降噪且成本可控；同时 LLM-assisted code review 的 adoption 受 trust/false positives 约束，并在 AI-led vs on-demand 交互形态上呈现情境依赖”：
- Tencent SAT false positives reduction（`reference_cap/03-arxiv-2601.18844-reducing-false-positives-static-bug-detection-industry.md`）
- WirelessCar code review workflow study（`reference_cap/03-arxiv-2505.16339-rethinking-code-review-workflows-llm-assistance.md`）

“宿主级执行安全与门禁：approval policy + sandbox_mode + OS/云隔离实现，把 ops 风险从‘口头规范’升级为可配置 contract”：
- Codex approvals & security（Seatbelt/bubblewrap+seccomp/gVisor）（`reference_cap/03-openai-codex-agent-approvals-security-sandbox.md`）

“组织级可持续协作：docs/ 作为系统事实源 + AGENTS.md 作为 TOC + PR/review loop + doc gardening，是长期防漂移的关键机制”：
- OpenAI Harness engineering（`reference_cap/03-openai-harness-engineering-agent-first-world.md`）

“MCP/外部工具链进入供应链风险域：confused deputy/SSRF/session hijacking/tool poisoning/rug pulls/多 server 放大，需要 scopes/allowlist/signing/vetting/guardrails”：
- MCP spec security best practices（`reference_cap/03-mcp-security-best-practices.md`）
- Breaking the Protocol（multi-server amplification）（`reference_cap/03-arxiv-2601.17549-breaking-the-protocol-mcp-security.md`）
- Securing MCP（tool poisoning/shadowing/rug pulls + layered defenses）（`reference_cap/03-arxiv-2512.06556-securing-mcp-tool-poisoning.md`）

## Notes

- 仅记录可回指证据，不在此处做长篇推理。
