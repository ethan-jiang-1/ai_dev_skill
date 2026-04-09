# GSD: Installer/Converter Churn Metrics from `bin/install.js` Commit History (Time-Series Snapshot)

- source_url: https://github.com/gsd-build/get-shit-done/commits/main/bin/install.js
- source_type: official
- accessed_at: 2026-04-09 14:39:48 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: “宿主适配层维护成本”不能只用静态 LOC snapshot 论证，还需要 time-series churn 证据。GSD 把跨宿主迁移集中在 `bin/install.js`（installer+converter）。该文件的 commit history 提供了一个可复核的时间序列切片：在短时间窗口内出现大量修复/调整，说明 portability layer 是持续维护负担，而非一次性迁移脚本。
- claims_supported:
  - 迁移/转换层存在高频 churn：短周期内持续修复与调整（反映宿主差异、边界案例与回归修复需求）
  - portability cost 包含长期维护（bugfix/compatibility debt），且需要回归测试与变更治理，否则会在多宿主扩展中持续破裂
  - “多宿主支持”不是声明能力，而是持续演进的工程面（installer/converter 作为专门维护对象）
- date_scope: commit history snapshot as of 2026-04-09（统计窗口见下）；commits dated 2026-04-02 to 2026-04-07（GitHub UI）
- related_frameworks: get-shit-done (GSD)
- related_tools: installer, converters, cross-host rewrites, multi-runtime compatibility maintenance

## 关键事实

### A. 近 6 天 churn 计数（可复核）

在 GitHub 的 `bin/install.js` commit history 中，2026-04-02 至 2026-04-07（含）至少出现 **34** 次触及该文件的提交（按页面列出的 commit 条目逐条计数；不含 2026-04-01 及更早分页内容）。

- 2026-04-07：4 commits（13faf66, 8021e86, 3895178, 5c1f902）
- 2026-04-06：3 commits（2d80cc3, c014501, 00c6a5e）
- 2026-04-05：6 commits（b185529, b602c1d, 0b6ef6f, 175d89e, 84de0cc, 6bd786b）
- 2026-04-04：8 commits（931fef5, 7185803, ca6a273, 085f5b9, 8d6577d, 66368a4, 9d626de, d4767ac）
- 2026-04-03：3 commits（5451e13, 0866290, b8b01fc）
- 2026-04-02：10 commits（647ddce, 56ec1f0, 8af7ad9, fc1a4cc, 6c5f89a, bdd41f9, 6f3a9d8, f8edfe7, 4157c7f, 52585de）

### B. churn 的内容类型（从 commit titles 直接可见）

从这些 commit 的标题可直接观察到 churn 主要集中在：

- installer 行为修复（例如 preserve 文件、hook path、config/rules 生成策略）
- 多运行时/多宿主兼容性修复（例如 slash commands、paths、tool 名称映射）
- 回归测试/断言修复（存在测试相关 commit，反映 contract 需要用 tests 固化）

## 与本研究的关系

- 直接回填 `digested_cap/04` 与 `W2-cross-dimension-synthesis` 的 portability cost / maintenance overhead：
  - 从“静态规模（LOC/targets）”补到“动态 churn（短周期高频修改）”。
- 为企业迁移价值评估提供更严格口径：
  - 如果企业要“支持 N 个宿主”，必须把 installer/converter 当成长期维护系统，并配套回归测试与变更治理预算。

## 可直接引用的术语 / 概念

- churn / compatibility debt
- commit history as time-series evidence
- installer + converter as a portability layer

## captured_excerpt

> “History for `bin/install.js`.”

## 风险与局限

- 这是 GitHub UI 的 commit history 计数切片：我们只统计了页面可见的 2026-04-02~2026-04-07 条目；更早提交在分页中，未纳入本次计数。
- commit 数量能反映 churn 强度，但不能单独证明每次变更都是“必要维护”或代表“不可控失效”；仍需结合 issue/bug reports 与 conversion regression tests 覆盖范围做更强因果解释。
