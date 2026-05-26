# Remediation Plan — [Incident Title]

## Immediate (containment)

- [ ] Disable the compromised service account
- [ ] Revoke the `roles/owner` binding added at 02:17 UTC
- [ ] Remove `allUsers` binding from the affected bucket
- [ ] Rotate any other keys associated with the compromised principal

## Short-term (eradication & recovery)

- [ ] Delete the malicious object and any derived artifacts
- [ ] Restore the IAM policy to its previous known-good state
- [ ] Snapshot relevant logs and store them in the long-term sink from Lab 05

## Long-term (prevention)

- [ ] Enforce IAM conditions (e.g. require corporate IP / device) for elevated roles
- [ ] Add an Org Policy: `iam.allowedPolicyMemberDomains` to restrict external members
- [ ] Add an Org Policy: `storage.publicAccessPrevention` to enforce private buckets
- [ ] Add alert: "Service account granted Owner/Editor"
- [ ] Periodically review unused service accounts (90-day rule)

## Lessons learned

- _Fill in after exercise._
