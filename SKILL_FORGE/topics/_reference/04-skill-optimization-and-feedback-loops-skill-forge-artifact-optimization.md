# `skill-forge` As Skill Artifact Optimization Object

- `source_url`: `https://raw.githubusercontent.com/motiful/skill-forge/main/README.md`
- `source_type`: `project-readme`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `practitioner`
- `why_it_matters`: `skill-forge 是当前最适合作为 04 起步样本的开源对象之一，因为它把 skill 的 discoverability、executability、结构一致性、安全和发布治理都视为可检查、可修复、可发布前阻断的工程问题。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - `skill-forge` 的优化对象是 skill artifact，而不是单段 prompt
  - skill 的 discoverability 与 workflow executability 可以被纳入质量检查
  - 发布前治理、结构审计和安全阻断是 skill 持续优化闭环的前置能力

## 关键事实

- 项目把 skill 视为工程产物，核心口径是 `Skills are code. Engineer them like it.`
- 项目定位是 post-authoring tool，不是帮助作者从零生成 skill 内容的工具。
- 它关注的对象不是单个 prompt，而是整个 skill project / repository。
- 它检查的维度包括：
  - skill 结构是否符合可安装 / 可发布要求
  - metadata、description、README 与实际能力是否一致
  - discoverability 是否足够
  - workflow skill 是否容易被 agent 真正按步骤执行
  - 安全问题是否应阻断发布
  - 多平台安装 / 分发是否会出现链接、重复副本或 shadowing 问题
- 它明确把 critical issue 设为 push 阻断条件，说明 skill 修订不是“建议优化”，而可以进入 release gate。

## 核心内容摘录

- 原始材料中最关键的机制不是某条命令，而是它把 skill 质量拆成多个可审查维度。
- 对 `04` 最有价值的三类维度是：
  - `discoverability`: agent 能不能在正确场景找到 skill
  - `executability`: workflow skill 会不会被 agent 真正按步骤执行
  - `governance`: 发布前是否有结构、安全、描述一致性和分发一致性检查
- 这说明 skill optimization 可以从 artifact 层开始，而不是直接跳到 prompt text optimization。

## 与本研究的关系

- 对 `04` 来说，`skill-forge` 是第一批应优先研究的 skill-level 优化对象。
- 它把“优化 skill”具体化为：
  - 改描述和元数据以提升触发与发现
  - 改 workflow 结构以提升可执行性
  - 改目录、链接、README 和发布结构以提升可治理性
  - 用安全扫描和 publish gate 防止坏版本进入公开分发
- 这为 `04` 的 failure taxonomy 提供了第一组分类线索：
  - 触发失败
  - 执行失败
  - 结构失败
  - 描述一致性失败
  - 安全 / 发布失败
  - 分发一致性失败

## 可直接引用的术语 / 概念

- `post-authoring tool`
- `discoverability`
- `workflow skills actually get followed`
- `Critical issues block push`
- `Skills are code`

## 风险与局限

- 当前证据主要来自项目 README 和本地 raw idea 总结，自述色彩较强。
- 它能支撑“skill-level 优化对象存在”这一判断，但不能单独证明其优化效果已经被独立评测验证。
- 它更像治理 / audit / publish 层的优化路线，不覆盖完整的线上 trace、eval、回放和自动候选修订闭环。
