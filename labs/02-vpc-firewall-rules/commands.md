# Commands — Secure VPC and Firewall Rules

> Replace placeholders with your own values.

```bash
export PROJECT_ID="your-project-id"
export REGION="us-central1"
export VPC_NAME="lab02-vpc"
export PUB_SUBNET="subnet-public"
export PRIV_SUBNET="subnet-private"

gcloud config set project "$PROJECT_ID"
```

## Create the VPC and subnets

```bash
gcloud compute networks create "$VPC_NAME" --subnet-mode=custom

gcloud compute networks subnets create "$PUB_SUBNET" \
  --network="$VPC_NAME" --region="$REGION" --range="10.10.1.0/24"

gcloud compute networks subnets create "$PRIV_SUBNET" \
  --network="$VPC_NAME" --region="$REGION" --range="10.10.2.0/24" \
  --enable-private-ip-google-access
```

## Default-deny ingress (low priority)

```bash
gcloud compute firewall-rules create "${VPC_NAME}-deny-all-ingress" \
  --network="$VPC_NAME" --direction=INGRESS --action=DENY \
  --rules=all --priority=65534
```

## Allow IAP-based SSH to tagged VMs only

```bash
gcloud compute firewall-rules create "${VPC_NAME}-allow-iap-ssh" \
  --network="$VPC_NAME" --direction=INGRESS --action=ALLOW \
  --rules=tcp:22 --source-ranges=35.235.240.0/20 \
  --target-tags=ssh-iap --priority=1000
```

## Cleanup

```bash
# TODO: delete test VMs, then firewall rules, subnets, and VPC in reverse order
```
