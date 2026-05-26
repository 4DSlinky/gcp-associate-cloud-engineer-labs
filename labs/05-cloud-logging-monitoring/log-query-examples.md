# Log Query Examples

These are starting points for the Logs Explorer. Adjust project IDs, time ranges, and resource types to your environment.

## IAM policy changes

```text
logName="projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Factivity"
protoPayload.methodName="SetIamPolicy"
```

## Failed authentication attempts

```text
logName="projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Fdata_access"
severity>=ERROR
protoPayload.authenticationInfo.principalEmail!=""
```

## Compute Engine instance creation / deletion

```text
resource.type="gce_instance"
protoPayload.methodName=("v1.compute.instances.insert" OR "v1.compute.instances.delete")
```

## Cloud Storage bucket made public (should never fire)

```text
resource.type="gcs_bucket"
protoPayload.methodName="storage.setIamPermissions"
protoPayload.serviceData.policyDelta.bindingDeltas.member=("allUsers" OR "allAuthenticatedUsers")
```

## VPC firewall rule changes

```text
resource.type="gce_firewall_rule"
protoPayload.methodName=("v1.compute.firewalls.insert"
                       OR "v1.compute.firewalls.patch"
                       OR "v1.compute.firewalls.delete")
```
