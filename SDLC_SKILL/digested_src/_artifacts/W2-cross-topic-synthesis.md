# Wave 2：跨主题综合（术语对齐 + 判断矩阵 + 交叉验证）

## 证据包清单（跨主题）

<!--
目标：Wave 2 的每条横向判断都能在 30 秒内回指到本地 reference_src。
优先列 shared + 各主题最“承重”的 official ground truth。
-->

- `../reference_src/00-shared-agentskills-specification.md`
- `../reference_src/00-shared-anthropic-engineering-agent-skills-2025.md`
- `../reference_src/00-shared-vercel-skills-cli-readme.md`
- `../reference_src/00-shared-owasp-llm-top10-v1-1.md`
- `../reference_src/01-host-openai-codex-agent-skills-docs.md`
- `../reference_src/01-host-google-gemini-cli-extensions-reference.md`
- `../reference_src/01-host-cursor-plugins-blog-2026-02-17.md`
- `../reference_src/01-host-cursor-plugins-github-readme.md`
- `../reference_src/01-host-cursor-plugins-json-schemas.md`
- `../reference_src/01-host-cursor-plugins-create-plugin-scaffold-skill.md`
- `../reference_src/01-host-cursor-plugins-hooks-runtime-contract.md`
- `../reference_src/01-host-windsurf-skills-docs.md`
- `../reference_src/01-host-opencode-agent-skills-docs.md`
- `../reference_src/02-dist-vercel-skills-docs-source-formats.md`
- `../reference_src/02-dist-vercel-skills-well-known-index-schema.md`
- `../reference_src/02-dist-vercel-skills-cli-security-audit-api.md`
- `../reference_src/02-dist-sundial-docs-cli.md`
- `../reference_src/02-dist-sundial-docs-push-publish.md`
- `../reference_src/02-dist-sundial-docs-security.md`
- `../reference_src/02-dist-x-well-known-agent-skills-index-json.md`
- `../reference_src/02-dist-x-well-known-skills-index-json.md`
- `../reference_src/02-dist-backstage-well-known-skills-index-json.md`
- `../reference_src/02-dist-cognite-well-known-agent-skills-index-json.md`
- `../reference_src/02-dist-cognite-well-known-skills-index-json.md`
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
- `../reference_src/03-supply-expo-docs-expo-skills.md`
- `../reference_src/03-supply-cognite-docs-ide-ai-integration.md`
- `../reference_src/03-supply-servicenow-ai-gateway-mcp-registry-consumption-2026-03.md`
- `../reference_src/03-supply-cloudflare-skills-github-readme.md`
- `../reference_src/03-supply-huggingface-skills-github-readme.md`
- `../reference_src/04-framework-superpowers-github-readme.md`
- `../reference_src/04-framework-superpowers-using-superpowers-skill.md`
- `../reference_src/04-framework-superpowers-verification-before-completion-skill.md`
- `../reference_src/04-framework-superpowers-test-driven-development-skill.md`
- `../reference_src/04-framework-feature-driven-flow-github-readme.md`
- `../reference_src/04-framework-feature-driven-flow-specification.md`
- `../reference_src/04-framework-feature-driven-flow-effective-matrix-schema.md`
- `../reference_src/04-framework-spec-kit-github-readme.md`
- `../reference_src/04-framework-roo-code-custom-instructions-docs.md`
- `../reference_src/04-framework-roo-code-custom-modes-docs.md`

## 术语对齐（跨主题口径）

