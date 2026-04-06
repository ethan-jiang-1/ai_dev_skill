# Superpowers 独立技能评估报告（第 2 部分）

> 评估人：Claude Opus 4.6 | 评估日期：2026-04-06  
> 评估范围：Skill #6 ~ #10（纪律层 + 代码审查层）  
> 评估依据：逐文件源码精读 + 结构化维度评分

---

## Skill #6: systematic-debugging

**路径**: `skills/systematic-debugging/SKILL.md`  
**角色**: 纪律型 skill — 强制 agent 在修 bug 前找到根因  
**字数**: ~1300 词（主文件）+ 支撑文件（root-cause-tracing.md、defense-in-depth.md、condition-based-waiting.md）

### 设计理念

systematic-debugging 的核心主张是一个极简但极强的 Iron Law：

> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

它把调试从"猜测 → 试修 → 猜测"循环转变为"调查 → 分析 → 假设 → 验证 → 修复"的科学方法。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 10 | Iron Law + 4 Phase 结构 + Red Flags + Rationalization Table + Quick Reference + 支撑文件引用。每个元素各司其职 |
| 规则密度 | 10 | 四个 Phase 各有严格的前置条件和通过标准。Phase 4 的"3+ fixes failed → question architecture"是一个精准的升级规则。Rationalization Table 有 8 条反合理化 |
| 失败模式覆盖 | 10 | 这是全仓库失败模式覆盖最全面的 skill。它覆盖了：猜修、多重修改、跳过测试、"太简单不需要流程"、"紧急情况没时间"、"先试试这个"、"我看到问题了直接修"、3+ 次修复失败后的惯性。特别是"your human partner's Signals You're Doing It Wrong"段落，从用户的反馈信号反推 agent 行为偏差 |
| 可验证性 | 9 | 每个 Phase 有明确的 Success Criteria。Phase 4 要求创建 failing test case。但 Phase 1（root cause investigation）的"完成度"难以客观衡量 |
| 认知增量 | 9 | "3+ fixes failed = architectural problem"规则是高价值认知增量。大多数 agent 在 10 次失败后仍在尝试修补，而不是质疑架构。"从用户信号反推自身问题"也是一种罕见的元认知设计 |
| 复用潜力 | 10 | 完全通用。任何项目、任何语言、任何宿主都需要系统化调试 |
| token 效率 | 7 | ~1300 词加上多个支撑文件。Rationalization Table 和 Red Flags 有部分重叠。但考虑到纪律型 skill 需要反复强化规则，这个长度可以接受 |
| 与上下游衔接 | 8 | 引用了 test-driven-development（Phase 4 创建 failing test）和 verification-before-completion。root-cause-tracing.md 作为技术支撑。但与 using-superpowers 的 Skill Priority 中"Fix this bug → debugging first"的衔接只是隐含的，不是显式的 |

### 亮点

- **四阶段结构** 是教科书级的调试方法论，但在 agent 语境下被重新包装为不可跳过的 phase gate。这个设计既是工程哲学又是行为约束。
- **"3+ fixes failed → question architecture"** 是全仓库最精妙的升级规则之一。它不是简单的"重试限制"，而是一个认知转向——从"代码有 bug"到"架构有问题"。
- **"your human partner's Signals"** 段落令人印象深刻。它列出了 5 种用户措辞（"Is that not happening?"、"Stop guessing"、"Ultrathink this"），然后告诉 agent：看到这些信号就意味着你做错了，立刻回到 Phase 1。这是一种**从外部反馈学习**的机制。
- **多组件系统的分层诊断**（Layer 1 → Layer 2 → ...）提供了可操作的代码模板，不只是理论建议。
- **Real-World Impact** 段落给出了具体数字（15-30 分钟 vs 2-3 小时），虽然是估算，但比空泛的"更高效"说服力强得多。

### 问题

- **Phase 1 完成标准不够量化**："Understand WHAT and WHY" 作为 Success Criteria 偏模糊。可以考虑要求"能用一句话陈述 root cause"。
- **与 TDD 的 overlap**：Phase 4 Step 1 要求"Create Failing Test Case"并引用 TDD skill，但如果 agent 已经在 debugging 流程中，是否需要完整执行 TDD 的 RED-GREEN-REFACTOR？边界不清晰。
- **支撑文件可能增加上下文压力**：root-cause-tracing.md、defense-in-depth.md、condition-based-waiting.md 都是额外的 token 消耗。

