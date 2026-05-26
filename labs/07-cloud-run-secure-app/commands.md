# Commands — Cloud Run Secure Deployment

```bash
export PROJECT_ID="your-project-id"
export REGION="us-central1"
export REPO="lab07-repo"
export IMAGE="lab07-app"
export SERVICE="lab07-secure-app"
export SA_NAME="lab07-runtime-sa"

gcloud config set project "$PROJECT_ID"
```

## Create an Artifact Registry repo and build the image

```bash
gcloud artifacts repositories create "$REPO" \
  --repository-format=docker --location="$REGION"

gcloud builds submit \
  --tag "${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/${IMAGE}:v1"
```

## Create a least-privileged runtime SA

```bash
gcloud iam service-accounts create "$SA_NAME" \
  --display-name="Lab 07 Cloud Run runtime SA"
```

## Deploy with secure defaults

```bash
gcloud run deploy "$SERVICE" \
  --image="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/${IMAGE}:v1" \
  --region="$REGION" \
  --service-account="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --no-allow-unauthenticated \
  --ingress=internal-and-cloud-load-balancing \
  --max-instances=3
```

## Grant a specific invoker (instead of `allUsers`)

```bash
gcloud run services add-iam-policy-binding "$SERVICE" \
  --region="$REGION" \
  --member="user:you@example.com" \
  --role="roles/run.invoker"
```

## Cleanup

```bash
gcloud run services delete "$SERVICE" --region="$REGION" --quiet
gcloud artifacts repositories delete "$REPO" --location="$REGION" --quiet
gcloud iam service-accounts delete \
  "${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" --quiet
```
