# Promptfoo CI Quality Gates For Skill Regression

- `source_url`: `https://www.promptfoo.dev/docs/integrations/ci-cd/`
- `source_type`: `official-doc`
- `accessed_at`: `2026-04-16`
- `related_topic`: `04-skill-optimization-and-feedback-loops`
- `trust_level`: `official`
- `why_it_matters`: `Promptfoo 的 CI/CD 文档把 eval、security scan、quality gate 和 regression prevention 放进自动化发布流程，这能迁移为 skill 修订的 publish gate。`
- `captured_excerpt`: `partial`
- `claims_supported`:
  - skill 修订可以通过 CI quality gate 阻断坏版本
  - eval 与 security scan 可以在发布前自动化运行
  - pass-rate / threshold / fail-on-error 可以成为最小 regression gate

## 关键事实

- Promptfoo 支持把 eval 放进 CI/CD pipeline。
- 文档明确列出 CI/CD 的用途包括：
  - 提前发现 regression
  - 自动安全扫描
  - enforce quality thresholds
  - 生成 reports
  - 跟踪 token usage 和 cost
- 基本命令模式包括运行 eval 并输出 JSON / HTML / XML 等结果。
- 文档提供了 fail-on-error 与自定义 pass-rate threshold 的质量门槛思路。

## 核心内容摘录

- 对 `04` 最关键的机制是：skill 修改不应只在本地手测，而应进入发布前自动 gate。
- 一个最小 skill CI gate 可以包括：
  - regression eval
  - safety / red-team scan
  - pass-rate threshold
  - report artifact
  - fail build on critical regression

## 与本研究的关系

- 这份材料支持 `Versioning / Regression Failure` 和 `Safety / Governance Failure`。
- 它也把 `skill-forge` 的发布前治理和 Promptfoo 的 eval gate 连接起来：
  - `skill-forge` 更像结构 / 安全 / 发布治理
  - Promptfoo 更像可自动运行的 eval / regression gate
- 后续 workflow baseline 可以采用组合口径：`skill-forge` 做 artifact audit，Promptfoo 或等价 harness 做 behavioral regression。

## 可直接引用的术语 / 概念

- `CI/CD`
- `quality gates`
- `fail-on-error`
- `pass rate`
- `regression`
- `security scanning`

## 风险与局限

- 这份材料主要说明 eval 如何进入 CI，不直接定义 skill-specific 测试样本格式。
- 如果直接迁移到 skill，需要补一层 adapter，把 skill 调用、宿主 agent、工具轨迹和输出断言接入 promptfoo config。