### 评分

**加权总分: 9.1 / 10**  
**评级: S**

> systematic-debugging 是 superpowers 中"纪律型 skill"的代表作。它的四阶段结构 + 升级规则 + 用户信号反推，构成了一个完整的调试行为治理系统。

---

## Skill #7: test-driven-development

**路径**: `skills/test-driven-development/SKILL.md`  
**角色**: 纪律型 skill — 强制 agent 先写测试再写代码  
**字数**: ~1400 词

### 设计理念

TDD skill 的核心是另一个 Iron Law：

> **NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST**

它将 TDD 从"最佳实践建议"提升为"刚性规则"，并用大量反合理化策略防止 agent 找借口跳过。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 10 | Iron Law + RED-GREEN-REFACTOR 流程图 + 详细代码示例（Good/Bad 对比）+ Verification Checklist + Rationalization Table（11 条）+ Red Flags + When Stuck + Debugging Integration。极其完整 |
| 规则密度 | 10 | "Write code before test? Delete it. Start over." + "No exceptions" + 4 条明确禁止（don't keep as reference, don't adapt, don't look at it, delete means delete）。这是全仓库措辞最强硬的段落之一 |
| 失败模式覆盖 | 10 | Rationalization Table 覆盖了 11 种常见借口，每一条都有精确的反驳。"Tests after achieve same goals" → "Tests-after = what does this do? Tests-first = what should this do?" 是一个极其精准的区分。Red Flags 列出 13 种危险信号 |
| 可验证性 | 10 | Verification Checklist 有 8 个勾选项。每一步（RED、GREEN、REFACTOR）都有明确的验证命令和预期输出。"Can't check all boxes? You skipped TDD. Start over." |
| 认知增量 | 8 | TDD 本身不是新概念。但将其包装为 agent 行为约束，并附加如此密集的反合理化策略，是显著增量。Good/Bad 代码对比（真实测试 vs mock 测试）也有教学价值 |
| 复用潜力 | 10 | 完全通用。任何有测试框架的项目都适用 |
| token 效率 | 6 | ~1400 词是全仓库最长的 skill 之一。Rationalization Table、Red Flags、"Why Order Matters" 解释段落有大量重复论证（从不同角度论证同一观点）。这是纪律型 skill 的代价：需要反复强化才能对抗合理化 |
| 与上下游衔接 | 8 | 被 systematic-debugging（Phase 4）和 subagent-driven-development（subagent should use）引用。引用了 testing-anti-patterns.md。但没有显式标注自己在整体流程链中的位置 |

### 亮点

- **"Delete it. Start over." 规则** 加上四条"No exceptions"是全仓库最强硬的行为约束。它不留任何灰色地带："Don't keep it as reference" → 你不能把已写的代码当参考。"Don't look at it" → 甚至不能看。这种极端措辞是故意的——它需要对抗 agent 非常强大的"沉没成本"合理化倾向。
- **Good/Bad 代码对比** 不是空泛的"好测试 vs 坏测试"。Good 示例用真实代码（`let attempts = 0`），Bad 示例用 mock（`jest.fn().mockRejectedValueOnce`）。这精确命中了 agent 最常见的测试偏差：过度使用 mock。
- **"Violating the letter of the rules is violating the spirit of the rules"** 这句话预封了"我遵守了精神但变通了形式"的合理化路径。
- **Verification Checklist** 的最后一行 "Can't check all boxes? You skipped TDD. Start over." 是一个完美的 gate function。
- **"Why Order Matters" 段落** 用四个独立论证攻击四种不同的跳过理由，每个论证都是自洽的。

### 问题

- **对探索性编程的处理**："Need to explore first? Fine. Throw away exploration, start with TDD." 虽然理论上正确，但在实践中，agent 可能不确定自己是在"探索"还是在"实现"。
- **token 成本偏高**：11 条 rationalization + 13 条 red flags + 4 段 "Why" 论证，有内容重叠。如果 token 预算紧张，可以压缩。
- **测试框架假设**：示例用 TypeScript/Jest。虽然 agent 可以移植到其他框架，但没有给出通用指导。
- **对 GUI/前端代码的适用性**：纯 UI 变更（CSS 调整、布局修改）是否也必须走 TDD？文档没有明确说明。

