# Commands — Secure Compute Engine VM

```bash
export PROJECT_ID="your-project-id"
export ZONE="us-central1-a"
export VM_NAME="lab03-hardened-vm"
export SA_NAME="lab03-vm-sa"
export VPC_NAME="lab02-vpc"
export SUBNET="subnet-private"

gcloud config set project "$PROJECT_ID"
```

## Create the service account

```bash
gcloud iam service-accounts create "$SA_NAME" \
  --display-name="Lab 03 hardened VM SA"
```

## Launch a Shielded VM with no external IP

```bash
gcloud compute instances create "$VM_NAME" \
  --zone="$ZONE" \
  --machine-type=e2-small \
  --image-family=debian-12 --image-project=debian-cloud \
  --network="$VPC_NAME" --subnet="$SUBNET" --no-address \
  --service-account="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --scopes=cloud-platform \
  --shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring \
  --tags=ssh-iap \
  --metadata-from-file=startup-script=startup-script.sh
```

## Connect via IAP

```bash
gcloud compute ssh "$VM_NAME" --zone="$ZONE" --tunnel-through-iap
```

## Cleanup

```bash
gcloud compute instances delete "$VM_NAME" --zone="$ZONE" --quiet
gcloud iam service-accounts delete \
  "${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" --quiet
```
