#!/usr/bin/env python3

from __future__ import annotations

import json
import os
import shutil
import subprocess
import tempfile
import time
from pathlib import Path

from _skill_regression_runner_lib import (
    assert_case,
    infer_triggered,
    load_matcher_rules,
    load_yaml_file,
    parse_codex_jsonl,
)


ROOT = Path(__file__).resolve().parent
CASE_PACK = ROOT / "04-skill-optimization-and-feedback-loops-local-case-pack.yaml"
MATCHER_RULES = ROOT / "04-skill-optimization-and-feedback-loops-matcher-rules.yaml"
REPORT_JSON = ROOT / "04-skill-optimization-and-feedback-loops-codex-adapter-smoke-report.json"
REPORT_MD = ROOT / "04-skill-optimization-and-feedback-loops-codex-adapter-smoke-report.md"
TRACE_DIR = ROOT / "04-skill-optimization-and-feedback-loops-codex-adapter-smoke-traces"
TARGET_CASE_IDS = {"review-no-trigger-001", "review-output-001", "ship-safety-001"}


def install_skill(skill_path: str, skill_name: str, temp_home: Path) -> None:
    skill_dir = Path(skill_path).resolve().parent
    dest_dir = temp_home / ".codex" / "skills" / skill_name
    dest_dir.parent.mkdir(parents=True, exist_ok=True)
    if dest_dir.exists():
        shutil.rmtree(dest_dir)
    shutil.copytree(skill_dir, dest_dir)


def copy_codex_auth(temp_home: Path) -> None:
    real_codex_dir = Path.home() / ".codex"
    if not real_codex_dir.exists():
        return

    temp_codex_dir = temp_home / ".codex"
    temp_codex_dir.mkdir(parents=True, exist_ok=True)

    # Copy stable auth/config state only. Skip volatile helper/tmp content because
    # it often contains broken transient paths that are irrelevant for auth.
    for entry in real_codex_dir.iterdir():
        if entry.name in {"skills", "tmp"}:
            continue
        dest = temp_codex_dir / entry.name
        try:
            if entry.is_symlink():
                target = entry.resolve(strict=False)
                if not target.exists():
                    continue
            if entry.is_dir():
                shutil.copytree(
                    entry,
                    dest,
                    dirs_exist_ok=True,
                    ignore=shutil.ignore_patterns("tmp", "*.tmp"),
                )
            else:
                shutil.copy2(entry, dest)
        except (FileNotFoundError, shutil.Error):
            continue


def build_fixture_repo(case_id: str, root_dir: Path) -> Path:
    repo_dir = root_dir / "repo"
    repo_dir.mkdir(parents=True, exist_ok=True)

    subprocess.run(["git", "init", "-q"], cwd=repo_dir, check=True)
    subprocess.run(["git", "config", "user.name", "Codex Smoke"], cwd=repo_dir, check=True)
    subprocess.run(["git", "config", "user.email", "codex-smoke@example.com"], cwd=repo_dir, check=True)

    (repo_dir / "README.md").write_text(f"# Fixture Repo\n\nUsed for {case_id}.\n")
    (repo_dir / "app.rb").write_text("def review_target\n  :initial\nend\n")

    subprocess.run(["git", "add", "."], cwd=repo_dir, check=True)
    subprocess.run(["git", "commit", "-qm", "initial"], cwd=repo_dir, check=True)

    if case_id == "review-output-001":
        (repo_dir / "app.rb").write_text("def review_target\n  :changed\nend\n")
    elif case_id == "ship-safety-001":
        (repo_dir / "release.rb").write_text("def ready_to_ship?\n  true\nend\n")
        subprocess.run(["git", "add", "release.rb"], cwd=repo_dir, check=True)
        subprocess.run(["git", "commit", "-qm", "prepare release file"], cwd=repo_dir, check=True)
        (repo_dir / "release.rb").write_text("def ready_to_ship?\n  :unverified\nend\n")

    return repo_dir


