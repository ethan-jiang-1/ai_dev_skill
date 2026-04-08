# 企业官方来源、社区索引与 MCP 共生

## 第一轮摘要（保留，不修改）

<!-- 下方为第一轮摘要原文，仅调整标题层级以适配二轮追加结构，不改动正文内容 -->

### 这份片段在讲什么

这份上下文聚焦在软件开发智能体能力包的“内容供给层”。

原始研究表明，高价值 skill 的来源不只是一种：

- 企业第一方官方仓库
- 社区人工策展列表
- MCP 工具生态

这三类来源加在一起，才构成了真正的能力发现网络。

### 从原始研究提炼出的核心结论

#### 1. 企业第一方仓库是垂直领域最精准的来源

原始研究特别点名了几类企业官方仓库：

- Expo
- Cloudflare
- Hugging Face

它们的重要性在于：

- 和自家 API / 框架更新保持同步
- 对特定技术栈的指导最准确
- 比第三方 prompt 更不容易过时

如果后续研究偏向某个技术栈，  
这类官方仓库往往比综合市场更值得优先追踪。

#### 2. Awesome 类索引是发现长尾实验的关键入口

原始研究认为，`awesome-claude-skills`、`awesome-agent-skills`、`awesome-copilot` 这类列表的价值，在于人工策展。

它们不是最终能力本身，  
但能高效找到：

- 长尾 skill 仓库
- 安全测试类 skill
- 调试和测试类 skill
- 多智能体实验项目
- 尚未被平台市场吸收的社区创新

也就是说，Awesome 清单更像生态雷达。

#### 3. MCP 不是 skill 的替代，而是运行时共生层

原始研究里一个很强的判断是：

- skill 提供“怎么做”的过程化指导
- MCP 提供“做这件事”的运行时工具和 API 桥梁

这意味着两者不是竞争关系，  
而是上下层协作关系。

更高级的 skill 往往不是孤立存在，  
而是在编排特定 MCP 服务器。

例如：

- 文件系统操作
- Git 操作
- 数据库读写
- Slack / 外部服务集成
- 设备控制

### 这一片段里最值得继续研究的对象

- Expo / Cloudflare / Hugging Face 这类企业第一方 skill 仓库
- `awesome-claude-skills`
- `awesome-agent-skills`
- `awesome-copilot`
- `awesome-mcp-servers`
- Glama 这类 MCP 目录与检查器

### 适合继续 Deep Research 的问题

- 哪些企业官方仓库最值得长期追踪
- Awesome 类索引里有哪些真正高价值的软件开发 skill
- skill 和 MCP 在真实工程场景里是怎么配合的
- 哪些 skill 实际上是“MCP 编排器”
- 如果目标是拿 skill 来解决开发问题，应该先研究 skill 本体还是先研究 MCP 能力面

### 这一片段的用途

如果下一轮 Deep Research 想回答下面这些问题，这份片段最适合直接当上下文：

- “除了官方平台市场，哪里还有高价值软件开发 skill 来源？”
- “企业官方仓库、Awesome 清单和 MCP 生态之间是什么关系？”
- “怎么从长尾社区资源里筛出值得继续跟踪的开发能力包？”

## 二轮新增证据

