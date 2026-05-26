# Lab 08 — Incident Response Simulation

## Objective

Walk through a tabletop-style incident in the lab project end-to-end:

1. **Detect** a suspicious event using Cloud Logging.
2. **Investigate** by pivoting through related logs and IAM bindings.
3. **Contain** the impact (revoke a credential, tighten a firewall rule, etc.).
4. **Document** findings in a short investigation report.
5. **Remediate** with concrete follow-ups.

## Scenario (example)

> A previously unused service account suddenly grants itself `roles/owner` on the project at 02:17 UTC, then creates a public Cloud Storage bucket and uploads an object.

You can keep this scenario or substitute your own. The point is to practice the workflow, not to be exhaustive.

## Inputs

- [`sample-logs/`](sample-logs/) — synthetic log snippets you can paste into Logs Explorer-style queries
- Output of the queries in [Lab 05](../05-cloud-logging-monitoring/log-query-examples.md)

## Deliverables

- [`investigation-report.md`](investigation-report.md) — what happened, when, who, how detected
- [`remediation-plan.md`](remediation-plan.md) — immediate, short-term, and long-term actions

## Validation

- [ ] Detection step references a specific log query
- [ ] Investigation report has a clear timeline
- [ ] Remediation plan separates "stop the bleeding" from "prevent recurrence"
- [ ] At least one preventative control maps back to another lab in this repo

## Files

- [`investigation-report.md`](investigation-report.md)
- [`remediation-plan.md`](remediation-plan.md)
- [`sample-logs/`](sample-logs/)
