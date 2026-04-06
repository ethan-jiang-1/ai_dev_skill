# get-shit-done 第一印象

## 先说结论

这个仓库我最先注意到的，不是 CLI，也不是安装脚本，  
而是它里面大量 **skill-like 单元**。

这些单元虽然不统一叫 `skill`，但本质上都在承担 skill 的职责：

- 定义某种能力
- 约束某种工作方式
- 暴露输入与输出
- 指定可用工具
- 把执行路由到更底层的 workflow 或 agent

## 我目前识别到的 skill-like 形态

### 1. commands/gsd/*.md

这是第一类最明显的 skill-like 内容。

原因：

- 文件有 YAML front matter
- front matter 里有 `name`、`description`、`allowed-tools`
- 正文里有 `objective`、`execution_context`、`process`

例如 `commands/gsd/new-project.md`：

- `name: gsd:new-project`
- `description: Initialize a new project with deep context gathering and PROJECT.md`
- `allowed-tools: Read / Bash / Write / Task / AskUserQuestion`

这说明 command 文件本质上就是“能力入口定义”。

### 2. agents/*.md

这是第二类强 skill-like 单元。

原因：

- 同样有 front matter
- front matter 里有 `name`、`description`、`tools`、`color`
- 正文里定义角色、职责、禁止事项、上下文读取规则

例如 `agents/gsd-planner.md`：

- `name: gsd-planner`
- `description: Creates executable phase plans...`
- `tools: Read, Write, Bash, Glob, Grep, WebFetch, mcp__context7__*`

这说明 agent 文件本质上就是“专职 skill persona”。

### 3. get-shit-done/workflows/*.md

这是第三类变形后的 skill。

它通常没有 YAML front matter，  
但用 XML 风格标签组织：

- `<purpose>`
- `<required_reading>`
- `<process>`
- `<step name="...">`

这说明它不是入口 skill，而是 **编排 skill**。

### 4. references/*.md 与 templates/*.md

这两类不是前台 skill，  
但它们在整个系统里充当 skill 的知识底座与工件底座。

- `references/` 提供方法论和规则
- `templates/` 提供产物结构

所以它们更像：

- supporting skills
- capability substrate

## 我现在的判断

如果按“我们最关心 skill”这条标准来分析，这个项目最重要的不是整个仓库所有文件，而是这四层：

- command 入口 skill
- agent 角色 skill
- workflow 编排 skill
- reference / template 支撑层

也就是说：

- `bin/install.js` 重要，但不是主角
- `.github/workflows/` 重要，但不是主角
- 真正值得重点拆的是这些带 front matter 或强结构标签的 Markdown 单元

## 初步项目类型判断

它不是一个单纯的“skills 仓库”，  
而是一个把 skill 进一步系统化后的 runtime 分发仓库。

我的第一印象是：

- `agent-skills` 更像 skill catalog
- `get-shit-done` 更像 skill operating system

区别在于：

- 前者强调技能模块本身
- 后者强调技能模块如何被安装、调用、串联、验证、持久化

## 当前最值得继续追的方向

后续分析最应该优先拆的，不是全部命令，而是以下问题：

- command front matter 是怎么定义能力入口的
- agent front matter 是怎么定义专职角色的
- workflow 是怎么把这些 skill-like 单元串成完整流水线的
- references 和 templates 如何降低 agent 的随机性
- 它和传统 skill 仓库相比，多出来的“状态管理”和“项目记忆”价值到底有多大
