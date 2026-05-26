# GCP Cloud Security Labs

This repository documents my hands-on labs while preparing for the **Google Cloud Associate Cloud Engineer** certification and **CompTIA Security+**.

The goal of this project is to demonstrate entry-level cloud engineering and cloud security skills, including:

- Google Cloud IAM
- VPC networking
- Firewall rules
- Compute Engine
- Cloud Storage
- Cloud SQL
- Cloud Run
- Logging and monitoring
- Basic incident response
- Least privilege access
- Secure configuration
- Automation with the `gcloud` CLI and shell scripts

## Certifications in Progress

- Google Cloud Associate Cloud Engineer
- CompTIA Security+

## Featured Labs

| # | Lab | Focus Area |
|---|-----|------------|
| 1 | [IAM Least Privilege Lab](labs/01-iam-least-privilege/) | Identity & access management |
| 2 | [Secure VPC and Firewall Rules Lab](labs/02-vpc-firewall-rules/) | Network segmentation |
| 3 | [Secure Compute Engine VM Lab](labs/03-compute-engine-secure-vm/) | Host hardening |
| 4 | [Cloud Storage Security Lab](labs/04-cloud-storage-secure-bucket/) | Data protection |
| 5 | [Cloud Logging and Monitoring Lab](labs/05-cloud-logging-monitoring/) | Observability & alerting |
| 6 | [Cloud SQL Private IP Lab](labs/06-cloud-sql-private-ip/) | Private database access |
| 7 | [Cloud Run Secure Deployment Lab](labs/07-cloud-run-secure-app/) | Serverless application security |
| 8 | [Incident Response Simulation](labs/08-incident-response-simulation/) | Detection & response |

## Repository Structure

```text
gcp-cloud-security-labs/
├── README.md                    # You are here
├── architecture-diagrams/       # Diagrams for each lab
├── labs/                        # Hands-on labs (READMEs, commands, screenshots)
├── scripts/                     # Reusable gcloud / bash helper scripts
├── security-plus-notes/         # Study notes mapped to Security+ domains
└── resume-project-summaries/    # Short, recruiter-friendly project write-ups
```

## Tools Used

- Google Cloud Platform
- Cloud Shell
- gcloud CLI
- Linux
- Bash
- IAM
- VPC
- Cloud Logging
- Cloud Monitoring
- GitHub

## How to Read This Repository

Each lab folder follows the same pattern:

1. `README.md` — objective, architecture, and step-by-step walkthrough
2. `commands.md` — the exact `gcloud` / shell commands used
3. `screenshots/` — visual proof of work in the GCP console
4. A lab-specific notes file (`lessons-learned.md`, `security-notes.md`, etc.)

The `resume-project-summaries/` folder contains short, one-page summaries written for recruiters who want the highlights without the deep technical detail.

## Status

This portfolio is actively being built out. Labs are added as I complete them.
