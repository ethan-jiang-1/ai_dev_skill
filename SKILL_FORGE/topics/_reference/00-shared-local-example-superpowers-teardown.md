# Local Example Teardown: `superpowers`

- `source_path`:
  - `/Users/bowhead/ai_dev_skill/superpowers-analysis/eval_skills/01-总览.md`
- `source_type`: `local-analysis-derived-note`
- `accessed_at`: `2026-04-11`
- `related_topic`: `shared`
- `trust_level`: `internal-derived`
- `why_it_matters`: `这组本地拆解很适合说明一个更成熟的实践方向：skill 不只是内容仓库，还可以通过 hooks、宿主适配和行为测试去强制工作流发生。`
- `claims_supported`:
  - 高质量 skill 系统会把 bootstrap、触发纪律、宿主适配和验证一起纳入设计
  - “agent 是否真的按规则使用了 skill”本身可以成为测试对象
  - workflow-enforcing plugin 是 skill engineering 的一个重要进阶形态

## 关键事实

- 本地拆解显示，该项目不只有显式 `SKILL.md`，还有：
  - hooks
  - 旧命令桥接层
  - 跨宿主安装和适配说明
  - 专门验证 skill 是否真的被调用的测试
- 这说明它的重点不是堆更多 skill，而是把 agent 推向一条强纪律的软件开发流程。
- 对阅读者来说，这类样本最值得学的不是单条 instruction，而是：
  - bootstrap 怎么做
  - 触发纪律怎么做
  - 测试怎么做

## 与本研究的关系

- 这是一个很强的“进阶例子”，适合放在主 Playbook 里告诉读者：当你不再只会写 `SKILL.md`，下一步可以开始考虑注入、适配和测试。
- 它也能作为“不要把 skill 仓库看得过于轻量”的反例。

## 风险与局限

- 这是一份本地拆解摘要，不是该仓库的原始官方规范。
- 它更适合说明成熟实践形态，不适合拿来当最小通用 baseline。
