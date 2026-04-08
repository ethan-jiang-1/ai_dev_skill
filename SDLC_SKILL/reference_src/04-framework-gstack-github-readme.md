# garrytan/gstack: README

- source_url: https://github.com/garrytan/gstack
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: gstack 把“团队角色分工 + SDLC 阶段流水线 + 质量/安全/发布”编码成一组强观点 slash commands/skills，并提供团队模式的自动更新与跨宿主安装脚本，是研究“组织社会学模拟派”与“长周期治理/运维化分发”的一手样本。

## Key Facts

- 定位：作者将 gstack 描述为把 Claude Code 变成“虚拟工程团队”的方法论框架，包含多个 specialist 角色与一组固定入口命令（如 `/office-hours`、`/review`、`/qa`、`/ship` 等）。
- 强调流程：README 明确将其描述为 process（不是工具集合），并用 “Think → Plan → Build → Review → Test → Ship → Reflect” 表达 sprint 顺序；上游技能产物会被下游技能读取。
- 安装机制：README 提供通过 `git clone ... ~/.claude/skills/gstack && ./setup` 的安装方式，并要求在 `CLAUDE.md` 中加入“使用哪些 gstack commands/skills”的项目级指令。
- 团队模式：README 给出 `./setup --team` 与 repo bootstrap（提交 `.claude/` 与 `CLAUDE.md`）的方案，并宣称会做静默、节流的自动更新检查以减少版本漂移。
- 多宿主适配：README 列出 `./setup --host <name>` 的宿主目标（含 Codex/OpenCode/Cursor 等）与对应安装路径，并指出“添加新的宿主支持”只需改一个 TypeScript 配置文件。

## Claims Supported

- “工程治理型框架”不仅是提示词，它往往会把角色分工、阶段顺序、质量门禁（review/qa/security/release）编码为固定入口命令与产物链路。（主题4 framework）
- 团队级采用往往需要处理版本漂移与同步成本，因此会出现“团队模式 + 自动更新 + repo bootstrap”的工程化分发策略。（主题4 framework；与主题2 dist 交叉）

## Captured Excerpts (keep short)

> Think → Plan → Build → Review → Test → Ship → Reflect

## Terms / Concepts

- slash commands
- team mode / auto-update
- host targeting (`./setup --host ...`)
- `CLAUDE.md` (project policy)

## Risks / Limits

- README 同时包含大量宣传性指标与机制性细节；对“质量/安全审计”相关能力需要进一步抓取对应 skills 的实现与输出制品格式，避免只引用口号。