- `Skill (Agent Skills open standard)`：最小单元是目录 + `SKILL.md`（YAML frontmatter + body），`name/description` 是跨宿主可交换的最小元数据；其余“触发/权限/落盘/组合”属于宿主语义。（Ref: ../reference_src/00-shared-agentskills-specification.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- `Progressive Disclosure (PD)`：将“可发现”与“可执行”分层，典型是 startup 只预加载 `name/description`，当判定相关才加载完整 `SKILL.md`，需要时再加载 `references/` 等附属文件。（Ref: ../reference_src/00-shared-anthropic-engineering-agent-skills-2025.md；../reference_src/01-host-windsurf-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- `Plugin (Cursor/Codex)`：面向分发与安装的“能力打包单位”。Cursor 在官方仓库把插件落地为 `marketplace.json`（索引）+ 每插件 `plugin.json`（manifest）并提供 JSON Schema；并给出本地默认 plugins 目录 `~/.cursor/plugins/local/` 的约定；manifest 可声明 `skills/rules/hooks/agents/commands/mcpServers` 等组件，但 schema 层未出现显式权限/授权声明字段（例如 `permissions`）。官方示例 plugin 进一步给出 hooks 运行时契约（`stop/afterAgentResponse` + `followup_message`），说明 plugin 不只是静态打包，还能以 hooks 驱动 agent 执行流。与 `skill`（内容/工作流）是不同层抽象。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-cursor-plugins-github-readme.md；../reference_src/01-host-cursor-plugins-json-schemas.md；../reference_src/01-host-cursor-plugins-create-plugin-scaffold-skill.md；../reference_src/01-host-cursor-plugins-hooks-runtime-contract.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- `Extension (Gemini CLI)`：Gemini 的可安装打包单位（`gemini-extension.json`），可捆绑 MCP servers、agent skills、custom commands、hooks，并提供 `excludeTools` 等治理入口；安装默认拷贝，更新/变更通常需重启会话生效。（Ref: ../reference_src/01-host-google-gemini-cli-extensions-reference.md）
- `Workflow (Windsurf)`：手动触发（manual-only）的可复用流程文件（slash 命令），与可自动触发的 skill 语义不同，属于宿主特有抽象。（Ref: ../reference_src/00-shared-windsurf-workflows-docs.md）
- `MCP (protocol/server)`：运行时协议与服务层抽象，host 内嵌 MCP client 连接 MCP server；server features 以 prompts/resources/tools 三类原语对外暴露能力；remote vs local 的 transport/auth 直接影响企业部署边界。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md）
- `Registry/Hub/Installer`：分发层对象，提供“来源解析 + 安装落盘 + 更新/版本治理 +（可选）安全扫描与验证”。在 skills 侧体现为 `npx skills`/Sundial 这类 installer/hub；在 MCP server 侧体现为 MCP Registry 的 metadata-only 发布/验证与只读 API（增值治理下放到 aggregators/subregistries）。（Ref: ../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-sundial-docs-security.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-aggregators.md）

## 横向判断矩阵（hard_fact / analysis / trend）

<!--
规则：
- 必须显式标注 hard_fact / analysis / trend
- 每条至少 1 个 reference_src 回指；承重判断尽量 2+ 交叉来源
-->

