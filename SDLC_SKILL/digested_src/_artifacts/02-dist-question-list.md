# 主题 2（dist）问题清单更新（Wave 1）

## 已回答（有证据回指）

- Sundial 发布与版本治理：`push` 会创建 immutable version snapshot；version 来源于 frontmatter 的 `version`，版本不更新会 auto-bump（整数/semver）；支持 public/private、team、changelog、categories。（Ref: ../reference_src/02-dist-sundial-docs-push-publish.md）
- Sundial 安全链路：使用 Cisco AI Skill Scanner、Semgrep、model-based review；并在模糊案例加入 manual review；UI 展示 severity 与触发原因摘要。（Ref: ../reference_src/02-dist-sundial-docs-security.md）
- Sundial 跨宿主落盘：CLI auto-detect agent 并安装到 `.claude/skills`、`.cursor/skills`、`.codex/skills`、`.gemini/skills` 等；鉴权同时影响 publish 与 private discovery。（Ref: ../reference_src/02-dist-sundial-docs-cli.md）
- Vercel Skills CLI 的 source detection logic：支持 GitHub/GitLab/git/local 等多格式，并支持 `/.well-known/skills/index.json` 作为 well-known endpoint。（Ref: ../reference_src/02-dist-vercel-skills-docs-source-formats.md）
- LobeHub 的规模主张线索：官方 README 提出 “10,000+ Skills ... MCP-compatible plugins”。（Ref: ../reference_src/02-dist-lobehub-github-readme.md）

## 待验证 / 待补搜

- Vercel `skills` CLI 的安全/更新治理机制（签名/校验/验证、供应链风险缓解策略）。
- `/.well-known/skills/index.json` 的 schema/发布约定与生态采用情况（是否被多 CLI/宿主实现）。
- LobeHub “skills” 的具体语义：是否可安装的 SKILL.md 包、是否可版本化、如何筛选与验证、是否存在安全扫描链路。
- `@lobehub/market-cli` 的实际命令面与能力范围（find/install/update 等），以及是否支持团队/私有化分发。

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：
- 新搜到的材料是否主要重复已知事实：
- 是否已覆盖 6 个固定问题（且每个有证据）：
- 是否已补搜反例、限制、争议：
- 是否已完成“官方说法 vs 社区实践”交叉核验：
