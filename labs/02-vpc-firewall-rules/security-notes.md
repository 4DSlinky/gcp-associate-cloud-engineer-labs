# Security Notes — VPC and Firewall Rules

## Design principles applied

- **Default deny** ingress, explicit allow only for required flows
- **Least exposure** — private subnet VMs have no external IP
- **Target by identity** — firewall rules use network tags / service accounts, not blanket CIDRs
- **Use IAP for admin access** instead of opening SSH to `0.0.0.0/0`

## Security+ mapping

- Network segmentation
- Defense in depth
- Implicit deny
- Bastion host concept
