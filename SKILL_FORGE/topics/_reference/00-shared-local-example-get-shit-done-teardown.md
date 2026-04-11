# Local Example Teardown: `get-shit-done`

- `source_path`:
  - `/Users/bowhead/ai_dev_skill/get-shit-done-analysis/eval_skills/01-总览.md`
  - `/Users/bowhead/ai_dev_skill/get-shit-done-analysis/eval_skills/02-结构拆解.md`
- `source_type`: `local-analysis-derived-note`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `internal-derived`
- `why_it_matters`: `这组本地拆解很适合说明：skill 不一定只长成标准 `SKILL.md` 目录，它也可能长成 command / agent / workflow / reference / template 的组合系统。`
- `claims_supported`:
  - skill-like system 可以由多层对象协同组成，而不只是一批 skill 卡片
  - command、agent、workflow、reference、template 可以共同构成可复用 runtime
  - 读现成系统时，真正要看的往往是结构层级和调度关系

## 关键事实

- 本地拆解把该项目稳定拆成五层：
  - `commands`
  - `agents`
  - `workflows`
  - `references`
  - `templates`
- 其中 `commands` 被视作能力入口层，`agents` 是专职角色层，`workflows` 是编排层，`references` 是共享规则层，`templates` 是产物层。
- 这说明 skill engineering 的研究对象不应被机械限制成单一文件格式。
- 它很适合教读者理解：如果只盯着 front matter，很容易漏掉真正决定系统可复用性的规则层和模板层。

## 与本研究的关系

- 这组例子可以放进主 Playbook 的“怎样读一个现成系统”章节，作为对照样本。
- 它提醒读者：现成 skill 值得借鉴的，不只是文案，更是入口、角色、编排和产物结构。
- 它也能帮助解释为什么我们最终推荐的是组合式 baseline，而不是单一对象崇拜。

## 风险与局限

- 这同样是一组本地二次拆解材料。
- 它更适合承担“阅读和拆解例子”，不适合单独支撑跨平台规范判断。
