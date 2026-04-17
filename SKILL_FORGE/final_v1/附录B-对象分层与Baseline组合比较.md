# 附录 B：对象分层与 Baseline 组合比较

这份附录不做"总冠军榜"。  
它的目标只有一个：把对象的角色边界讲清楚，让你知道什么该拿来学，什么该拿来装，什么该拿来治理，什么只能当入口或补层。

## B1. 为什么这份附录很重要

当前 skill 生态的问题，不是对象太少，而是太容易混类。

最典型的混淆有三种：

- 把目录站当成质量背书
- 把 installer（安装层）当成评测或治理系统
- 把样板库当成完整工程基座

只要这三种混淆还在，后面所有"推荐什么"的结论都会漂。

## B2. 当前最稳的对象分层

| 层 | 它负责什么 | 当前代表对象 | 最不该误读成什么 |
| --- | --- | --- | --- |
| `sample library` | 高质量样板、结构参考 | `vercel-labs/agent-skills` | 全链路工程基座 |
| `installer / manager` | 安装、列出、更新、路径映射 | `vercel-labs/skills` | trust 或 evaluation 系统 |
| `governance / publish` | 审计、质量门槛、发布前治理 | `skill-forge` | 冷启动唯一答案 |
| `registry / directory` | 发现 skill、公开入口 | `skills.sh` | 质量或安全背书 |
| `community learning hub` | 教程、案例、社区聚合 | `github/awesome-copilot` | 工程基座 |
| `library manager` | 内部或团队化 curated shelf（精选存放层） | `Ai-Agent-Skills` | 通用 installer 替代品 |
| `runtime bridge` | 本地或自托管运行桥接 | `open-skills` | 默认全局基座 |
| `optimization mechanisms` | 回归、反馈、候选修订 | Promptfoo / LangSmith / DSPy / OpenAI evals 风格机制 | skill package 规范本身 |

最重要的不是表本身，而是背后的一个判断：

> 当前生态已经从"几个 skill 仓库"分化成了多个职责层，不再适合被看成同一类对象。

## B3. 为什么最终推荐不是单一赢家

因为当前没有任何一个对象在所有维度上都明显最强。

更实际的情况是：

- `agent-skills` 强在学习和结构参考
- `skills` 强在安装、分发和兼容层
- `skill-forge` 强在治理、发布和 artifact 级质量门槛
- `skills.sh` 和 `awesome-copilot` 强在入口和学习效率
- 持续优化机制强在上线后的稳定化，而不是 authoring（写作）本身

所以如果一定要问"谁第一"，信息会丢掉大半。  
更稳的问法是：

- 你现在缺哪一层
- 你现在要补哪种能力

这才接近真实工作场景。

## B4. 当前最值得先学的入口

### 1. `skills.sh`

最值得先学的原因：

- 它把"哪里有现成 skill"这件事做成了低成本入口
- 它能快速拉开你的视野

但要记住：

- 它解决的是发现，不是信任
- 它能让你更快找到对象，不能替你判断对象值不值得装

### 2. `github/awesome-copilot`

最值得先学的原因：

- 它把社区教程、样本、工具入口组织成了学习层
- 对"借鉴别人怎么写"尤其有帮助

但要记住：

- 它更像 learning hub（学习中心）
- 不是工程基座

### 3. `vercel-labs/agent-skills`

最值得先学的原因：

- 它最适合用来学结构、`Use when`、支撑文件分层
- 对"先读后编"最有帮助

但要记住：

- 它是样板库
- 不是 installer、不是治理层、也不是评测系统

这三个对象合在一起，最适合解决的是"先看什么、先学什么"。

## B5. 当前最值得先搭的 baseline 组合

当前最稳的 baseline 组合仍然是：

- `vercel-labs/agent-skills`
- `vercel-labs/skills`
- `skill-forge`

可以把它理解成一个三层组合：

