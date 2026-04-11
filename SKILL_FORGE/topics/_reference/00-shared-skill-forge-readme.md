# `skill-forge` README

- `source_url`: `https://raw.githubusercontent.com/motiful/skill-forge/main/README.md`
- `source_type`: `project-readme`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `practitioner`
- `why_it_matters`: `这是当前最明确把 skill 放进“工程治理、审计、发布、安全”框架里看的项目之一。`
- `claims_supported`:
  - skill engineering 的难点不只在内容生成，而在结构、发现、验证、安全与发布
  - 生态已经开始出现 post-authoring / audit / publish 工具
  - 风险与失败模式已足够真实，值得形成独立治理层

## 关键事实

- 项目核心口号是 `Skills are code. Engineer them like it.`。
- README 明确将 skill-forge 定位为 post-authoring tool，而不是写 skill 内容的生成器。
- 项目重点覆盖：
  - 审计整个 skill 项目
  - 检测注册冲突与坏链接
  - 安全扫描
  - 发布到多平台
  - 校验 discoverability 与 metadata 完整度
  - 检查 README 声明与实际能力是否一致
- README 说明 critical 安全问题会阻断 push。
- README 还把 workflow skills 的“agent 看过但不照做”作为真实问题来处理，说明 skill 质量不只是文本内容，还包括 executability。
- 项目声明自己验证六个质量维度：discoverable、reliable、efficient、trustworthy、bounded、valuable。

## 与本研究的关系

- 对 `01` 而言，这个项目说明 skill engineering 已经在讨论超出“写内容”之外的质量维度。
- 对 `02` 而言，它是“治理 / audit / publish 工具”这类对象的典型代表。
- 对 `03` 而言，它提供了一个重要反面提醒：现成 skill 借鉴很有帮助，但第三方 skill 的结构、安全和描述质量并不天然可信。

## 可直接引用的术语 / 概念

- `post-authoring tool`
- `Critical issues block push`
- `discoverability`
- `workflow skills actually get followed`

## 风险与局限

- README 中关于生态规模和漏洞比例的数字属于项目自述，除非拿到独立审计来源，否则不应当作硬事实引用。
- 这个来源最适合用于理解治理思路，而不是单独证明其效果已经被广泛验证。
