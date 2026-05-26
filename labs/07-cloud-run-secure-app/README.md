# Lab 07 — Cloud Run Secure Deployment

## Objective

Deploy a small containerized application to Cloud Run with a secure baseline:

- Runs as a dedicated, least-privileged service account
- Ingress restricted (internal-only or internal + load balancer)
- Authentication required (no unauthenticated invocations) **or** explicit public exposure documented
- Image built from a minimal base and stored in Artifact Registry
- Environment variables sourced from Secret Manager, not baked into the image

## Why This Matters

Cloud Run makes it tempting to ship "Hello World" to the public internet in one command. This lab shows the secure way to do the same thing.

## Prerequisites

- A GCP project with billing enabled
- `gcloud`, `docker`, and Artifact Registry API enabled
- `Cloud Run Admin` and `Service Account User` roles

## Architecture

> _Add a diagram and link it here._

## Walkthrough

1. Build the sample app in [`app/`](app/) using the [`Dockerfile`](Dockerfile).
2. Push the image to Artifact Registry.
3. Create a dedicated runtime service account with minimal roles.
4. Deploy to Cloud Run with `--no-allow-unauthenticated` and `--ingress=internal-and-cloud-load-balancing` (or `internal`).
5. Bind the appropriate invoker role to the calling principal.
6. Verify the service is reachable only by authorized callers.

See [`commands.md`](commands.md) and [`security-notes.md`](security-notes.md).

## Validation

- [ ] Image is in Artifact Registry, not Docker Hub
- [ ] Service runs as a custom service account (not the default Compute SA)
- [ ] Unauthenticated invocations are denied
- [ ] Ingress is restricted
- [ ] Secrets are mounted from Secret Manager

## Files

- [`app/`](app/) — sample application source
- [`Dockerfile`](Dockerfile)
- [`commands.md`](commands.md)
- [`security-notes.md`](security-notes.md)
