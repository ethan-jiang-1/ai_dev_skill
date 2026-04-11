# Local Example Teardown: `gstack`

- `source_path`:
  - `/Users/bowhead/ai_dev_skill/gstack-analysis/eval_skills/01-总览.md`
- `source_type`: `local-analysis-derived-note`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `internal-derived`
- `why_it_matters`: `这组本地拆解很适合当高级样本，因为它把 skill、模板、浏览器 runtime、专项审查和多宿主适配捆成了一个完整 sprint 系统。`
- `claims_supported`:
  - skill 仓库可以进化成完整的 AI 工作流系统，而不只是 slash command 集合
  - 模板治理、浏览器 runtime 和 specialist review 会显著改变 skill 的可执行性
  - 读高级样本时，真正该盯的是系统层而不是命令数量

## 关键事实

- 本地拆解指出，该样本不仅有大量 `SKILL.md`，还有：
  - `SKILL.md.tmpl`
  - 浏览器 daemon / runtime 假设
  - review specialists
  - QA taxonomy
  - 多宿主接入
- 拆解的结论很清楚：如果只看 README 或命令数量，会严重低估这种仓库的系统性。
- 对学习者来说，这类高级样本最能说明 skill engineering 如何从 prompt 仓库进化成产品化系统。

## 与本研究的关系

- 这份例子适合放在附录 A，承担“高级阅读样本”的角色。
- 它能帮助主 Playbook 解释：为什么到了进阶阶段，阅读 skill 的重点会从 `SKILL.md` 本体，转向模板、runtime、specialists 和治理基础设施。

## 风险与局限

- 这是本地拆解后的总结，不是官方原始设计文档。
- 它更适合作为高级阅读参考，不建议读者把它当作冷启动阶段的默认模板。
