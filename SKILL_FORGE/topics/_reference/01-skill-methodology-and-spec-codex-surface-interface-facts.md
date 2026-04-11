# Codex Skill Surface And AGENTS Interface Facts

- `source_urls`:
  - `https://developers.openai.com/codex/skills`
  - `https://developers.openai.com/codex/guides/agents-md`
- `source_type`: `official-docs`
- `accessed_at`: `2026-04-11`
- `related_topic`: `01-skill-methodology-and-spec`
- `trust_level`: `official`
- `why_it_matters`: `这组官方 Codex 文档把 OpenAI 侧的 surface 事实固定下来，尤其补齐了 skill authoring、plugin distribution、`.agents/skills` 扫描语义，以及 AGENTS.md 分层加载模型。`
- `claims_supported`:
  - Codex skill surface 以 `SKILL.md` 目录对象为核心，但扩展了 `agents/openai.yaml`
  - Codex 明确把 skills 与 plugins 分成 authoring format 和 distribution unit
  - Codex 官方支持 layered `AGENTS.md`，因此 repo guidance 与 task-level skill 的边界在 Codex 中尤其清楚

## 关键事实

- Codex 官方文档明确说:
  - skills 是 reusable workflows 的 `authoring format`
  - plugins 是 reusable skills 和 apps 的 `installable distribution unit`
- Codex skills 可用于:
  - CLI
  - IDE extension
  - Codex app
- skill 的最小结构仍是目录级对象，至少包含:
  - `SKILL.md`
  - `name`
  - `description`
- Codex 同时支持:
  - `scripts/`
  - `references/`
  - `assets/`
  - `agents/openai.yaml`
- Codex 明确把 `agents/openai.yaml` 作为可选 metadata，用于:
  - UI metadata
  - invocation policy
  - tool dependencies
- skill 激活有两种方式:
  - explicit invocation：CLI / IDE 中用 `/skills` 或 `$`
  - implicit invocation：任务命中 `description`
- Codex 的 skill 路径语义与 GitHub / Claude 都不同:
  - repo scope：从当前工作目录向上扫到 repo root 的 `.agents/skills`
  - user scope：`$HOME/.agents/skills`
  - admin scope：`/etc/codex/skills`
  - system scope：Codex 自带 skills
- Codex 还提供 `[[skills.config]]`，可在 `~/.codex/config.toml` 中按路径启停 skills。
- Codex 官方的 `AGENTS.md` 文档说明:
  - Codex 在开始工作前读取 `AGENTS.md`
  - 支持 global `~/.codex/AGENTS.md`
  - 从 project root 走到当前目录，按层拼接 project instructions
  - 更近目录的 instructions 覆盖更远目录
  - 默认总大小限制 `32 KiB`

## 与本研究的关系

- 对 `01` 来说，这组材料最重要的新增价值是:
  - Codex 现在已经可以作为第三个官方 surface 进入 compatibility appendix
  - `portable core` 与 `surface-specific extensions` 的区分不再只是 GitHub / Claude 两家对照
- 它也进一步巩固了一个判断:
  - `SKILL.md + name + description` 的共同层是强的
  - 但 `openai.yaml`、plugin packaging、`.agents/skills` upward scan、layered `AGENTS.md` 都是 Codex surface 的实现语义，不应被误写成通用规范

## 风险与局限

- 这组文档很好地覆盖了 Codex surface，但并不自动给出 GitHub / Claude 的字段级一一映射。
- 它足够支持 cross-surface appendix，却还不足以形成完整的 field-by-field support matrix。
