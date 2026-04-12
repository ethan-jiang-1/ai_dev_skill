# Claude Code Memory: CLAUDE.md Loading, Rules Organization, and Auto Memory

- source_url: https://code.claude.com/docs/en/memory
- source_type: official_docs
- accessed_at: 2026-04-12 17:35:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 02, 06, 08
- trust_level: official
- why_it_matters: Claude Code’s “persistent layer” is not only CLAUDE.md; this page documents the instruction loading chain, rules organization, and auto-memory storage/limits that shape whether skills/subagents remain stable and maintainable
- claims_supported: Claude loads multiple CLAUDE.md/CLAUDE.local.md files by walking up directories and concatenating; imports unify cross-tool instruction files; `.claude/rules/` and excludes help reduce drift; auto memory has explicit storage, security constraints, and load thresholds
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Claude Code uses two persistence mechanisms loaded at session start:
  - `CLAUDE.md` files (instructions you write)
  - `Auto memory` (learnings Claude writes)
- `AGENTS.md` interoperability guidance (official):
  - Claude Code reads `CLAUDE.md`, not `AGENTS.md`.
  - If a repo uses `AGENTS.md` for other hosts, create a `CLAUDE.md` that imports it (avoids duplication; keeps instruction parity across tools).
- How `CLAUDE.md` loads:
  - Claude walks up the directory tree from the current working directory and loads `CLAUDE.md` and `CLAUDE.local.md` in each directory.
  - Discovered files are concatenated (not “override” semantics).
  - Within a directory, `CLAUDE.local.md` is appended after `CLAUDE.md` (last-read wins when conflicting at that level).
- Imports:
  - `@path/to/import` syntax (relative + absolute); recursive imports supported with a maximum depth of 5 hops.
- Auto memory storage and security boundary:
  - Project memory directory: `~/.claude/projects/<project>/memory/`
  - `<project>` derives from the git repository, so all worktrees/subdirectories share the same auto memory directory.
  - `autoMemoryDirectory` can be set in user/local settings, but not in project settings (`.claude/settings.json`) to prevent redirecting writes to sensitive locations.
  - Auto memory can be disabled by env var `CLAUDE_CODE_DISABLE_AUTO_MEMORY=1` or config (`autoMemoryEnabled`).
- Auto memory load limit:
  - The first 200 lines or first 25KB of `MEMORY.md` (whichever comes first) is loaded at conversation start.

## 核心内容摘录

- The documented concatenation model means large teams and monorepos must manage drift intentionally:
  - split instructions with imports or `.claude/rules/`
  - periodically remove outdated/conflicting instructions
  - use exclude controls (`claudeMdExcludes`) to avoid pulling irrelevant rules into a working context
- Auto memory is explicitly “machine-local” and scoped by repo identity (worktrees share one memory base).

## 与本研究的关系

- Topic `02`: clarifies the runtime context stack that skills must coexist with (instruction precedence, import patterns, drift management, and auto-memory ceilings).
- Topic `06`: strengthens cross-host guidance: maintain one canonical instruction source (e.g., `AGENTS.md`) and import it into Claude via `CLAUDE.md` to reduce divergence across hosts.
- Topic `08`: highlights why research workflows can drift over time (auto-memory retention thresholds; cross-worktree sharing; tool/permission contracts interacting with persistent instructions).

## 可直接引用的术语 / 概念

- `CLAUDE.md` + `CLAUDE.local.md` concatenation
- `@path/to/import` (max depth 5)
- `.claude/rules/`
- `claudeMdExcludes`
- `~/.claude/projects/<project>/memory/`
- `CLAUDE_CODE_DISABLE_AUTO_MEMORY=1`
- `first 200 lines or 25KB` load cap

## 模型 / 宿主 / 版本相关信息

- This page exposes “context window economics” as an operational concern:
  - instruction bloat reduces adherence
  - memory load caps mean not everything is always in-context
- Subagents may have their own memory behavior (the page points to subagent configuration for details).

## 风险与局限

- Official docs describe intended behavior; some org deployments may further constrain behavior via managed settings or policy.
- Importing `AGENTS.md` is a strong interoperability pattern, but it still requires translation when hosts disagree on tool names, permissions, or plan semantics.