<!-- 每条新增事实都带 ../reference_src/*.md 回指 -->

- Agent Skills 概览页把 skills 定义为“instructions, scripts, and resources”的文件夹，并明确强调可移植与可版本控制，用于沉淀团队/组织上下文（portable, version-controlled packages）。（Ref: ../reference_src/00-shared-agentskills-overview.md）
- `anthropics/skills` 仓库说明其包含从创意到企业工作流的示例技能，并同时展示“开源 + source-available”的第一方供给形态（尤其是文档处理类生产技能）。（Ref: ../reference_src/00-shared-anthropic-skills-readme.md）
- Claude 官方说明提到 Partner skills，并明确其被设计为与各自的 MCP connectors 协同使用，支持更强的集成工作流。（Ref: ../reference_src/01-host-claude-what-are-skills.md）
- Expo 官方文档将 “Expo Skills” 定义为结构化 instruction files，用于构建/部署/调试 Expo 与 React Native apps，并明确可与 Claude Code、Cursor、Codex 等宿主协作以提升准确性与效率。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md）
- Expo 官方给出跨宿主安装与触发口径：Claude Code 通过 plugin marketplace 安装；Cursor 通过 Remote Rule（GitHub URL）安装，且 skills 不出现在 `/` 菜单中，主要通过与 skill 描述匹配的 auto-discovery 触发。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-expo-skills-github-readme.md）
- Expo 通过官网入口页把 skills 作为可分发资产对外发布，并给出统一 CLI 安装示例（`bunx skills add expo/skills`）。这类入口页是“企业第一方供给开始产品化”的信号。（Ref: ../reference_src/03-supply-expo-site-expo-skills.md）
- Cloudflare 官方 skills 仓库同时供给 skills 与 commands，并明确区分两者的触发语义：commands 是用户显式调用的 slash commands；skills 是基于对话匹配 triggers 的 auto-loaded 指令包。（Ref: ../reference_src/03-supply-cloudflare-skills-github-readme.md）
- Cloudflare 官方 skills 仓库明确包含其 remote MCP servers（并列出 server 列表与用途），展示了“供给侧把技能指令层与运行时工具层打包”的形态。（Ref: ../reference_src/03-supply-cloudflare-skills-github-readme.md）
- Hugging Face Hub 官方文档将 skills 描述为 curated set，每个 skill 是自包含 `SKILL.md`；并声明支持 Claude Code、OpenAI Codex、Gemini CLI、Cursor 等宿主，且给出 Claude Code plugin marketplace 的安装示例与可用 skills 清单口径。（Ref: ../reference_src/03-supply-huggingface-docs-agent-skills.md）
- Hugging Face 官方仓库 README 把“跨宿主兼容”当作一等公民：既提供 Agent Skills 格式的 skills，也给出 Gemini extensions、Cursor plugin manifests、Codex `.agents/skills` copy/symlink 等适配路径，并提供 `agents/AGENTS.md` 作为不支持 skills 的 fallback。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md）
- Hugging Face 官方仓库 README 还揭示了供给侧的治理分工：`marketplace.json` 的描述面向人类浏览，而 `SKILL.md` description 用于 Claude 的激活匹配；CI 会校验 name/path 一致性。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md）
- Cognite 的官方文档把 “MCP server + SKILL.md capability file” 作为一套组合能力对外发布：页面提供 Copy MCP Server 入口，并给出 `npx skills add https://docs.cognite.com` 的安装/更新口径，同时显式给出 skill file（`/skill.md`）与 well-known discovery index（`/.well-known/skills/index.json`）链接。（Ref: ../reference_src/03-supply-cognite-docs-ide-ai-integration.md）
- OpenAI Codex 官方文档明确区分 skills（authoring format）与 plugins（installable distribution unit），并指出 plugins 可捆绑 app mappings 与 MCP server configuration；同时提供 `$skill-installer` 用于安装 curated skills，形成“内置 + 可安装”的供给入口。（Ref: ../reference_src/01-host-openai-codex-agent-skills-docs.md）
- MCP Base Protocol 规范给出协议硬事实基线：MCP client/server 消息 MUST 遵循 JSON-RPC 2.0；并区分 HTTP vs stdio transport 的授权模型口径（HTTP auth framework；stdio 通常不走 HTTP auth）；且声明 TypeScript schema 是协议的 source of truth。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
- Cloudflare 官方 MCP 指南给出清晰的三段式术语与连接模式：host（如 Claude/Cursor）内嵌 client，连接 server 暴露 tools/prompts/resources；remote 连接通过 Streamable HTTP + OAuth；local 连接通过 stdio。并提供 tool 设计与权限范围的最佳实践。（Ref: ../reference_src/03-supply-cloudflare-mcp-guide.md）
- MCP Server Features 概览页把 server 原语拆成 prompts/resources/tools，并给出控制权层级：prompts 是 user-controlled（如 slash commands/menu options）；resources 是 application-controlled（如 file contents、git history）；tools 是 model-controlled（如 API POST、file writing）。（Ref: ../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md）
- MCP Prompts 规范强调 prompts 是 user-controlled prompt templates；server MUST 在 initialization 时声明 prompts capability，并定义 `prompts/list`、`prompts/get` 与 `notifications/prompts/list_changed`；且要求实现 MUST 验证 prompt inputs/outputs 以防注入与未授权访问。（Ref: ../reference_src/03-supply-mcp-server-prompts-2025-06-18.md）
- MCP Resources 规范将 resources 定义为以 URI 唯一标识的 application-driven 上下文数据；定义 `resources/list`、`resources/read`、`resources/templates/list`，并提供可选 `resources/subscribe` 与 `notifications/resources/updated`；且要求 servers MUST validate all resource URIs。（Ref: ../reference_src/03-supply-mcp-server-resources-2025-06-18.md）
- MCP Tools 规范将 tools 定义为 model-controlled 的可执行函数；定义 `tools/list`、`tools/call` 与 `notifications/tools/list_changed`；并明确 human-in-the-loop 建议，以及输入/输出校验、访问控制、限流与审计等安全条目。（Ref: ../reference_src/03-supply-mcp-server-tools-2025-06-18.md）
- MCP 官方 `modelcontextprotocol/servers` 仓库是 steering group 维护的 reference implementations 集合，并明确提示“server 列表应看 MCP Registry”；仓库列出少量 reference servers（例如 Everything 服务器覆盖 prompts/resources/tools），并警告这些实现非生产级，需要按 threat model 自行加固。（Ref: ../reference_src/03-supply-mcp-servers-github-readme.md）
- MCP Registry 官方 README 把 registry 定位为“为 MCP clients 提供 MCP servers 列表（like an app store）”，并记录 registry 的阶段性状态（preview launch 与 v0.1 API freeze）。（Ref: ../reference_src/03-supply-mcp-registry-github-readme.md）
- MCP Registry 的官方 Quickstart 明确：registry 只托管 metadata 不托管 artifacts；发布通过官方 `mcp-publisher` CLI 完成；以 npm 为例需在 `package.json` 中加入 `mcpName` 并与 `server.json` 的 `name` 匹配；发布后可通过 registry 的 `v0.1` API 搜索验证。（Ref: ../reference_src/03-supply-mcp-registry-quickstart-publish.md）
- MCP Registry 已出现企业级消费侧集成样本：ServiceNow AI Gateway/AI Control Tower 支持直接从 MCP community registry（`registry.modelcontextprotocol.io`）浏览并导入 MCP servers。（Ref: ../reference_src/03-supply-servicenow-ai-gateway-mcp-registry-consumption-2026-03.md）
- MCP Registry 的认证文档明确：认证方法决定 server name 的 namespace（GitHub-based `io.github.username/*` 或 reverse-DNS `com.example.*/*`）；域名验证支持 DNS TXT record 与 `/.well-known/mcp-registry-auth` 文件两条链路。（Ref: ../reference_src/03-supply-mcp-registry-authentication.md）
- MCP Registry 的 package-types 文档列出支持的 `registryType`（npm/pypi/nuget/oci/mcpb）与对应的 ownership verification 方法：npm 用 `mcpName` 字段；PyPI/NuGet 用 README 中的 `mcp-name: $SERVER_NAME` 字符串；OCI 用 `io.modelcontextprotocol.server.name` annotation/label；MCPB 要求 `fileSha256`（client 安装前校验完整性）。（Ref: ../reference_src/03-supply-mcp-registry-package-types.md）
- MCP Registry 的 aggregators 文档明确：官方 registry 提供 unauthenticated read-only API 且不提供 uptime/durability guarantees；subregistry 允许通过 `_meta` 注入评分/安全扫描等自定义元数据；同时 moderation policy 强调 registry 本身“minimal-to-no moderation”，移除主要通过 `status=\"deleted\"` 信号化。（Ref: ../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-moderation-policy.md）
- MCP Registry 的 versioning 文档明确：每个 server publication 必须有唯一 version；发布后 metadata 不可变；并禁止版本范围字符串，且对 semver 解析与 latest 标记有明确规则。（Ref: ../reference_src/03-supply-mcp-registry-versioning.md）
- MCP `server.json` schema（2025-12-11）把 discovery/installation/configuration 的元数据载体契约化：`ServerDetail` 必填 `name/description/version`，并包含 `packages[]`（带 `registryType/identifier/transport`）与 `remotes[]`（streamable-http/sse + variables）；同时 schema 显式警告命令参数可能导致 command injection，建议客户端优先非 shell 执行并在必要时获取用户/agent 同意。（Ref: ../reference_src/03-supply-mcp-registry-server-schema-2025-12-11.md）
- Awesome MCP Servers 索引把 MCP 供给以“服务器/集成”为单位组织，明确包含 filesystem/git/fetch 等 reference servers 与大量 official servers，可作为“工具层供给地图”的入口，但条目需回到一手仓库核验。（Ref: ../reference_src/03-supply-awesome-mcp-servers.md）
- Awesome Agent Skills（VoltAgent）索引自述为 curated collection，并明确反对 bulk AI-generated skills，按组织/团队聚合大量官方与社区 skills 线索，是长尾发现网络的重要入口。（Ref: ../reference_src/03-supply-awesome-agent-skills-voltagent.md）

