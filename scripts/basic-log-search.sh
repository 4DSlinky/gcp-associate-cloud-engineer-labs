#!/usr/bin/env bash
# Run a Cloud Logging query and print recent matches.
#
# Usage:
#   ./basic-log-search.sh "QUERY" [LIMIT] [FRESHNESS]
#
# Examples:
#   ./basic-log-search.sh 'protoPayload.methodName="SetIamPolicy"'
#   ./basic-log-search.sh 'severity>=ERROR' 50 24h

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 \"QUERY\" [LIMIT] [FRESHNESS]" >&2
  exit 1
fi

QUERY="$1"
LIMIT="${2:-20}"
FRESHNESS="${3:-1h}"

echo "==> Searching logs (limit=${LIMIT}, freshness=${FRESHNESS})"
echo "    Query: ${QUERY}"

gcloud logging read "${QUERY}" \
  --limit="${LIMIT}" \
  --freshness="${FRESHNESS}" \
  --format="table(timestamp, severity, resource.type, protoPayload.methodName, protoPayload.authenticationInfo.principalEmail)"
