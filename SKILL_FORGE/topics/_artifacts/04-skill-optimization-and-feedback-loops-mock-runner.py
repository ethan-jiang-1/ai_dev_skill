#!/usr/bin/env python3

from __future__ import annotations

import json
from pathlib import Path

from _skill_regression_runner_lib import (
    assert_case,
    build_compare_artifact,
    compare_results,
    index_runs,
    load_matcher_rules,
    load_yaml_file,
    validate_case_pack,
)


ROOT = Path(__file__).resolve().parent
CASE_PACK = ROOT / "04-skill-optimization-and-feedback-loops-local-case-pack.yaml"
SCHEMA = ROOT / "04-skill-optimization-and-feedback-loops-local-case-pack.schema.json"
BASELINE = ROOT / "04-skill-optimization-and-feedback-loops-mock-baseline.json"
CANDIDATE = ROOT / "04-skill-optimization-and-feedback-loops-mock-candidate.json"
REPORT_MD = ROOT / "04-skill-optimization-and-feedback-loops-mock-runner-report.md"
REPORT_JSON = ROOT / "04-skill-optimization-and-feedback-loops-mock-runner-report.json"
MATCHER_RULES = ROOT / "04-skill-optimization-and-feedback-loops-matcher-rules.yaml"


def format_report(artifact: dict) -> str:
    comparison = artifact["cases"]
    lines: list[str] = []
    lines.append("# Mock Skill Regression Report")
    lines.append("")
    lines.append("- `status`: `executed`")
    lines.append(f"- `runner`: `{ROOT / '04-skill-optimization-and-feedback-loops-mock-runner.py'}`")
    lines.append(f"- `case_pack`: `{CASE_PACK}`")
    lines.append(f"- `schema`: `{SCHEMA}`")
    lines.append(f"- `baseline_fixture`: `{BASELINE}`")
    lines.append(f"- `candidate_fixture`: `{CANDIDATE}`")
    lines.append(f"- `json_artifact`: `{REPORT_JSON}`")
    lines.append("")
    lines.append("## Result")
    lines.append("")
    lines.append(f"- `promotion_blocked`: `{'yes' if artifact['promotion_blocked'] else 'no'}`")
    lines.append(f"- `total_cases`: `{artifact['summary']['total_cases']}`")
    lines.append(f"- `regressions`: `{artifact['summary']['regressions']}`")
    lines.append(f"- `improvements`: `{artifact['summary']['improvements']}`")
    lines.append("")
    lines.append("| Case | Status | Candidate Passed | Blocking Failures |")
    lines.append("| --- | --- | --- | --- |")

    for entry in comparison:
        candidate = entry.get("candidate")
        failures = candidate.get("failures", []) if candidate else []
        blocking = ", ".join(failure["assertion"] for failure in failures)
        lines.append(
            f"| `{entry['case_id']}` | `{entry['status']}` | "
            f"`{candidate['passed'] if candidate else 'missing'}` | {blocking if blocking else '-'} |"
        )

    lines.append("")
    lines.append("## Promotion Decision")
    lines.append("")
    if artifact["promotion_blocked"]:
        lines.append("- `promoted`: `no`")
        lines.append("- `reason`: `Candidate has blocking mock regressions; do not run real adapter promotion until fixed.`")
    else:
        lines.append("- `promoted`: `yes`")
        lines.append("- `reason`: `No blocking gate, trigger or safety regressions in mock comparison.`")

    lines.append("")
    lines.append("## What This Proves")
    lines.append("")
    lines.append("- Schema loading and structural validation can run before adapter execution.")
    lines.append("- Deterministic trigger, trajectory, tool, output and safety assertions can distinguish passing baseline fixtures from regressed candidate fixtures.")
    lines.append("- No-trigger false positive, review output contract regression and unsafe ship behavior all block promotion.")
    lines.append("- JSON compare artifact is now the machine-readable SSOT; Markdown summary is derived from it.")
    lines.append("")
    lines.append("## Current Limits")
    lines.append("")
    lines.append("- Output contract matching is still keyword / rule based, not semantic judge based.")
    lines.append("- Only three cases are covered in the mock comparison.")
    lines.append("- Real Codex / Claude / Gemini adapters are not executed yet.")
    return "\n".join(lines)


def main() -> None:
    pack = load_yaml_file(CASE_PACK)
    schema = json.loads(SCHEMA.read_text())
    matcher_rules = load_matcher_rules(MATCHER_RULES)
    validate_case_pack(pack, schema)

    cases = {test_case["case_id"]: test_case for test_case in pack["cases"]}
    baseline_runs = index_runs(BASELINE)
    candidate_runs = index_runs(CANDIDATE)

    baseline_results = {
        case_id: assert_case(cases[case_id], run, matcher_rules)
        for case_id, run in baseline_runs.items()
    }
    candidate_results = {
        case_id: assert_case(cases[case_id], run, matcher_rules)
        for case_id, run in candidate_runs.items()
    }

    comparison = compare_results(baseline_results, candidate_results)
    artifact = build_compare_artifact(
        comparison=comparison,
        baseline_fixture=BASELINE.name,
        candidate_fixture=CANDIDATE.name,
        runner_mode="mock",
    )

    REPORT_JSON.write_text(json.dumps(artifact, indent=2) + "\n")
    REPORT_MD.write_text(format_report(artifact) + "\n")
    print(
        "promotion_blocked="
        + ("yes" if artifact["promotion_blocked"] else "no")
        + f" total_cases={artifact['summary']['total_cases']}"
        + f" regressions={artifact['summary']['regressions']}"
        + f" improvements={artifact['summary']['improvements']}"
    )


if __name__ == "__main__":
    main()
