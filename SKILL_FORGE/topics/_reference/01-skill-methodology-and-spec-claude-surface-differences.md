# Claude Surface Differences For Skill Portability

- `source_urls`:
  - `https://code.claude.com/docs/en/skills`
  - `https://code.claude.com/docs/en/agent-sdk/skills`
  - `https://platform.claude.com/docs/en/build-with-claude/skills-guide`
- `source_type`: `official-doc-comparison`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这组官方文档最直接地说明了“共同 skill 结构”和“具体客户端能力”不是一回事，因此它能帮 `01` 把可迁移 authoring baseline 与 surface-specific 扩展清楚拆开。`
- `claims_supported`:
  - portable core 与客户端私有扩展字段必须分开看
  - Claude Code CLI、Agent SDK、API runtime 对 skill 的支持方式并不完全一致
  - skill engineering 里的“规范”已经不能只写格式，还必须写清运行边界

## 关键事实

- Claude Code 文档展示的 frontmatter 已明显超出最小共同层，常见字段包括:
  - `argument-hint`
  - `disable-model-invocation`
  - `user-invocable`
  - `allowed-tools`
  - `model`
  - `effort`
  - `context`
  - `agent`
  - `hooks`
  - `paths`
  - `shell`
- Agent SDK 文档把 Skills 暴露成 SDK 内可调用对象，但也明确提示某些 frontmatter 能力并非全表面一致支持。
- SDK 文档特别指出: `allowed-tools` frontmatter 只在 Claude Code CLI 中直接支持，这意味着它不应被误当成可无条件迁移的公共字段。
- API Skills guide 给出了非常硬的运行边界:
  - 每次请求最多 `8` 个 skills
  - 单次上传总大小上限 `30 MB`
  - skill execution container 默认没有网络访问
  - 不能在运行时安装新依赖
  - 每次请求都在 fresh isolated container 中执行
- 同一份 API guide 还建议 production workflow 做 version pinning 与 staged rollout，而不是直接把最新 skill 内容无差别推向所有任务。

## 与本研究的关系

- 对 `01` 来说，这组材料最重要的价值是纠正一个常见误判:
  - 有 open format
  - 不等于所有 surface 都有同等能力
- 因此，当前更合理的方法论口径应拆成两层:
  - `portable core`
  - `surface-specific extensions`
- 如果后续要设计自己的 skill authoring baseline，最稳的写法应优先围绕:
  - `SKILL.md`
  - `name`
  - `description`
  - progressive disclosure
  - supporting files
  而把 `allowed-tools`、execution model、hooks 一类对象放进兼容性附录，而不是强行当成默认必备字段。

## 风险与局限

- 这组来源主要来自 Claude 自身文档，对其他生态的实现差异没有直接覆盖。
- 它足够证明“实现层存在分化”，但还不能单独给出完整跨平台支持矩阵。