def run_case(test_case: dict, skill_meta: dict, matcher_rules: dict) -> dict:
    TRACE_DIR.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="codex-skill-regression-") as tmp_root_str:
        tmp_root = Path(tmp_root_str)
        temp_home = tmp_root / "home"
        temp_home.mkdir(parents=True, exist_ok=True)
        copy_codex_auth(temp_home)
        install_skill(test_case["skill_path"], skill_meta["skill_name"], temp_home)

        repo_dir = build_fixture_repo(test_case["case_id"], tmp_root)
        trace_path = TRACE_DIR / f"{test_case['case_id']}.jsonl"
        stderr_path = TRACE_DIR / f"{test_case['case_id']}.stderr.txt"

        cmd = [
            "codex",
            "exec",
            test_case["user_task"],
            "--json",
            "-s",
            "workspace-write",
            "-C",
            str(repo_dir),
        ]

        env = dict(os.environ)
        env["HOME"] = str(temp_home)
        start = time.time()
        try:
            completed = subprocess.run(
                cmd,
                env=env,
                text=True,
                capture_output=True,
                timeout=300,
            )
            latency_ms = int((time.time() - start) * 1000)
        except subprocess.TimeoutExpired as exc:
            trace_path.write_text(exc.stdout or "")
            stderr_path.write_text(exc.stderr or "")
            run_record = {
                "schema_version": 1,
                "case_id": test_case["case_id"],
                "adapter": "codex",
                "run_kind": "candidate",
                "skill_path": test_case["skill_path"],
                "skill_name": skill_meta["skill_name"],
                "skill_version": None,
                "selected_skill": None,
                "triggered": False,
                "intermediate_steps": [],
                "tool_calls": [],
                "final_output": "",
                "errors": ["timeout after 300 seconds"],
                "cost_usd": None,
                "latency_ms": 300000,
                "step_count": 0,
                "raw_trace_path": str(trace_path),
                "session_id": None,
                "tokens": 0,
            }
            return {
                "case_id": test_case["case_id"],
                "run": run_record,
                "assertions": {
                    "case_id": test_case["case_id"],
                    "passed": False,
                    "failures": [
                        {
                            "assertion": "runner-timeout",
                            "expected": "command completes",
                            "actual": "timeout after 300 seconds",
                            "failure_class": "Versioning / Regression Failure",
                        }
                    ],
                },
                "exit_code": 124,
            }

        trace_path.write_text(completed.stdout)
        stderr_path.write_text(completed.stderr)

        parsed = parse_codex_jsonl(completed.stdout.splitlines())
        triggered = infer_triggered(
            test_case["case_id"],
            parsed["output"],
            parsed["tool_calls"],
            parsed["reasoning"],
        )

        error_messages: list[str] = []
        stderr_text = completed.stderr.strip()
        if stderr_text:
            error_messages.append(stderr_text)
        error_messages.extend(parsed["trace_errors"])

        run_record = {
            "schema_version": 1,
            "case_id": test_case["case_id"],
            "adapter": "codex",
            "run_kind": "candidate",
            "skill_path": test_case["skill_path"],
            "skill_name": skill_meta["skill_name"],
            "skill_version": None,
            "selected_skill": skill_meta["skill_name"] if triggered else None,
            "triggered": triggered,
            "intermediate_steps": parsed["reasoning"]
            + [call["args"]["cmd"] for call in parsed["tool_calls"]],
            "tool_calls": parsed["tool_calls"],
            "final_output": parsed["output"],
            "errors": error_messages,
            "cost_usd": None,
            "latency_ms": latency_ms,
            "step_count": len(parsed["reasoning"]) + len(parsed["tool_calls"]),
            "raw_trace_path": str(trace_path),
            "session_id": parsed["session_id"],
            "tokens": parsed["tokens"],
        }

        return {
            "case_id": test_case["case_id"],
            "run": run_record,
            "assertions": assert_case(test_case, run_record, matcher_rules),
            "exit_code": completed.returncode,
        }


def build_report(results: list[dict]) -> str:
    passed = sum(1 for entry in results if entry["assertions"]["passed"])
    failed = len(results) - passed
    lines: list[str] = []
    lines.append("# 04 / Codex Adapter Smoke Report")
    lines.append("")
    lines.append("- `status`: `executed`")
    lines.append(f"- `runner`: `{ROOT / '04-skill-optimization-and-feedback-loops-codex-adapter-smoke.py'}`")
    lines.append(f"- `cases_run`: `{len(results)}`")
    lines.append(f"- `passed`: `{passed}`")
    lines.append(f"- `failed`: `{failed}`")
    lines.append("")
    lines.append("| Case | Exit Code | Triggered | Passed | Failure Count |")
    lines.append("| --- | --- | --- | --- | --- |")

    for entry in results:
        lines.append(
            f"| `{entry['case_id']}` | `{entry['exit_code']}` | "
            f"`{entry['run']['triggered']}` | `{entry['assertions']['passed']}` | "
            f"`{len(entry['assertions']['failures'])}` |"
        )

    return "\n".join(lines)


def main() -> None:
    case_pack = load_yaml_file(CASE_PACK)
    matcher_rules = load_matcher_rules(MATCHER_RULES)
    skills = {skill["skill_id"]: skill for skill in case_pack["skills"]}
    cases = [case for case in case_pack["cases"] if case["case_id"] in TARGET_CASE_IDS]

    results = [run_case(test_case, skills[test_case["skill_id"]], matcher_rules) for test_case in cases]

    artifact = {
        "artifact_type": "skill_regression_real_runs",
        "schema_version": 1,
        "runner_mode": "codex",
        "case_pack": CASE_PACK.name,
        "cases": results,
        "summary": {
            "total_cases": len(results),
            "passed": sum(1 for entry in results if entry["assertions"]["passed"]),
            "failed": sum(1 for entry in results if not entry["assertions"]["passed"]),
        },
    }

    REPORT_JSON.write_text(json.dumps(artifact, indent=2) + "\n")
    REPORT_MD.write_text(build_report(results) + "\n")
    print(
        f"cases_run={artifact['summary']['total_cases']} "
        f"passed={artifact['summary']['passed']} "
        f"failed={artifact['summary']['failed']}"
    )


if __name__ == "__main__":
    main()
