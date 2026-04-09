# cap 二轮 Deep Research 执行状态（Progress / State）

- plan: `SDLC_SKILL/plans/cap-二轮Deep-Research-progressive-plan.md`
- status_file: `SDLC_SKILL/plans/cap-二轮Deep-Research-progressive-plan.status.md`
- timezone: Asia/Shanghai
- last_updated: 2026-04-09 10:49:00 +0800

> 维护口径：这是“执行落地状态机”，记录哪些已做、哪些未做、以及下一步最短路径。内容允许反复增补，但不应改写原计划的规则口径。

## Progress Snapshot

### Wave 0：共享 Ground Truth 地基（最低标准）

- [x] >= 8 份共享型 ground truth（当前：`reference_cap` 已落库 30+ 条含证据文档；详见 `reference_cap/_INDEX.md`）
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
  - `digested_cap/_artifacts/01-planning-evidence-summary.md`
  - `digested_cap/_artifacts/01-planning-question-list.md`
- [x] digested 已回填
  - `digested_cap/01-能力单元本质与前置规划机制.md` 已追加二轮固定章节

状态：01 维度 Wave 1 达标。

#### 02-build-debug（构建执行与系统化调试闭环）

- [x] ground truth docs（>=8）：已落库 12+ 条（以 `reference_cap/02-*.md` 为主）
- [x] >=4 一手来源：superpowers/GSD/gstack 多条官方工作流与参考协议
- [x] >=2 独立第三方：UTBoost / InspectCoder / DebugHarness（学术）
- [x] >=1 近期趋势来源：`reference_cap/02-arxiv-2604.03610-debugharness-interactive-debugging-for-apr.md`（2026-04）
- [x] >=1 限制/失败模式来源：`reference_cap/02-arxiv-2506.09289-utboost-swebench-test-augmentation.md`（弱测试导致 false positives）
- [ ] artifacts 待回填
  - `digested_cap/_artifacts/02-build-debug-evidence-summary.md`
  - `digested_cap/_artifacts/02-build-debug-question-list.md`
- [ ] digested 待回填
  - `digested_cap/02-构建执行与系统化调试闭环.md`（需要追加二轮固定章节）

状态：02 维度证据已落库，但“边取证边回填”尚未完成（阻塞 Wave 1 完整达标）。

#### 03-review-ship-ops（审查发布运维与状态持久化）

- [ ] ground truth docs（>=8）：当前已落库约 4-5 条（主要是 gstack browse/ship + 两篇 arXiv）
- [ ] >=4 一手来源：不足（需要补 gstack /review /qa /document-release /health /checkpoint 等；以及 GSD code-review / verify / ship 等工作流与 references）
- [ ] >=2 独立第三方：不足（需要补“LLM 自审偏差/对抗性审查/自动 code review 可靠性”等独立资料）
- [ ] >=1 近期趋势来源：待补
- [ ] >=1 限制/失败模式来源：已部分覆盖（skills 供应链安全攻击面），但 review/ship/ops 侧仍需补足
- [ ] artifacts 待回填：`digested_cap/_artifacts/03-*.md`
- [ ] digested 待回填：`digested_cap/03-审查发布运维与状态持久化.md`

状态：03 维度 Wave 1 未达标。

#### 04-map-migration（能力地图与迁移价值判断）

- [ ] ground truth docs（>=8）：当前仅 2-3 条（config mechanisms + 社区迁移案例）
- [ ] >=4 一手来源：不足（需要补各框架“多宿主互操作/迁移策略/配置机制”的官方材料）
- [ ] >=2 独立第三方：不足（需要补企业/组织实践、迁移成本模型、风险治理等第三方分析）
- [ ] >=1 近期趋势来源：待补
- [ ] >=1 限制/失败模式来源：待补（例如迁移失败、供应链、权限/审计难题）
- [ ] artifacts/digested：均待回填

状态：04 维度 Wave 1 未达标。

### Wave 2：横向比对与综合判断

- [ ] `digested_cap/_artifacts/W2-cross-dimension-synthesis.md`：已建空骨架，未做交叉结论与回指填充
- [ ] “能力地图每行评级 30 秒回指”自检：未开始

### Report Readiness Check（最终验收）

- [ ] 任意抽取能力地图一行 → 30 秒内回指迁移价值证据：未达标（能力地图与评级证据链尚未逐行落位）
- [ ] 任意 SDLC 阶段 → 写出“失控模式 + 机制 + 实证来源”段落：03/04 维度材料不足
- [ ] “4 框架核心抽象异同”横向综合：Wave 2 未做
- [ ] 第三方可继续深入：未自检

## Next Actions (Shortest Path)

- 完成 02 回填：把 `reference_cap/02-*` 的关键结论回填到 `digested_cap/02-*.md` 与 `digested_cap/_artifacts/02-*.md`
- 补齐 03 的一手证据（优先官方 repo/workflows/references），并补 2 条独立第三方“review/ship/ops 可靠性与失败模式”材料
- 扩张 04：补足迁移评估与案例证据（官方多宿主互操作材料 + 独立第三方迁移/治理分析 + 社区失败/摩擦）
- 进入 Wave 2：完成术语口径统一、跨维度交叉结论、逐行能力地图回指
- 做 Report Readiness Check 自检并修补缺口

## Update Log

- 2026-04-09: 完成 Wave 0 共享地基并超额落库；01 维度 Wave 1 达标并完成回填；02 维度完成证据落库但回填未完成；03/04 仍需扩张证据链。

