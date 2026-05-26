#!/usr/bin/env bash
# List all IAM bindings on the active GCP project, one role per row.
#
# Usage:
#   ./list-iam-bindings.sh [PROJECT_ID]
#
# If PROJECT_ID is omitted, uses the currently active gcloud project.

set -euo pipefail

PROJECT_ID="${1:-$(gcloud config get-value project 2>/dev/null)}"

if [[ -z "${PROJECT_ID}" || "${PROJECT_ID}" == "(unset)" ]]; then
  echo "ERROR: no project ID provided and none set in gcloud config" >&2
  exit 1
fi

echo "==> IAM bindings on project: ${PROJECT_ID}"
gcloud projects get-iam-policy "${PROJECT_ID}" \
  --flatten="bindings[].members" \
  --format="table(bindings.role, bindings.members)"
