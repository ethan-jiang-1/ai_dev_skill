# Orchestration And Recall Limits In Skill Lifecycle

- `source_urls`:
  - `https://platform.claude.com/docs/en/agents-and-tools/agent-skills/enterprise`
  - `https://arxiv.org/abs/2603.02176`
- `source_type`: `official-doc-and-research`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `mixed-high`
- `why_it_matters`: `这组材料把 `02` 从“工具有什么功能”推进到“skill 数量上来以后，系统如何记住、选中并编排这些 skill”，这是 lifecycle 后半段最容易被忽略的一层。`
- `claims_supported`:
  - 太多可用 skills 会带来 recall / selection failure，而不是简单的能力累加
  - lifecycle 需要包含 skill bundling、selection 和 orchestration，不只是 authoring 与 install
  - flat invocation 很可能不是长期最优形态

## 关键事实

- Claude Enterprise 官方文档明确提醒:
  - active skills 太多时，agent 可能无法稳定选中正确的 skill
  - 推荐先从更具体、role-based 的 bundles 开始
  - 应先评估，再考虑 consolidation
- 同一份 enterprise 文档说明，当前 API 并不直接提供 usage analytics，这意味着“skill 有没有被调用、是否真的有效”不能完全依赖平台自动告诉你。
- `AgentSkillOS` 研究把 skill 使用拆成两个核心阶段:
  - `Manage Skills`
  - `Solve Tasks`
- 该研究进一步表明:
  - tree-based retrieval 更接近 oracle selection
  - DAG orchestration 在同一组 skills 上显著优于 native flat invocation
- 这说明当 skill 数量上升时，真正的工程问题会从“有没有 skill”转向:
  - 怎么检索
  - 怎么编排
  - 怎么限制同时激活的范围

## 与本研究的关系

- 对 `02` 来说，这组证据补上了第一轮分段草案里仍偏静态的一块:
  - 我们之前已经能区分 sample / installer / governance / runtime
  - 现在还必须把 orchestration / recall control 纳入 lifecycle
- 这也强化了“组合式 baseline”的必要性，因为:
  - sample library 解决内容来源
  - installer 解决装载
  - governance 解决审计与发布
  - 但 selection / orchestration 仍需要额外设计

## 风险与局限

- 研究论文提供的是强方向性证据，不等于现成开源项目已经把这些能力产品化。
- 官方 enterprise 文档更偏实践建议，未必代表所有平台都用同样的 retrieval 机制。
