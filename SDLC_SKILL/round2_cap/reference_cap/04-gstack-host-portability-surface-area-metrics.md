# gstack: Host Portability Surface Area Metrics (Host Count + Mapping Layer LOC)

- source_url: https://github.com/garrytan/gstack/blob/a7593d70ef1b6500d1f6457c58cf7c9896cf6062/hosts/index.ts
- source_type: official
- accessed_at: 2026-04-09 14:05:03 +0800
- related_dimension: 04-map-migration
- trust_level: official
- why_it_matters: “多宿主可移植层”的维护成本需要可复核度量。这份材料把 gstack 的 host compatibility 落到可量化的 surface area：当前支持的 host 数量、host 配置与 adapter 的代码规模（LOC），以及新增 host 的明确工程步骤（必须注册到 ALL_HOST_CONFIGS）。可用于支撑“portability cost / maintenance overhead”评估。
- claims_supported:
  - gstack 当前以显式 HostConfig registry 维护多宿主支持，host 集合是可枚举且需要手工注册的（不是隐式兼容）
  - 可移植层包含 host configs + host-config schema + adapters，具有明确代码规模与持续维护负担
  - 迁移成本不是“复制文件”而是“长期维护映射层 + 回归验证”
- date_scope: as of git commit a7593d70ef1b6500d1f6457c58cf7c9896cf6062 (2026-04-08)
- related_frameworks: gstack
- related_tools: HostConfig, host adapters, frontmatter allowlist/denylist, path/tool rewrites, suppressed resolvers

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/gstack
- commit: a7593d70ef1b6500d1f6457c58cf7c9896cf6062
- measured_files:
  - hosts/*.ts
  - scripts/host-config.ts
  - scripts/host-adapters/openclaw-adapter.ts

## 关键事实

- HostConfig registry 明确列出当前注册的 hosts（来自 `hosts/index.ts`）：
  - `claude`
  - `codex`
  - `factory`
  - `kiro`
  - `opencode`
  - `slate`
  - `cursor`
  - `openclaw`
- 新增 host 的工程步骤被写在注释中：需要创建 `hosts/<name>.ts` 并加入 `ALL_HOST_CONFIGS`。
- 可移植层的代码规模（基于本地 repo snapshot 的 `wc -l`）：
  - `hosts/*.ts` + `scripts/host-config.ts` + `scripts/host-adapters/openclaw-adapter.ts` 合计约 733 LOC（不含其他生成脚本与调用侧）。

## 与本研究的关系

- 为 `round2_cap/04` 的 portability cost/maintenance overhead 提供可复核切片：即便只支持 8 个 hosts，也需要专门的 registry、schema 与 adapter，且代码规模达到数百行；宿主升级与语义差异会进一步引入兼容债。

## 可直接引用的术语 / 概念

- “Host config registry”
- `ALL_HOST_CONFIGS`
- “Adding a new host … add to ALL_HOST_CONFIGS”

## captured_excerpt

摘录（来自 `hosts/index.ts` 文件头注释，保持简短）：

> “Adding a new host … add to ALL_HOST_CONFIGS.”

## 风险与局限

- 这是静态 snapshot（commit 级别）的 surface area 度量，不能直接推断长期维护成本的时间序列；若要更强证据，需要补“随时间的 churn（breakage/修复频率）”与回归失败统计。

