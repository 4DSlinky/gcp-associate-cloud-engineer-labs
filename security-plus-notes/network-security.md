# Network Security

## Segmentation

- Break the network into zones (public, private, management)
- Limit lateral movement after an initial compromise
- In GCP: separate subnets, firewall rules targeted by tag/SA, Shared VPC

## Firewalls

- **Stateful** vs. **stateless**
- **Implicit deny** by default; explicit allow for what's needed
- Filter by source IP, port, protocol, identity

## Secure protocols

- Prefer TLS for in-transit data
- Disable plaintext fallbacks (e.g. HTTP, FTP, Telnet)
- Use SSH with keys, not passwords

## Bastion / jump host pattern

- One hardened entry point for admin access
- In GCP, IAP TCP forwarding replaces traditional bastions for SSH/RDP

## Applied in this repo

- [Lab 02 — VPC & Firewall Rules](../labs/02-vpc-firewall-rules/)
- [Lab 03 — Secure Compute Engine VM](../labs/03-compute-engine-secure-vm/) (IAP-only SSH)
- [Lab 06 — Cloud SQL Private IP](../labs/06-cloud-sql-private-ip/)
