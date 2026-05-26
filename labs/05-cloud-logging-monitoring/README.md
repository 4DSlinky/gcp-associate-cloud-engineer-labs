# Lab 05 — Cloud Logging and Monitoring

## Objective

Build a basic observability + alerting baseline for the lab project:

- Confirm Cloud Audit Logs are flowing
- Write a few useful log queries
- Create a log-based metric for a security event (e.g. IAM policy change)
- Create an alert policy that notifies on that metric
- Export logs to a Cloud Storage sink for retention

## Why This Matters

You can't respond to what you can't see. A minimal logging and alerting setup is table stakes for any cloud environment.

## Prerequisites

- A GCP project with billing enabled
- `gcloud` CLI installed and authenticated
- `Logging Admin` and `Monitoring Editor` roles

## Architecture

> _Add a diagram (e.g. `architecture-diagrams/logging-monitoring-lab.png`) and link it here._

## Walkthrough

1. Verify Admin Activity audit logs are enabled (they are by default and cannot be disabled).
2. Run the queries in [`log-query-examples.md`](log-query-examples.md) in Logs Explorer.
3. Create a log-based metric for "IAM policy changed".
4. Create an alert policy on that metric and route it to an email notification channel.
5. Create a logging sink to a Cloud Storage bucket for long-term retention.

## Validation

- [ ] Logs Explorer returns recent Admin Activity entries
- [ ] Log-based metric exists and increments on test events
- [ ] Alert fires when a test IAM change is made
- [ ] Logs are appearing in the export bucket

## Files

- [`alert-policy-notes.md`](alert-policy-notes.md)
- [`log-query-examples.md`](log-query-examples.md)
- [`screenshots/`](screenshots/)
