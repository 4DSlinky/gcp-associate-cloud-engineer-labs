# IAM Policy Notes — Cloud Storage Secure Bucket

## Bindings I will use

| Principal | Role | Reason |
|-----------|------|--------|
| `serviceAccount:app-reader@PROJECT.iam.gserviceaccount.com` | `roles/storage.objectViewer` | Application reads objects only |
| `serviceAccount:ci-uploader@PROJECT.iam.gserviceaccount.com` | `roles/storage.objectCreator` | CI pipeline uploads new artifacts |
| `group:cloud-admins@example.com` | `roles/storage.admin` | Break-glass admin access for humans |

## Bindings I will **not** use

- `allUsers` / `allAuthenticatedUsers` — bucket is private
- `roles/storage.admin` for application service accounts
- Project-level `roles/owner` for any human or workload identity

## Reasoning

Granting `objectViewer` and `objectCreator` separately enforces separation of duties between "read" and "write" workloads. Admin access stays with humans, behind group membership that can be audited and revoked.
