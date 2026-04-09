# 主题 2（dist）问题清单更新（Wave 1）

## 已回答（有证据回指）

- Sundial 发布与版本治理：`push` 会创建 immutable version snapshot；version 来源于 frontmatter 的 `version`，版本不更新会 auto-bump（整数/semver）；支持 public/private、team、changelog、categories。（Ref: ../reference_src/02-dist-sundial-docs-push-publish.md）
- Sundial 安全链路：使用 Cisco AI Skill Scanner、Semgrep、model-based review；并在模糊案例加入 manual review；UI 展示 severity 与触发原因摘要。（Ref: ../reference_src/02-dist-sundial-docs-security.md）
- Sundial 跨宿主落盘：CLI auto-detect agent 并安装到 `.claude/skills`、`.cursor/skills`、`.codex/skills`、`.gemini/skills` 等；鉴权同时影响 publish 与 private discovery。（Ref: ../reference_src/02-dist-sundial-docs-cli.md）
- Vercel Skills CLI 的 source detection logic：支持 GitHub/GitLab/git/local 等多格式；docs 暴露 `/.well-known/skills/index.json` 入口，而 CLI 代码实现补齐了 `index.json` schema/校验并优先 `/.well-known/agent-skills/index.json`（legacy fallback 到 `/.well-known/skills/index.json`）。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md）
- Vercel Skills 的 lock files：global `~/.agents/.skill-lock.json` + local `./skills-lock.json`（明确 intended to be checked into version control），并用 `skillFolderHash/computedHash` 与确定性 JSON 输出降低团队协作摩擦。（Ref: ../reference_src/02-dist-vercel-skills-docs-lock-files.md）
- Vercel Skills 的 update system：`skills check/update` 读取 lock file 的 `skillFolderHash`，并通过远端 update API（`https://add-skill.vercel.sh/check-updates`）取最新 hash 对比返回更新列表。（Ref: ../reference_src/02-dist-vercel-skills-docs-update-system.md）
- Vercel Skills CLI 的安全治理线索：安装流程会通过 audit API 拉取并展示 `Security Risk Assessments`（advisory），且 audit 失败/超时不会阻塞安装。（Ref: ../reference_src/02-dist-vercel-skills-cli-security-audit-api.md）
- LobeHub 的规模主张线索：官方 README 提出 “10,000+ Skills ... MCP-compatible plugins”。（Ref: ../reference_src/02-dist-lobehub-github-readme.md）
- `@lobehub/market-cli`（`lhm`）命令面与落盘语义：顶层 `auth/mcp/skills`；`skills search/view/install`，并支持 `--agent` 选择宿主，内置 `.claude/skills` / `.agents/skills` / `.cursor/skills` 等安装目录映射；也支持 `--version` / `--global`，并提供 env vars 或 `~/.lobehub-market/credentials.json` 的凭据读取逻辑。（Ref: ../reference_src/02-dist-lobehub-market-cli-tarball-0-0-28.md）

## 待验证 / 待补搜

- Vercel `skills` CLI 的安全/更新治理机制仍需补齐“强信任”证据（签名/可验证来源/供应链风险缓解策略）；目前已覆盖 lock files、hash-based update checking 与 update API。（Ref: ../reference_src/02-dist-vercel-skills-docs-lock-files.md；../reference_src/02-dist-vercel-skills-docs-update-system.md）
- well-known endpoint 的生态采用情况与口径收敛：发布者侧已出现多种真实状态（X/Cognite 新旧双栈；Backstage legacy-only），但消费侧（多 CLI/多宿主）是否收敛到同一 schema/versioning/security 语义仍需补证据。（Ref: ../reference_src/00-shared-cloudflare-agent-skills-discovery-rfc-0-2-0.md；../reference_src/02-dist-x-well-known-agent-skills-index-json.md；../reference_src/02-dist-cognite-well-known-agent-skills-index-json.md；../reference_src/02-dist-backstage-well-known-skills-index-json.md）
- LobeHub “skills” 的治理与信任语义：`skills install --version` 的版本语义（是否不可变/如何更新）、skill id 如何解析到 artifacts、是否存在 digest/签名/完整性校验、审核/安全扫描/下架策略、以及与 MCP plugins 分发的治理边界。
- LobeHub 是否支持企业侧团队/私有化分发（私有 registry 或私有 marketplace），以及鉴权模型与审计能力。

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：基本稳定（Vercel Skills / Sundial / LobeHub），但仍可能出现新的 registry/hub。
- 新搜到的材料是否主要重复已知事实：开始出现重复（不同页面在重复“安装/版本/安全扫描”口径）。
- 是否已覆盖 6 个固定问题（且每个有证据）：已覆盖（见 `02-dist-evidence-summary.md`）。
- 是否已补搜反例、限制、争议：部分覆盖（扫描覆盖面/误报漏报、规模市场噪音），仍缺更多实证与反例。
- 是否已完成“官方说法 vs 社区实践”交叉核验：未完成（缺用户落地报告、scan 误报案例、以及对 well-known endpoint 的生态采用证据）。