| 组合层 | 当前候选对象 | 它负责什么 |
| --- | --- | --- |
| 结构样板层 | `vercel-labs/agent-skills` | 给你高质量样板和组织方式 |
| 安装与分发层 | `vercel-labs/skills` | 把 skill 放进项目或个人环境，做受控安装 |
| 治理与发布层 | `skill-forge` | 补结构审计、质量门槛与发布前治理 |

这个组合为什么更稳？

因为它尊重现实里的职责分工，而不是强迫一个对象同时承担：

- 学习
- 安装
- 治理
- 评测
- 发布

现实里，这些事情就是不同层。

## B6. baseline 组合之外，必须补上的两条纪律

如果只搭工具组合，不补纪律，还是不稳。  
当前至少要补下面两条纪律。

### 1. 信任纪律

也就是：

- 不把目录站当安全背书
- 不把下载量当有效性证明
- 不把样板库当作"装进去就稳"

更稳的做法是：

- 安装前先审
- 装完后再测

### 2. 优化纪律

也就是：

- 不能因为 skill 现在能用，就默认以后也稳
- 不能因为修改后看起来更顺眼，就默认结果更好

更稳的做法是：

- 留代表性任务
- 做对照
- 版本固定
- 能回退
- 有失败回流

这两条纪律，决定的是 skill 会不会越积越乱。

## B7. 只在特定场景下追加的增强层

并不是所有对象都适合默认进入第一层 baseline。  
有些对象更适合在特定场景下追加。

### `open-skills`

更适合：

- 本地 LLM
- MCP
- 自托管 runtime bridge（运行桥接）

不适合：

- 当作所有人都该默认先上的通用基座

### `Ai-Agent-Skills`

更适合：

- 团队内部精选库
- 个人长期维护的 curated shelf

不适合：

- 直接替代通用 installer 和治理层

### 持续优化机制

例如 Promptfoo、LangSmith、DSPy、OpenAI evals 风格机制，更适合：

- skill 已经进入高频使用
- 你已经开始关心回归、失败回流和候选修订

不适合：

- 在 skill 还没基本成形时，就拿来替代结构设计和样板借鉴

## B8. 当前最该坚持的 anti-misread rules（防误读规则）

| 常见误读 | 为什么会错 | 更稳的理解 |
| --- | --- | --- |
| "`skills.sh` 上能找到，所以应该挺靠谱" | 目录站解决的是发现，不是质量判定 | 把它当 discovery 入口 |
| "`vercel-labs/skills` 能装，所以也能保证效果" | installer 解决的是装载，不是评测 | 装进去之后仍然要对照测试 |
| "`agent-skills` 最完整，所以应该就是基座" | 样板库强在学习，不等于治理和发布完整 | 把它当样板层 |
| "`skill-forge` 方向最对，所以现在就应该 all in" | 治理方向重要，不等于所有实践都得从它起步 | 把它当治理层和后期质量门槛 |
| "找得到、下载多、结构像样，就说明直接能上生产" | 发现、分发、结构质量和任务效果不是一回事 | 仍然要保留信任和评测纪律 |

如果把这张表压成一句话，就是：

> 能找到，不等于能信；能安装，不等于有效；很适合学，不等于应该直接重押。

## B9. 如果你现在就要做选择，怎么选

### 场景 1：我刚开始建立视野

优先：

- `skills.sh`
- `github/awesome-copilot`
- `vercel-labs/agent-skills`

### 场景 2：我已经会写一点，想搭最小工作流

优先：

- `vercel-labs/agent-skills`
- `vercel-labs/skills`
- trust gate（信任门）
- with/without evaluation（有无 skill 的对照评测）

### 场景 3：我已经进入持续维护阶段

优先：

- baseline 组合
- `skill-forge`
- failure taxonomy（失败分类）
- regression harness（回归测试框架）
- versioning（版本治理）

## B10. 读完这份附录后，下一步做什么

把你现在最常提到的 3 个对象写下来，然后给它们分别标注：

- 它属于哪一层
- 我为什么会用它
- 我有没有误读过它

如果你发现自己常用的 3 个对象其实都落在学习层，那下一步就不是继续搜对象，而是补安装层或治理层。
