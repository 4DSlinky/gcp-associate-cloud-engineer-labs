# Alert Policy Notes

## Alert: IAM policy changed

- **Source metric**: log-based counter on `protoPayload.methodName="SetIamPolicy"`
- **Condition**: any data point > 0 over a rolling 5-minute window
- **Notification channel**: email (later: PagerDuty / Slack)
- **Severity**: Warning
- **Runbook**:
  1. Open the triggering log entry in Logs Explorer.
  2. Identify `principalEmail` (who) and `resourceName` (what).
  3. Confirm the change was expected via change management.
  4. If unexpected: revoke the new binding and rotate the principal's credentials.

## Alert: Bucket made public

- **Source metric**: log-based counter on the "bucket made public" query in [`log-query-examples.md`](log-query-examples.md)
- **Condition**: any data point > 0
- **Severity**: Critical
- **Runbook**:
  1. Remove the `allUsers` / `allAuthenticatedUsers` binding immediately.
  2. Audit object access logs for that bucket.
  3. Notify the data owner.

## Alert: Firewall rule changed

- **Source metric**: log-based counter on firewall mutation methods
- **Severity**: Warning
- **Runbook**: confirm change against approved change ticket; roll back if unauthorized.
