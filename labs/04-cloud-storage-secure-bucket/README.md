# Lab 04 — Cloud Storage Secure Bucket

## Objective

Create a Cloud Storage bucket configured for secure, auditable data storage:

- Uniform bucket-level access (no per-object ACLs)
- Public access prevention enforced
- Versioning enabled
- Lifecycle policy that transitions and eventually deletes old objects
- Customer-managed or default Google-managed encryption documented
- IAM bindings reviewed for least privilege

## Why This Matters

Misconfigured Cloud Storage buckets are a frequent source of public data leaks. This lab establishes a "safe by default" bucket pattern.

## Prerequisites

- A GCP project with billing enabled
- `gcloud` and `gsutil` CLIs installed and authenticated

## Architecture

> _Add a diagram (e.g. `architecture-diagrams/secure-static-site.png`) and link it here._

## Walkthrough

1. Create the bucket with uniform bucket-level access and public access prevention.
2. Enable object versioning.
3. Apply the lifecycle policy in [`lifecycle-policy.json`](lifecycle-policy.json).
4. Bind a least-privileged role to a specific service account.
5. Verify no `allUsers` or `allAuthenticatedUsers` bindings exist.

See [`iam-policy-notes.md`](iam-policy-notes.md) for IAM design notes.

## Validation

- [ ] `iamConfiguration.uniformBucketLevelAccess.enabled` is `true`
- [ ] `iamConfiguration.publicAccessPrevention` is `enforced`
- [ ] Versioning is enabled
- [ ] Lifecycle policy is applied
- [ ] No public principals are bound to the bucket

## Cleanup

- Delete the bucket (use the `--force` flag only if you've reviewed contents)

## Files

- [`lifecycle-policy.json`](lifecycle-policy.json)
- [`iam-policy-notes.md`](iam-policy-notes.md)
- [`screenshots/`](screenshots/)
