# Methodology Convergence Draft

- `source_type`: `cross-source-synthesis`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `analytic`
- `why_it_matters`: `这份文档把 `01` 的多个来源收束成“当前已经稳定的共识”和“仍未完全收敛的部分”。`
- `claims_supported`:
  - 当前已经存在一组可重复出现的事实共识
  - 方法论正在收敛，但仍未完全统一
  - 后续 `02` 和 `03` 可以基于这套口径继续评估对象与采用价值

## 当前已经较稳的共识

- skill 的最小载体是一个目录，至少包含 `SKILL.md`。
- `SKILL.md` 需要 YAML frontmatter 与 Markdown 正文。
- `name` 与 `description` 是稳定核心字段。
- discovery 阶段通常只依赖 `name + description`，因此 `description` 是 routing 级字段。
- 完整 instructions 与 supporting resources 倾向按需加载，这就是 progressive disclosure 的方法论核心。
- `scripts/`、`references/`、`assets/` 这类 supporting files 已经是高频结构，而不是罕见扩展。

## 当前仍未完全收敛的部分

- `compatibility`、`metadata`、`allowed-tools` 这类扩展字段虽然进入了规格与实践讨论，但客户端支持仍有差异。
- placement、activation、权限处理等客户端实现细节并未完全统一。
- “open standard” 已成立，但“实现行为完全一致”还远未成立。

## 当前方法论层判断

- skill engineering 正在从“写 prompt”收敛到“设计目录级、可路由、可扩展、可治理的能力包”。
- 好的 skill 不是把所有知识塞进一个 `SKILL.md`，而是把:
  - metadata
  - instructions
  - references
  - scripts
  分层组织起来。
- 这意味着 `01` 的最终输出不应只是定义，而应是一套可指导作者和工具设计者的分层框架。

## 风险与局限

- 这份文档是综合判断，不是原始来源。
- 后续仍需要补更多客户端差异与失败案例，来检验这些共识的稳定度。
