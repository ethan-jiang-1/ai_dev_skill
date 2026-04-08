# github/spec-kit: Hash-tracked integration manifest (SHA-256) (`manifest.py`)

- source_url: https://github.com/github/spec-kit/blob/main/src/specify_cli/integrations/manifest.py
- source_type: official_repo_code
- accessed_at: 2026-04-09
- published_at:
- related_topic: framework
- trust_level: official
- why_it_matters: 这是 Spec Kit 在“安装/卸载集成（integrations）”层面的安全与可追溯机制一手证据：用 manifest 记录每个写入文件的 SHA-256，并在卸载时仅删除 hash 仍匹配的文件（被修改则跳过并报告），同时包含 path traversal 防护与 symlink 处理策略。可迁移到技能分发/安装治理讨论（dist × framework）。

## Key Facts

- 模块目标：为“已安装 integration”记录其创建文件与 SHA-256 hash；卸载时仅移除 hash 仍匹配的文件，已修改文件会被保留并报告。（Ref: module docstring）
- Manifest 落盘路径固定为：`<project_root>/.specify/integrations/<key>.manifest.json`。（Ref: `IntegrationManifest.manifest_path`）
- 路径安全：`_validate_rel_path()` 禁止 absolute path，并校验相对路径 resolve 后仍位于 project root 内（防 `..` 逃逸）。（Ref: `_validate_rel_path`）
- 写入与记录：`record_file()` 会写入内容并记录 `rel_path -> sha256(content)`；`record_existing()` 记录现有文件的 sha256。（Ref: `record_file`, `record_existing`）
- 修改检测：`check_modified()` 将 symlink 与非普通文件视为 modified，并对普通文件计算 sha256 与 expected_hash 对比。（Ref: `check_modified`）
- 卸载策略：`uninstall(force=False)` 默认仅在 hash 匹配时删除文件；对 symlink 默认不删除（除非 force），并在删除后清理空父目录；最后删除 manifest 文件自身。（Ref: `uninstall`）
- Manifest 内容：`save()` 写入 JSON，包括 `integration`、`version`、`installed_at`、以及 `files` 的 `{rel_path: sha256_hex}` 映射。（Ref: `save`）

## Claims Supported

- “Spec Kit 在安装资产治理上采用 hash-tracked manifest：既能支持可追溯卸载，又能避免覆盖/删除用户已修改文件，是一种可迁移的分发安全与可维护性机制。”（主题 4 framework；主题 2 dist）

## Captured Excerpts (keep short)

> On uninstall only files whose hash still matches the recorded value are removed.

## Terms / Concepts

- integration manifest (`.specify/integrations/*.manifest.json`)
- sha256 hash tracking
- path traversal prevention
- force uninstall

## Risks / Limits

- 该实现解决的是“本地安装文件的可追溯卸载与防误删”；它不能单独解决“下载来源真实性/签名/provenance”等更上层供应链信任问题，但可作为强治理链路的一环。

