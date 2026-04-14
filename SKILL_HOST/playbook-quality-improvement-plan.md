# Playbook 质量提升计划

## Context

用户花了大量时间做 Deep Research，产出了：
- 91 个 reference 文件（原始证据）
- 8 个 topic 深度研究文档
- 5 个 Wave 2 综合分析 artifacts
- 当前的 final/ 目录（主 playbook + 3 个附录）

当前 playbook (`00-AI-Coding-Skills-Engineering-Playbook.md`, 472行) 信息完整，框架清晰，但读起来"不够痛"——质量没到让人"一看赏心悦目"的程度。

**用户的问题核心不是"加更多内容"，而是"如何把现有内容写得令人印象深刻"。**

---

## 诊断：当前 Playbook 的具体问题

通过阅读所有 final/ 文件和关键 topic/artifact 文档，识别出以下问题：

### 1. 开篇没有"痛" —— 缺少第一视角的真实场景
当前开篇描述了4个困境（选 host 困惑、可移植性误解等），但写法是概括性的"大家都会遇到"式描述。
**缺什么**：一个具体的、让目标读者感到"天啊这就是我"的场景。

### 2. 框架密度太高，结论先行，推导缺失
第一段就给出"3-layer 生态模型"，然后是"7层可移植性框架"，然后是"3种跨host模式"，然后是"5大警告信号"……
读者被大量框架淹没，但没有"为什么这样分层"的第一原理推导过程。
**缺什么**：让读者跟着思路走的"推导式叙述"，而不是"结论堆砌"。

### 3. 写法过于"汇报体" —— 缺少文字的流动和节奏
大量 `**标题**：\n- 要点\n- 要点\n- 要点` 结构。
信息容量很高，但阅读感差——类似读一份报告，而不是一份洞察深刻的 playbook。
**缺什么**：散文式段落（prose）和列表混搭；有些洞察用一句强力的"独白"比用要点列表更有冲击力。

### 4. 缺少具体案例（before/after / scenario）
框架描述很完整，但"实战"感不足。读者很难想象"我按这个做，具体会发生什么"。
**缺什么**：至少2-3个"小故事"级别的具体场景，哪怕是半虚构的composite scenario。

### 5. 结尾软掉了 —— Open Issues 不提气
第8章结尾是"未解决问题"清单，收尾感很弱。高质量 playbook 的结尾应该给读者一个清晰的"出发信号"，不是留下"还有很多问题没解决"的印象。

### 6. Quickstart 埋得太深
第2章末尾才出现 Quickstart，而且3步走之后紧跟一段"你跑完这三步再回头读第3-4章"，读起来像是搭手脚架，还没建好房子。
**建议**：Quickstart 值得更前置、更醒目，或者干脆独立出来作为一个"进门前的预热"。

### 7. 附录A（Host Matrix）太稀 —— 表格信息量不够
附录A的综合对比矩阵是最核心的工具表，但目前只有8行×5列，而且写法还是流水账式描述，不够"一目了然"。
**topics/_artifacts/W2-host-capability-matrix.md 里有更丰富的内容没有被充分利用。**

---

## 改进方案

### 核心原则
**目标不是"加内容"，而是"换写法"。** 信息量已经足够，问题在于组织和表达。

### 改写策略

#### 策略1：开篇重写 —— 从"场景"进入，不是从"困境列表"进入
用一个具体的复合场景（composite scenario）开篇：
> "你在 GitHub 上找到一个评分很高的 deep research skill，装进了 Claude Code，跑起来了。两个月后，团队里用 Cursor 的同事想复用。你把文件给他，他装上去，发现跑不起来。你们花了半天研究，最后发现问题出在……"

然后引出：这不是格式问题，而是 runtime contract 的问题。这才是这份 Playbook 要解决的真正问题。

#### 策略2：第2章重写 —— 用推导式叙述替换结论堆砌
不要直接给"3-layer 模型"，而是让读者跟着推导：
- "Skills 是什么？不是更长的 prompt。为什么不是？因为……"
- "如果把所有 host 的 skill 支持拆开来看，你会发现……（推导出3层）"
- Mermaid 图保留，但图之前要有"推导出这张图"的过程