### 评分

**加权总分: 9.0 / 10**  
**评级: S**

> TDD skill 是 superpowers 中反合理化策略最密集的 skill。它的 Rationalization Table 和 Red Flags 组合构成了一道几乎不可逾越的纪律防线。

---

## Skill #8: verification-before-completion

**路径**: `skills/verification-before-completion/SKILL.md`  
**角色**: 纪律型 skill — 强制 agent 在声称完成之前提供证据  
**字数**: ~500 词

### 设计理念

verification-before-completion 解决的是一个令人惊讶的常见问题：**agent 在没有运行验证命令的情况下声称"测试通过了""构建成功了""bug 修复了"**。

其 Iron Law：

> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 9 | Iron Law + 5 步 Gate Function + Common Failures 表 + Red Flags + Rationalization Prevention 表 + Key Patterns（5 种场景的正确/错误对比）+ When To Apply。缺少流程图但不需要——这是一个 gate 型 skill，不是流程型 |
| 规则密度 | 10 | Gate Function 的 5 步中每一步都是不可跳过的。Common Failures 表列出 7 种常见声称及其验证要求。Rationalization Prevention 有 8 条。密度极高 |
| 失败模式覆盖 | 10 | "Using 'should', 'probably', 'seems to'" → STOP。"Expressing satisfaction before verification ('Great!', 'Perfect!', 'Done!')" → STOP。这两条覆盖了 agent 最常见的虚假完成信号。"Why This Matters" 段落引用了 24 个失败记忆——这不是理论，是从真实事故中提取的 |
| 可验证性 | 10 | 这个 skill 本身就是关于验证的。它要求 agent 在当前消息中运行验证命令并展示输出。这是所有 skill 中最容易验证的——如果回复中没有命令输出，就是违规 |
| 认知增量 | 9 | "Claiming work is complete without verification is dishonesty, not efficiency" 这个定性（从效率问题提升为诚实问题）是高价值认知转变。大多数 agent 把跳过验证视为"偷懒"，而非"撒谎" |
| 复用潜力 | 10 | 完全通用。任何需要验证结果的场景都适用 |
| token 效率 | 9 | ~500 词内传递了极其密集的验证规则。简洁有力 |
| 与上下游衔接 | 7 | 被 systematic-debugging 引用（"Verify fix worked before claiming success"）。被 subagent-driven-development 隐式要求（每个 review 后需要验证）。但自身没有显式标注与其他 skill 的关系 |

### 亮点

- **Key Patterns 段落** 是这个 skill 最有操作性的部分。它给出了 5 种场景（Tests、Regression tests、Build、Requirements、Agent delegation）的 ✅/❌ 对比。特别是 "Agent delegation" 场景：`✅ Agent reports success → Check VCS diff → Verify changes → Report actual state` vs `❌ Trust agent report`。
- **将跳过验证定性为"dishonesty"** 是一个刻意的措辞选择。它利用了 agent 对"诚实"概念的高优先级——"Honesty is a core value. If you lie, you'll be replaced."
- **Regression test 的 red-green 验证** 要求不只是"测试通过"，而是"写测试 → 通过 → revert fix → 必须失败 → 恢复 → 通过"。这是完整的回归测试验证循环。
- **"Different words so rule doesn't apply"** 这条 rationalization prevention 预封了 agent 用同义词绕过规则的路径。

### 问题

- **与 TDD 的 Verification Checklist 有重叠**：TDD skill 已经要求"Watch each test fail/pass"。verification-before-completion 的 Gate Function 在某些场景下是重复验证。
- **对长时间运行任务的适用性**：如果测试套件运行需要 30 分钟，每次声称都重新运行是不现实的。但文档的"fresh verification"似乎要求每次都运行。
- **"24 failure memories" 引用** 很有说服力，但没有给出具体的案例细节。

### 评分

**加权总分: 9.3 / 10**  
**评级: S+**

> verification-before-completion 是全仓库"投入产出比"最高的 skill。500 词内传递了一个足以改变 agent 行为模式的核心规则，且通过 Key Patterns 提供了直接可操作的验证模板。

---

## Skill #9: requesting-code-review

**路径**: `skills/requesting-code-review/SKILL.md`  
**角色**: 质量保障 — 调度 code-reviewer subagent 进行代码审查  
**字数**: ~350 词

