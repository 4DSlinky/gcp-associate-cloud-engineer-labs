# Lab 01 — IAM Least Privilege

## Objective

Demonstrate the principle of least privilege in Google Cloud IAM by:

- Creating a dedicated service account for a single workload
- Granting only the predefined role(s) required for that workload
- Verifying that broader roles (e.g. `roles/editor`, `roles/owner`) are **not** in use
- Auditing existing IAM bindings on the project

## Why This Matters

Over-privileged identities are one of the most common cloud breach root causes. Practicing least privilege at the IAM layer reduces blast radius if credentials are leaked.

## Prerequisites

- A GCP project with billing enabled
- `gcloud` CLI installed and authenticated
- `Project IAM Admin` (`roles/resourcemanager.projectIamAdmin`) on the lab project

## Architecture

> _Add a diagram to `architecture-diagrams/` and link it here._

## Walkthrough

1. List existing IAM bindings and identify any overly broad grants.
2. Create a service account scoped to a specific task (e.g. reading from one bucket).
3. Grant only the predefined role needed (e.g. `roles/storage.objectViewer`) at the **resource** level, not the project level.
4. Attempt an action the service account should **not** be able to perform and confirm it is denied.
5. Attempt the allowed action and confirm it succeeds.

See [`commands.md`](commands.md) for the exact commands.

## Validation

- [ ] Service account exists and has only the intended role
- [ ] Denied action returns a `PERMISSION_DENIED` error
- [ ] Allowed action succeeds
- [ ] No `roles/owner` or `roles/editor` grants on user-managed identities

## Cleanup

See the cleanup section in [`commands.md`](commands.md).

## Files

- [`commands.md`](commands.md) — gcloud commands used in this lab
- [`lessons-learned.md`](lessons-learned.md) — reflections and gotchas
- [`screenshots/`](screenshots/) — console evidence
