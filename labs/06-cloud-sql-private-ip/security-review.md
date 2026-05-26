# Security Review — Cloud SQL Private IP

## Controls in place

- Network isolation via Private Service Access (no public IP)
- Strong root password set out-of-band; not stored in source control
- Least-privileged application user; no DDL rights
- Automated backups + point-in-time recovery for ransomware / accident recovery
- Cloud SQL Admin API audit logs flowing to Cloud Logging

## Open follow-ups

- [ ] Store DB credentials in Secret Manager and rotate
- [ ] Require IAM database authentication where supported
- [ ] Enable Cloud SQL Insights for query-level visibility
- [ ] Enforce SSL/TLS for in-VPC connections

## Security+ mapping

- Data in transit / data at rest
- Network segmentation
- Backup and recovery (availability)
- Account management (least privilege at the DB layer)
