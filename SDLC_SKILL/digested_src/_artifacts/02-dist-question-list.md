# 主题 2（dist）问题清单更新（Wave 1）

## 已回答（有证据回指）

- Sundial 发布与版本治理：`push` 会创建 immutable version snapshot；version 来源于 frontmatter 的 `version`，版本不更新会 auto-bump（整数/semver）；支持 public/private、team、changelog、categories。（Ref: ../reference_src/02-dist-sundial-docs-push-publish.md）
- Sundial 安全链路：使用 Cisco AI Skill Scanner、Semgrep、model-based review；并在模糊案例加入 manual review；UI 展示 severity 与触发原因摘要。（Ref: ../reference_src/02-dist-sundial-docs-security.md）
- Sundial 跨宿主落盘：CLI auto-detect agent 并安装到 `.claude/skills`、`.cursor/skills`、`.codex/skills`、`.gemini/skills` 等；鉴权同时影响 publish 与 private discovery。（Ref: ../reference_src/02-dist-sundial-docs-cli.md）
- Vercel Skills CLI 的 source detection logic：支持 GitHub/GitLab/git/local 等多格式；docs 暴露 `/.well-known/skills/index.json` 入口，而 CLI 代码实现补齐了 `index.json` schema/校验并优先 `/.well-known/agent-skills/index.json`（legacy fallback 到 `/.well-known/skills/index.json`）。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md；../reference_src/02-dist-vercel-skills-well-known-index-schema.md）
- Vercel Skills 的 lock files：global `~/.agents/.skill-lock.json` + local `./skills-lock.json`（明确 intended to be checked into version control），并用 `skillFolderHash/computedHash` 与确定性 JSON 输出降低团队协作摩擦。（Ref: ../reference_src/02-dist-vercel-skills-docs-lock-files.md）
- Vercel Skills 的 update system：`skills check/update` 读取 lock file 的 `skillFolderHash`，并通过远端 update API（`https://add-skill.vercel.sh/check-updates`）取最新 hash 对比返回更新列表。（Ref: ../reference_src/02-dist-vercel-skills-docs-update-system.md）
- LobeHub 的规模主张线索：官方 README 提出 “10,000+ Skills ... MCP-compatible plugins”。（Ref: ../reference_src/02-dist-lobehub-github-readme.md）

## 待验证 / 待补搜

- Vercel `skills` CLI 的安全/更新治理机制仍需补齐“强信任”证据（签名/可验证来源/供应链风险缓解策略）；目前已覆盖 lock files、hash-based update checking 与 update API。（Ref: ../reference_src/02-dist-vercel-skills-docs-lock-files.md；../reference_src/02-dist-vercel-skills-docs-update-system.md）
- well-known endpoint 的生态采用情况与口径收敛（`agent-skills` vs `skills` 路径、`index.json` 字段扩展/兼容策略），以及是否被多 CLI/宿主实现。
- LobeHub “skills” 的具体语义：是否可安装的 SKILL.md 包、是否可版本化、如何筛选与验证、是否存在安全扫描链路。
- `@lobehub/market-cli` 的实际命令面与能力范围（find/install/update 等），以及是否支持团队/私有化分发。

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：基本稳定（Vercel Skills / Sundial / LobeHub），但仍可能出现新的 registry/hub。
- 新搜到的材料是否主要重复已知事实：开始出现重复（不同页面在重复“安装/版本/安全扫描”口径）。
- 是否已覆盖 6 个固定问题（且每个有证据）：已覆盖（见 `02-dist-evidence-summary.md`）。
- 是否已补搜反例、限制、争议：部分覆盖（扫描覆盖面/误报漏报、规模市场噪音），仍缺更多实证与反例。
- 是否已完成“官方说法 vs 社区实践”交叉核验：未完成（缺用户落地报告、scan 误报案例、以及对 well-known endpoint 的生态采用证据）。
