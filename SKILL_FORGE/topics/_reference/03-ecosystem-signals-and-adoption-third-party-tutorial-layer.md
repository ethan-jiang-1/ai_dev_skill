# Third Party Tutorial Layer Around Skills

- `source_urls`:
  - `https://alejandro-ao.com/agent-skills/`
  - `https://www.cloudnativedeepdive.com/creating-your-first-agent-skill-a-hands-on-tutorial/`
- `source_type`: `third-party-tutorials`
- `accessed_at`: `2026-04-11`
- `related_topic`: `03-ecosystem-signals-and-adoption`
- `trust_level`: `secondary`
- `why_it_matters`: `这组第三方教程不是用来证明哪个项目最强，而是用来证明 skill 已经形成独立的外部教学层和成长入口，这正是“借鉴别人 skill 能显著缩短摸索期”的现实基础之一。`
- `claims_supported`:
  - skill 生态已经从 vendor docs 延伸到独立教程与教学内容
  - 外部教学层围绕 create / install / store / share / safe-use 展开
  - “先借鉴、再动手、再积累经验”已经成为被公开传授的实践路径

## 关键事实

- Alejandro AO 的教程直接把文章定位成 `Full Crash Course`，明确覆盖:
  - create
  - install
  - share
  - reusable agent context
  - best practices
- 这说明 skill 已经不只是少数项目 README 里的内部约定，而是可以独立教学的对象。
- Cloud Native Deep Dive 的教程则更进一步把问题组织成三类现实问题:
  - 现在有哪些 maintained skills 可用
  - skills 该如何集中存储和管理
  - 如何创建自己的 skills
- 该文还明确强调:
  - `SKILL.md` 是 mandatory file
  - 常见 supporting directories 包括 `scripts/`、`references/`、`assets/`
  - skills 需要放进 provider 期望的 project / personal 目录才能被自动发现
  - prompt injection 与维护、更新、安全是持续问题

## 与本研究的关系

- 对 `03` 来说，这组来源补的是“第三方教学层存在”这个信号，而不是“独立效果已经被证明”。
- 它直接支持用户关心的成长命题:
  - 完全靠自己慢慢悟当然可以
  - 但现实里已经有不少现成教程、样板和目录能显著缩短冷启动
- 同时，这些教程讨论的主题也与我们当前三 topic 分工高度一致:
  - `01`: 什么是 skill，结构怎么写
  - `02`: 怎么创建、存储、装载
  - `03`: 去哪里找、怎样借鉴、怎样更安全地用

## 风险与局限

- 这类来源属于 secondary evidence，不能替代官方文档或独立 benchmark。
- 第三方教程可能混入作者自身产品偏好或对平台演进节奏的滞后理解，因此更适合拿来证明“教学层存在”，不适合单独承担最终排序依据。