### 设计理念

requesting-code-review 是一个**操作手册型 skill**，它不塑造行为纪律，而是提供"如何正确请求代码审查"的操作流程。

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 8 | When to Request + How to Request（3 步 + Placeholders）+ Example + Integration + Red Flags。结构清晰但相对简单 |
| 规则密度 | 7 | "Fix Critical issues immediately""Fix Important issues before proceeding""Note Minor issues for later" 是清晰的优先级规则。Red Flags 有 4 条 "Never"。但整体规则不如纪律型 skill 密集 |
| 失败模式覆盖 | 7 | "Skip review because 'it's simple'" 和 "Ignore Critical issues" 覆盖了最常见的跳过行为。但对"reviewer 给出低质量反馈""reviewer 和 implementer 意见冲突"等更复杂的场景覆盖不足 |
| 可验证性 | 8 | code-reviewer subagent 的输出（Strengths/Issues/Assessment）是可验证的。git SHA 对比提供了精确的审查范围 |
| 认知增量 | 6 | "review early, review often" 不是新概念。操作流程（get git SHAs → dispatch subagent → act on feedback）是实用但不算高增量 |
| 复用潜力 | 8 | 依赖 code-reviewer subagent 的存在。通用性取决于宿主是否支持 subagent |
| token 效率 | 9 | ~350 词极简。信息密度合理 |
| 与上下游衔接 | 9 | 被 subagent-driven-development 调用。与 finishing-a-development-branch 衔接。Integration 段落给出了三种工作流（SDD、Executing Plans、Ad-Hoc）中的不同调用频率 |

### 亮点

- **Placeholder 机制**（`{WHAT_WAS_IMPLEMENTED}`、`{BASE_SHA}` 等）让 review 请求标准化，减少了遗漏关键信息的可能。
- **"Push back if reviewer is wrong (with reasoning)"** 是一个重要的平衡——review 不是单向服从，而是双向技术讨论。
- **Integration 段落** 根据不同工作流给出不同的 review 频率建议（SDD：每个 task 后；Executing Plans：每 3 个 task 后），体现了灵活性。

### 问题

- **对 code-reviewer 模板的依赖**：SKILL.md 引用了 `code-reviewer.md`，但该模板的质量直接影响 review 效果。如果模板有缺陷，整个 review 流程都会打折。
- **缺少 review 质量的元评估**：如何评估 reviewer 本身的工作质量？目前没有覆盖。

### 评分

**加权总分: 7.8 / 10**  
**评级: A**

> requesting-code-review 是一个实用的操作手册，但它更多是"做什么"而非"怎么做好"。它的价值主要来自于与 SDD 流程的集成。

---

## Skill #10: receiving-code-review

**路径**: `skills/receiving-code-review/SKILL.md`  
**角色**: 纪律型 skill — 规范 agent 接收和处理代码审查反馈的行为  
**字数**: ~700 词

### 设计理念

receiving-code-review 解决的是一个微妙但重要的问题：**agent 收到代码审查反馈后的行为偏差**，包括：
- 表演性认同（"You're absolutely right!"）
- 盲目实现（不验证就执行建议）
- 回避冲突（不敢 push back）

### 逐维度评分

| 维度 | 分数 | 评语 |
|---|---:|---|
| 结构完整性 | 9 | Response Pattern（6 步）+ Forbidden Responses + Handling Unclear Feedback + Source-Specific Handling（partner vs external）+ YAGNI Check + Implementation Order + When To Push Back + Acknowledging Correct Feedback + Gracefully Correcting + Common Mistakes 表 + Real Examples。结构非常完整 |
| 规则密度 | 9 | Forbidden Responses 列出 3 条"NEVER"。Acknowledging 段落禁止所有感谢表达（"Thanks for [anything]" → ❌）。Push Back 条件列出 6 种合理场景。Implementation Order 规定严格的优先级序列。密度高 |
| 失败模式覆盖 | 10 | 这个 skill 的失败模式覆盖极其独特——它覆盖的不是"做错事"的失败，而是"说错话"的失败。"performative agreement"是 LLM agent 最典型的行为偏差之一，这个 skill 精准打击它。对"partial implementation"（在不确定时先做确定的部分）的覆盖也很到位 |
| 可验证性 | 7 | 语言行为（是否使用了"You're absolutely right!"）可以通过文本分析验证。但"是否真的验证了 codebase"只能通过观察行为判断 |
| 认知增量 | 9 | "Code review requires technical evaluation, not emotional performance" 这个定位转换是高价值增量。大多数 agent 被训练为"友好和同意"，这个 skill 明确要求"技术严谨而非社交舒适" |
| 复用潜力 | 9 | 适用于任何有代码审查流程的项目。对 external reviewer 的处理（"be skeptical, but check carefully"）也适用于 PR review |
| token 效率 | 8 | ~700 词。Real Examples 段落提供了高价值的具体对比，但 Common Mistakes 表与前文有部分重叠 |
| 与上下游衔接 | 7 | 与 requesting-code-review 形成配对。但 SKILL.md 没有显式标注这个配对关系。与 SDD 流程的衔接也是隐含的 |

