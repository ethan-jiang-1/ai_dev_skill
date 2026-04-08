# 主题 2（dist）证据摘要（Wave 1）

## 证据包清单

- `../reference_src/00-shared-vercel-skills-cli-readme.md`
- `../reference_src/00-shared-owasp-llm-top10-v1-1.md`
- `../reference_src/00-shared-cloudflare-agent-skills-discovery-rfc-0-2-0.md`
- `../reference_src/03-supply-mcp-registry-github-readme.md`
- `../reference_src/03-supply-mcp-registry-quickstart-publish.md`
- `../reference_src/03-supply-mcp-registry-authentication.md`
- `../reference_src/03-supply-mcp-registry-package-types.md`
- `../reference_src/03-supply-mcp-registry-aggregators.md`
- `../reference_src/03-supply-mcp-registry-moderation-policy.md`
- `../reference_src/03-supply-mcp-registry-versioning.md`
- `../reference_src/02-dist-sundial-home.md`
- `../reference_src/02-dist-sundial-docs-security.md`
- `../reference_src/02-dist-sundial-docs-cli.md`
- `../reference_src/02-dist-sundial-docs-push-publish.md`
- `../reference_src/02-dist-sundial-docs-specification.md`
- `../reference_src/02-dist-vercel-skills-docs-source-formats.md`
- `../reference_src/02-dist-vercel-skills-docs-lock-files.md`
- `../reference_src/02-dist-vercel-skills-docs-update-system.md`
- `../reference_src/02-dist-vercel-skills-well-known-index-schema.md`
- `../reference_src/02-dist-x-docs-skill-md.md`
- `../reference_src/02-dist-x-well-known-agent-skills-index-json.md`
- `../reference_src/02-dist-x-well-known-skills-index-json.md`
- `../reference_src/02-dist-backstage-docs-ai-skills.md`
- `../reference_src/02-dist-backstage-well-known-skills-index-json.md`
- `../reference_src/02-dist-lobehub-github-readme.md`
- `../reference_src/02-dist-lobehub-market-cli-npm.md`

## 关键判断 -> 证据回指

- “分发层”已从简单的目录演化为工程化链路：跨宿主安装、版本治理（immutable snapshots/auto-bump）与安全扫描/人工复核逐步进入默认路径。（Ref: ../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-sundial-docs-push-publish.md；../reference_src/02-dist-sundial-docs-security.md）
- [hard_fact] “包管理器化”不仅是安装源解析，还包括可追溯状态与更新检测：Vercel Skills 通过 global/local lock files（含 `skillFolderHash/computedHash`）记录安装状态，并通过 `skills check/update` + 远端 update API 做 hash 对比返回更新列表。（Ref: ../reference_src/02-dist-vercel-skills-docs-lock-files.md；../reference_src/02-dist-vercel-skills-docs-update-system.md）
- 分发层正在出现可机器发现的 registry 入口：Vercel Skills docs 暴露 `/.well-known/skills/index.json`，而 CLI 实现补齐了 schema 与校验规则，并优先 `/.well-known/agent-skills/index.json`（legacy fallback 到 `/.well-known/skills/index.json`），为多 registry 互操作提供协议化基石。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md）
- [hard_fact] well-known 机制存在规范级演进且已被真实采用：Cloudflare RFC v0.2.0 将发现路径迁移到 `/.well-known/agent-skills/` 并引入 `$schema/type/url/digest` 与强制 digest 校验；X 同时提供 v0.2.0（agent-skills）与 legacy（skills/files）两套 endpoints；Backstage 仅提供 legacy `/.well-known/skills/index.json`。这解释了生态为何短期内难以口径收敛。（Ref: ../reference_src/00-shared-cloudflare-agent-skills-discovery-rfc-0-2-0.md；../reference_src/02-dist-x-well-known-agent-skills-index-json.md；../reference_src/02-dist-x-well-known-skills-index-json.md；../reference_src/02-dist-backstage-well-known-skills-index-json.md）
- “规模市场”与“可信治理”是不同产品路线：LobeHub 强调规模与 MCP-compatible plugins，但可安装性/版本化/验证链路仍需进一步证据核验。（Ref: ../reference_src/02-dist-lobehub-github-readme.md；../reference_src/02-dist-lobehub-market-cli-npm.md）
- 分发安全的风险面可用 OWASP LLM Top 10 的 supply chain/plugin/excessive agency 分类作为底线基线，再结合平台的扫描与复核链路落地。（Ref: ../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/02-dist-sundial-docs-security.md）
- [hard_fact] MCP Registry 提供了另一条“registry/hub”范式的官方样本：metadata-only（不托管 artifacts）+ 认证决定命名空间 + 分包类型 ownership verification + 不可变版本语义；同时明确本体不提供强 moderation 或 SLA，安全扫描/评级等预期由 aggregators/subregistries 叠加。这为技能分发层讨论“可信分发边界在哪一层”提供可迁移参照。（Ref: ../reference_src/03-supply-mcp-registry-quickstart-publish.md；../reference_src/03-supply-mcp-registry-authentication.md；../reference_src/03-supply-mcp-registry-package-types.md；../reference_src/03-supply-mcp-registry-versioning.md；../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-moderation-policy.md）

