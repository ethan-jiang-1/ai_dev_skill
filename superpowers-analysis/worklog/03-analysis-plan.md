# superpowers 后续分析计划

## 当前已确认的事实

- 仓库主轴是 `skills/`，共有 14 个显式 `SKILL.md`
- `using-superpowers` + `hooks/session-start` 构成全局 bootstrap 机制
- `README.md` 已明确给出从 brainstorming 到 finishing 的主流程
- `tests/` 不是摆设，至少覆盖 skill triggering、显式请求、子 agent 开发、Claude Code 与 OpenCode
- 仓库面向多宿主分发，而不是单一 Claude Code 环境

## 接下来重点要回答的问题

### 1. 它到底在评估什么对象

按 flow 的要求，不能只说“这是个好仓库”，  
而要先把 skill-like 单元拆清楚。

这里我准备按五类对象来分析：

- 顶层 skill 入口
- `using-superpowers` 引导层
- 复合 skill 的 prompt / reference 子模块
- 插件注入与宿主适配层
- 测试与验证层

### 2. 它的共同结构是什么

需要进一步总结：

- front matter 如何写 trigger
- skill 正文如何组织 checklist / hard gate / phase
- 子模块如何为主 skill 提供 prompt 和 reference
- hooks 如何把方法论注入 session

### 3. 它最核心的机制是什么

当前优先怀疑的核心机制有三条：

- `using-superpowers` 的强制技能检查机制
- brainstorming -> writing-plans -> subagent-driven-development 的主流水线
- 用真实会话测试来验证 skill 是否被执行

后续评估时要围绕这三条展开。

## 重点样本

### 高优先级 skill

- `skills/using-superpowers/SKILL.md`
- `skills/brainstorming/SKILL.md`
- `skills/writing-plans/SKILL.md`
- `skills/subagent-driven-development/SKILL.md`
- `skills/systematic-debugging/SKILL.md`
- `skills/test-driven-development/SKILL.md`

### 高优先级支撑文件

- `hooks/session-start`
- `hooks/hooks.json`
- `docs/testing.md`
- `docs/README.codex.md`
- `tests/claude-code/README.md`

## 评估策略

按照 flow，后面的 `eval_skills/` 将固定产出：

- `01-总览.md`
- `02-结构拆解.md`
- `03-核心机制.md`
- `04-优缺点.md`
- `05-评分总表.md`
- `superpowers-全量评估.md`

写法上会保持这几个原则：

- 先列出正在评估哪些 skill-like 单元
- 一定写路径，不只写抽象结论
- 主体评分用 1-5 分
- 全量总评尾巴用 1-10 六维收口

## 目前判断

我当前的中间判断是：

superpowers 最可能不是靠“单个超强 skill”取胜，  
而是靠下面这套组合：

- 会话启动注入
- 强制 skill 调用纪律
- 标准化的 spec -> plan -> execute -> review 流程
- 行为级测试

如果后续阅读没有推翻这个判断，  
最终评估大概率会围绕“流程纪律系统”而不是“工具能力系统”展开。
