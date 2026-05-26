# Lab 06 — Cloud SQL with Private IP

## Objective

Deploy a Cloud SQL instance that is reachable only over a **private IP** from inside the VPC:

- No public IP address
- Private Service Access configured between the VPC and Google's services
- Strong root password set; least-privileged application user created
- Automated backups and point-in-time recovery enabled
- Connections only from approved VMs (verified)

## Why This Matters

Publicly reachable databases are a top attack vector. Forcing all DB traffic across a private interconnect dramatically shrinks the attack surface.

## Prerequisites

- A custom VPC (from [Lab 02](../02-vpc-firewall-rules/))
- `Cloud SQL Admin` and `Service Networking Admin` roles
- Service Networking API enabled

## Architecture

> _Add a diagram and link it here._

## Walkthrough

1. Allocate an IP range for Private Service Access in the VPC.
2. Create a private connection from the VPC to Google services.
3. Create the Cloud SQL instance with `--no-assign-ip` and the private network.
4. Set a strong root password; create a least-privileged application user.
5. Enable automated backups and point-in-time recovery.
6. From a VM in the VPC, connect to the instance via its private IP and confirm a public connection attempt fails.

See [`commands.md`](commands.md) and [`security-review.md`](security-review.md).

## Validation

- [ ] Instance has no public IP
- [ ] Connection from a VM in the VPC succeeds
- [ ] Connection from outside the VPC fails
- [ ] Application user has only the privileges it needs
- [ ] Backups and PITR are enabled

## Files

- [`commands.md`](commands.md)
- [`security-review.md`](security-review.md)
