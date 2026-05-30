# 19.8万 Star！Anthropic黑客松冠军开源CodeAgent Harness优化系统，一键调用249个常见工程流程Skill

Original 关注AI开源项目 关注AI开源项目 [智猩猩AI](javascript:void(0);)

_2026年5月30日 11:06_ _北京_

在小说阅读器读本章

去阅读

在小说阅读器中沉浸阅读

智猩猩AI整理

编辑：没方

  

如今，Claude Code、Cursor、Codex 等 AI 编程助手，已经逐渐成了开发者的日常标配。写代码、改 Bug、补测试、读文档，甚至从零实现一个功能模块，AI 都能参与其中。

  

但高频使用后，很多开发者会发现 AI 编程助手虽然好用，但并不总是“可靠”。

  

比如，在 Claude Code 里精心调好的工作流、技能和规则，换到 Cursor 或 Codex 里，往往就失效了。

  

更麻烦的是，AI 生成的代码风格并不稳定。

  

有时它严格遵守规范，有时又会为了跑通结果绕过测试；有时能理解项目架构，有时又会写出和团队风格完全不一致的实现。安全隐患、配置污染、重复返工，也随之出现。

  

本来要用 AI 提升生产力，但在复杂工程场景里，反而变成了“混乱制造机”。开发者节省下来的编程时间，又花在调试 AI 输出、统一代码风格、补安全漏洞和重建工作流上。

  

最近，一个名为 ECC（Everything Claude Code）的开源项目，正是冲着解决这些问题而来。

  

