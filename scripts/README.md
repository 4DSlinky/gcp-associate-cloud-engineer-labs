# Scripts

Small helper scripts that I reach for repeatedly while working on the labs in this repo.

All scripts assume you have the `gcloud` and `gsutil` CLIs installed and authenticated, and that your active project is set:

```bash
gcloud config set project YOUR_PROJECT_ID
```

| Script | Purpose | Default behavior |
|--------|---------|------------------|
| `check-bucket-permissions.sh` | Audit IAM on a Cloud Storage bucket and flag public bindings | Read-only |
| `list-iam-bindings.sh` | List all IAM bindings on the active project | Read-only |
| `basic-log-search.sh` | Run a Cloud Logging query and print recent matches | Read-only |
| `cleanup-resources.sh` | Tear down resources created by a lab | **Dry-run** by default; pass `--apply` to actually delete |

All scripts are intended as starting points — read them before running.
