# Wave 2 Final Recommendation Syntax Draft

- `status`: `in_progress`
- `purpose`: `决定最终交付不应如何表达，以及当前最稳的推荐语法应该长什么样。`
- `basis`:
  - `W2-formal-comparison-table.md`
  - `W2-combination-baseline-workflow-draft.md`
  - `W2-surface-compatibility-appendix-codex-github-claude.md`
  - `W2-cross-topic-synthesis.md`
- `warning`: `这份文档决定的是推荐语法，不是最终对外报告终稿。`

## 不推荐的表达方式

### 1. 不建议只给一个总榜

- 原因不是“不能排”，而是单榜会把三类本质不同的对象强行压平:
  - learning / discovery layer
  - engineering baseline layer
  - governance / trust layer
- 这样会直接丢失最重要的工程信息：
  - 为什么某对象适合学但不适合装
  - 为什么某对象适合装但不负责 trust
  - 为什么某对象值得跟踪但还不该重押

### 2. 不建议把“最值得学”和“最值得采用”混成同一个推荐口径

- 当前证据已经反复表明:
  - public skills 很好找
  - 现成样板很适合借鉴
  - 但有效性、信任边界与工程成熟度并不会自动跟着一起成立

## 当前最稳的最终推荐语法

### Part A. Learning / Discovery 推荐

- 用来回答:
  - 去哪里找现成 skill
  - 去哪里观察成熟写法
  - 去哪里缩短冷启动摸索期
- 当前最稳的对象池:
  - `skills.sh`
  - `github/awesome-copilot`
  - `vercel-labs/agent-skills`

### Part B. Engineering Baseline 推荐

- 用来回答:
  - 如果要落自己的 skill workflow，默认骨架应该怎么搭
- 当前最稳的表达方式不是单对象，而是组合:
  - `vercel-labs/agent-skills`
  - `vercel-labs/skills`
  - `skill-forge`
- 这组对象分别承担:
  - 结构样板
  - install / distribution
  - governance / publish

### Part C. Trust / Usage Discipline

- 用来回答:
  - 即便对象值得学或值得试，使用时还必须额外注意什么
- 必须显式写入的 discipline:
  - trust gate before install
  - with / without evaluation
  - version pinning
  - rollback
  - role-based bundling

### Part D. Context-Specific Add-ons

- 用来回答:
  - 哪些对象不是默认基座，但在特定场景下很重要
- 当前主要包括:
  - `open-skills`
  - `Ai-Agent-Skills`

## 推荐写法模板

最终交付时，更建议用下面这种语法，而不是一个平铺榜单：

```md
## 最值得先学的 3 个入口

...

## 最值得先搭的 baseline 组合

...

## 使用时必须保留的信任与评测纪律

...

## 只在特定场景下追加的增强层

...
```

## 为什么这是当前最稳的写法

- 它与当前证据结构一致:
  - `01` 负责方法论共同层
  - `02` 负责 lifecycle 与 baseline
  - `03` 负责 adoption、learning leverage 与 trust boundary
- 它也与当前现实约束一致:
  - 没有单一对象在所有维度上都最强
  - 生态发现层与工程基座层本来就不是同一批对象
  - cross-surface appendix 已经证明 host-specific semantics 不应被压扁成单一“标准赢家”

## 当前几乎可以定稿的判断

- 最终交付应以 `分角色推荐 + baseline 组合` 为主。
- 如果一定要给 `前 3`，也应明确:
  - 这是 learning-first 前 3
  - 或是值得先试的 baseline 相关前 3
- 不建议给一个不带语义标签的总榜。

## 当前还没完全定稿的点

- 要不要在最终文稿里保留一个“单榜附录”，供快速扫描使用。
- `open-skills` 与 `Ai-Agent-Skills` 是否需要进入最终正文，还是只放进场景化补充段。