- [hard_fact] `SKILL.md` 的“可交换基线”已相对清晰：skill = 目录 + `SKILL.md`（YAML frontmatter + body），`name/description` 有硬约束；但该规范只覆盖格式，不覆盖宿主运行语义。（Ref: ../reference_src/00-shared-agentskills-specification.md；../reference_src/01-host-opencode-agent-skills-docs.md）
- [hard_fact] 多宿主已将 PD 写入官方机制：启动阶段仅暴露/预加载 `name/description`，在 invoke 时才加载完整 `SKILL.md`，并支持更深层按需读取引用文件。（Ref: ../reference_src/00-shared-anthropic-engineering-agent-skills-2025.md；../reference_src/01-host-windsurf-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- [hard_fact] 生态正在用“可安装打包单位”承载更多 primitives：Cursor plugins 除了概念层声明（blog/forum），在官方仓库用 `marketplace.json` + `plugin.json`（含 JSON Schema）把可声明的组件字段（skills/rules/hooks/agents/commands/mcpServers）契约化；Codex 区分 skills vs plugins；Gemini extensions 可捆绑 MCP servers、skills、commands、hooks 并提供 `excludeTools`。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-cursor-plugins-github-readme.md；../reference_src/01-host-cursor-plugins-json-schemas.md；../reference_src/01-host-openai-codex-agent-skills-docs.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md）
- [hard_fact] 分发层已具备包管理器化的“来源识别与安装策略”：Skills CLI 支持多种 source formats，并支持 well-known endpoints；docs 暴露 `/.well-known/skills/index.json`，而 CLI 实现补齐 schema/校验并优先 `/.well-known/agent-skills/index.json`（legacy fallback）。（Ref: ../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md）
- [hard_fact] 分发层已出现可观察的“版本治理与供应链机制”：Sundial 明确每次 push 形成不可变版本快照，且在版本冲突时自动 bump。（Ref: ../reference_src/02-dist-sundial-docs-push-publish.md）
- [hard_fact] 分发层正在把安全扫描纳入默认链路：Sundial 文档点名 Cisco AI Skill Scanner、Semgrep、model-based review，并对模糊情况加入 manual review 与 UI 风险报告呈现。（Ref: ../reference_src/02-dist-sundial-docs-security.md）
- [hard_fact] 安装落盘的现实成本存在且已被文档化：Sundial CLI 以“auto-detect agent -> install targets”方式映射到 `.claude/.cursor/.codex/.gemini` 等目录。（Ref: ../reference_src/02-dist-sundial-docs-cli.md）
- [hard_fact] 企业第一方供给已形成“官方仓库 + 多宿主安装指引 +（可选）配套 MCP server”的交付形态，且明确依赖宿主的 auto-discovery/trigger 语义。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- [hard_fact] MCP 的协议层基线明确：client/server MUST 遵循 JSON-RPC 2.0；并区分 HTTP auth framework 与 stdio transport 的授权口径；server features 把 prompts/resources/tools 三类原语与 control hierarchy 形式化；Cloudflare 文档补充了 host/client/server 术语与 remote/local 模式。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md）
- [hard_fact] MCP server 的“发布与发现”正在被官方 Registry 化：MCP Registry 自述为 app-store 式清单，提供 `mcp-publisher` 发布工具与 GitHub/domain-based（DNS/HTTP well-known）认证，定义分包类型的 ownership verification，并采用不可变版本语义；同时 moderation policy 相当 permissive，安全扫描/评级等增值能力预期由 aggregators/subregistries 叠加；其核心元数据载体被契约化为 `server.json` schema（含扩展点 `_meta` 与安全提示）。（Ref: ../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-quickstart-publish.md；../reference_src/03-supply-mcp-registry-authentication.md；../reference_src/03-supply-mcp-registry-package-types.md；../reference_src/03-supply-mcp-registry-versioning.md；../reference_src/03-supply-mcp-registry-moderation-policy.md；../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-server-schema-2025-12-11.md）
- [hard_fact] 方法论框架已把 SDLC 治理落成可安装资产与固定流程契约：Superpowers 强调 mandatory workflows；FDF 以固定七阶段 + invariants + rule matrix + gates；Spec Kit 用命令链路落地工件；Roo Code 用 rules/modes 做权限与规则隔离。（Ref: ../reference_src/04-framework-superpowers-github-readme.md；../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-roo-code-custom-modes-docs.md）
- [analysis] “统一的不是产品，而是分层”：`SKILL.md` 更像最小 authoring format；真正决定可用性/可治理性的是宿主的 discovery scopes、触发语义与权限模型，以及分发层的安装/更新/验证。（Ref: ../reference_src/00-shared-agentskills-specification.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-windsurf-skills-docs.md；../reference_src/02-dist-vercel-skills-docs-source-formats.md）
- [analysis] “skills 与 MCP 的关系”更接近协作分层而非替代：skills 负责过程化编排与 guardrails，MCP server 提供运行时外部能力；供给侧与宿主的打包单位正把两者合并交付。（Ref: ../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md；../reference_src/03-supply-expo-docs-expo-skills.md）
- [analysis] “安全”不是分发层独立问题：风险面覆盖 prompt injection、供应链、插件设计与过度代理；因此宿主权限模型（tool exclusion/permissions）与分发扫描/版本治理必须协同，否则单点治理会失效。（Ref: ../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md；../reference_src/02-dist-sundial-docs-security.md）
- [trend] 分发层正在两条腿走路：一条腿向“包管理器化（source detection + well-known endpoint + update）”演进；另一条腿向“registry/hub（verified + scanning + snapshots）”演进。MCP Registry 的 metadata-only + verification + immutable versioning + subregistry 设计，属于后者在 MCP server 侧的具体落地。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-sundial-docs-security.md；../reference_src/02-dist-sundial-docs-push-publish.md；../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-package-types.md；../reference_src/03-supply-mcp-registry-versioning.md）
- [trend] 宿主平台正在把企业治理前移到分发入口：Cursor 明确提出 private team marketplaces（central governance + security controls），Gemini extensions 提供 enable/disable scope 与 `excludeTools`，Windsurf 提供 system（Enterprise）skills 下发路径。（Ref: ../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md；../reference_src/01-host-windsurf-skills-docs.md）
- [trend] 方法论框架的高杠杆治理原语（工件化、阶段不变量、显式 gate、规则分层覆写、权限/角色隔离）正在反向影响宿主与分发层的产品形态（modes/rules/plugins 的一等化）。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/04-framework-roo-code-custom-instructions-docs.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md）

## 每主题至少 2 个交叉验证结论（Wave 2 最低标准）

### 主题 1（host）

- host × dist：宿主目录与作用域差异客观存在，因此分发层必须显式处理“install targets / 落盘映射”，否则跨宿主“兼容”无法规模化。（Ref: ../reference_src/02-dist-sundial-docs-cli.md；../reference_src/01-host-windsurf-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- host × supply：企业第一方仓库之所以有长期价值，部分来自其把“宿主触发语义与安装入口”写进官方文档（auto-discovery、marketplace/plugin flow、skills CLI）。这意味着供给侧必须长期跟随宿主机制变化。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md）

