# Skill Host Research Topic Registry

这份 registry 是 `SKILL_HOST/topics` 的总入口：列出 `01-08` topics 的边界、对应文件、核心中间产物，以及推荐阅读/维护路径。

执行状态（Round 1 真相源）：`../plan/skill-host-skills-deep-research-progressive-plan-round-1.status.md`

证据索引入口：`./_reference/_INDEX.md`

决策/收束入口（建议从这里开始读）：`./_artifacts/W2-round1-closeout-summary.md`

## Topic List

- `01` / `skill-foundations-and-common-model` / Skill Foundations, Spec, and Common Model
  - file: `01-skill-foundations-and-common-model.md`
  - evidence: `_artifacts/01-skill-foundations-evidence-summary.md`

- `02` / `claude-code-skills-deep-dive` / Claude Code Skills Deep Dive
  - file: `02-claude-code-skills-deep-dive.md`
  - evidence: `_artifacts/02-claude-code-skills-evidence-summary.md`

- `03` / `codex-cli-skills-deep-dive` / Codex CLI Skills Deep Dive
  - file: `03-codex-cli-skills-deep-dive.md`
  - evidence: `_artifacts/03-codex-cli-skills-evidence-summary.md`

- `04` / `cursor-skills-deep-dive` / Cursor Skills Deep Dive
  - file: `04-cursor-skills-deep-dive.md`
  - evidence: `_artifacts/04-cursor-skills-evidence-summary.md`

- `05` / `opencode-skills-deep-dive` / OpenCode Skills Deep Dive
  - file: `05-opencode-skills-deep-dive.md`
  - evidence: `_artifacts/05-opencode-skills-evidence-summary.md`

- `06` / `cross-host-comparison-and-interoperability` / Cross-Host Comparison and Interoperability
  - file: `06-cross-host-comparison-and-interoperability.md`
  - evidence: `_artifacts/06-cross-host-comparison-evidence-summary.md`

- `07` / `writing-skills-discovery-adaptation-and-host-support` / Writing Skills Discovery, Adaptation, and Host Support
  - file: `07-writing-skills-discovery-adaptation-and-host-support.md`
  - evidence: `_artifacts/07-writing-skills-evidence-summary.md`

- `08` / `deep-research-skills-discovery-adaptation-and-host-support` / Deep Research Skills Discovery, Adaptation, and Host Support
  - file: `08-deep-research-skills-discovery-adaptation-and-host-support.md`
  - evidence: `_artifacts/08-deep-research-skills-evidence-summary.md`

## Key Artifacts (Round 1)

- Round-level closeout + “stop-the-world” entry point:
  - `_artifacts/W2-round1-closeout-summary.md`
- Round-level readiness gate:
  - `_artifacts/W2-round1-readiness-check.md`
- Cross-topic synthesis + decision support:
  - `_artifacts/W2-cross-topic-synthesis-draft.md`
  - `_artifacts/W2-host-capability-matrix.md`
  - `_artifacts/W2-portability-layers-and-breakpoints.md`
  - `_artifacts/W2-host-selection-and-portability-decision-framework.md`
- Shared ground truth evidence summary:
  - `_artifacts/W0-shared-ground-truth-evidence-summary.md`

## Recommended reading path (fast → deep)

1) Start with `_artifacts/W2-round1-closeout-summary.md`.
2) Read `_artifacts/W2-host-capability-matrix.md` + `_artifacts/W2-portability-layers-and-breakpoints.md`.
3) Use `_artifacts/W2-host-selection-and-portability-decision-framework.md` as the operational “what to do next” lens.
4) If you need the full argument chain, read `_artifacts/W2-cross-topic-synthesis-draft.md`.
5) Drill into topic seeds `01-08-*.md` for “机制 + 趋势 + 维护 + 模型/权限要求 + 难点/限制”。
6) Use `./_reference/_INDEX.md` as the 30-second traceability entry point.

## Suspended branches (Round 1)

- `topic06/official-migration-guidance`
  - why: 2026+ 官方“跨宿主迁移契约/政策”证据仍然稀缺；当前互操作主要依赖 `sync / translate / delegate` 实践证据
  - reopen trigger: 官方 docs / release notes 开始明确跨宿主迁移与互通契约
- `topic06-08/additional-repair-oriented-failure-cases`
  - why: 已有一个强 duplicate-loading 故障与多类 drift/constraint 故障；继续找“可复现 repair case”回报下降
  - reopen trigger: 出现能改变可迁移性建议的新 failure case，或提供明确 before/after remediation steps 的案例

## Maintenance notes

- 新证据默认只接受 `2026-01-01+`；历史基础定义只能作为 `canonical_exception`。
- 每新增一份 `_reference/*.md`，同步更新：
  - `./_reference/_INDEX.md`
  - 对应 topic 的 `_artifacts/*evidence-summary.md`
- Round-level判断变更时，同步刷新：
  - `_artifacts/W2-cross-topic-synthesis-draft.md`
  - `_artifacts/W2-round1-closeout-summary.md`