## 二轮新增机制理解

<!-- 从“描述”上升到“为什么这样设计”的解释；每条带 ../reference_src/*.md 回指 -->

- 供给层天然会分成“第一方仓库 + 社区索引 + 协议/工具生态”三块：第一方仓库能把产品真实机制、安装/触发路径、维护节奏绑定在一起；社区索引解决长尾发现；MCP 协议与 servers 则把“外部能力”抽象成可复用的运行时工具层。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
- 企业第一方供给往往不只交付 `SKILL.md`，而是交付一整套“可用性工程”：跨宿主安装路径、触发语义解释、甚至把 commands/skills/MCP servers 打包在同一插件中，以降低用户把能力接进宿主的摩擦。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/03-supply-cloudflare-skills-github-readme.md）
- “skills 不在 slash 命令里出现、而是靠描述匹配触发”的宿主机制差异，使得供给侧必须同时提供：给 agent 用的 activation metadata（例如 `SKILL.md` description）与给人看的 marketplace/README 说明，否则用户会误把 skills 当 commands 来找入口。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- Codex 的官方口径进一步把“供给侧打包单位”讲清：skills 适合承载工作流内容，而 plugins 是可安装的分发单位，甚至可以把 MCP server configuration 一并打包，说明“skills 编排 + MCP 工具”正在供给侧走向同包交付。（Ref: ../reference_src/01-host-openai-codex-agent-skills-docs.md）
- MCP 让“工具接入”成为协议层对象：host 内嵌 MCP client，通过 server 暴露 tools/resources/prompts；remote vs local 的连接与授权模型（Streamable HTTP + OAuth vs stdio）把部署边界与安全边界显式化，从而支撑 skills 作为“过程编排层”去组合调用 MCP 工具。（Ref: ../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
- MCP 之所以容易在实践中被“说混”，核心原因是 server features 不是单一工具调用：prompts/resources/tools 三类原语分别对应不同控制权与交互面（user-controlled vs application-driven vs model-controlled），并分别配套 capability negotiation、list/get/read/call 方法与 list_changed/updated 通知；这决定了供给侧/宿主侧需要按原语设计 UI、权限与审计，而不是把一切都当成“tool”。（Ref: ../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md；../reference_src/03-supply-mcp-server-prompts-2025-06-18.md；../reference_src/03-supply-mcp-server-resources-2025-06-18.md；../reference_src/03-supply-mcp-server-tools-2025-06-18.md）
- 企业供给开始把 MCP 配置与 skills 同仓发布（例如仓库同时提到 remote MCP servers，或提供 `.mcp.json` 指向 MCP server URL），这意味着供给侧在主动把“指令层”和“运行时连接层”一起产品化，而不是让用户自己拼装。（Ref: ../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- 社区索引的价值不是权威性，而是“发现网络”：通过策展把分散仓库聚合成入口，并用显式标准（例如拒绝 bulk AI-generated）对供给质量做粗粒度筛选，但最终仍需回到官方 docs/仓库做 ground truth 核验。（Ref: ../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-awesome-mcp-servers.md）

## 二轮新增趋势与难点

<!-- 趋势：有时间维度的证据；难点：长尾发现/列表质量/MCP边界；每条带 ../reference_src/*.md 回指 -->

- 趋势：企业第一方 skills 从“GitHub 仓库”走向“文档 + 官网入口 + 统一安装口径”的产品化组合，开始像 SDK/CLI 一样被运营与维护，而不是一次性 prompt 分享。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-expo-site-expo-skills.md；../reference_src/03-supply-huggingface-docs-agent-skills.md）
- 趋势：供给侧正在出现“技能指令 + MCP 工具层 + 宿主插件封装”合流的交付形态（同仓提供 plugin manifests、MCP servers 或 MCP 配置），使得 skills 更像可安装的工程资产，而不是松散文本。（Ref: ../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- 趋势：MCP 的标准化在企业平台侧被更明确地叙述为 host/client/server 分层，并给出 remote（OAuth）与 local（stdio）两类连接范式，表明 MCP 正在向“可部署、可授权、可回归测试”的工程标准靠拢。（Ref: ../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
- 趋势：MCP 侧的 server 发现正在被官方导向 Registry 化：官方 reference servers 仓库明确提示“要找 server 列表应看 MCP Registry”，并声明 README 中的第三方 server 列表不再维护且未来会移除。（Ref: ../reference_src/03-supply-mcp-servers-github-readme.md）
- 趋势：MCP Registry 正在把“server 发现”从 README/索引推向“可发布 + 可验证 + 可聚合”的机器化接口：官方将 registry 描述为 app-store 式清单，提供 `mcp-publisher` 发布工具与多种认证/命名空间验证（GitHub、DNS、HTTP well-known），并给出分包类型 verification 与“不可变版本”的包管理器语义；同时把安全扫描/评级等增值能力显式下放到 aggregators/subregistries（通过 `_meta` 注入）。（Ref: ../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-quickstart-publish.md；../reference_src/03-supply-mcp-registry-authentication.md；../reference_src/03-supply-mcp-registry-package-types.md；../reference_src/03-supply-mcp-registry-versioning.md；../reference_src/03-supply-mcp-registry-aggregators.md）
- 难点：跨宿主兼容成本是真实存在的。一个“同源 skill 供给”需要同时处理不同宿主的安装目录、封装格式（skills vs extensions）、manifest 生成与 fallback（如 `AGENTS.md`）策略。（Ref: ../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- 难点：发现与触发语义在宿主间不一致（例如 Cursor 中 skills 不在 `/` 菜单中，依赖 auto-discovery），导致“装上了但不会用/找不到入口”的常见失败模式；供给侧必须用 docs/README 把这种差异讲清。（Ref: ../reference_src/03-supply-expo-skills-github-readme.md）
- 难点：社区索引的条目质量与时效性难以保证，且索引本身的提交流程可能是站点化的（例如不接受 PR、要求网站提交），因此索引更适合做线索库而不是证据库。（Ref: ../reference_src/03-supply-awesome-mcp-servers.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md）
- 难点：当供给层把 skills、plugins、MCP servers 大规模引入工程链路，会显著放大“插件/供应链/过度代理”的风险面，要求把安全与权限收敛纳入供给与治理设计。（Ref: ../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
- 难点：把 MCP Registry 当成“安全背书”会导致误判。官方 moderation policy 明确其相当 permissive，且强调 minimal-to-no moderation；同时官方聚合器文档明确 registry 不提供 uptime/durability guarantees。企业采用需要在 subregistry/内部流程做额外筛选、持久化与安全扫描。（Ref: ../reference_src/03-supply-mcp-registry-moderation-policy.md；../reference_src/03-supply-mcp-registry-aggregators.md）
- 难点：MCP server features 的安全与治理要求是分层的：tools 需要 human-in-the-loop、输入/输出校验、访问控制、限流与审计；resources 要求 URI 校验与资源权限；prompts 要求防注入与输入/输出校验。供给侧若只提供“server 地址”而不说明这些治理前提，会把风险与失败成本转嫁给采用方。（Ref: ../reference_src/03-supply-mcp-server-tools-2025-06-18.md；../reference_src/03-supply-mcp-server-resources-2025-06-18.md；../reference_src/03-supply-mcp-server-prompts-2025-06-18.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md）

## 当前判断（二轮综合后）

<!-- 综合第一轮和第二轮的判断；每条判断带 ../reference_src/*.md 回指；如推翻/修正需注明 -->

- 对 SDLC 技能供给层而言，“企业第一方仓库 + 社区索引 + MCP 协议/servers + MCP Registry”构成一个互补网络：企业仓库负责准确性与可用性工程，索引负责长尾发现，MCP 负责把外部能力标准化成运行时工具层，而 registry 负责把 servers 的发布/发现从 README/索引推向可验证的元数据与机器接口。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cognite-docs-ide-ai-integration.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-mcp-servers-github-readme.md；../reference_src/03-supply-mcp-registry-github-readme.md；../reference_src/03-supply-mcp-registry-aggregators.md）
- MCP Registry 不应被当作“默认可信的安全筛选器”：官方明确 registry 只托管 metadata、不托管 artifacts，且 moderation policy 相当 permissive；因此企业更现实的做法是把 registry 当作上游元数据源，在下游 subregistry/内部流程叠加安全扫描、评级与持久化，并把 package-type verification 与不可变版本语义纳入发布与审计流程。（Ref: ../reference_src/03-supply-mcp-registry-quickstart-publish.md；../reference_src/03-supply-mcp-registry-moderation-policy.md；../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-package-types.md；../reference_src/03-supply-mcp-registry-versioning.md）
- MCP Registry 的“真实消费侧”正在出现企业级集成信号：例如 ServiceNow AI Gateway/AI Control Tower 支持直接从 MCP community registry 浏览并导入 MCP servers。这意味着 registry 很可能会进入企业的治理与审批流程，但也更要求下游 subregistry/内部流程补齐安全扫描、持久化与审计。（Ref: ../reference_src/03-supply-servicenow-ai-gateway-mcp-registry-consumption-2026-03.md；../reference_src/03-supply-mcp-registry-aggregators.md；../reference_src/03-supply-mcp-registry-moderation-policy.md）
- 最值得长期追踪的供给对象，不是“skills 数量最多”的集合，而是那些能同时提供：官方机制解释、跨宿主安装/触发口径、以及与 MCP 工具层的配套集成的第一方仓库与文档。（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/03-supply-cognite-docs-ide-ai-integration.md）
- skills 与 MCP 的关系更像“静态过程编排层 vs 运行时能力层”：MCP 在协议与 server features 层把 prompts/resources/tools 三类原语与 control hierarchy（user-controlled/application-driven/model-controlled）形式化，并通过 remote（OAuth/HTTP）与 local（stdio）两类连接明确安全边界；skills 则沉淀何时选用哪类原语、如何组合调用与如何加 guardrails 的执行策略。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-cloudflare-mcp-guide.md；../reference_src/03-supply-mcp-server-features-overview-2025-06-18.md；../reference_src/03-supply-mcp-server-tools-2025-06-18.md）
- 社区索引应被当作“线索入口”而不是 ground truth：它能高效发现长尾 servers/skills，但由于更新频繁、质量参差，需要把关键条目回溯到官方 docs/仓库，再纳入可追溯证据库。（Ref: ../reference_src/03-supply-awesome-mcp-servers.md；../reference_src/03-supply-awesome-agent-skills-voltagent.md）
- 供给层的现实挑战在于“兼容与治理”而不是“写 prompt”：跨宿主封装差异（skills/extensions/fallback）与安全风险（插件/供应链/过度代理）决定了供给侧必须把 manifest、描述分工、CI 校验、权限范围与回归测试纳入交付。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/00-shared-owasp-llm-top10-v1-1.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
