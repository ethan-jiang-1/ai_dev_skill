# GitHub Docs: Creating Agent Skills for GitHub Copilot

- `source_url`: `https://docs.github.com/en/copilot/how-tos/use-copilot-agents/cloud-agent/create-skills`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `official`
- `why_it_matters`: `这份文档提供了当前最清楚的 `SKILL.md` 结构要求、脚本资源模型，以及一个关键安全约束。`
- `claims_supported`:
  - `SKILL.md` 是 skill 目录的核心入口文件
  - `SKILL.md` 使用 Markdown + YAML frontmatter
  - `name`、`description`、`allowed-tools` 等字段揭示了当前 skill 接口的事实约定
  - skill 与 always-on custom instructions 应分层处理

## 关键事实

- GitHub 将创建 skill 的基本单位定义为一个目录，而不是单文件。
- skill 的入口文件必须命名为 `SKILL.md`。
- `SKILL.md` 是 Markdown 文件，并带有 YAML frontmatter。
- 最简形式下，frontmatter 至少包含：
  - `name`：必填，唯一标识符，使用小写与连字符
  - `description`：必填，描述 skill 做什么，以及何时应被使用
  - `license`：可选
- skill 目录可以包含 scripts、examples 或其他资源文件。
- 当 skill 被调用时，Copilot 会自动发现 skill 目录中的文件，并与 `SKILL.md` 一并提供给 agent。
- `allowed-tools` 可以预先批准 skill 使用某些工具。
- GitHub 官方明确警告：只有在完全信任 skill 及其脚本来源时，才应预先批准 `shell` 或 `bash`；否则第三方 skill 或 prompt injection 可能触发任意命令执行。
- GitHub 明确区分：
  - `custom instructions` 适合几乎每个任务都应生效的简单规则
  - `skills` 适合仅在相关时才应加载的更细致程序化说明

## 与本研究的关系

- 对 `01` 而言，这份文档给出了当前最清晰的 `SKILL.md` 事实接口，可用来固定“skill 的最小结构”。
- 对 `02` 而言，它说明了 skill 为什么天然是目录级对象，也解释了为何 installer / loader / runtime 需要处理附带脚本和资源。
- 对 `03` 而言，官方安全警告说明“借鉴他人 skill”有明显收益，但也不能跳过来源审查与权限边界。

## 可直接引用的术语 / 概念

- `SKILL.md`
- `YAML frontmatter`
- `allowed-tools`
- `skills versus custom instructions`
- `Only pre-approve shell or bash if you fully trust the source`

## 风险与局限

- 当前信息主要反映 GitHub Copilot 的实现与建议，不必然代表所有 agent 已完全对齐这些字段。
- 这份文档更偏“如何创建”，对版本化、跨平台兼容和大规模治理的描述有限。
