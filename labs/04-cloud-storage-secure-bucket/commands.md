# Commands — Cloud Storage Secure Bucket

```bash
export PROJECT_ID="your-project-id"
export BUCKET_NAME="your-unique-bucket-name"
export LOCATION="US"

gcloud config set project "$PROJECT_ID"
```

## Create the bucket with secure defaults

```bash
gcloud storage buckets create "gs://${BUCKET_NAME}" \
  --location="$LOCATION" \
  --uniform-bucket-level-access \
  --public-access-prevention
```

## Enable versioning

```bash
gcloud storage buckets update "gs://${BUCKET_NAME}" --versioning
```

## Apply the lifecycle policy

```bash
gcloud storage buckets update "gs://${BUCKET_NAME}" \
  --lifecycle-file=lifecycle-policy.json
```

## Inspect the resulting configuration

```bash
gcloud storage buckets describe "gs://${BUCKET_NAME}" \
  --format="json(iamConfiguration, versioning, lifecycle)"
```
