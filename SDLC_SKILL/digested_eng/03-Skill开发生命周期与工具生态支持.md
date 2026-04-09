# Skill 开发生命周期与工具生态支持

## 第一轮摘要（保留，不修改）

## 这份片段在讲什么

这份上下文聚焦两个紧密相关的问题：

- 高质量 skill 是怎么一步步开发出来的
- 不同工具生态对 skill 的发现、调用、调试和沉淀提供了什么支持

## 从原始研究提炼出的核心结论

### 1. Skill 开发本身就是一个工程项目

原始研究不把 skill 看成“一次写完的提示词”，  
而是看成一个完整的软件工程对象。

它提炼出四个阶段：

- Discovery & Scoping
- Context Engineering & Build
- Evaluations & Iterative Refinement
- Deployment & Steady State

这说明 skill 开发要经历：

- 目标界定
- 上下文设计
- 失败反馈闭环
- 部署和长期维护

### 2. 最关键的是把失败经验回写成规则

原始研究里最有价值的一点是：

- AI 出错时，不应该只在当前会话里纠正
- 而要分析失败原因，并把纠正逻辑写回 skill 或规则

这意味着 skill 的成长不是靠灵感，  
而是靠失败驱动的规则沉淀。

### 3. 工具生态会深刻影响工程师学 skill 的方式

原始研究比较了几类工具：

- Cursor：显式上下文控制，更训练工程师的依赖图意识
- Windsurf：自动上下文索引，更适合快速上手，但可能掩盖复杂性
- CLI / terminal agents：更贴近测试、日志、脚本、CI/CD 循环
- Dify / Coze / n8n：更适合把 prompt 变成可视化 workflow

也就是说，工具不只是载体，  
它会塑造工程师掌握 skill 的路径。

### 4. Cursor 和 Windsurf 体现了两种不同训练方式

原始研究里的对比很清楚：

- Cursor：显式投喂上下文，训练人去理解依赖和边界
- Windsurf：自动补全上下文，降低新手门槛，但更容易认知卸载

所以如果研究目标是“让工程师学会方法学”，  
并不是自动化越高越好。

### 5. 节点式工作流工具更适合训练 pipeline 思维

原始研究把 Dify、Coze、n8n 这类平台看成另一类脚手架：

- 它们通过节点、分支、API 调用来展示流程
- 更适合训练“工程化管道”思维
- 让人更直观看到 RAG、条件判断、工具调用之间的连接关系

## 这一片段里最值得继续研究的对象

- Skill development lifecycle
- Cursor
- Windsurf
- CLI agents
- Dify / Coze / n8n

## 适合继续 Deep Research 的问题

- 一个高质量 skill 从发现问题到稳态运营要经历哪些步骤
- skill 开发里 eval 和失败反馈为什么重要
- 哪些工具最适合新手，哪些最适合训练工程师的上下文管理能力
- 显式控制和隐式自动化各自带来什么学习收益与代价

## 这一片段的用途

如果下一轮 Deep Research 想回答下面这些问题，这份片段最适合直接当上下文：

- “高质量 software engineering skill 是怎么开发出来的？”
- “Cursor、Windsurf、CLI agents、节点式编排工具对 skill 学习有什么不同影响？”
- “想让工程师不仅会用，还会开发 skill，应该选什么工具生态？”

## 二轮新增证据

- Claude 官方对 skills 的定义强调：skills 可按需加载、可动态启用，并存在可治理的范围/权限边界（生态原语事实）。（ref: `../reference_eng/03-devlife-claude-what-are-skills.md`）
- Windsurf 官方文档描述了 skills 的 invocation、scopes 与存储/组织方式，体现“skills 作为可管理上下文资产”。（ref: `../reference_eng/03-devlife-windsurf-cascade-skills-docs.md`）
- Windsurf 官方明确 workflows 必须手动触发（manual-only），这是一个非常硬的“显式授权”边界事实。（ref: `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`）
- OpenAI Evals 官方仓库提供了 evals-as-code 的工程形态：自定义 eval、registry 管理、dashboard 运行等，可作为“Evals 阶段”的 ground truth。（ref: `../reference_eng/03-devlife-openai-evals-readme.md`）
- Vercel 的 skills 机制展示了分发/稳态支持的工程化要素：
  - lockfile 用于确定性安装态与团队共享（ref: `../reference_eng/03-devlife-vercel-skills-lock-files.md`）
  - update system 使用 hash-based checks + remote update API（ref: `../reference_eng/03-devlife-vercel-skills-update-system.md`）
  - source formats 与解析顺序属于底层实现事实（ref: `../reference_eng/03-devlife-vercel-skills-source-formats.md`）
- Cursor vs Windsurf 的第三方对比只能作为弱证据信号（观点性），但可用于提出“显式控制 vs 隐式自动化”影响学习路径的假设，需优先用官方 docs 做机制事实兜底。（ref: `../reference_eng/03-devlife-cursor-vs-windsurf-blott-2025.md`）

## 二轮新增机制理解