## 6 个固定问题覆盖情况

- 这个主题当前的硬事实是什么：已出现至少三类分发层对象（跨宿主安装 CLI、带验证/版本治理的 hub、以及规模市场），并且安全扫描与版本快照等机制已被官方文档化。（Ref: ../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-sundial-home.md；../reference_src/02-dist-sundial-docs-security.md；../reference_src/02-dist-lobehub-github-readme.md）
- 背后的根本机制是什么：把 skills 当作制品治理，需要解决“可安装/可更新/可追溯/可评估风险”，对应机制包括：源解析与落盘策略、lock files/哈希状态、不可变版本、扫描与复核、以及私有发现与鉴权。（Ref: ../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-vercel-skills-docs-lock-files.md；../reference_src/02-dist-vercel-skills-docs-update-system.md；../reference_src/02-dist-sundial-docs-push-publish.md；../reference_src/02-dist-sundial-docs-security.md；../reference_src/02-dist-sundial-docs-cli.md）
- 生态最近在往哪里演化：向标准化 registry 入口（well-known endpoint + schema/校验固化）与默认安全治理链路演化，同时跨宿主安装成为基础能力。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md；../reference_src/02-dist-sundial-docs-cli.md；../reference_src/02-dist-sundial-docs-security.md）
- 采用或落地的难点在哪里：symlink vs copy 的升级治理差异、scan 覆盖面与误报/漏报、以及规模市场的质量筛选与可验证性不足。（Ref: ../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-sundial-docs-security.md；../reference_src/02-dist-lobehub-github-readme.md）
- 社区争议和失败模式在哪里：大市场“规模口径”与“可信可用”脱节；以及供应链/插件/过度代理风险在缺少权限与审计机制时会被放大。（Ref: ../reference_src/02-dist-lobehub-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）
- 哪些对象最值得继续追踪：Sundial（验证/版本/私有发现）、Vercel Skills（source formats + well-known registry）、LobeHub（可安装语义与 CLI 能力面），以及更多分发侧的安全与更新治理实证。（Ref: ../reference_src/02-dist-sundial-docs-security.md；../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-lobehub-market-cli-npm.md）

## 缺口与下一步补搜

- Vercel `skills` CLI 的安全/更新治理仍缺“强信任”机制证据（例如签名/可验证来源/供应链风险缓解策略）；目前已覆盖 lock files、hash-based update checking 与 update API，但还不足以说明端到端完整性保障。（Ref: ../reference_src/02-dist-vercel-skills-docs-lock-files.md；../reference_src/02-dist-vercel-skills-docs-update-system.md）
- well-known endpoint 已出现真实采用样本，但生态口径仍分裂：既存在 v0.2.0（agent-skills + digest）与 legacy（skills + files）并存，也存在“发布者只做 legacy”的滞后；仍需补“消费侧收敛证据”（除 Vercel CLI 外，哪些安装器/宿主消费哪种 schema、以及如何处理完整性/信任）。（Ref: ../reference_src/00-shared-cloudflare-agent-skills-discovery-rfc-0-2-0.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md；../reference_src/02-dist-x-docs-skill-md.md；../reference_src/02-dist-backstage-docs-ai-skills.md）
- LobeHub “skills” 的可安装语义与验证链路仍缺证据；目前仅有规模与 CLI 包存在性线索。（Ref: ../reference_src/02-dist-lobehub-github-readme.md；../reference_src/02-dist-lobehub-market-cli-npm.md）
