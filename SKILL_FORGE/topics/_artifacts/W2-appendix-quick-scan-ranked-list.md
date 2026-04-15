# W2 Appendix Quick Scan Ranked List

- `status`: `appendix`
- `purpose`: `提供快速扫描用的附录式排序，不替代主推荐结构。`
- `warning`: `这不是最终推荐主语法。主语法仍然是分角色推荐 + baseline 组合 + optimization / feedback loop layer。`
- `basis`:
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-final-recommendation-and-baseline.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-formal-comparison-table.md`
  - `/Users/bowhead/ai_dev_skill/SKILL_FORGE/topics/_artifacts/W2-cross-topic-synthesis.md`

## Quick Scan: Learning-First Top 3

1. `skills.sh`
   - role: `discovery / directory`
   - why: 最强的公开发现入口之一，适合快速找到现成 skill 和生态对象。
   - caution: 不提供质量或安全背书。

2. `github/awesome-copilot`
   - role: `community learning hub`
   - why: 适合观察真实写法、教程、社区材料和学习路径。
   - caution: 不应直接当工程基座。

3. `vercel-labs/agent-skills`
   - role: `sample-library`
   - why: 适合学习 `SKILL.md`、supporting files 和 progressive disclosure。
   - caution: 不承担 install / governance / evaluation 全链路。

## Quick Scan: Engineering Baseline Top 3

1. `vercel-labs/agent-skills`
   - role: `sample-library`
   - baseline position: 结构样板和内容参考。

2. `vercel-labs/skills`
   - role: `installer / manager`
   - baseline position: install / distribution / compatibility。

3. `skill-forge`
   - role: `governance / publish / artifact optimization`
   - baseline position: 发布前治理、trust gate、discoverability / executability 检查。

## Quick Scan: Optimization / Feedback Loop Mechanisms

1. Promptfoo-style trajectory regression
   - role: `regression harness`
   - use: tool calls、tool args、tool sequence、step count、CI quality gate。

2. LangSmith-style offline / online feedback loop
   - role: `trace feedback loop`
   - use: production trace、human feedback、annotation queue、offline regression dataset。

3. DSPy / OpenAI evals style optimizer and flywheel
   - role: `candidate revision / eval-driven optimization`
   - use: metric-driven candidate proposals、baseline comparison、representative test data。

## Quick Scan: Context-Specific Add-ons

- `open-skills`
  - best when: local LLM / MCP / self-hosted runtime bridge matters.
  - not default when: you need general discovery or trust layer.

- `Ai-Agent-Skills`
  - best when: team / personal curated library management matters.
  - not default when: you need universal installer or governance.

## How To Read This Appendix

- If learning is the goal, start from Learning-First Top 3.
- If building a workflow is the goal, use Engineering Baseline Top 3 plus Optimization / Feedback Loop mechanisms.
- If operating in a special runtime context, consider context-specific add-ons.
- Do not collapse these lists into one unqualified ranking.
