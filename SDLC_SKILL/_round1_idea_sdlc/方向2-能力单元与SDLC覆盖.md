# 方向2：能力单元与 SDLC 覆盖

## 任务

这份 Deep Research 只研究一件事：

**这些 skill、workflow、hook、subagent 到底在软件开发流程里解决了什么问题，哪些能力单元真正值得借鉴？**

重点不是找来源，  
也不是优先判断能不能安装，  
而是把“它到底在做什么”看清楚。

## 研究边界

优先看：

- 会改变 agent 做事方式的 skill-like 单元
- 与 Define、Design、Plan、Build、Test、Debug、Review、Ship、Operate 相关的能力
- 有明确输入、输出、顺序、约束或验证闭环的设计

默认弱化：

- 只是换一种说法的 prompt 包装
- 只讲理念、不体现执行机制的项目
- 与软件开发 SDLC 关系很弱的通用 AI 工具

下面这些名字可以当作边界样本：

- get-shit-done
- gstack
- Google agent skills
- superpowers

## 要看什么

研究时重点判断：

- 它把哪个开发动作做成了可复用单元
- 这个单元对应哪个 SDLC 阶段
- 它在防什么常见失控问题
- 它是流程约束、验证机制、协作分工，还是知识沉淀
- 它是否值得被别的宿主或团队借鉴

常见失控问题可以从这些角度看：

- 任务理解跑偏
- 计划过粗
- 漏做验证
- 缺少 review
- 调试无系统
- 上下文丢失

## 交付

最终输出尽量包含：

- 一张能力地图
- 每个代表性项目里的关键能力单元
- 每个单元对应的 SDLC 阶段和问题类型
- 哪些单元值得借鉴，哪些只是包装层

如果需要方便后续合并，可选记录这些最小字段：

- `name`
- `url`
- `reusable_unit`
- `sdlc_stage`
- `problem_solved`
- `notes`

## 搜索方向

优先沿这些方向找：

- 角色词：`planner`、`reviewer`、`tester`、`debugger`、`architect`、`subagent`
- 机制词：`hooks`、`workflow`、`quality gate`、`verification loop`
- 阶段词：`task planning`、`design review`、`code review skill`、`test workflow`
- 失败模式词：`prevent drift`、`context loss`、`regression check`、`root cause analysis`
- 结构线索：`commands`、`skills`、`subagents`、`workflows`、`review rules`

研究时先抓“能力单元”，  
再判断它是不是值得迁移的抽象。
