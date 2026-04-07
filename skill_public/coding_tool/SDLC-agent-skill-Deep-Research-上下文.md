# SDLC Agent Skill 生态 Deep Research 上下文

## 研究目标

这项研究不是在找普通 prompt 仓库，  
而是在找这样一类开源包：

- 它们寄生在 coding agent、AI IDE、CLI agent、plugin marketplace、subagent 框架之上
- 它们把软件开发里的动作包装成 skill、workflow、command、agent、hook 或类似能力单元
- 它们对真实开发行为有约束、编排或塑形作用
- 它们内部存在高价值、可迁移、可复用的 skill-like 单元

核心问题是：

**当前开源生态里，有多少值得研究的“SDLC × coding agent × skill/workflow/plugin”包？它们分别解决什么问题、适合什么场景、社区反馈如何、哪些 skill 最值得借鉴？**

## 研究对象

优先纳入这类仓库：

- 明确面向 coding agent 或 agentic coding workflow
- 明确提供 skill、workflow、command、agent、subagent、hook、planner、reviewer 等结构化单元
- 内容直接服务于软件开发 SDLC
- 不只是零散 prompt，而是能影响 agent 做事方式

默认排除这类仓库：

- 单纯的 system prompt 仓库
- 只有 README 的 prompt 集合
- 与软件开发无关的效率工具
- 只做模型路由、不提供 SDLC skill 的 infra 仓库

可以把下面这些仓库直接当作已知正样本或近邻样本来理解：

- get-shit-done
- gstack
- Google agent skills
- superpowers

这些例子说明，研究对象不局限于单一封装形式。  
它们有的更像 skill 包，有的更像 workflow/plugin，有的更像 runtime 或工程纪律系统，但本质上都在把 coding agent 的 SDLC 行为做成可复用能力单元。

## 重点关注

研究时真正要看的是：

- 它有没有把 SDLC 里的关键动作做成可复用单元
- 它是不是在解决 agent 的典型失控问题
- 它的 skill 是否真的改变交互方式和执行方式
- 它有没有明确的触发条件、流程顺序、验证闭环
- 它的设计是否值得迁移到别的宿主或别的仓库

## SDLC 维度

对每个仓库都要标记它覆盖了哪些阶段：

- Define：需求澄清、问题定义、目标对齐
- Design：方案探索、架构选择、trade-off、ADR
- Plan：任务拆分、执行路径、依赖顺序
- Build：编码、重构、实现约束
- Test：TDD、验证、回归、观察性
- Debug：问题定位、根因分析、防复发
- Review：spec review、code review、quality gate
- Ship：发布、PR、merge、灰度、验收
- Operate：监控、学习、记忆、文档沉淀、持续改进

## 评估视角

不要主要按“功能多不多”或“star 高不高”来评价。  
重点从下面几个角度判断：

- 结构化程度
- 可验证性
- 复用性
- 工具依赖
- 协作价值
- 规则密度
- 失败模式覆盖
- 独立可执行性
- AI Agent 特异性
- 使用频率期望

## 用户评价

用户评价不要只看 stars。  
需要额外关注：

- GitHub stars / forks / watchers
- issues 与 discussions 的活跃度
- 最近提交频率与 release 节奏
- marketplace 或安装入口是否存在
- 外部讨论、教程、口碑样本

评价时重点区分：

- 用户是在夸想法
- 还是在夸真实好用
- 是在夸某个 skill 很强
- 还是在抱怨太重、太啰嗦、太依赖宿主、安装太难

## 宿主生态

这类仓库主要适配和寄生的 coding agent 生态，优先关注当前主流宿主：

- Claude Code
- Codex
- OpenCode
- Cursor
- Windsurf

如果某个项目能跨这些宿主迁移，或者明确提供多宿主适配层，这通常说明它的抽象更稳定、复用价值更高。
