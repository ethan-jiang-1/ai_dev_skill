# cap 二轮 Deep Research 执行状态（Progress / State）

- plan: `SDLC_SKILL/plans/cap-二轮Deep-Research-progressive-plan.md`
- status_file: `SDLC_SKILL/plans/cap-二轮Deep-Research-progressive-plan.status.md`
- timezone: Asia/Shanghai
- last_updated: 2026-04-09 14:51:15 +0800

> 维护口径：这是“执行落地状态机”，记录哪些已做、哪些未做、以及下一步最短路径。内容允许反复增补，但不应改写原计划的规则口径。

## Progress Snapshot

### Wave 0：共享 Ground Truth 地基（最低标准）

- [x] >= 8 份共享型 ground truth（当前：`reference_cap` 已落库 66 条参考文档；详见 `reference_cap/_INDEX.md`）
- [x] >= 5 份来自官方仓库/官方文档（已覆盖 gstack / GSD / superpowers / GABBE 多份）
- [x] >= 1 份来自安全/质量工程视角分析
  - 安全：`reference_cap/03-arxiv-2603.16572-repo-context-skill-security.md`
  - 质量/评测可靠性：`reference_cap/02-arxiv-2506.09289-utboost-swebench-test-augmentation.md`
- [x] >= 1 份来自社区真实使用反馈
  - `reference_cap/04-community-gsd-copilot-integration-reddit.md`

结论：Wave 0 已达标，可进入 Wave 1（按维度深挖）。

### Wave 1：按 4 个维度分别深挖（最低交付标准：每维度 >=8 docs，且满足一手/三方/趋势/争议配额）

#### 01-planning（能力单元本质与前置规划机制）

- [x] ground truth docs（>=8）：已落库 11 条（以 `reference_cap/01-*.md` 为主）
- [x] >=4 一手来源：gstack、GSD、GABBE、superpowers 多条官方文档
- [x] >=2 独立第三方：`reference_cap/01-arxiv-2511.12884-agent-readmes-context-files.md`、`reference_cap/01-arxiv-2602.11988-evaluating-agents-md-helpfulness.md`
- [x] >=1 近期趋势来源：`reference_cap/01-arxiv-2602.11988-evaluating-agents-md-helpfulness.md`（2026-02）
- [x] >=1 限制/争议来源：同上（context files 可能降低 success rate、提高成本）
- [x] artifacts 已回填
  - `round2_cap/_artifacts/01-planning-evidence-summary.md`
  - `round2_cap/_artifacts/01-planning-question-list.md`
- [x] digested 已回填
  - `round2_cap/01-能力单元本质与前置规划机制.md` 已追加二轮固定章节

状态：01 维度 Wave 1 达标。

#### 02-build-debug（构建执行与系统化调试闭环）

- [x] ground truth docs（>=8）：已落库 13 条（以 `reference_cap/02-*.md` 为主）
- [x] >=4 一手来源：superpowers/GSD/gstack 多条官方工作流与参考协议
- [x] >=2 独立第三方：UTBoost / InspectCoder / DebugHarness（学术）
- [x] >=1 近期趋势来源：`reference_cap/02-arxiv-2604.03610-debugharness-interactive-debugging-for-apr.md`（2026-04）
- [x] >=1 限制/失败模式来源：`reference_cap/02-arxiv-2506.09289-utboost-swebench-test-augmentation.md`（弱测试导致 false positives）
- [x] artifacts 已回填
  - `round2_cap/_artifacts/02-build-debug-evidence-summary.md`
  - `round2_cap/_artifacts/02-build-debug-question-list.md`
- [x] digested 已回填
  - `round2_cap/02-构建执行与系统化调试闭环.md` 已追加二轮固定章节

状态：02 维度 Wave 1 达标。

#### 03-review-ship-ops（审查发布运维与状态持久化）

- [x] ground truth docs（>=8）：已落库 24 条（以 `reference_cap/03-*.md` 为主）
- [x] >=4 一手来源：gstack（review/qa/ship/document-release/checkpoint/health/canary/benchmark）+ GSD（code-review/verify-work/pause-work）多条官方材料
- [x] >=2 独立第三方：SWR-Bench / CodeReviewQA / self-bias / MCP security（学术）
- [x] >=1 近期趋势来源：SWR-Bench/CodeReviewQA（PR-centric/full-context + probes）`reference_cap/03-arxiv-2509.01494-swr-bench-llm-code-review-benchmark.md` `reference_cap/03-arxiv-2503.16167-codereviewqa-code-review-comprehension.md`
- [x] >=1 限制/失败模式来源：self-bias（builder self-review 风险）+ skills/MCP 供应链安全攻击面（仓库上下文/弃置仓库劫持、tool poisoning、多 server 放大）`reference_cap/03-arxiv-2402.11436-llm-self-bias-self-refinement.md` `reference_cap/03-arxiv-2603.16572-repo-context-skill-security.md` `reference_cap/03-arxiv-2512.06556-securing-mcp-tool-poisoning.md` `reference_cap/03-arxiv-2601.17549-breaking-the-protocol-mcp-security.md`
- [x] artifacts 已回填
  - `round2_cap/_artifacts/03-review-ship-ops-evidence-summary.md`
  - `round2_cap/_artifacts/03-review-ship-ops-question-list.md`
