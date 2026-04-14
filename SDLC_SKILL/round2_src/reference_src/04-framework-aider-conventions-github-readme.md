# Aider-AI/conventions: README

- source_url: https://github.com/Aider-AI/conventions
- source_type: official_repo
- accessed_at: 2026-04-08
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: Aider 的 conventions 机制提供了一种极轻量的“约定驱动治理”：用 `CONVENTIONS.md` 这类只读规范文件约束 AI 的风格、依赖偏好与测试/文档标准；该仓库作为官方组织下的 conventions 模板集合，是研究“轻规则集”如何扩张的直接样本。

## Key Facts

- 定位：仓库说明其是 community-contributed convention files 集合，用于 aider（终端中的 AI pair programming 工具）。
- convention files 形式：README 明确 conventions 是 Markdown 文件，用于指定 coding guidelines（风格、依赖偏好、type hints、测试约定、文档标准等）。
- 使用方式：README 建议把目标 `CONVENTIONS.md` 拷贝进项目，并通过 `aider --read-only CONVENTIONS.md` 或在 `.aider.conf.yml` 中配置 read-only 文件的方式加载。
- 结构：每个子目录包含 `README.md`（用途说明）与 `CONVENTIONS.md`（规则本体）。

## Claims Supported

- “轻规则集”路线可以不引入复杂阶段门禁，而通过只读 conventions 文件持续约束模型行为与团队偏好。（主题4 framework）
- conventions 仓库这种“模板集合”形态，为个人/团队低成本采纳提供了现成入口，有利于扩散。（主题4 framework）

## Captured Excerpts (keep short)

> Convention files are markdown files that specify coding guidelines for aider to follow.

## Terms / Concepts

- `CONVENTIONS.md`
- `.aider.conf.yml`
- read-only conventions

## Risks / Limits

- 仓库主要是模板集合，机制细节（read-only、缓存、加载优先级等）需要以 aider 官方文档为准进行补证据。

