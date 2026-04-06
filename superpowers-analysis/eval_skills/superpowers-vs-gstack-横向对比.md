# superpowers vs gstack 横向对比

## 对比前提

这里的对比不是“谁绝对更强”，  
而是看这两个仓库分别在解决什么问题、用什么结构解决、适合什么人学。

当前对比基于两份已经完成的分析：

- [superpowers-全量评估.md](file:///Users/bowhead/ai_dev_skill/superpowers-analysis/eval_skills/superpowers-%E5%85%A8%E9%87%8F%E8%AF%84%E4%BC%B0.md)
- [gstack-全量评估.md](file:///Users/bowhead/ai_dev_skill/gstack-analysis/eval_skills/gstack-%E5%85%A8%E9%87%8F%E8%AF%84%E4%BC%B0.md)

## 一句话先说差别

- **superpowers** 更像“高纪律的 agent 开发流程插件”
- **gstack** 更像“带 runtime 和多角色体系的 AI 工程操作系统”

这两个项目都不是普通 prompt 仓库，  
但它们的重心明显不同。

## 1. 它们分别在解决什么问题

### superpowers 在解决什么

superpowers 最核心的问题意识是：

- agent 明明有技能，却不稳定使用
- agent 很容易跳过设计、计划、测试、review
- agent 在真实工程任务里容易靠直觉乱冲

所以它重点解决的是：

- 如何把 agent 推进到一条被约束的工程流程
- 如何让 skill 在 session 里稳定触发
- 如何用测试确认这些流程真的发生

### gstack 在解决什么

gstack 最核心的问题意识是：

- 单个 AI 助手不够像完整工程团队
- 浏览器、设计、QA、ship 等环节缺少持续可执行底座
- 需要长期、多项目、多 session 的工程协作体系

所以它重点解决的是：

- 如何把多角色工程方法做成 skill system
- 如何给 skill 配 runtime 执行层
- 如何把 QA、browse、design、ship 做成长期系统

## 2. skill 版面上的差异

### superpowers

- 显式 skill 数量较少，但骨干清晰
- 技能主要围绕软件开发主流程
- `using-superpowers` 是总开关
- 更强调顺序和纪律

它的核心链条是：

- brainstorm
- worktree
- plan
- execute
- TDD
- review
- finish

### gstack

- 显式 skill 数量更多
- 角色类型明显更丰富
- `/browse`、`/qa`、`/review`、`/ship`、`/design-review` 这类能力面更宽
- 除流程外，还有明显的 specialist 和 runtime 分层

它更像：

- 多角色并存
- 多工具并存
- 多阶段并存

## 3. 结构层面的最大区别

### superpowers 的结构重心

superpowers 最关键的四层是：

- skill 入口层
- bootstrap / hook 注入层
- 支撑 prompt / reference 层
- 测试与验证层

这意味着它的重点是：

- 让 agent 按规则做事

### gstack 的结构重心

gstack 最关键的五层是：

- skill 入口层
- 模板治理层
- runtime 执行层
- 集成与分发层
- 测试 / eval / CI 层

这意味着它的重点是：

- 让 agent 不只按规则思考，还能靠底层工具长期执行

## 4. 核心机制上的差异

### superpowers 最强机制

我认为 superpowers 最强的机制是：

- `using-superpowers` 的行为入口治理
- 强制先查 skill 再行动
- spec -> plan -> execute -> review 的强路由链
- 行为级测试

换句话说，它最强的是：

- **行为治理**

### gstack 最强机制

我认为 gstack 最强的机制是：

- `SKILL.md.tmpl -> SKILL.md` 的模板治理
- persistent browser daemon
- 多角色 review / QA / ship 闭环
- learnings / timeline / telemetry 的长期系统层

换句话说，它最强的是：

- **流程系统 + runtime 执行力**

## 5. 谁更像“方法论”，谁更像“系统”

### superpowers 更像方法论插件

虽然 superpowers 已经不仅仅是文档，  
但它更像是：

- 一套高纪律方法论
- 一套技能入口与强约束机制
- 一套面向多个宿主传播的方法体系

### gstack 更像系统工程

gstack 更明显地具备：

- runtime
- bin 工具
- extension
- analytics / learnings / timeline
- 设计和浏览器基础设施

所以它更接近：

- 一套 AI 工程系统

## 6. 测试与验证的区别

### superpowers

superpowers 最亮眼的地方之一，是它在测：

- skill 是否触发
- Task 是否调用
- TodoWrite 是否出现
- 子 agent 流程是否成立
- review 顺序是否符合定义

它的测试重点是：

- **agent 有没有按规定行为工作**

### gstack

gstack 同样很重视测试，但方向更宽：

- browse runtime
- design runtime
- evals
- CI freshness
- skill docs 生成一致性

它的测试重点是：

- **系统组件和 skill runtime 是否持续可用**

## 7. 学习价值对比

### 如果你想学“怎么约束 agent 不乱来”

优先学 superpowers：

- `using-superpowers`
- `systematic-debugging`
- `test-driven-development`
- `brainstorming`
- `writing-plans`

它非常适合学：

- 如何写 hard gate
- 如何写 red flags
- 如何把流程顺序写得不可误解

### 如果你想学“怎么把 skill 仓库做成长期系统”

优先学 gstack：

- 模板生成链
- browse daemon
- review / QA / ship 体系
- learnings / timeline / analytics

它非常适合学：

- 如何把 prompt、runtime、验证、运维拼成闭环

## 8. 适用人群对比

### superpowers 更适合谁

- 想让 agent 像守纪律工程师的人
- 需要强计划、强 TDD、强 review 的开发者
- 想把一套流程迁移到多个宿主的人
- 更重视流程治理 than runtime 扩展的人

### gstack 更适合谁

- 想把 agent 用成虚拟工程团队的人
- 需要浏览器 QA、设计评审、发布闭环的人
- 愿意接受更重基础设施的人
- 追求长期、多项目、多 session 工程体系的人

## 9. 代价对比

### superpowers 的主要代价

- 纪律感强
- 小任务可能显得过重
- 成败部分取决于宿主是否遵守注入与 skill 触发机制

### gstack 的主要代价

- 系统更厚
- 环境依赖更重
- 迁移成本更高
- 长期治理复杂度更大

## 10. 我的最终对比判断

如果一定要把两者拉开：

- **superpowers 赢在行为治理**
- **gstack 赢在系统完整度和执行基础设施**

如果你问“哪个更适合直接借鉴 skill 写法”，  
我会先推荐 superpowers。

如果你问“哪个更适合研究 AI 工程系统怎么长成完整平台”，  
我会先推荐 gstack。

## 11. 最后一行总结

**superpowers 像一套把 agent 管住的工程纪律插件；gstack 像一套把 agent 组织成虚拟团队的工程系统。前者更像方法论中枢，后者更像能力平台。**