#### 策略3：关键洞察用"独白式"强调
把最重要的观点从要点列表里提出来，单独成段，用更有力的语气写：
> **Install ≠ Run。这是 2026 年最容易踩的坑。**
> 
> 你的 skill 能在 4 个 host 上 install，不代表它能在 4 个 host 上正确运行。Install spread 只解决了最表层的 Layer 1（文件格式）问题。真正决定 skill 能不能"跑起来"的，是 Layer 4-7 的 runtime contract。

#### 策略4：第3章（Host对比）加入决策叙事
不只是列每个 host 的优缺点，而是写出"当你面临X需求时，这些差异对你意味着什么"的决策叙事。
Claude Code vs Codex 的选择，不是技术规格表的对比，而是"工作流哲学的取向"。

#### 策略5：加入1个完整的"mini case"
在第4章（可移植性）或第5章（应用线）中加入一个完整的 mini case：
> "一个 technical-writer skill 从 Claude Code 迁移到 Codex 的故事"
- Before：原来的 skill 长什么样，哪些地方有 host-specific 假设
- 发现：在目标 host 上什么跑了，什么没跑
- After：改了什么，怎么决定用 Translate 而不是 Delegate

这类 case 比任何框架都更"痛"。

#### 策略6：结尾重写 —— 给读者出发信号
把 Open Issues 降级到"维护者注"或注脚，主结尾改成：
> "现在你有了框架。下一步是实践。建议路径：先选一个 host，装一个 writing skill，跑起来。然后用 7 层框架评估它。你会开始看到 runtime contract 的边界在哪里。这是建立真实直觉最快的路。"

#### 策略7：附录A（Host Matrix）升级
利用 `W2-host-capability-matrix.md` 里更丰富的内容，重新设计附录A：
- 保留综合矩阵表格，但让每个格子更"可操作"（不只是描述，而是"如果你在乎X，那么……"）
- 加入"场景选择"矩阵（你的场景是什么 → 推荐哪个 host）

---

## 用户确认的改写方向

基于用户反馈，确定以下方向：

### 风格定位
**保持技术深度，但增加叙事感和具体案例**
- 维持当前的信息密度和技术准确性
- 改进：开篇场景化、推导式叙述、加入 mini case、独白式强调关键洞察
- 预计改动 40-50% 内容

### 案例类型
**Writing skill 跨 host 迁移的完整故事**
- 选择一个 technical-writer skill 从 Claude Code 迁移到 Codex 的 before/after 案例
- 展示 7 层可移植性框架的实际应用
- 让读者看到"哪一层开始断裂"的具体过程

### 附录A升级
**增加场景决策矩阵**
- 在现有对比表基础上，增加一个"你的场景 → 推荐 host"的决策表
- 利用 `W2-host-selection-and-portability-decision-framework.md` 的内容

---

## 具体执行计划

### Phase 1: 开篇重写（第0-1章）

**目标**：用具体场景开篇，让读者"认出自己"

**改写内容**：
1. **新增开篇场景**（约 30-40 行）
   - 场景：一个 AI Coding Engineer 在 GitHub 找到高评分 skill，装进 Claude Code 能跑，两个月后团队用 Cursor 的同事想复用，装上去跑不起来
   - 引出核心问题：这不是格式问题，是 runtime contract 问题
   - 素材来源：`topics/_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md`

2. **重写第1章"为什么需要"**（约 40-50 行）
   - 保留 4 个困境点，但用更具体的描述
   - 加入"2026 年最重要的认知转变"作为独立段落（独白式）
   - 明确 Playbook 的价值主张

**保留内容**：
- 导航表格
- Mermaid 结构图
- 工作区入口说明

---

### Phase 2: 第2章重写（3-Layer 模型）

**目标**：用推导式叙述替换结论堆砌

