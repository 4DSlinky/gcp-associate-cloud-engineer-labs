# Lab 02 — Secure VPC and Firewall Rules

## Objective

Design a custom VPC with subnets and firewall rules that:

- Default-deny ingress
- Allow only required ports from specific source ranges
- Separate public-facing and private workloads into different subnets
- Use network tags / service accounts as firewall targets instead of broad CIDRs

## Why This Matters

A well-designed VPC is the first line of defense. Most "auto-mode" networks created by default are too permissive for production-style workloads.

## Prerequisites

- A GCP project with billing enabled
- `gcloud` CLI installed and authenticated
- `Compute Network Admin` (`roles/compute.networkAdmin`)

## Architecture

> _Add a diagram (e.g. `architecture-diagrams/private-vpc-lab.png`) and link it here._

Suggested layout:

- One custom-mode VPC
- `subnet-public` for a bastion / load balancer
- `subnet-private` for application VMs (no external IPs)
- Firewall: deny-all by default, allow SSH from a single admin CIDR via IAP, allow internal traffic between tagged VMs

## Walkthrough

1. Create a custom-mode VPC.
2. Create a public and a private subnet in the same region.
3. Create explicit deny rules at lower priority and targeted allow rules at higher priority.
4. Deploy two test VMs (one in each subnet) and verify expected connectivity.
5. Confirm the private VM has no external IP and is only reachable via the bastion or IAP.

See [`commands.md`](commands.md).

## Validation

- [ ] Private VM has no external IP
- [ ] SSH to private VM works only through IAP / bastion
- [ ] Unintended ports are blocked from the internet
- [ ] Firewall rules use tags or service accounts as targets

## Cleanup

See [`commands.md`](commands.md).

## Files

- [`commands.md`](commands.md)
- [`security-notes.md`](security-notes.md)
- [`screenshots/`](screenshots/)
