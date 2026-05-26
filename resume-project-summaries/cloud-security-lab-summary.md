# Cloud Security Lab — IAM & Storage Hardening

**Related labs:** [01 — IAM Least Privilege](../labs/01-iam-least-privilege/), [04 — Cloud Storage Secure Bucket](../labs/04-cloud-storage-secure-bucket/)

## What

Built a baseline GCP environment where every service account and Cloud Storage bucket follows least-privilege and "private by default" patterns.

## How

- Created dedicated service accounts per workload instead of reusing the default Compute SA
- Granted predefined roles at the **resource** level (bucket-scoped), not project-wide
- Enabled **uniform bucket-level access** and **public access prevention** on every bucket
- Turned on object versioning and applied a lifecycle policy to transition and expire data
- Audited existing project-level IAM bindings and removed `Editor` / `Owner` from workload identities

## Outcome

A repeatable, documented baseline that prevents the most common GCP misconfigurations: over-privileged service accounts and accidentally public buckets.

## Skills demonstrated

- Google Cloud IAM (predefined roles, resource-scoped bindings)
- Cloud Storage hardening (UBLA, PAP, versioning, lifecycle)
- `gcloud` / `gsutil` automation
- Security documentation aligned with least-privilege principles
