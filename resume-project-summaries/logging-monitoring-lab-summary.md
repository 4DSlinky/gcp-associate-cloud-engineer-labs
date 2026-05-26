# Logging, Monitoring, and Incident Response

**Related labs:** [05 — Cloud Logging & Monitoring](../labs/05-cloud-logging-monitoring/), [08 — Incident Response Simulation](../labs/08-incident-response-simulation/)

## What

Built a basic detection-and-response capability on top of GCP audit logs, then exercised it end-to-end with a simulated incident.

## How

- Verified Admin Activity audit logs and wrote reusable queries for IAM changes, public bucket creation, and firewall mutations
- Created log-based metrics and alert policies that fire on high-signal security events
- Exported logs to a Cloud Storage sink for long-term, append-only retention
- Ran a tabletop simulation: a compromised service account grants itself Owner and creates a public bucket — detected, investigated, contained, and documented

## Outcome

A small but real "you can't respond to what you can't see" baseline, plus a written investigation report and remediation plan demonstrating the full IR lifecycle.

## Skills demonstrated

- Cloud Logging query language and log-based metrics
- Cloud Monitoring alert policies and notification channels
- Log retention via storage sinks
- Incident response: detection, investigation, containment, remediation, lessons learned
