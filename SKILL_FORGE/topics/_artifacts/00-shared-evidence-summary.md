# Wave 0 Shared Evidence Summary

## 当前共享结论

- skill 在当前生态里已经稳定呈现为“目录级对象”而不是单段 prompt。
- skill 的核心入口通常是 `SKILL.md`，并且至少在 GitHub Copilot 这一实现里，`SKILL.md` 已经有明确 frontmatter 约定。
- 生态里已经出现两类不同但容易混淆的机制：
  - repo-level、常驻的 `AGENTS.md` / custom instructions
  - task-level、按需加载的 `SKILL.md` skill 包
- “高质量 skill” 不只是内容好，还包括可发现、可执行、可安装、可治理、可审计。
- 生态已经从单个 skill 仓库扩展到安装器、目录站、社区聚合、审计工具和学习中心。

## 对三个 topic 的直接支持

### 对 `01` 的支持

- GitHub 官方文档已经足够支撑一版 skill 最小定义。
- `SKILL.md`、frontmatter、scripts、references、description / use-when 等元素已能构成初步结构共识。
- `AGENTS.md` 与 skill 的边界可以开始固定，不必再把它们混成同一类东西。

### 对 `02` 的支持

- Vercel `skills` CLI 已明确体现 installer / updater / scope / multi-agent mapping 这类工程能力。
- `vercel-labs/agent-skills` 则更像高质量样板库，而不是 installer 或治理工具。
- `skill-forge` 明显属于 post-authoring / governance / publish 层。
- 目录站与社区聚合层应单独归类，不能和工具链对象混用。

### 对 `03` 的支持

- GitHub 官方明确建议使用共享在线 skills，这直接支撑“借鉴现成 skill 有学习杠杆”的方向。
- `awesome-copilot` 和 `skills.sh` 说明现成资源不仅存在，而且已经出现集中发现与学习入口。
- 同时，GitHub 官方对 `allowed-tools` 的警告和 `awesome-copilot` 的 third-party inspection 提醒，也说明“借鉴”必须与审查并存。

## 当前最重要的共享术语

- `AGENTS.md`: repo-level、agent-facing、可嵌套、近处优先的持续上下文
- `SKILL.md`: skill 目录入口文件，面向按需加载任务能力
- `project skill`: 随仓库分发、与项目共存的 skill
- `personal skill`: 存在用户目录、跨项目复用的 skill
- `single source of truth`: 通过 symlink 等方式减少多 agent 复制漂移
- `post-authoring`: skill 内容写完之后的审计、修复、发布阶段
- `discoverability`: agent 能在正确时机发现并激活 skill 的能力

## 当前共享判断

- 这轮研究不应该再用“有没有现成 skill 可借鉴”作为核心问题，因为答案已经接近明确：有，而且入口不少。
- 更值得继续追的问题是：
  - 这些入口分别解决发现、学习、安装、治理中的哪一段
  - 哪些只是热闹入口，哪些真正降低试错成本
  - 哪些结构约定正在收敛成事实标准
