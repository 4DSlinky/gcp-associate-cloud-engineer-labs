#!/usr/bin/env bash
# Baseline hardening startup script for a Debian/Ubuntu Compute Engine VM.
# Intended as a learning skeleton — extend it for your own workload.

set -euo pipefail

LOG=/var/log/lab03-startup.log
exec > >(tee -a "$LOG") 2>&1

echo "[lab03] Starting hardening at $(date -u)"

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install -y unattended-upgrades fail2ban

systemctl enable --now unattended-upgrades
systemctl enable --now fail2ban

# Disable password-based SSH (key-based / IAP only).
if [ -f /etc/ssh/sshd_config ]; then
  sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
  sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  systemctl reload ssh || systemctl reload sshd || true
fi

echo "[lab03] Hardening complete at $(date -u)"