- [x] digested 已回填
  - `round2_cap/03-审查发布运维与状态持久化.md` 已追加二轮固定章节

状态：03 维度 Wave 1 达标。

#### 04-map-migration（能力地图与迁移价值判断）

- [x] ground truth docs（>=8）：已落库 18 条（以 `reference_cap/04-*.md` 为主）
- [x] >=4 一手来源：gstack（AGENTS.md + HostConfig/adapters）+ GSD（multi-runtime installer + `.clinerules` + conversion regression tests）等官方材料
- [x] >=2 独立第三方：配置机制谱系/采用基线 + AGENTS.md 效率实证（学术）`reference_cap/04-arxiv-2602.14690-configuring-agentic-ai-coding-tools.md` `reference_cap/04-arxiv-2601.20404-impact-of-agents-md-efficiency.md`
- [x] >=1 近期趋势来源：两篇 arXiv（2026-03）
- [x] >=1 限制/失败模式来源：社区迁移摩擦与信任顾虑 + skills 供应链风险域 `reference_cap/04-community-gsd-copilot-integration-reddit.md` `reference_cap/03-arxiv-2603.16572-repo-context-skill-security.md`
- [x] artifacts 已回填
  - `round2_cap/_artifacts/04-map-migration-evidence-summary.md`
  - `round2_cap/_artifacts/04-map-migration-question-list.md`
- [x] digested 已回填
  - `round2_cap/04-能力地图与迁移价值判断.md` 已追加二轮固定章节（含能力地图评级与最小证据集回指）

状态：04 维度 Wave 1 达标。

### Wave 2：横向比对与综合判断

- [x] `round2_cap/_artifacts/W2-cross-dimension-synthesis.md`：已完成 shared vocabulary、跨维度 claims→evidence pointers、四大抽象的跨框架对齐，并补齐治理控制面（approval/sandbox/requirements/prefix_rules/MCP allowlist）与 MCP 安全边界
- [x] “能力地图每行评级 30 秒回指”自检：已在 `round2_cap/04` 中落位（每行给出最小证据集；证据不足则标注“待验证”）

### Report Readiness Check（最终验收）

- [x] 任意抽取能力地图一行 → 30 秒内回指迁移价值证据（或明确标注“待验证”）
- [x] 任意 SDLC 阶段 → 写出“失控模式 + 机制 + 实证来源”段落（01-03 维度已具备）
- [x] “4 框架核心抽象异同”横向综合（已落盘到 `round2_cap/_artifacts/W2-cross-dimension-synthesis.md`）
- [ ] 第三方可继续深入：仍有 gap（端到端 correctness/质量净收益的更强因果证据、更多企业试点复盘、以及更完整的 time-series 维护成本/失败复盘仍不足；但已补 SAT 降噪工业实证 + 社区 confirmed bugs 线索库 + portability churn 切片）

## Next Actions (Shortest Path)

- 补“迁移价值评级”的 hard evidence：企业试点/公开基准/失败复盘，尤其是 correctness/质量净收益与治理成本的可复核数据
- 补“宿主适配层维护成本”的度量证据：当前已有 snapshot 指标（host 数量、映射层 LOC 规模）与部分 time-series churn（installer/converter commit history 切片）；仍缺更完整的 churn（rewrites/adapter 增长、回归失败频率、宿主升级 breakage 统计）
- 把供应链治理从“best practices/研究”推进到“企业可执行落地”：签名/锁定/隔离/审计/审批链，并补至少 1-2 条真实落地案例（含负结果）

## Update Log

- 2026-04-09: 完成 Wave 0/1/2 的证据落库与回填；补齐 Codex/Claude Code 的 AGENTS.md 契约与企业治理控制面（requirements/prefix_rules/approval/sandbox/MCP allowlist）、补齐 MCP 安全威胁模型与对抗证据；仍保留企业级 hard evidence gaps（correctness 净收益/迁移成本度量/失败复盘）。
- 2026-04-09: 补齐 portability cost 的可复核切片度量（gstack host registry/adapter 层规模；GSD installer+converter 规模与目标数量），并已回填到索引与 04 维度综合判断。
- 2026-04-09: 补齐“审查/质量净收益”的工业实证切片：LLM+静态分析在企业流水线中显著降低 SAT 假阳性；以及工业现场的 LLM-assisted code review workflow 摩擦点/信任边界与交互模式偏好。
- 2026-04-09: 补齐 portability layer 的 time-series churn 切片：GSD `bin/install.js` 在短窗口内出现高频提交，证明“多宿主适配”是持续维护对象而非一次性迁移脚本。
- 2026-04-09: 补齐迁移失败模式线索库：新增社区侧“33 confirmed bugs”清单（按 install/update/planning/execution/migration 分类），用于校准迁移价值评级的风险面与治理成本。
