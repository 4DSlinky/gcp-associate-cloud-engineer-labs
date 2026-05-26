#!/usr/bin/env bash
# Audit IAM bindings on a Cloud Storage bucket and flag public bindings.
#
# Usage:
#   ./check-bucket-permissions.sh BUCKET_NAME
#
# Exit codes:
#   0  no public bindings found
#   1  bad invocation
#   2  public bindings found

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 BUCKET_NAME" >&2
  exit 1
fi

BUCKET="$1"

echo "==> IAM policy for gs://${BUCKET}"
gcloud storage buckets get-iam-policy "gs://${BUCKET}" --format=json \
  | tee /tmp/bucket-iam-${BUCKET}.json

echo
echo "==> Checking for public principals"
if grep -E '"allUsers"|"allAuthenticatedUsers"' "/tmp/bucket-iam-${BUCKET}.json" >/dev/null; then
  echo "WARNING: public bindings found on gs://${BUCKET}" >&2
  exit 2
fi

echo "OK: no public bindings found on gs://${BUCKET}"