### 主题 2（dist）

- dist × host：分发层的“包管理器化能力”在现实中要落到宿主的 discovery scopes 与目录扫描规则上，否则更新/禁用/冲突处理都无法闭环。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/01-host-opencode-agent-skills-docs.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- dist × framework：方法论框架与扩展生态天然引入 supply chain 风险与责任边界，因此分发层除了安装与更新，还需要版本快照、可审计与安全扫描/风险提示等治理能力。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/02-dist-sundial-docs-push-publish.md；../reference_src/02-dist-sundial-docs-security.md；../reference_src/02-dist-vercel-skills-cli-security-audit-api.md）

### 主题 3（supply）

- supply × host：供给侧正把“skills + MCP + commands/rules”打包在同一仓库/插件里，而这些 primitives 的最终执行边界由宿主决定（plugins/extensions 的语义）。供给侧要同时面对多个宿主封装层。（Ref: ../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/01-host-cursor-plugins-blog-2026-02-17.md；../reference_src/01-host-google-gemini-cli-extensions-reference.md）
- supply × dist：企业仓库/文档通过 `npx skills add <base-url>` 等入口进入“通用安装器链路”（CLI 自动发现 `SKILL.md`），这会把供给从“单一宿主 marketplace”扩展为“跨宿主来源”；同时也引入 well-known endpoint/registry 标准化方向。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cognite-docs-ide-ai-integration.md；../reference_src/00-shared-vercel-skills-cli-readme.md；../reference_src/02-dist-vercel-skills-docs-source-formats.md）

### 主题 4（framework）

- framework × host：框架需要同时适配“skills/commands/$tool”多种宿主交互面，且宿主差异会直接影响框架强制性与门禁是否能落地。（Ref: ../reference_src/04-framework-spec-kit-github-readme.md；../reference_src/04-framework-superpowers-github-readme.md；../reference_src/01-host-openai-codex-agent-skills-docs.md）
- framework × dist：框架往往不仅是文档，而是一组可安装资产（skills、rules、installer、更新命令），因此分发层的版本治理与安全审计会成为框架团队与采用方的共同需求。（Ref: ../reference_src/04-framework-feature-driven-flow-github-readme.md；../reference_src/02-dist-sundial-docs-push-publish.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）

## 缺口与下一步补证据（优先级）

- 已补齐 MCP Registry 的官方治理口径与契约（发布工具、认证/命名空间验证、分包类型 verification、聚合器/子注册表、moderation policy、不可变版本语义，以及 `server.json` schema）。真实消费侧仍需更强证据：已补到至少一个企业级平台消费侧集成样本（ServiceNow AI Gateway/AI Control Tower），但“主流 coding 宿主/企业安装器是否在生产中消费 registry/subregistry、以及其安全与更新策略如何落地”仍待进一步核验。（缺口；Ref: ../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-community-projects.md；../reference_src/03-supply-servicenow-ai-gateway-mcp-registry-consumption-2026-03.md）
- Cursor plugins 的运行时语义仍缺证据：已补齐官方仓库的 manifest/JSON Schema 与 marketplace 结构，并获得本地默认 plugins 目录 `~/.cursor/plugins/local/` 的官方仓库级证据；同时已补齐官方示例 plugin 的 hooks 运行时契约（`stop/afterAgentResponse` + `followup_message`），且已知 manifest schema 层未出现显式权限声明字段（例如 `permissions`）。但多插件加载顺序、权限边界（hooks/commands 的执行授权与审计）与 IDE/CLI 一致性仍需更直接的一手说明或实现级核验。（缺口；Ref: ../reference_src/01-host-cursor-plugins-create-plugin-scaffold-skill.md；../reference_src/01-host-cursor-plugins-hooks-runtime-contract.md；../reference_src/01-host-cursor-plugins-json-schemas.md）
- well-known endpoint 的生态采用情况与口径收敛仍缺证据：发布者侧已出现更多真实采用（X/Cognite 新旧双栈；Backstage legacy-only），且规范侧已给出 v0.2.0（digest）口径；但消费侧（多宿主/多 CLI）是否收敛到同一 schema/versioning/security 语义仍待验证。（缺口；Ref: ../reference_src/00-shared-cloudflare-agent-skills-discovery-rfc-0-2-0.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md；../reference_src/02-dist-x-well-known-agent-skills-index-json.md；../reference_src/02-dist-cognite-well-known-agent-skills-index-json.md；../reference_src/02-dist-backstage-well-known-skills-index-json.md）
