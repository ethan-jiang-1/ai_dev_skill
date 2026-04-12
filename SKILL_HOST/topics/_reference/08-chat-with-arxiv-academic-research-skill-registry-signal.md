# Chat With ArXiv Academic Research Skill Registry Signal

- source_url: https://skills.sh/qodex-ai/ai-agent-skills/chat-with-arxiv
- source_type: registry_skill_listing
- accessed_at: 2026-04-12 17:20:00 CST
- published_or_updated_at: First Seen Jan 22, 2026 (skills.sh listing)
- date_scope: 2026-Q1
- related_topic: 08
- trust_level: practitioner
- why_it_matters: provides a concrete 2026 “academic literature” deep-research skill example, supporting the taxonomy that deep research skills are not just web search wrappers
- claims_supported: deep research skills package synthesis and conversation workflows; install portability can be broad; semantic portability still depends on tool/runtime contracts
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Installation command:
  - `npx skills add https://github.com/qodex-ai/ai-agent-skills --skill chat-with-arxiv`
- Repository: `https://github.com/qodex-ai/ai-agent-skills`
- Weekly installs (listing): `110`
- First seen (listing): `Jan 22, 2026`
- Installs-across signal (listing UI): `opencode`, `gemini-cli`, `codex`, `cursor`, `github-copilot`, `claude-code`
- Skill positioning (listing description): conversational exploration + synthesis of ArXiv research papers

## 核心内容摘录

- This is a “deep research” shape: read/summarize/synthesize primary sources (papers) and support interactive questioning.
- Unlike a pure search wrapper, the value claim centers on synthesis and understanding, which is sensitive to model capability and context limits.

## 与本研究的关系

- Strengthens Topic `08` taxonomy with an academic-literature example (distinct from market intel / prospect research).
- Reinforces the Wave 2 framing: research skills are a stress test because they depend on runtime contracts (retrieval ability, context window, and tool availability) more than writing skills do.

## 可直接引用的术语 / 概念

- `ArXiv`
- `scientific literature exploration`
- `synthesis`
- `conversational research`

## 模型 / 宿主 / 版本相关信息

- The “paper synthesis” promise is strongly model- and context-window-dependent; host exposure of context limits and long-context options can materially change usefulness.
- Cross-host install signals are not proof that the retrieval/summarization workflow behaves equivalently across hosts.

## 风险与局限

- If the host/runtime cannot fetch papers reliably (or cannot keep enough context), the skill degrades into shallow summaries.
- Academic synthesis increases the need for evidence discipline and citation checks; host tool availability and permission envelopes can be a bottleneck.

