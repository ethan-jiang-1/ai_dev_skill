# Codex App Worktrees: Parallel Threads, Automations, and Handoff

- source_url: https://developers.openai.com/codex/app/worktrees
- source_type: official_docs
- accessed_at: 2026-04-12 17:45:00 CST
- published_or_updated_at: current docs snapshot accessed 2026-04-12
- date_scope: current-2026
- related_topic: 03, 06, 08
- trust_level: official
- why_it_matters: worktrees are a concrete execution-topology primitive; they explain why “format-compatible skills” can still behave differently across hosts once workflows rely on parallel threads, background execution, and branch isolation
- claims_supported: Codex app uses Git worktrees to run independent tasks in parallel; automations run on background worktrees in Git repos; non-git projects run automations directly; threads can be started on worktrees manually; Handoff moves a thread between Local and Worktree
- captured_excerpt: partial
- canonical_exception: no

## 关键事实

- Worktrees allow Codex to run multiple independent tasks in the same project without interfering with each other.
- In Git repositories:
  - automations run on dedicated background worktrees so they don’t conflict with ongoing work.
- In non-version-controlled projects:
  - automations run directly in the project directory.
- Threads can be started on a worktree manually.
- `Handoff` is explicitly documented as the flow that moves a thread between `Local` and `Worktree`, with Codex handling the Git operations.
- Worktrees require a Git repository:
  - a worktree is a second checkout of a repo, sharing `.git` metadata while keeping separate file copies, enabling parallel branch work.

## 核心内容摘录

- The doc frames worktrees as a safety+parallelism mechanism:
  - queue background work while keeping the foreground stable
  - later move the thread into Local for inspection, testing, or collaboration
- This is an explicit host capability that many “skill portability” discussions overlook.

## 与本研究的关系

- Topic `03`: shows Codex’s execution topology is first-class in product docs; skills and workflows must be reasoned about in the presence of parallel threads and branch-isolated environments.
- Topic `06`: supports the portability-layer model: even with shared `SKILL.md` format, execution topology portability is weak across hosts.
- Topic `08`: research and orchestration workflows often assume parallel tasks; worktrees explain one concrete way a host enables safe parallelism.

## 可直接引用的术语 / 概念

- `Worktree`
- `Local checkout`
- `Handoff`
- `automations run on dedicated background worktrees`
- `Git worktrees`

## 模型 / 宿主 / 版本相关信息

- This capability is tied to Codex app runtime behavior and assumes a Git repository context.

## 风险与局限

- Worktree semantics are Git-dependent; portability to hosts without worktree support must rely on alternative isolation strategies.
- This page describes intended behavior; operational edge cases still exist (setup scripts, environment selection, branch selection).

