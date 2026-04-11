# Evaluation Versioning And Cross Surface Gaps

- `source_urls`:
  - `https://platform.claude.com/docs/en/agents-and-tools/agent-skills/enterprise`
  - `https://platform.claude.com/docs/en/build-with-claude/skills-guide`
- `source_type`: `official-doc-comparison`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `official`
- `why_it_matters`: `这组官方材料把一个经常被低估的问题固定下来: skill lifecycle 不应在“写完并装上”时结束，还必须包括 evaluation、versioning、surface gap management 与 fallback。`
- `claims_supported`:
  - evaluation / deploy / monitor / deprecate 是 lifecycle 固有部分
  - custom skills 不会天然跨所有 surface 同步
  - version pinning、fallback 和 staged rollout 是工程必需项，不是可选打磨

## 关键事实

- Claude Enterprise 文档把 skill lifecycle 直接写成一条更完整的流程:
  - plan
  - create
  - test
  - deploy
  - monitor
  - iterate or deprecate
- 同一份文档明确指出:
  - custom skills 不会自动在不同 surface 之间同步
  - 当前没有直接的 usage analytics API 可用来做全自动闭环
- API Skills guide 则进一步强调:
  - 生产环境应做 version pinning
  - 应保留 fallback 策略
  - 更新前要在代表性任务上测试
- 这意味着 skill engineering 并不是“像拷贝 Markdown 一样轻量”的问题，而更接近:
  - 一个需要 release discipline 的配置与内容资产系统

## 与本研究的关系

- 对 `02` 来说，这组材料补上了第一轮最缺的那部分“后运营”证据。
- 如果只看 install / add / update 命令，很容易误以为工具链已经接近完整。
- 但官方文档显示真正难的部分还包括:
  - 不同 surface 的行为差异
  - 版本固定与升级节奏
  - 没有平台级 analytics 时如何自己做验证
- 这也解释了为什么 `skill-forge` 这类治理对象仍然重要，因为 publish 之后并不等于 lifecycle 已结束。

## 风险与局限

- 当前材料主要来自 Claude 体系，其他平台的 versioning 和 analytics 能力可能不同。
- 它足够证明这类问题客观存在，但还没有把各家平台的差异矩阵完全补齐。
