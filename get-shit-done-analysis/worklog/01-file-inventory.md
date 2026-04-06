# get-shit-done 文件盘点

## 基本信息

- 项目：`gsd-build/get-shit-done`
- 分析目录：`/Users/bowhead/ai_dev_skill/get-shit-done-analysis`
- snapshot commit：`2d80cc3afd66fa222c8f3cfefa6f7a4621b5fcb4`
- package 版本：`1.33.0`
- 运行时要求：Node `>=24.0.0`

## 根目录观察

我先看到的主结构是：

- `README.md` 与多语言 README
- `docs/`：完整用户文档与架构文档
- `commands/gsd/`：面向终端和宿主 agent 的命令入口
- `agents/`：专职子 agent 定义
- `get-shit-done/`：真正的 workflow、reference、template、CLI logic 资源层
- `bin/`：安装入口
- `tests/`：回归测试
- `.github/workflows/`：CI 与治理

## 关键目录统计

- `agents/`：24 个 agent 定义文件
- `commands/gsd/`：68 个命令文件
- `get-shit-done/workflows/`：68 个 workflow 文件
- `get-shit-done/references/`：35 个 reference 文件
- `get-shit-done/templates/`：43 个模板文件
- `tests/`：122 个测试文件

## 我认为最关键的结构层

### 1. 命令层

- 路径：`commands/gsd/*.md`
- 作用：对外暴露 `/gsd-*` 命令
- 特征：命令文件很薄，主要做 frontmatter、objective、execution_context，再跳转到 workflow

### 2. workflow 层

- 路径：`get-shit-done/workflows/*.md`
- 作用：真正编排流程
- 特征：负责初始化上下文、调用 agent、串联研究、规划、执行、验证

### 3. agent 层

- 路径：`agents/*.md`
- 作用：把不同职责拆成专门子 agent
- 代表角色：planner、executor、verifier、debugger、security-auditor、ui-researcher、codebase-mapper

### 4. reference 层

- 路径：`get-shit-done/references/*.md`
- 作用：提供稳定规则、策略和模式
- 代表内容：context-budget、questioning、verification-patterns、tdd、git-integration、planning-config

### 5. template 层

- 路径：`get-shit-done/templates/`
- 作用：生成 `.planning/` 下的标准工件
- 代表模板：`project.md`、`requirements.md`、`roadmap.md`、`state.md`、`UAT.md`、`VALIDATION.md`

### 6. CLI 工具层

- 路径：`get-shit-done/bin/gsd-tools.cjs` 与 `get-shit-done/bin/lib/*.cjs`
- 作用：把状态管理、配置、phase、验证、模板填充等收口到一个工具系统

## 第一轮盘点结论

- 这不是一个简单 prompt 集合
- 这也不是单纯命令包
- 它更像一个给多种 AI coding runtime 安装“工作流操作系统”的分发仓库
- 真正的核心不是某一条 prompt，而是命令层、workflow 层、agent 层、reference 层、template 层的配合

## snapshot 清理备注

当前我扫描到两个嵌套 snapshot 自带的 `.git` 目录：

- `/Users/bowhead/ai_dev_skill/addyosmani-agent-skills/agent-skills-src/.git`
- `/Users/bowhead/ai_dev_skill/get-shit-done-analysis/source_snapshot/get-shit-done/.git`

顶层仓库 `.git` 需要保留。  
这两个属于 snapshot 内部的 git 元数据，确实是你说的“另外一个 repo”的来源。
