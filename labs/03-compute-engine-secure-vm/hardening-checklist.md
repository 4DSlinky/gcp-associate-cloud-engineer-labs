# VM Hardening Checklist

A short, opinionated baseline for a Linux Compute Engine VM. Tick items off as you verify them on the running instance.

## Identity & access

- [ ] VM runs as a dedicated, least-privileged service account (not the default Compute SA)
- [ ] OS Login is enabled at the project or instance level
- [ ] No SSH keys stored in project metadata

## Network exposure

- [ ] No external IP address
- [ ] Reachable only via IAP or a bastion host
- [ ] Firewall rules target this VM by tag or service account

## Platform integrity

- [ ] Shielded VM: Secure Boot enabled
- [ ] Shielded VM: vTPM enabled
- [ ] Shielded VM: Integrity Monitoring enabled
- [ ] Confidential Computing considered (where appropriate)

## OS baseline

- [ ] Latest image family (e.g. `debian-12`, `ubuntu-2204-lts`)
- [ ] `apt update && apt upgrade` run on first boot
- [ ] Unattended security upgrades enabled
- [ ] `fail2ban` (or equivalent) installed
- [ ] Password SSH disabled; root SSH disabled

## Logging & monitoring

- [ ] Ops Agent installed for system + application metrics/logs
- [ ] Serial console logs reviewed
- [ ] Audit logs flowing to Cloud Logging
