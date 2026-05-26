# Commands — IAM Least Privilege

> Replace `PROJECT_ID`, `SA_NAME`, and `BUCKET_NAME` with your own values.

## Setup

```bash
export PROJECT_ID="your-project-id"
export SA_NAME="lab01-readonly-sa"
export BUCKET_NAME="your-bucket-name"

gcloud config set project "$PROJECT_ID"
```

## Audit existing IAM bindings

```bash
gcloud projects get-iam-policy "$PROJECT_ID" \
  --format="table(bindings.role, bindings.members)" \
  --flatten="bindings[].members"
```

## Create a least-privilege service account

```bash
gcloud iam service-accounts create "$SA_NAME" \
  --display-name="Lab 01 read-only SA"
```

## Grant a single, narrow role at the resource level

```bash
gsutil iam ch \
  "serviceAccount:${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com:objectViewer" \
  "gs://${BUCKET_NAME}"
```

## Verify denied action (should fail)

```bash
# TODO: impersonate the SA and try to delete an object — expect PERMISSION_DENIED
```

## Verify allowed action (should succeed)

```bash
# TODO: impersonate the SA and list/read an object — expect success
```

## Cleanup

```bash
gcloud iam service-accounts delete \
  "${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" --quiet
```
