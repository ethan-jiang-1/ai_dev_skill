# 主题 3（supply）证据摘要（Wave 1）

## 证据包清单

- `../reference_src/00-shared-agentskills-overview.md`
- `../reference_src/00-shared-anthropic-skills-readme.md`
- `../reference_src/01-host-claude-what-are-skills.md`
- `../reference_src/03-supply-expo-docs-expo-skills.md`
- `../reference_src/03-supply-expo-site-expo-skills.md`
- `../reference_src/03-supply-expo-skills-github-readme.md`
- `../reference_src/03-supply-cloudflare-skills-github-readme.md`
- `../reference_src/03-supply-huggingface-docs-agent-skills.md`
- `../reference_src/03-supply-huggingface-skills-github-readme.md`
- `../reference_src/03-supply-mcp-base-protocol-2025-06-18.md`
- `../reference_src/03-supply-cloudflare-mcp-guide.md`
- `../reference_src/03-supply-awesome-mcp-servers.md`
- `../reference_src/03-supply-awesome-agent-skills-voltagent.md`
- `../reference_src/00-shared-owasp-llm-top10-v1-1.md`

## 关键判断 -> 证据回指

- “企业第一方仓库 + 社区索引 + MCP 协议/servers”是供给层互补网络（准确性/长尾发现/运行时工具层）。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
- 第一方供给的关键差异不是 skill 数量，而是“可用性工程”：跨宿主安装/触发口径、封装与治理策略。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- skills 与 MCP 是分层共生：skills 倾向过程编排；MCP 以 JSON-RPC 的 host/client/server 模式把外部能力标准化并引入授权/部署边界（remote OAuth vs local stdio）。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
- 社区索引主要是“线索库”，不能直接当作证据库；关键条目需回到官方 docs/仓库核验。（Ref: ../reference_src/03-supply-awesome-mcp-servers.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md）
- 供给层引入 plugins/MCP servers 后，风险面扩大到供应链与过度代理，需要把权限/描述/回归验证纳入供给与治理。（Ref: ../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/03-supply-huggingface-skills-github-readme.md）

## 6 个固定问题覆盖情况

- 这个主题当前的硬事实是什么：企业第一方已在官方 docs/仓库中以可安装资产的方式供给 skills，并出现与 MCP servers 配套交付；MCP 协议提供 JSON-RPC 的 client-server 基线与 transport/auth 口径；社区存在大量策展索引作为发现入口。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md）
- 背后的根本机制是什么：供给为了“可用”必须同时解决宿主差异（安装/触发/封装）与外部能力接入（MCP），而社区索引承担长尾聚合但不具备权威性。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-awesome-mcp-servers.md）
- 生态最近在往哪里演化：从单仓库走向“文档 + 官网入口 + CLI/marketplace”产品化，且供给侧更倾向把 skills 与 MCP/插件封装一起交付。（Ref: ../reference_src/03-supply-expo-site-expo-skills.md；../reference_src/03-supply-huggingface-docs-agent-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md）
- 采用或落地的难点在哪里：跨宿主兼容（skills/extensions/fallback）、触发语义差异（auto-discovery vs slash commands）、索引时效与质量不稳定、以及权限/安全边界治理成本。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/03-supply-awesome-mcp-servers.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
- 社区争议和失败模式在哪里：把索引当证据导致误导；把 skills 当 commands 导致“装了但找不到入口”；以及引入第三方 plugins/MCP servers 带来的供应链/过度代理风险。（Ref: ../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）
- 哪些对象最值得继续追踪：`expo/skills`、`cloudflare/skills`、`huggingface/skills`；MCP 规范与关键 servers；Awesome 索引与其背后的提交站点（例如 mcpservers.org）。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-docs-agent-skills.md；../reference_src/03-supply-awesome-mcp-servers.md）

## 缺口与下一步补搜

- 需要把“跨宿主适配”的关键外链抓成一手证据（例如 Codex skills guide、Gemini extensions docs、Cursor plugins/remote rules 细则），避免只引用企业 README 的二手描述。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md）
- 对 MCP 协议还需要补齐 tools/resources/prompts 等 server feature 章节与官方 reference servers 仓库级证据，才能把“共生层”从概念落到可实现细节。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
