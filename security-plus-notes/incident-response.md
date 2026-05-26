# Incident Response

## Lifecycle (NIST SP 800-61 style)

1. **Preparation** — playbooks, contacts, logging, tooling in place
2. **Detection & Analysis** — alerts, triage, scope determination
3. **Containment** — short-term and long-term containment actions
4. **Eradication** — remove the root cause and any persistence
5. **Recovery** — restore systems and validate
6. **Lessons Learned** — post-incident review, update controls

## Evidence handling

- Preserve logs and disk images before changing things
- Maintain chain of custody
- Use append-only / immutable storage where possible (e.g. WORM bucket, log sinks)

## Communication

- Define who talks to whom (internal stakeholders, legal, customers, regulators)
- Pre-write templates so you don't draft them during an incident

## Applied in this repo

- [Lab 05 — Cloud Logging & Monitoring](../labs/05-cloud-logging-monitoring/) (detection)
- [Lab 08 — Incident Response Simulation](../labs/08-incident-response-simulation/) (full tabletop)