### 1) 生命周期的“硬分界线”：是否具备稳态维护闭环

- 从工具原语看，Skill 从一次性脚本到团队资产的关键分界线不是“写得更复杂”，而是是否进入可回归的稳态：
  - Evals 让输出质量可被持续回归，而不是靠人工记忆与主观印象维护。（ref: `../reference_eng/03-devlife-openai-evals-readme.md`）
  - lockfile + update check 把“安装态一致性”和“更新漂移”工程化，否则团队共享会退化为复制粘贴碎片化。（ref: `../reference_eng/03-devlife-vercel-skills-lock-files.md`, `../reference_eng/03-devlife-vercel-skills-update-system.md`）

### 2) “显式授权边界”是生态走向团队化的必要条件

- workflows manual-only 说明生态正在把某类高风险自动化行为强制放到显式触发通道，这与团队治理目标一致：把不可预测副作用的动作放回人类授权与审计链条。（ref: `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`）
- 这也反向约束 Skill 设计：当能力越来越强，越需要把“自动做”改成“按协议做”，否则会演化为过度代理风险（与 04-path 风险框架相交叉）。

### 3) 工具生态塑形：不是“哪个更强”，而是“训练了谁的什么能力”

- 目前我们能强说的是机制层差异存在（skills 的 scope、触发边界、分发/更新方式、eval 原语）。
- 对“显式控制更利于训练上下文管理能力”这类结论，当前证据强度仍偏弱，需要更多实证补强（尤其是长期能力指标）。

## 二轮新增趋势与难点

- 趋势：skills 正在从个人 prompt 资产化为“可加载、可治理、可更新、可回归”的工程工件（至少在多个官方生态里出现相似原语）。（ref: `../reference_eng/03-devlife-claude-what-are-skills.md`, `../reference_eng/03-devlife-vercel-skills-lock-files.md`）
- 难点：Evals 设计与维护成本高，且容易出现指标漂移/过拟合等问题；若没有 eval 资产与回归纪律，skill 很难进入稳态。（ref: `../reference_eng/03-devlife-openai-evals-readme.md`）
- 难点：跨生态的 skill “标准化与可迁移性”仍不清晰；不同工具对触发边界与存储形式的差异会带来迁移成本。（ref: `../reference_eng/03-devlife-windsurf-cascade-skills-docs.md`, `../reference_eng/03-devlife-vercel-skills-source-formats.md`）

## 当前判断（二轮综合后）

### 1) 二轮后的生命周期框架（仍保留四阶段，但加硬约束）

- Discovery：明确目标与失败模式，否则后续 eval 不可定义。
- Build：把专家策略写成可执行协议与可审查结构（与 01/02 的“保留心智动作”一致）。
- Evals：把“对不对/好不好/稳不稳”变成可回归资产（是进入稳态的必要条件）。（ref: `../reference_eng/03-devlife-openai-evals-readme.md`）
- Deploy/Steady State：必须具备分发的确定性与更新控制，否则团队共享会碎片化。（ref: `../reference_eng/03-devlife-vercel-skills-lock-files.md`, `../reference_eng/03-devlife-vercel-skills-update-system.md`）

### 2) 六个固定问题回答（二轮）

1. 这个主题当前的硬事实是什么
   - skills/workflows/evals/lockfile/update 等工程原语在官方生态中已经存在，且可以被直接引用为 ground truth。（ref: `../reference_eng/03-devlife-claude-what-are-skills.md`, `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`, `../reference_eng/03-devlife-openai-evals-readme.md`, `../reference_eng/03-devlife-vercel-skills-lock-files.md`）
2. 背后的根本机制是什么
   - 稳态来自“可回归（evals）+ 可复现（lockfile）+ 可控更新（update checks）+ 显式授权边界（manual-only workflows）”的组合，而不是单纯更强模型或更长 prompt。（ref: `../reference_eng/03-devlife-openai-evals-readme.md`, `../reference_eng/03-devlife-vercel-skills-update-system.md`, `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`）
3. 生态最近在往哪里演化
   - 在向“资产化与治理化”演化：skills 越来越像可部署的工程工件，而不是个人聊天技巧。（ref: `../reference_eng/03-devlife-vercel-skills-lock-files.md`）
4. 采用或落地的难点在哪里
   - eval 设计与维护是最硬的门槛；缺少评测闭环会导致技能漂移、不可复现与信任崩塌。（ref: `../reference_eng/03-devlife-openai-evals-readme.md`）
5. 社区争议和失败模式在哪里
   - 失败模式：无 lockfile/无更新控制导致团队共享碎片化；无 eval 导致 drift；自动化边界不清导致误触发与过度代理风险。（ref: `../reference_eng/03-devlife-vercel-skills-update-system.md`, `../reference_eng/03-devlife-windsurf-workflows-manual-only.md`）
6. 哪些对象最值得继续追踪
   - 公开的“从 0 到稳态”的 skill/agent 案例复盘（尤其是 eval 迭代史、失败模式）。
   - 跨生态的版本/分发/权限/触发边界标准化趋势与兼容性成本。
