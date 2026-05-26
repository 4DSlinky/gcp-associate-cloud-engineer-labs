# Access Control

## Core concepts

- **Identification** — claiming an identity (username)
- **Authentication** — proving the claim (password, key, MFA)
- **Authorization** — what the authenticated identity is allowed to do
- **Accounting / auditing** — recording what they did

## Access control models

- **DAC** — Discretionary Access Control. Owner decides.
- **MAC** — Mandatory Access Control. System / labels decide.
- **RBAC** — Role-Based. Access tied to roles, not individuals.
- **ABAC** — Attribute-Based. Decisions use attributes (time, device, IP).

## Principle of least privilege

Grant only what the identity needs to perform its task, for only as long as needed.

## Applied in this repo

- [Lab 01 — IAM Least Privilege](../labs/01-iam-least-privilege/)
- IAM policy review in [Lab 04](../labs/04-cloud-storage-secure-bucket/iam-policy-notes.md)
- Cloud Run invoker bindings in [Lab 07](../labs/07-cloud-run-secure-app/)
