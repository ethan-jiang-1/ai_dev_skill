# 主题 3（supply）证据摘要（Wave 1）

## 证据包清单

- `../reference_src/00-shared-agentskills-overview.md`
- `../reference_src/00-shared-anthropic-skills-readme.md`
- `../reference_src/01-host-claude-what-are-skills.md`
- `../reference_src/01-host-openai-codex-agent-skills-docs.md`
- `../reference_src/03-supply-expo-docs-expo-skills.md`
- `../reference_src/03-supply-expo-site-expo-skills.md`
- `../reference_src/03-supply-expo-skills-github-readme.md`
- `../reference_src/03-supply-cloudflare-skills-github-readme.md`
- `../reference_src/03-supply-huggingface-docs-agent-skills.md`
- `../reference_src/03-supply-huggingface-skills-github-readme.md`
- `../reference_src/03-supply-mcp-base-protocol-2025-06-18.md`
- `../reference_src/03-supply-cloudflare-mcp-guide.md`
- `../reference_src/03-supply-mcp-servers-github-readme.md`
- `../reference_src/03-supply-mcp-registry-github-readme.md`
- `../reference_src/03-supply-mcp-registry-quickstart-publish.md`
- `../reference_src/03-supply-mcp-registry-authentication.md`
- `../reference_src/03-supply-mcp-registry-package-types.md`
- `../reference_src/03-supply-mcp-registry-aggregators.md`
- `../reference_src/03-supply-mcp-registry-moderation-policy.md`
- `../reference_src/03-supply-mcp-registry-versioning.md`
- `../reference_src/03-supply-mcp-registry-server-schema-2025-12-11.md`
- `../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md`
- `../reference_src/03-supply-mcp-server-prompts-2025-06-18.md`
- `../reference_src/03-supply-mcp-server-resources-2025-06-18.md`
- `../reference_src/03-supply-mcp-server-tools-2025-06-18.md`
- `../reference_src/03-supply-awesome-mcp-servers.md`
- `../reference_src/03-supply-awesome-agent-skills-voltagent.md`
- `../reference_src/00-shared-owasp-llm-top10-v1-1.md`

## 关键判断 -> 证据回指

- “企业第一方仓库 + 社区索引 + MCP 协议/servers + MCP Registry”是供给层互补网络：第一方保准确性与可用性工程，索引保长尾发现，协议/servers 把外部能力标准化成运行时工具层，而 registry 把 servers 的发布/发现推向可验证元数据与机器接口。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-mcp-servers-github-readme.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-aggregators.md）
- 第一方供给的关键差异不是 skill 数量，而是“可用性工程”：跨宿主安装/触发口径、封装与治理策略。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- skills 与 MCP 是分层共生：skills 倾向过程编排；MCP 以 JSON-RPC 的 host/client/server 模式把外部能力标准化并引入授权/部署边界（remote OAuth vs local stdio）。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
- [hard_fact] MCP server features 不是单一“工具调用”：prompts/resources/tools 三类原语有不同控制权层级与配套 methods/notifications，并且 tools/resources/prompts 各自有明确安全要求与治理前提。（Ref: ../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md；../reference_src/03-supply-mcp-server-prompts-2025-06-18.md；../reference_src/03-supply-mcp-server-resources-2025-06-18.md；../reference_src/03-supply-mcp-server-tools-2025-06-18.md）
- [hard_fact] MCP Registry 的发布与消费模型是“metadata-only + 可验证 + 可聚合”：发布通过 `mcp-publisher`，认证决定命名空间（GitHub 或域名 reverse-DNS），并对不同包类型定义 ownership verification；同时 registry 本身不承诺 uptime/durability，且 moderation policy 相当 permissive，增值治理预期下放到 subregistries/aggregators。（Ref: ../reference_src/03-supply-mcp-registry-quickstart-publish.md；../reference_src/03-supply-mcp-registry-authentication.md；../reference_src/03-supply-mcp-registry-package-types.md；../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-moderation-policy.md）
- 社区索引主要是“线索库”，不能直接当作证据库；关键条目需回到官方 docs/仓库核验。（Ref: ../reference_src/03-supply-awesome-mcp-servers.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md）
- 供给层引入 plugins/MCP servers 后，风险面扩大到供应链与过度代理，需要把权限/描述/回归验证纳入供给与治理。（Ref: ../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/03-supply-huggingface-skills-github-readme.md）

## 6 个固定问题覆盖情况

- 这个主题当前的硬事实是什么：企业第一方已在官方 docs/仓库中以可安装资产的方式供给 skills，并出现与 MCP servers 配套交付；MCP 协议与 server features 形式化了 prompts/resources/tools 原语、消息方法与安全边界；官方 MCP Registry 已提供 server 的发布/发现与验证入口；社区仍有大量策展索引作为长尾发现入口。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md）
- 背后的根本机制是什么：供给为了“可用”必须同时解决宿主差异（安装/触发/封装）与外部能力接入（MCP），而社区索引承担长尾聚合但不具备权威性。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-awesome-mcp-servers.md）
- 生态最近在往哪里演化：从单仓库走向“文档 + 官网入口 + CLI/marketplace”产品化；MCP 侧的 server 发现从 Awesome/README 正在向官方 Registry 迁移，且 Registry 正在引入可验证发布与不可变版本等包管理器语义。（Ref: ../reference_src/03-supply-expo-site-expo-skills.md；../reference_src/03-supply-huggingface-docs-agent-skills.md；../reference_src/03-supply-mcp-servers-github-readme.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-versioning.md）
- 采用或落地的难点在哪里：跨宿主兼容（skills/extensions/fallback）、触发语义差异（auto-discovery vs slash commands）、索引时效与质量不稳定、以及权限/安全边界治理成本。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/03-supply-awesome-mcp-servers.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
- 社区争议和失败模式在哪里：把索引当证据导致误导；把 skills 当 commands 导致“装了但找不到入口”；以及引入第三方 plugins/MCP servers 带来的供应链/过度代理风险。（Ref: ../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）
- 哪些对象最值得继续追踪：`expo/skills`、`cloudflare/skills`、`huggingface/skills`；MCP 规范与关键 servers；Awesome 索引与其背后的提交站点（例如 mcpservers.org）。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-docs-agent-skills.md；../reference_src/03-supply-awesome-mcp-servers.md）

## 缺口与下一步补搜

- 需要把“跨宿主适配”的关键外链抓成一手证据（例如 Gemini extensions docs、Cursor plugins/remote rules 细则），避免只引用企业 README 的二手描述。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- 需要补齐“宿主/客户端对 MCP Registry 的真实消费证据”：目前已覆盖 registry 的发布、schema、聚合器/子注册表与治理口径；官方也收录了一批 community consumers 作为线索，但仍需更多一手证据说明哪些 host/installer 在生产中消费 registry API 或 subregistry 元数据（以避免把愿景当现状）。（缺口；Ref: ../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-community-projects.md）
