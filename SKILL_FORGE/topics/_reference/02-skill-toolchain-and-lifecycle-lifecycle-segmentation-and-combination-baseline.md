# Lifecycle Segmentation And Combination Baseline Draft

- `source_type`: `cross-source-synthesis`
- `accessed_at`: `2026-04-11`
- `related_topic`: `02-skill-toolchain-and-lifecycle`
- `trust_level`: `analytic`
- `why_it_matters`: `这份文档把前面的对象重新放回同一张 lifecycle 图里，避免继续把不同职责边界的项目直接横向比较。`
- `claims_supported`:
  - 当前生态更像组合式工具链，而不是单一全链路基座
  - 不同对象覆盖的是 skill lifecycle 的不同段落
  - “推荐什么”最终很可能要拆成不同层的 baseline 组合

## 当前生命周期分段草案

| Segment | 主要问题 | 代表对象 |
| --- | --- | --- |
| `repo-guidance` | 仓库级长期指令如何表达 | `AGENTS.md` |
| `skill-package` | 可复用 skill 的最小目录对象是什么 | `SKILL.md` format / sample repos |
| `sample-library` | 高质量样板从哪里借鉴 | `vercel-labs/agent-skills` |
| `install-manager` | skill 如何安装、更新、检查、定位到不同 agent 目录 | `vercel-labs/skills` |
| `library-manager` | 团队如何维护自己的 skill 书架、来源与说明 | `Ai-Agent-Skills` |
| `runtime-bridge` | 如何把现有 skills 跑到本地 LLM / MCP 环境 | `open-skills` |
| `governance-publish` | 如何审计、安全扫描、修复、发布 skill | `skill-forge` |
| `registry-directory` | skill 如何被发现、收录、统计 | `skills.sh` |

## 当前组合式 baseline

- 如果目标是“尽快建立可用 workflow”，当前更像需要三层组合:
  - `sample-library`
  - `install-manager`
  - `governance-publish`
- 如果目标是“本地 / 自托管 / MCP 场景”，还需要补一层 `runtime-bridge`。
- 如果目标是“团队长期维护自己的 skill 书架”，`library-manager` 也是独立层，不应简单并入 installer。

## 当前判断

- 单一对象覆盖全链路的证据仍然不强。
- 当前最接近现实的答案不是“找唯一赢家”，而是先承认 skill engineering 已经分化出多层工程职责。
- 后续横向比较应优先比较:
  - 同类型对象之间谁更强
  - 以及哪种组合最接近可落地 baseline

## 风险与局限

- 这份文档是本轮综合判断，不应被误当成外部来源。
- 后续仍需要更多对象与失败样本来检验这张分段图是否足够稳定。
