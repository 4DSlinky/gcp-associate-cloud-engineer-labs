# Investigation Report — [Incident Title]

## Summary

> One paragraph: what happened, when it was detected, and current status.

## Timeline (UTC)

| Time | Event | Source |
|------|-------|--------|
| 02:17 | `SetIamPolicy` adds `roles/owner` to `svc-unused@…` | Cloud Audit Logs |
| 02:18 | New bucket `gs://example-public-bucket` created | Cloud Audit Logs |
| 02:19 | Bucket IAM updated with `allUsers:objectViewer` | Cloud Audit Logs |
| 02:20 | Object `payload.bin` uploaded | Data Access Logs |
| 02:45 | Alert "IAM policy changed" fires; on-call paged | Cloud Monitoring |

## Indicators

- Principal: `svc-unused@PROJECT.iam.gserviceaccount.com`
- Source IP: `203.0.113.42`
- User agent: `google-api-python-client/x.y.z`

## Scope and impact

- Resources touched: 1 service account, 1 bucket, 1 object
- Data exposure: _confirmed / not confirmed_
- Customer impact: _none / partial / full_

## How it was detected

- Alert policy from [Lab 05](../05-cloud-logging-monitoring/alert-policy-notes.md)

## Root cause (preliminary)

- _Fill in: leaked key, over-privileged human user, missing condition on IAM binding, etc._