![Image](https://mmbiz.qpic.cn/mmbiz_png/zJVQUll3YIZF4tczBNzy3K3htwLn6OictmpvjzHSPCBaJxdn846aJvGDh24btpUZiahVrbJL0wgslJjXM9FsWLNbkmzPOJ5bJzDic92w1g7BGc/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

  

它定位是：**The harness-native operator system for agentic work。**

  

通俗地说，就是给 AI Agent 套上一层“操作系统”，把分散在各个 AI 编程工具中的技能体系、长期记忆、安全规则、工作流程和自动化机制，直接收敛成一套可复用的完整工作规范。它支持Codex、Claude Code、Cursor、OpenCode、Gemini、Zed、GitHub Copilot等多种Agent Harness。

  

该项目由 Anthropic x Forum Ventures 黑客松冠军 Affaan Mustafa 基于10个多月高强度日常使用与真实产品开发迭代打磨而成。该项目在GitHub上已收获198k stars。

  

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

-   项目链接：
    
    https://github.com/affaan-m/ECC
    

_**01**_

**63个智能体、249个技能、79个命令，**

**ECC 重构 AI 编程工作流  
**

  
ECC 试图降低不同 AI 编程工具之间的迁移成本，把 agents、skills、Commands、hooks、rules 和 MCP 配置等工程化能力，整理成一套在 Claude Code、Cursor、Codex、OpenCode 等工具中都适配使用的工作流体系。

  

它核心思路很明确：不要每次都靠人类重新提醒AI“该怎么做”，而是把这些工程习惯固化为可执行、可迁移、可复用的组件。

  

首先是 **Agents**。

  

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

ECC内置了63 个专业智能体，这意味着，AI不再只是一个“全能聊天框”，而更像一个小型工程团队。

  

遇到新功能时，它可以先让planner拆解需求；涉及架构判断时，交给architect；代码写完后，再由code-reviewer和security-reviewer进行检查。原本需要开发者反复口头提醒的协作流程，被拆成了一组可以自动调用的角色。

  

其次是 **Skills**。

  

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  
ECC 将常见工程流程封装成 249 个可复用技能，比如TDD工作流、代码规范、后端开发模式、前端开发模式、数据库迁移、API设计、部署模式、Docker模式、E2E测试、Python测试、Go测试、安全审查等。

  

这件事的价值在于，它把“高级工程师的经验”变成了可复用模块。以前你需要告诉AI：“先写失败测试，再实现最小代码，再重构，再保证覆盖率”，现在这些步骤可以通过TDD技能来约束。

  

第三个关键能力是 Commands。

  

ECC 还提供了 79 个兼容命令，让开发者可以用更熟悉的方式调用这些工作流能力。比如规划需求、代码审查、安全检查、测试验证、文档更新等操作，都可以通过命令入口触发，而不是每次都重新写一大段提示词。

  

这相当于把复杂的 AI 协作流程，压缩成一组可以直接调用的“快捷操作”。对个人开发者来说，它降低了使用门槛；对团队来说，它则让 AI 工作流更容易统一和复用。

  

第四个关键能力是 **Hooks**。

  

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

Hooks 可以在 AI 执行工具操作前后自动触发。比如，当 AI 编辑 TypeScript 或 JavaScript 文件后，Hook 可以自动运行格式化、类型检查，并扫描是否出现 console.log 这类调试语句，提醒开发者在提交前移除。

  

这就像给 AI 的行动装上了一层“拦截器”和“提示器”：不是等所有问题都进入人工 Review 阶段后再返工，而是在 AI 执行命令、编辑文件、提交输出的过程中，就引入自动化检查、提醒和必要的阻断。AI 的自主性越强，这种运行时治理就越重要。

  

再往下，是 **Rules**。

  

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

Rules负责定义AI必须长期遵守的开发规范。ECC把它分为common（通用规则），以及TypeScript、Python、Go、Swift、PHP语言相关规则。

  

通用规则覆盖代码风格、Git 工作流、测试、性能、常用模式、Hook 使用规范、Agent 委派、安全检查、代码审查和开发流程等内容。它解决的不是某一种语言的写法问题，而是团队通用工程规范如何被 AI 持续继承的问题。

  

不少团队难以规模化落地 AI 编程工具，问题往往不在于 AI 能否实现功能，而在于产出代码风格杂乱、和团队规范脱节。

  

缺少统一约束时，AI 会跟随上下文随机生成代码，最终拉低整体项目可维护性，而 ECC 正是把团队里口头相传的隐性约定，转化为强制生效的显性开发规则。

  
此外，ECC 还提供了完整的 MCP 配置体系。

  

对 AI 编程助手来说，光有角色分工和开发规范还不够，它还需要能够查询文档、访问上下文、调用外部服务。ECC 中的 docs-lookup agent 就会使用 Context7 这类 MCP 工具来查询库文档，避免 AI 只凭记忆写代码。

  

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

在完善的模块化能力底座之上，ECC 形成了一个很重要的理念：Research-first development（先研究再开发）。

  

很多AI写代码的问题都出在“上来就写”——需求没理解清楚，项目结构没看明白，依赖版本没确认，历史决策也不知道，然后就开始生成一大段代码。

  
ECC 通过 search-first、iterative-retrieval 等技能，以及 docs-lookup 这类检索型 agent，引导 Agent 先做调研、检索和理解，再进入实现阶段。

  

这非常接近成熟工程师的工作方式，好的程序员不会拿到需求就敲代码，而是先读现有实现、看接口约定、确认测试、理解边界条件，再决定怎么改。ECC想做的，就是把这种习惯迁移给AI。

  

在安全方面，ECC集成了 **AgentShield，这是一套面向 AI 编程智能体的安全审计组件，****包含102条静态分析规则，并支持终端、JSON、Markdown、HTML等输出格式。**

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

-   项目链接：
    
    https://github.com/affaan-m/agentshield
    

可以扫描CLAUDE.md、settings.json、MCP配置、hooks、agent definitions和skills，检测密钥泄露、权限问题、Hook注入风险、MCP服务器风险和Agent配置风险。

  

这说明ECC并不只是追求让AI多干活，而是更强调让AI安全地干活。

  

_**02**_

**安装教程  
**

  

（1）在 Claude Code 中安装

  

```
# 添加市场
```

  

插件安装后，只手动复制需要的 rules/ 目录即可（插件无法自动安装 rules）。

  

（2）手动安装

  

Claude Code 用户只能选择一种安装方式。 如果已经通过插件安装，请不要再运行 install.sh --profile full，否则容易导致技能、Hooks 重复。

  

```
# 克隆仓库（注意新仓库名）
```

  

只复制 Rules（推荐做法）：

```
# macOS / Linux
```

  

完整手动安装（不推荐和插件混用）：

```
# macOS / Linux
```

  

（3）开始使用

  

```
# 尝试一个命令（插件安装使用命名空间形式）
```

  

现在就可以使用 63 个智能体、249 个技能和 79 个命令了。

完整流程请参考：

https://github.com/affaan-m/ECC/blob/main/README.zh-CN.md

  

_**03**_

**AI 会写代码之后，**

**真正稀缺的是“工程化管理”  
**

  

AI编程助手正在从“智能补全工具”，变成真正参与工程协作的数字执行体。

  

而一旦 AI 拥有了自主操作、修改代码、执行命令的行动能力，规则、权限、流程、记忆与安全治理，就成了必不可少的底层基建。

  

这也正是 ECC 最核心的价值所在。

  

它没有简单堆砌提示词，也没有重做一套 Agent 框架，而是把 AI 编程中最混乱、最难迁移、最依赖人工经验的隐性工程逻辑，沉淀为一套可复用的AI 工程操作层。

  

在 ECC 中，Agents 负责角色分工，Skills 负责经验复用，Hooks 负责过程治理，Rules 负责长期规范，MCP 负责外部生态连接，AgentShield 负责全链路安全审计。

  

这些模块组合在一起，本质上是在回答一个更大的问题：当 AI 开始具备一定自主操作能力，人类该如何标准化管理，让它按照团队标准，稳定、合规、安全、可迁移地持续工作？

  

从这个角度看，ECC 更像是 Agent 时代的一次基础设施探索。

  

它把过去分散在个人 Prompt、团队规范、代码审查经验、CI 流程、安全检查和工具配置里的东西，收敛为一套 AI 原生可执行的标准化工作体系。

  

这意味着，未来团队沉淀的可能不只是代码库，还有一套属于自己的 AI 协作系统。

  

代码库记录的是“软件如何被构建”，而这套 AI 协作系统记录的，则是“团队希望 AI 如何参与构建软件”。

  

当 AI 编程从个人效率工具走向团队级生产力工具，类似 ECC 这样的项目，也许会成为下一阶段 Agent 工程化落地的重要基础设施。

**END**

  

✦

✦

**2026中国AI智能体大会**

✦

_7月2-3日，智猩猩主办的2026中国AI智能体大会将在杭州举行，设有开幕式，企业级AI智能体、AI智能体产品创新2场论坛，以及Coding Agent、自进化智能体、深度研究智能体、Computer-Use Agent、多智能体协同、_Agent Skills_、Agent Harness7场技术研讨会。_

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

✦

✦

**入群申请**

✦

![Image](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

**智猩猩矩阵号各专所长，点击名片关注**