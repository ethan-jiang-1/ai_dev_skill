# Claude Support: What Are Skills? (Progressive Disclosure + Dynamic Loading)

- source_url: https://support.claude.com/en/articles/12512176-what-are-skills
- source_type: official
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 03-devlife
- trust_level: official
- why_it_matters: Official product-level definition of “skills” including progressive disclosure and dynamic loading. This supports eng claims about why skill packaging can be a learning scaffold (structure + on-demand context) rather than only a long prompt.
- claims_supported:
  - Claude skills are designed to work via progressive disclosure (load only what’s needed to avoid context overload).
  - Skills can include instructions/scripts/resources and be provisioned at different governance scopes (user vs org).
  - “Dynamic loading” is a concrete mechanism that changes how engineers experience and learn skills (on-demand exposure of method).
- date_scope: docs page as of access date (2026-04-09)
- related_tools: Claude (skills)

## 关键事实

- Claude 将 skills 定义为包含 instructions / scripts / resources 的文件夹资产，用于提升特定任务表现。
- 文档明确提到 skills 的运行机制包含 progressive disclosure：Claude 判断相关性并按需加载信息，避免 context window overload。
- 文档提到多类技能供给/治理层级（官方、用户自定义、组织预置、合作伙伴等），并指出与 code execution 等能力开关相关。

## 与本研究的关系

- 对 01-scaffold：progressive disclosure 是“脚手架”实现层面的一个典型机制。
  - 学习收益假设：把方法/规则拆成按需暴露的模块，让工程师在完成任务时逐步看到“为什么这么做”与“检查点”，降低一开始的认知负担。
- 对 03-devlife：说明工具生态会塑造 skill 的开发与使用方式（例如：如何打包、如何加载、如何在团队层面 provision）。

## 可直接引用的术语 / 概念

- progressive disclosure
- dynamic loading
- context window overload
- organization provisioned skills

## captured_excerpt

> Skills work through progressive disclosure...

## 风险与局限

- 这是 Claude 产品语义，不等价于所有宿主/标准（例如不同 host 对 SKILL.md 的字段与加载语义可能不同）。用于跨工具比较时需要再用各宿主的官方 docs/schema/code 做交叉核验。

