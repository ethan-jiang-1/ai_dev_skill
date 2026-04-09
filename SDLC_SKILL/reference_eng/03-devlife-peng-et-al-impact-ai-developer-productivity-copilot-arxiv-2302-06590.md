# The Impact of AI on Developer Productivity: Evidence from GitHub Copilot (Peng et al., 2023; arXiv:2302.06590)

- source_url: https://arxiv.org/abs/2302.06590
- source_type: academic
- accessed_at: 2026-04-09T08:42:58+08:00
- related_topic: 03-devlife
- trust_level: academic
- why_it_matters: A controlled experiment (randomized split) with recruited software developers measuring task completion time and success, using a standardized repo + test suite (GitHub Classroom). It is widely cited as the canonical “Copilot makes developers faster” RCT-style evidence, and it provides concrete measurement mechanics that are directly reusable for skill/agent eval design.
- claims_supported:
  - In this controlled experiment, the treatment group with Copilot completed an HTTP server task in JavaScript 55.8% faster than the control group (with reported CI).
  - The control condition was not “no help”: participants were free to use internet search/Stack Overflow; the only difference was Copilot access plus a brief how-to video, strengthening interpretability.
  - The study operationalizes productivity with clear instrumentation (repo creation timestamp → first passing commit on 12-test suite), a template for building eval harnesses.
- date_scope: arXiv v1 2023-02-13; experiment ran 2022-05-15 to 2022-06-20 (per paper)
- related_tools: GitHub Copilot; GitHub Classroom; test suites; productivity measurement; controlled experiment

## 关键事实

- 研究设计（摘要/Study Design）：
  - controlled experiment；随机分配 control vs treatment。
  - 任务：尽快实现一个 JavaScript HTTP server。
  - treatment：可使用 Copilot + 观看简短使用视频。
  - control：不可使用 Copilot，但可自由使用 internet search / Stack Overflow 等日常信息源。
  - 招募：通过 Upwork 招募 95 名 professional programmers（论文给出招募与分配细节）。
- 度量与工具化（Study Design）：
  - 使用 GitHub Classroom 发放作业，给每位参与者一份私有模板仓库。
  - 仓库内置 12 个 checks 的 test suite；完成时间定义为“repo 创建时间戳 → 首次通过全部 12 tests 的 commit 时间戳”。
- 结果（摘要/Results）：
  - treatment 组完成时间 55.8% 更快（论文摘要给出该数字；正文还给出区间与显著性）。
  - 论文也报告 heterogeneous effects（不同经验/年龄/每日编程时长等维度的差异），并将其讨论为潜在职业转型支持信号（需谨慎外推）。

## 与本研究的关系

- 对 03-devlife（生命周期/评测闭环）：
  - 这份研究不仅给出“效率提升”的强证据，也给出一套可复用的评测工程脚手架：标准化 repo + tests + 明确的时间定义。
  - 可直接支撑“Evals/回归”章节：评测不是抽象概念，而是可落为 repository + test harness + timestamp 指标。
- 对 04-path（采纳与治理）有交叉：
  - 说明“自由搜索/Stack Overflow”并不妨碍 Copilot 带来速度差异，这会提高组织层采纳动机；但仍需配套质量/安全/维护性指标与长期跟踪。

## 可直接引用的术语 / 概念

- controlled experiment / controlled trial
- treatment vs control (Copilot access)
- task completion time (repo creation → first all-tests-pass commit)
- GitHub Classroom as task harness
- heterogeneous treatment effects

## captured_excerpt

From the abstract (PDF text extraction):

> "The treatment group ... completed the task 55.8% faster than the control group."

## 风险与局限

- 任务是单一 JS HTTP server；外推到多文件复杂系统、长期项目与团队协作需要谨慎。
- 该研究主要衡量速度与成功率，未直接覆盖代码质量、安全、可维护性、以及长期能力变化；在 eng 报告中必须与这些缺口并列呈现（并与 Borg 2026 maintainability 等研究交叉对照）。