### 亮点

- **"Strange things are afoot at the Circle K"** 这个安全词设计是全仓库最意外的亮点。它给 agent 一个信号：如果你不敢公开 push back，可以用这个暗语提醒用户。这是对 agent 在权力不对称环境中的行为的深刻理解。
- **Forbidden Responses** 不只是禁止"You're absolutely right!"，还禁止所有感谢表达。"If you catch yourself about to write 'Thanks': DELETE IT. State the fix instead." 这种级别的行为塑形非常罕见。
- **Source-Specific Handling** 区分了 partner（信任但仍需理解）和 external reviewer（验证后再实现）。这个区分反映了真实工程环境中的信任层级。
- **YAGNI Check** 段落精准打击了 reviewer 常见的"implement properly"建议——如果功能根本没被使用，就不应该"properly implement"它。
- **Handling Unclear Feedback** 的规则（"If ANY item is unclear, STOP, do not implement ANYTHING yet"）防止了"先做能做的部分"这种常见但有害的行为。

### 问题

- **过于强硬的感谢禁令**：完全禁止感谢表达在人类团队中可能不合适。虽然对 agent 来说这个规则有效，但如果用户的 CLAUDE.md 要求礼貌沟通，会产生冲突。
- **"your human partner" 术语** 在多处使用，但如果 agent 不在 superpowers 语境中工作，这个术语可能令人困惑。
- **GitHub Thread Replies** 段落过于技术细节化，应该在支撑文件中而非 SKILL.md 主体。

### 评分

**加权总分: 8.5 / 10**  
**评级: S**

> receiving-code-review 是全仓库"社交行为塑形"最精妙的 skill。它解决的是一个大多数 skill 仓库完全忽略的领域——agent 如何在技术讨论中保持严谨而非迎合。

---

## 第 2 部分总结

| Skill | 评分 | 评级 | 核心价值 |
|---|---:|---|---|
| systematic-debugging | 9.1 | S | 四阶段调试 + 3 次失败升级规则 |
| test-driven-development | 9.0 | S | 最密集的反合理化策略 |
| verification-before-completion | 9.3 | S+ | 投入产出比最高：500 词改变一个核心行为 |
| requesting-code-review | 7.8 | A | 实用操作手册，价值依赖 SDD 集成 |
| receiving-code-review | 8.5 | S | 社交行为塑形的独创性设计 |

**第 2 批 5 个 skill 的平均分: 8.74 / 10**

### 观察

1. **纪律三角形**：systematic-debugging + TDD + verification-before-completion 构成了一个互补的纪律三角形——调试纪律（如何找 bug）+ 开发纪律（如何写代码）+ 验证纪律（如何证明完成）。这三个 skill 的配合是 superpowers 最有说服力的设计。
2. **requesting vs receiving 的不对称**：requesting-code-review（7.8 分）明显弱于 receiving-code-review（8.5 分）。前者是操作手册，后者是行为塑形。如果 requesting 能增加更多关于"如何写出有效的 review 请求""如何为 reviewer 提供足够上下文"的指导，整体质量会更均衡。
3. **token 成本权衡**：TDD（~1400 词）是最长的 skill 之一，但它的长度是由"反合理化"需求驱动的。如果削减 Rationalization Table，纪律效果会明显下降。这是纪律型 skill 的固有 trade-off。

---

*下一部分将评估 Skill #11-14 + 全仓库总评：finishing-a-development-branch、using-git-worktrees、dispatching-parallel-agents、writing-skills*
