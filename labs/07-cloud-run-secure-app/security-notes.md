# Security Notes — Cloud Run Secure Deployment

## Image hygiene

- Base image is pinned (`python:3.12-slim`)
- Container runs as a non-root user (`appuser`)
- Image is stored in Artifact Registry inside the same project (no Docker Hub dependency at runtime)

## Identity

- Runtime SA is dedicated and least-privileged
- Default Compute service account is **not** used

## Network exposure

- `--no-allow-unauthenticated` enforces IAM-based invocation
- Ingress restricted to internal + load balancer; not directly internet-facing
- Invokers are listed explicitly; no `allUsers` binding

## Secrets

- Use Secret Manager + `--update-secrets` instead of `--set-env-vars` for sensitive values

## Security+ mapping

- Application security / hardening
- Identity-based access control
- Defense in depth (auth + ingress + IAM)
