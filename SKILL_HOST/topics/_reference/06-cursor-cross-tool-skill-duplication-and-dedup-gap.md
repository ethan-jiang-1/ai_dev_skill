# Cursor Cross-Tool Skill Duplication and Dedup Gap

- source_url: https://forum.cursor.com/t/critical-issue-duplicate-skills-loading-causing-context-window-waste-and-confusion/150137
- source_type: official_forum_thread
- accessed_at: 2026-04-12 11:56:36 CST
- published_or_updated_at: thread opened 2026-01-28; staff reply 2026-01-28; auto-closed 2026-02-19
- date_scope: 2026-Q1
- related_topic: 04, 06
- trust_level: community
- why_it_matters: this is a concrete 2026 failure case showing that cross-host skill coexistence can backfire at discovery time; Cursor was loading duplicate `SKILL.md` entries from Codex and Claude-related directories, wasting context tokens and creating version ambiguity
- claims_supported: install portability can create negative side effects when host scanning lacks deduplication and priority rules; cross-tool skill discovery can surface outdated copies, hidden caches, and conflicting versions; practical interoperability sometimes requires a single authoritative directory
- captured_excerpt: yes
- canonical_exception: no

## 关键事实

- The report was filed on the official Cursor forum on `2026-01-28` against Cursor IDE `2.4.21`.
- The user describes Cursor scanning multiple tool-related directories and loading every discovered `SKILL.md` without deduplication or version resolution.
- The example shows one skill, `planning-with-files`, loaded from `11` different paths across Codex-, Claude-, and other tool-specific directories.
- The report explicitly calls out three missing controls:
  - filter by origin
  - deduplicate by skill name
  - resolve version conflicts
- The reported impact is concrete:
  - repeated metadata consumes context window tokens
  - different versions can coexist
  - the agent may select an outdated or unintended copy
- A Cursor staff reply confirms duplicates are showing up in the UI and says the bug is logged in the system.
- The workaround from staff is operational rather than architectural:
  - keep skills in one directory only
  - manually delete or rename duplicates in other directories
  - restart Cursor so filesystem rescanning drops the extra copies

## 核心内容摘录

- This thread is valuable because it shows a real failure mode caused by multi-tool skill spread:
  - interoperability at the file-discovery layer can increase confusion rather than reduce it
- The bug is not about `SKILL.md` syntax.
- It is about what happens when a host scans too broadly across other tools’ native directories and cached plugin paths.
- That creates three kinds of damage at once:
  - token waste from repeated metadata injection
  - version ambiguity when several copies of the same skill coexist
  - user-control failure because the host does not respect an intended authoritative source
- The staff workaround sharpens the lesson:
  - until deduplication exists, the practical fix is governance
  - one directory should be treated as authoritative
  - other copies should be removed or hidden
- So this source strengthens a key cross-host conclusion:
  - install portability is not automatically good
  - without discovery boundaries and dedup rules, cross-tool coexistence can degrade runtime quality

## 与本研究的关系

- Important for Topic `06` because it is a concrete interoperability failure, not a theoretical risk.
- Also relevant to Topic `04` because it shows Cursor’s discovery layer can interact badly with other tools’ skill layouts.
- It complements the mirror-sync and translation artifacts by showing the downside of uncontrolled multi-directory coexistence.

## 可直接引用的术语 / 概念

- `duplicate skills loading`
- `context window waste`
- `version conflict`
- `one directory only`
- `deduplication of Skills`

## 模型 / 宿主 / 版本相关信息

- Host: Cursor IDE
- Reported version: `2.4.21`
- The issue is about skill discovery and context injection behavior rather than model capability.

## 风险与局限

- This is an official forum thread, not a formal product specification.
- The confirmed workaround is strong evidence of the problem, but it does not establish how or when the underlying product behavior changed afterward.
