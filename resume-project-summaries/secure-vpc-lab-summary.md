# Secure VPC Lab — Network Segmentation on GCP

**Related labs:** [02 — VPC & Firewall Rules](../labs/02-vpc-firewall-rules/), [03 — Secure Compute Engine VM](../labs/03-compute-engine-secure-vm/), [06 — Cloud SQL Private IP](../labs/06-cloud-sql-private-ip/)

## What

Designed and deployed a custom-mode VPC that isolates public and private workloads, removes external IPs from sensitive resources, and forces admin access through Google Identity-Aware Proxy.

## How

- Custom-mode VPC with separate public and private subnets
- Default-deny ingress; targeted allow rules using network tags and service accounts
- Compute Engine VM hardened with Shielded VM features and a startup script that disables password SSH
- Cloud SQL deployed with **private IP only** over Private Service Access
- Admin access via IAP TCP forwarding — no SSH exposed to the internet

## Outcome

A networking baseline where compromise of a single subnet does not give lateral access to data stores, and where no admin port is reachable from the public internet.

## Skills demonstrated

- VPC design (custom mode, subnets, firewall rule prioritization)
- Compute Engine hardening (Shielded VM, custom SA, IAP-only SSH)
- Cloud SQL Private Service Access
- Defense-in-depth network architecture
