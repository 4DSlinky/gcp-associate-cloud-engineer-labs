# Cryptography Basics

## Symmetric vs. asymmetric

- **Symmetric** — one shared secret key (AES). Fast. Key distribution is the hard part.
- **Asymmetric** — public/private key pair (RSA, ECC). Slower. Solves key distribution.

## Hashing

- One-way function (SHA-256, SHA-3)
- Used for integrity, password storage (with salts + KDFs like bcrypt/argon2), digital signatures
- Not encryption — you can't reverse a hash

## TLS in one breath

1. Client and server agree on a cipher suite
2. Server proves identity with a certificate signed by a trusted CA
3. They negotiate a symmetric session key (often via ECDHE)
4. Bulk traffic is encrypted symmetrically

## Key management in GCP

- **Google-managed encryption keys (GMEK)** — default; transparent
- **Customer-managed encryption keys (CMEK)** — you control rotation in Cloud KMS
- **Customer-supplied encryption keys (CSEK)** — you supply raw key material

## Applied in this repo

- TLS for Cloud Run ingress (Lab 07)
- Encryption-at-rest discussion in [Lab 04](../labs/04-cloud-storage-secure-bucket/)
- Cloud SQL in-transit encryption in [Lab 06](../labs/06-cloud-sql-private-ip/)