**改写内容**：
1. **推导式引入**（约 30 行）
   - 不直接给"3-layer 模型"，而是从"Skills 是什么？不是更长的 prompt"开始推导
   - 素材来源：`topics/01-skill-foundations-and-common-model.md` 的论证部分
   
2. **Progressive Disclosure 独立强调**（约 20 行）
   - 用独白式段落强调这个核心原则
   - 解释"为什么这是 skill 能同时做到强约束和低 token 成本的关键"

3. **Quickstart 位置调整**
   - 考虑提前到第2章开头，作为"先跑起来再理解"的入口
   - 或者独立成"第1.5章"

**保留内容**：
- 3-layer 模型的 Mermaid 图（但图之前加推导过程）
- Layer 1-3 的详细描述（但改写表达方式）

---

### Phase 3: 第3章改进（Host 对比）

**目标**：加入决策叙事，不只是技术规格对比

**改写内容**：
1. **决策叙事框架**（约 40 行）
   - 不只列优缺点，而是写"当你面临 X 需求时，这些差异意味着什么"
   - 素材来源：`topics/_artifacts/W2-host-selection-and-portability-decision-framework.md`

2. **关键对比的独白强化**
   - Claude Code vs Codex：工作流哲学的取向
   - Cursor：IDE-native 的优势与 runtime maturity 的权衡
   - OpenCode：兼容性桥梁的价值与配置复杂度的代价

**保留内容**：
- 4 个 Host 的核心特征描述
- Runtime Contract 的概念

---

### Phase 4: 第4章增强（可移植性）+ Mini Case

**目标**：加入完整的 mini case，让 7 层框架具体化

**新增内容**：
1. **Mini Case: Technical-Writer Skill 迁移故事**（约 80-100 行）
   - **Before**：原 skill 在 Claude Code 上的结构
     - 包含什么：workflow steps、style rules、reference files
     - 有哪些 host-specific 假设（如果有）
   
   - **迁移过程**：装到 Codex 后发生了什么
     - Layer 1-2：格式和发现层顺利通过
     - Layer 3：workflow-method 层基本可用
     - Layer 4-5：execution topology 和 runtime orchestration 的差异在哪里显现
     - 具体问题：tool names、subagent labels、或其他需要 translate 的地方
   
   - **After**：如何解决
     - 选择 Translate 模式而不是 Delegate
     - 具体改了什么
     - 最终效果
   
   - **教训**：这个案例验证了 7 层框架的哪些判断
   
   - 素材来源：
     - `topics/_reference/07-technical-writer-skill-patterns-and-install-flow.md`
     - `topics/_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md`

**保留内容**：
- 7 层可移植性框架的描述
- 3 种跨 host 模式（Sync/Translate/Delegate）

---

### Phase 5: 第7章强化（护栏）

**目标**：用独白式强调关键警告

**改写内容**：
1. **Install ≠ Run 独立段落**（约 15-20 行）
   - 作为"标语级"洞察单独呈现
   - 解释为什么这是 2026 年最容易踩的坑
   
2. **其他关键警告的独白化**
   - 不要假设 tool 可用性
   - 不要盲目复制 GitHub skill
   - 每个警告都有一个"为什么这很重要"的具体解释

**保留内容**：
- 5 大警告信号的核心内容

---

### Phase 6: 第8章重写（下一步）

**目标**：给读者清晰的出发信号

**改写内容**：
1. **行动路径**（约 30-40 行）
   - 第一步：选一个 host，装一个 writing skill
   - 第二步：用 7 层框架评估它
   - 第三步：尝试跨 host 工作
   - 第四步：编写自己的 skill
   
2. **结尾语气调整**
   - 从"这些问题还没解决"改为"现在你有了框架，下一步是实践"
   - Open Issues 降级到注脚或单独的"维护者注"部分

**移除内容**：
- 当前的 Open Issues 作为主结尾

---

### Phase 7: 附录A升级

**目标**：增加场景决策矩阵

