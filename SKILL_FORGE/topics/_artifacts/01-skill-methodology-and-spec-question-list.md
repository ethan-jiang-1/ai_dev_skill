# 01 / Skill 方法论与规范接口 / Question List

- `status`: `in_progress`

## 已初步回答

- skill 的最小定义能否跨平台稳定成立
  - 目前已可初步回答为“可以在较高层稳定成立”: 目录级对象、`SKILL.md`、`name`、`description`、按需加载是最稳的共同层。
- `SKILL.md` 与 `AGENTS.md` 的边界是否正在收敛成共识
  - 当前可以先按 `AGENTS.md = passive / always-on`、`skills = active / on-demand specialized workflow` 理解。
- 哪些结构字段已经接近事实标准，哪些仍是平台私有约定
  - 核心字段更接近事实标准；`compatibility`、`metadata`、`allowed-tools` 还存在实现差异。

## 仍待补充

- 各客户端对 `allowed-tools`、`compatibility`、`metadata` 的实际支持矩阵如何
- 哪些 placement / activation 差异会影响 skill 的可迁移性
- 能否沉淀出一份“当前最小可迁移 authoring checklist”
