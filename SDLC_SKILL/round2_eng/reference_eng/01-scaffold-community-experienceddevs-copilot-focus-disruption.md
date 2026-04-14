# Community Feedback: “I stopped using Copilot and didn’t notice a decrease in productivity” (r/ExperiencedDevs, 2025/2026)

- source_url: https://www.reddit.com/r/ExperiencedDevs/comments/1p0qqmx/i_stopped_using_copilot_and_didnt_notice_a/
- source_type: community
- accessed_at: 2026-04-09T04:22:03+08:00
- related_topic: 01-scaffold
- trust_level: community
- why_it_matters: A high-signal thread from experienced developers discussing concrete cognitive effects of always-on autocomplete: distraction, decision fatigue, and impact on “train of thought”. This is practitioner-grounded evidence for eng’s cognitive-offloading and “explicit control vs implicit automation” claims.
- claims_supported:
  - Always-on suggestions can interrupt a developer’s working memory / train of thought and introduce decision fatigue, sometimes offsetting time saved on boilerplate.
  - Developers differentiate between AI modes: autocomplete vs “agent/chat for debugging/exploration”; learning value and cognitive cost differ.
  - Supports a design hypothesis: optional/on-demand invocation (keybind/request) may preserve focus better than constant suggestions.
- date_scope: post/comments as of access date (2026-04-09); thread shows “4mo ago” timestamps at access time
- related_tools: GitHub Copilot; Cursor; Claude; IDE autocomplete vs agent mode

## 关键事实

- 讨论核心不在“AI 会不会写代码”，而在“默认弹出建议”对注意力与思考链路的影响：不少人认为省下的键入时间很有限，但被打断去评估建议的代价很真实。
- 讨论里反复出现“把 AI 当成可控工具，而不是默认自动化”的诉求（例如希望只有在需要 boilerplate 时按键触发）。

## 与本研究的关系

- 对 01-scaffold（认知卸载/认知负担）：
  - 这是“认知卸载”在软件工程场景的社区语言版本：不是抽象概念，而是“被迫切换注意力去评估提示”这种可感知成本。
- 对 03-devlife（工具生态影响学习路径）：
  - 这类反馈能支撑一个重要区分：同一工具内的不同形态（autocomplete vs agent mode）对学习/专注/产出质量影响不同。

## 可直接引用的术语 / 概念

- train of thought / focus disruption
- decision fatigue
- keybind / request suggestion (on-demand invocation)
- boilerplate vs “thinking part”

## captured_excerpt

Representative comments (quotes kept short):

> "...time lost when I'm intentionally writing more complex knowledge and an auto-suggestion pops up and immediately takes my brain out of its current line of thought..." (comment in thread)

> "AI should help reduce cognitive load, not increase it." (comment in thread)

## 风险与局限

- 社区讨论不等于可控实验；样本存在自选择偏差与情绪化表达。用于 eng 结论时应与工具机制（官方 docs）和更系统的研究（学术论文）做交叉验证，并把结论表述为“社区一致性反馈/实践倾向”，而非普遍规律。