**新增内容**：
1. **场景决策表**（约 40-50 行）
   - 表格结构：你的场景 | 关键需求 | 推荐 Host | 理由
   - 场景类型：
     - 快速复用现有 Skills
     - 运行复杂多步骤 Workflow
     - 评估 Deep Research Skills
     - 跨 Host 协作
     - 团队治理与企业化
     - 新手快速上手
   - 素材来源：`topics/_artifacts/W2-host-selection-and-portability-decision-framework.md`

**保留内容**：
- 现有的综合对比矩阵表格
- Evidence 来源部分

---

## 文件改动清单

### 主要改动
1. **`final/00-AI-Coding-Skills-Engineering-Playbook.md`**
   - 新增开篇场景：~40 行
   - 第1章重写：~50 行
   - 第2章推导式改写：~80 行
   - 第3章决策叙事：~40 行
   - 第4章 mini case：~100 行
   - 第7章独白强化：~30 行
   - 第8章结尾重写：~40 行
   - **预计总改动：约 380 行（新增+改写），保留约 200 行**

2. **`final/附录A-Host-Capability-Matrix.md`**
   - 新增场景决策矩阵：~50 行
   - 优化现有表格描述：~20 行
   - **预计总改动：约 70 行**

### 不改动
- `final/附录B-Portability-Playbook.md`
- `final/附录C-Evidence-Traceability-Map.md`
- `final/_STAGE_0-3_FOUNDATION.md`
- `final/_STAGE_6_EVIDENCE_MAP.md`

---

## 写作原则与风格指南

### 核心原则
1. **技术深度不妥协** — 保持所有框架、分层、证据链的完整性
2. **叙事感增强** — 用推导、场景、故事让读者"跟着走"，而不是"被灌输"
3. **节奏交替** — 散文段落（prose）和要点列表（bullets）交替使用
4. **观点明确** — 在关键问题上有清晰的推荐立场，不只是"各有优劣"

### 具体写法指南

#### 开篇场景的写法
- **第一人称视角或"你"的视角**，不用"大家"、"用户"这类抽象主语
- **具体细节**：不说"遇到问题"，而是说"装上去，跑起来了，但两个月后……"
- **情绪共鸣**：让读者感到"这就是我经历过的"

#### 推导式叙述的写法
- **问题先行**："Skills 是什么？"→ 回答 → 引出下一个问题
- **层层递进**：从简单观察 → 深入分析 → 得出框架
- **避免结论堆砌**：不要一上来就给"3-layer 模型"，而是让读者看到"为什么需要分3层"

#### 独白式强调的写法
- **短句、有力**：如"Install ≠ Run。这是 2026 年最容易踩的坑。"
- **单独成段**：不埋在要点列表里
- **解释紧跟**：独白之后立即解释"为什么这很重要"

#### Mini Case 的写法
- **完整的故事弧**：Before → 问题 → 解决 → After → 教训
- **具体到可复现**：不说"遇到兼容性问题"，而是说"tool name 从 X 改成 Y"
- **框架验证**：明确指出"这个案例验证了 7 层框架的第 X 层"

#### 决策叙事的写法
- **场景驱动**："当你需要 X 时，Y 和 Z 的差异意味着……"
- **权衡明确**：不只说优点，也说代价
- **推荐清晰**：在关键选择上给出明确建议

### 要避免的写法
❌ "大家都知道……"（假设读者已知）
❌ "显然……"（跳过推导）
❌ "可以看出……"（没有真正展示）
❌ 连续5个以上的要点列表（节奏单调）
❌ "这个问题很复杂"（然后不解释）

### 要保持的写法
✅ 证据链完整（每个关键判断都能回溯到 reference）
✅ 技术术语准确（runtime contract、progressive disclosure 等）
✅ Mermaid 图和表格（视觉化辅助）
✅ 附录的技术参考价值（不降低信息密度）

---

## 改写顺序建议

建议按以下顺序改写，确保逻辑连贯：

1. **Phase 4 先行**：先写 mini case
   - 原因：这是最具体的部分，写完后对"什么是好的叙事"有更清晰的感觉
   - 位置：第4章中间，7层框架描述之后

2. **Phase 1**：开篇场景
   - 有了 mini case 的经验，开篇场景会更容易写得具体

