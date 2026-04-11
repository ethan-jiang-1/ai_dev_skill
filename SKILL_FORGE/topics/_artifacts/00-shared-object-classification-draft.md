# Wave 0 Shared Object Classification Draft

## 当前分类草案

### 1. Repo-level agent guidance

- 代表对象：`AGENTS.md`
- 作用：给 agent 持续提供 build / test / conventions / local rules
- 典型特征：层级化、最近目录优先、不是 task-specific capability 包

### 2. Skill package / sample

- 代表对象：`SKILL.md` skill 目录、`vercel-labs/agent-skills`
- 作用：把专门任务能力打包成按需加载的 instructions + scripts + references
- 典型特征：有 `SKILL.md` 入口、明确 use-when、可带资源文件

### 3. Installer / loader / compatibility layer

- 代表对象：`vercel-labs/skills`
- 作用：安装、列出、查找、更新、分发 skill，并映射到多 agent 目录
- 典型特征：project/global scope、symlink / copy、agent path mapping

### 4. Governance / audit / publish tooling

- 代表对象：`skill-forge`
- 作用：验证结构、安全、描述、可发布性、多平台注册与发布
- 典型特征：post-authoring、quality gate、security scan、publish

### 5. Registry / marketplace / directory

- 代表对象：`skills.sh`
- 作用：发现 skill、查看生态入口、公开安装命令和可见信号
- 典型特征：目录站、排行榜、站点级导航、统计或审计入口

### 6. Community curation / learning layer

- 代表对象：`github/awesome-copilot`
- 作用：把 skills、agents、instructions、hooks、plugins、教程组织成可搜索集合
- 典型特征：Learning Hub、community-created、llms.txt、third-party warning

## 目前最容易混淆的边界

- `AGENTS.md` vs `SKILL.md`
  - 前者偏 repo-level 持续指导
  - 后者偏 task-level 按需加载

- `sample repo` vs `toolchain`
  - `vercel-labs/agent-skills` 更像样板库
  - `vercel-labs/skills` 更像安装与兼容层

- `directory` vs `quality signal`
  - `skills.sh` 和 `awesome-copilot` 能说明“可被发现”
  - 但不能自动说明“质量高”或“安全可信”

- `engineering maturity` vs `learning value`
  - 有些对象适合直接借鉴学习
  - 但不一定适合当作长期工程基座

## 进入 Wave 1 前的默认口径

- 把 `AGENTS.md` 归入上下文与约定层，不直接归入 skill 包本体
- 把 skill 目录视为最小可安装 / 可加载 / 可复用单元
- 把 installer、registry、sample、audit tool 分开评估，不再混成同一类“skill 项目”
