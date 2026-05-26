#!/usr/bin/env bash
# Tear down resources created by a lab.
#
# DRY-RUN BY DEFAULT. Pass --apply to actually delete anything.
#
# Usage:
#   ./cleanup-resources.sh LAB_NUMBER [--apply]
#
# Example:
#   ./cleanup-resources.sh 03           # prints what would be deleted
#   ./cleanup-resources.sh 03 --apply   # actually deletes
#
# NOTE: This is a starting point. Each lab is responsible for filling in its
# own cleanup commands inside the case statement below.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 LAB_NUMBER [--apply]" >&2
  exit 1
fi

LAB="$1"
APPLY="false"
if [[ "${2:-}" == "--apply" ]]; then
  APPLY="true"
fi

run() {
  if [[ "${APPLY}" == "true" ]]; then
    echo "+ $*"
    "$@"
  else
    echo "DRY-RUN: $*"
  fi
}

case "${LAB}" in
  01)
    # IAM least privilege
    run gcloud iam service-accounts delete \
      "lab01-readonly-sa@$(gcloud config get-value project)-iam.gserviceaccount.com" --quiet
    ;;
  02)
    # VPC & firewall
    # run gcloud compute firewall-rules delete ...
    # run gcloud compute networks subnets delete ...
    # run gcloud compute networks delete lab02-vpc --quiet
    echo "TODO: fill in cleanup steps for lab 02"
    ;;
  03)
    # Compute Engine secure VM
    # run gcloud compute instances delete lab03-hardened-vm --zone=us-central1-a --quiet
    echo "TODO: fill in cleanup steps for lab 03"
    ;;
  04|05|06|07|08)
    echo "TODO: fill in cleanup steps for lab ${LAB}"
    ;;
  *)
    echo "Unknown lab number: ${LAB}" >&2
    exit 1
    ;;
esac

if [[ "${APPLY}" != "true" ]]; then
  echo
  echo "Dry run complete. Re-run with --apply to delete resources."
fi