3. **Phase 2**：第2章推导式改写
   - 开篇定了基调，第2章的推导就能承接

4. **Phase 3**：第3章决策叙事
   - 前面的叙事风格确立后，这部分会更顺

5. **Phase 5**：第7章独白强化
   - 相对独立，可以快速完成

6. **Phase 6**：第8章结尾重写
   - 最后写，确保和全文基调一致

7. **Phase 7**：附录A升级
   - 独立的技术附录，最后完成

---

## 质量检查清单

改写完成后，逐项检查：

### 内容完整性
- [ ] 所有原有的框架（3-layer、7-layer、3-mode）都保留
- [ ] 所有关键判断都有证据支撑
- [ ] 附录 C 的证据回溯仍然有效

### 叙事质量
- [ ] 开篇场景让目标读者"认出自己"
- [ ] 至少有 3 处"独白式"强调（Install ≠ Run 等）
- [ ] Mini case 完整且具体
- [ ] 推导过程清晰，不是结论堆砌

### 节奏与可读性
- [ ] 散文段落和要点列表交替出现
- [ ] 没有连续超过 5 个要点的列表
- [ ] 每个章节有明确的"入口"和"出口"
- [ ] 技术密度高的部分有具体例子辅助理解

### 实用性
- [ ] 附录 A 有场景决策矩阵
- [ ] 第8章给出清晰的行动路径
- [ ] Quickstart 位置合理（容易找到）
- [ ] 导航表格仍然有效

### 技术准确性
- [ ] 所有 host 名称、工具名称正确
- [ ] 引用的 reference 文件路径正确
- [ ] 技术术语使用一致
- [ ] 没有引入新的未经验证的判断

---

## 关键素材文件清单

改写时需要重点参考的文件：

### 开篇场景
- `topics/_reference/08-repo-research-analyst-multi-host-adoption-and-host-assumption-drift.md`
- `topics/_reference/06-cursor-cross-tool-skill-duplication-and-dedup-gap.md`

### 推导式叙述
- `topics/01-skill-foundations-and-common-model.md`
- `topics/_artifacts/W2-cross-topic-synthesis-draft.md`

### Mini Case
- `topics/_reference/07-technical-writer-skill-patterns-and-install-flow.md`
- `topics/_reference/06-claude-to-codex-tool-mapping-and-subagent-translation.md`

### 决策叙事
- `topics/_artifacts/W2-host-selection-and-portability-decision-framework.md`
- `topics/_artifacts/W2-host-capability-matrix.md`

### 独白强化
- `topics/_artifacts/W2-round1-closeout-summary.md` — "Install ≠ Run" 核心洞察

---

## 预期成果

改写完成后，这份 Playbook 应该：

1. **开篇 30 秒内抓住读者** — 通过具体场景让读者认出自己的困境
2. **中间部分有节奏** — 框架、案例、独白交替，不单调
3. **Mini case 成为亮点** — 让抽象的 7 层框架具体化
4. **结尾有力** — 读者知道"我该怎么开始"
5. **附录实用** — 场景决策矩阵成为快速查找工具
6. **整体感觉** — "这是一份有洞察、有深度、有实战价值的 Playbook"，而不是"一份信息完整但读起来累的技术文档"

---

## 时间估算

- Phase 4 (Mini case)：约 2-3 小时
- Phase 1 (开篇)：约 1-1.5 小时
- Phase 2 (第2章)：约 2 小时
- Phase 3 (第3章)：约 1.5 小时
- Phase 5 (第7章)：约 1 小时
- Phase 6 (第8章)：约 1 小时
- Phase 7 (附录A)：约 1.5 小时

**总计：约 10-12 小时的改写工作**

---

## 最终交付物

1. **改写后的主 Playbook** — `final/00-AI-Coding-Skills-Engineering-Playbook.md`
2. **升级后的附录A** — `final/附录A-Host-Capability-Matrix.md`
3. **改写说明文档**（可选）— 记录主要改动点和理由，方便未来维护
