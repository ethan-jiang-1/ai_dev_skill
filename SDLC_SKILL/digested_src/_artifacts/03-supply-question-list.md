# 主题 3（supply）问题清单更新（Wave 1）

## 已回答（有证据回指）

- 企业第一方供给在这一轮里有哪些高信号样本、各自提供了什么“可用性工程”？（Ref: ../reference_src/03-supply-expo-docs-expo-skills.md；../reference_src/03-supply-cloudflare-skills-github-readme.md；../reference_src/03-supply-huggingface-skills-github-readme.md）
- skills 与 MCP 的边界是什么、为什么说是“共生分层”？（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md；../reference_src/03-supply-cloudflare-mcp-guide.md）
- 社区索引的价值与限制是什么，应如何使用才不把索引当证据？（Ref: ../reference_src/03-supply-awesome-agent-skills-voltagent.md；../reference_src/03-supply-awesome-mcp-servers.md）
- “装了但找不到/不会触发”的典型失败模式来自哪里？（Ref: ../reference_src/03-supply-expo-skills-github-readme.md）

## 待验证 / 待补搜

- Hugging Face/Cloudflare README 中涉及的“宿主官方落盘位置/manifest schema”需要回到各宿主官方文档核验成一手证据（尤其是 Codex `.agents/skills`、Gemini extensions、Cursor plugin 安装流）。（Ref: ../reference_src/03-supply-huggingface-skills-github-readme.md；../reference_src/03-supply-cloudflare-skills-github-readme.md）
- MCP 协议还缺少 tools/resources/prompts 等 server features 的规范章节与 reference servers 的仓库级证据，当前只覆盖 base protocol。（Ref: ../reference_src/03-supply-mcp-base-protocol-2025-06-18.md）
- Glama 等 MCP 目录/检查器在“发现网络”中的实际机制与可信度，需要单独补证据（第一轮摘要中提名但二轮未覆盖）。（Ref: ../reference_src/03-supply-awesome-mcp-servers.md）

## 停止条件自检

- 核心对象清单是否稳定（不再持续新增关键名字）：基本稳定（Expo/Cloudflare/HF + MCP 规范 + Awesome 索引）。
- 新搜到的材料是否主要重复已知事实：开始出现重复（同一仓库的 docs/README 在重复阐述安装与触发口径）。
- 是否已覆盖 6 个固定问题（且每个有证据）：已覆盖（见 `03-supply-evidence-summary.md`）。
- 是否已补搜反例、限制、争议：部分覆盖（主要覆盖“索引不可信/宿主触发差异/安全风险”，仍缺真实落地案例反证）。
- 是否已完成“官方说法 vs 社区实践”交叉核验：未完成（当前仍以官方 docs/仓库为主，需补社区实践与失败复盘）。
