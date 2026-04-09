# superpowers: Verification Before Completion (Evidence Before Claims Gate)

- source_url: https://github.com/obra/superpowers/blob/917e5f53b16b115b70a3a355ed5f4993b9f8b73d/skills/verification-before-completion/SKILL.md
- source_type: official
- accessed_at: 2026-04-09 10:29:28 +0800
- related_dimension: 02-build-debug
- trust_level: official
- why_it_matters: 这是一个“防止假完成”的强 gate：如果没有在当前消息里跑过验证命令并读过输出，就禁止宣称通过/完成。它把“完成定义”从主观感受拉回到可复核证据，对抗 agent 的乐观偏差与隐性跳步。
- claims_supported:
  - “完成”必须绑定可执行验证命令与新鲜输出证据
  - 防止“agent 报喜但实际不通过”的系统性失败模式
  - 将验证动作前置到 commit/PR 前，可减少返工与信任损耗
- date_scope: as of git commit 917e5f53b16b115b70a3a355ed5f4993b9f8b73d (2026-04-06)
- related_frameworks: superpowers
- related_tools: tests/lint/build commands (host-specific)

Local anchor:
- repo_path: /Users/bowhead/ai_dev_skill/.tmp/cap/superpowers
- commit: 917e5f53b16b115b70a3a355ed5f4993b9f8b73d
- file_path: skills/verification-before-completion/SKILL.md

## 关键事实

- Iron Law：没有“fresh verification evidence”就不能做 completion claims。
- Gate Function 将完成宣称拆成 5 步（identify→run→read→verify→only then claim），并将跳步定义为“lying, not verifying”。
- 明确反对：
  - 信任 agent “success reports”
  - 依赖 partial verification
  - 用 “should/probably/seems” 等模糊措辞替代证据
- 给出典型映射表：不同 claim 需要不同类型的证据（tests pass 需要 0 failures 输出等）。

## 与本研究的关系

- 直接支撑 cap plan 的“完成定义要严”与“不要轻易说做完”的执行协议，可作为 build/debug/ship 的通用 gate。

## 可直接引用的术语 / 概念

- “NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE”
- “Evidence before claims, always.”

## captured_excerpt

摘录（来自 `skills/verification-before-completion/SKILL.md`）：

> “NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE”

## 风险与局限

- 该 gate 强依赖宿主能执行命令并读取完整输出；在受限环境（无测试命令、无可运行环境）需定义替代证据（例如静态分析、最小复现实验）。

