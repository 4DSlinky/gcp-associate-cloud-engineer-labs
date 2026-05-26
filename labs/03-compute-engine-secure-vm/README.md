# Lab 03 — Secure Compute Engine VM

## Objective

Deploy a hardened Compute Engine VM that:

- Uses a minimal, current OS image
- Has **no external IP** and is reached only via IAP
- Runs as a **non-default** service account with least privilege
- Uses Shielded VM features (Secure Boot, vTPM, Integrity Monitoring)
- Boots with a startup script that applies baseline OS hardening

## Why This Matters

Default Compute Engine settings are convenient but not secure. A hardened baseline image is a foundation for any production workload.

## Prerequisites

- A GCP project with billing enabled
- `gcloud` CLI installed and authenticated
- The VPC from [Lab 02](../02-vpc-firewall-rules/) (or another custom VPC)

## Architecture

> _Add a diagram and link it here._

## Walkthrough

1. Create a dedicated service account for the VM with minimal roles.
2. Launch a Shielded VM in the private subnet with no external IP.
3. Attach the startup script from [`startup-script.sh`](startup-script.sh).
4. SSH via IAP and verify hardening steps were applied.
5. Run through the [`hardening-checklist.md`](hardening-checklist.md).

See [`commands.md`](commands.md).

## Validation

- [ ] VM has no external IP
- [ ] Shielded VM features are enabled
- [ ] VM runs as a custom service account, not the default Compute SA
- [ ] OS package list is up to date
- [ ] Unneeded services are disabled

## Cleanup

See [`commands.md`](commands.md).

## Files

- [`commands.md`](commands.md)
- [`startup-script.sh`](startup-script.sh)
- [`hardening-checklist.md`](hardening-checklist.md)
