# Clone Security And Quality Risks In The Skill Ecosystem

- `source_urls`:
  - `https://arxiv.org/abs/2603.22447`
  - `https://arxiv.org/abs/2604.02837`
  - `https://agentskillreport.com/`
  - `https://www.agentskillreport.com/quality-in-the-agent-skills-ecosystem.pdf`
- `source_type`: `independent-research-and-report`
- `accessed_at`: `2026-04-11`
- `related_topic`: `03-ecosystem-signals-and-adoption`
- `trust_level`: `independent`
- `why_it_matters`: `这组独立来源把 `03` 最需要的反证补齐了: 生态的“规模、目录和下载”都是真信号，但复制膨胀、安全弱点和质量退化也同样是真信号。`
- `claims_supported`:
  - skill 生态存在大规模 clone inflation，公开数量不能直接当成有效供给
  - 风险具有结构性，不只是少数作者粗心
  - validation 和静态结构检查不足以预测 skill 是否真的会伤害输出质量

## Clone inflation

- `SkillClone` 论文指出生态中已出现 `196K` public skill instances。
- 在其 `20K` skill 样本里，发现 `258K` clone pairs。
- `75%` 的 skills 处于 clone pairs 中，且 `40%` 跨作者传播。
- 论文还指出生态规模被放大约 `3.5x`，并且 clone families 中有 `41%` 已被更优变体 supersede。

## Security structure

- 安全研究论文将 Agent Skill lifecycle 拆成:
  - Creation
  - Distribution
  - Deployment
  - Execution
- 论文基于真实生态证据分析了 `5` 起 confirmed security incidents。
- 论文认为最严重的风险来自框架本身的结构特征，例如:
  - 缺少 data-instruction boundary
  - persistent trust model 过强
  - 缺少强制性 marketplace security review

## Quality and contamination

- `agentskillreport.com` 对 `673` 个 skills / `41` 个 repositories 的审计显示:
  - `22%` fail validation
  - `52%` tokens 落在 nonstandard files 中，浪费上下文窗口
  - `66` 个 skills 存在 reference-file hidden contamination
  - structural risk 与实测 degradation 几乎无相关性: `r = 0.077`, `n = 19`
- 该报告明确提醒:
  - validation 是必要过滤器
  - 但 passing validation 不等于能提升任务表现

## 与本研究的关系

- 对 `03` 来说，这组证据迫使我们把 adoption judgement 拆成至少三层:
  - discovery signal
  - trust signal
  - effectiveness signal
- 这也让“借鉴别人 skill”这条路径更清楚:
  - 借鉴非常有价值
  - 但公共目录更像 discovery layer
  - 不是默认可信的 deployment layer
- 因此，最终推荐不应把目录规模、下载量或 star 直接折算成“可以重押”的理由。

## 风险与局限

- 这些来源多为新近研究，结论方向性很强，但未来仍可能随着生态治理改进而变化。
- 独立报告覆盖面广，但不直接替代针对某个具体候选项目的代码审计与任务评测。
