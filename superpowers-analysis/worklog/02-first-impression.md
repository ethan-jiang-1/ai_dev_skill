# superpowers 第一印象

## 项目类型判断

第一眼看，superpowers 不是普通的“AI prompt 集合”，  
而是一套把 skill、hook、插件元数据、平台适配和测试绑在一起的 agent 工作流系统。

它服务的对象也很明确：

- Claude Code 用户
- Cursor 用户
- Codex 用户
- OpenCode 用户
- Gemini CLI 用户

所以它不是只在描述“怎么写 prompt”，  
而是在试图成为一个跨宿主分发的技能插件。

## 核心卖点

从 `README.md` 看，它主打的是一条完整的软件开发工作流：

- brainstorming
- using-git-worktrees
- writing-plans
- subagent-driven-development / executing-plans
- test-driven-development
- requesting-code-review
- finishing-a-development-branch

这条链的特点不是 skill 数量特别多，  
而是顺序很强、流程感很强。

## 和 gstack 的第一眼差异

如果和之前分析的 gstack 对照，  
superpowers 给我的第一印象有几个明显区别：

- 它更聚焦“工程流程纪律”，不是工具种类扩张
- 它的 runtime 代码量明显更轻
- 它把自动触发和宿主注入做得更显式
- 它更像一个流程框架，而不是一套浏览器执行系统

也就是说：

- gstack 更像“AI 工程操作系统”
- superpowers 更像“agent 工作方法论插件”

## 关键观察

### 1. `using-superpowers` 很像总开关

它不是一个普通 skill，  
而像整个系统的 bootstrap：

- 要求先检查 skill 再响应
- 明确 Skill tool 的优先级
- 给不同宿主做工具映射
- 用很强硬的语言约束 agent 行为

再加上 `hooks/session-start` 直接注入这个 skill，  
说明 superpowers 真正在做的是“先改变 agent 的行为规范”，再谈别的 skill。

### 2. skill 是强流程的，不是松散参考卡片

像 `brainstorming`、`writing-plans`、`systematic-debugging`、`subagent-driven-development` 这些 skill，  
都有明显的：

- checklist
- phase
- hard gate
- red flags
- transition rule

这表明仓库重点不是给你若干建议，  
而是强制把 agent 推进到某种工作流里。

### 3. 文档本身就是能力系统的一部分

像：

- `docs/testing.md`
- `docs/README.codex.md`
- `skills/*/*.md`
- `hooks/session-start`

它们不是外围文档，  
而是系统能力的一部分：

- 测试文档定义验证方式
- 平台文档定义分发方式
- reference 文档定义 skill 的可执行细节

## 风险感知

第一轮阅读里，也能感到几个潜在风险：

- 这种强纪律型 skill 很依赖宿主真的遵守
- prompt 文字权重很高，内容演进风险会集中在 skill 本体
- 跨宿主适配会带来行为一致性问题
- 如果测试不足，skill 的真实效果很难长期稳定

不过目前仓库已经有：

- skill-triggering 测试
- explicit-skill-requests 测试
- claude-code 集成测试
- opencode 测试

说明作者已经意识到这些风险，不是在盲目写 prompt。

## 第一印象结论

superpowers 的第一印象可以概括成一句话：

**它不是想让 agent“多知道一点”，而是想让 agent“按一套被验证过的开发纪律工作”。**
