# Commands — Cloud SQL Private IP

```bash
export PROJECT_ID="your-project-id"
export REGION="us-central1"
export VPC_NAME="lab02-vpc"
export INSTANCE_NAME="lab06-pg"
export DB_VERSION="POSTGRES_15"
export PSA_RANGE="google-managed-services-${VPC_NAME}"

gcloud config set project "$PROJECT_ID"
```

## Allocate a range for Private Service Access

```bash
gcloud compute addresses create "$PSA_RANGE" \
  --global --purpose=VPC_PEERING --prefix-length=16 \
  --network="$VPC_NAME"
```

## Create the private connection

```bash
gcloud services vpc-peerings connect \
  --service=servicenetworking.googleapis.com \
  --ranges="$PSA_RANGE" \
  --network="$VPC_NAME"
```

## Create the Cloud SQL instance with private IP only

```bash
gcloud sql instances create "$INSTANCE_NAME" \
  --database-version="$DB_VERSION" \
  --region="$REGION" \
  --tier=db-g1-small \
  --network="projects/${PROJECT_ID}/global/networks/${VPC_NAME}" \
  --no-assign-ip \
  --backup --enable-point-in-time-recovery
```

## Set passwords and create an app user

```bash
gcloud sql users set-password postgres \
  --instance="$INSTANCE_NAME" \
  --prompt-for-password

gcloud sql users create app_user \
  --instance="$INSTANCE_NAME" \
  --prompt-for-password
```

## Cleanup

```bash
gcloud sql instances delete "$INSTANCE_NAME" --quiet
```
